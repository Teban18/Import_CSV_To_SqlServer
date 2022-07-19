using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Collections;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using System.IO;
using Telerik.Windows.Documents.Spreadsheet.Model;
using Telerik.Windows.Documents.Spreadsheet.Formatting.FormatStrings;
using System.Activities.Statements;
using System.Data.OleDb;
using System.Net;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
        
    }

    protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        /*foreach (object line in Read_Table("dbo.TBempleado", "SqlServices").Item1)
        {
            System.Diagnostics.Debug.WriteLine("tested item 1 : " + line);
        }
        foreach (object col in Read_Table("dbo.TBBanco", "SqlServices").Item2)
        {
            System.Diagnostics.Debug.WriteLine("tested item 2 : " + col );
        }*/
        //Read_File(@"C:\Users\MARIO RUEDA\Documents\cities.txt");
        validator(Read_Table("dbo.TBempleado", "SqlServices").Item1, Read_Table("dbo.TBempleado", "SqlServices").Item2, Read_File(@"C:\Users\MARIO RUEDA\Documents\cities.txt"));
    }

    /*Read file and DB structure*/
    private Tuple<List<object>, List<object>> Read_Table(string dbtable, string connstr)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connstr].ConnectionString);
            SqlCommand comm = new SqlCommand("SELECT t.name, c.max_length FROM sys.columns c JOIN sys.types t ON c.user_type_id = t.user_type_id WHERE c.object_id = Object_id('" + dbtable + "')", conn);
            conn.Open();
            List<object> typeresults = new List<object>();
            List<object> lengthresults = new List<object>();
            using (SqlDataReader reader = comm.ExecuteReader())
            {
                while (reader.Read())
                {
                    typeresults.Add(reader[0]);
                    lengthresults.Add(reader[1]);
                }
            }
            conn.Close();
            return Tuple.Create(typeresults, lengthresults); 
        }
        catch (Exception)
        {
            throw;
        }      
    } 

    private string[] Read_File(string path)
    {
        string[] lines = File.ReadAllLines(path);
        return lines;
    }

    /* Validation of data */
    protected void validator(List<object> tablestructure, List<object> columnlength, string[] filedata)
    {
        System.Diagnostics.Debug.WriteLine(columnlength.Count());
        foreach (string line in filedata)
        {
            string[] filecolumns = line.Split(',');
            if (Is_Length_As(filecolumns.Count(), columnlength.Count()))
            {
                for (int i = 0; i < filecolumns.Count(); i++)
                {
                    System.Diagnostics.Debug.WriteLine(filecolumns[i].Count());
                    
                }
            }       
            else
            {
                
            }
        }
    }

    private bool Is_Length_As (int tablecolumns, int filecolumns)
    {
        return tablecolumns == filecolumns;
    } 

    private bool Is_Less_Than (int tablecolumnlength, int filecolumnlength)
    {
        if (filecolumnlength <= tablecolumnlength) return true;
        return false;
    }

    /*protected void RadGrid4_ItemCommand (object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.ExpandCollapseCommandName)
        {
            foreach (GridItem item in e.Item.OwnerTableView.Items)
            {
                if (item.Expanded && item != e.Item)
                {
                    item.Expanded = false;
                }
            }
        }
    }*/
}
