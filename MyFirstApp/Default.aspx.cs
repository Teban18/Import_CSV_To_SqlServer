using System;
using System.Configuration;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;


public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Tables("SqlServices");
        }
        
    }

    //Flow of the logic 
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        notify1.Text = "";
        try
        {
            validator(
            Read_Table("", "SqlServices").Item1,
            Read_Table(RadDropDownTables.SelectedItem.Text, "SqlServices").Item2,
            Read_File(@"C:\Users\MARIO RUEDA\Documents\" + Return_File()),
            char.Parse(RadTextBox1.Text)
            );
            notify1.Show();
        } catch (Exception ex)
        {
            notify1.Text = ex.Message;
            notify1.Show();
        }
    }

    protected string Return_File()
    {
        try
        {
            List<object> list = new List<object>();
            foreach (UploadedFile f in RadAsyncUpload1.UploadedFiles)
            {
                list.Add(f.GetName());
            }
            return list.ElementAt(0).ToString();
        } catch (Exception ex)
        {
            notify1.Text = ex.Message;
            throw;
        }
        
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
        catch (Exception ex)
        {
            notify1.Text = ex.Message;
            throw;
        }      
    } 

    private string[] Read_File(string path)
    {
        try
        {
            string[] lines = File.ReadAllLines(path);
            return lines;
        } catch (Exception ex)
        {
            notify1.Text = ex.Message;
            throw;
        }
        
    }

    protected void validator(List<object> tablestructure, List<object> columnlength, string[] filedata, char spliter)
    {
        for (int li = 0; li < filedata.Count(); li++)
        {
            string[] filecolumns = filedata[li].Split(spliter);
            if (Is_Length_As(filecolumns.Count(), columnlength.Count()))
            {
                notify1.Text += "<p style='color:gray'>" +
                    "La línea " + li + " <span style='color:green'> cumple </span>" +
                    "</p>" +
                    "";
                for (int ci = 0; ci < filecolumns.Count(); ci++)
                {
                    if (Is_Less_Than(filecolumns[ci].Count(), System.Convert.ToInt32(columnlength[ci])))
                    {
                        notify1.Text += "<p style='color:gray'>" +
                            "Línea " + li + ": La columna "+ci+" '" + filecolumns[ci] + "' <span style='color:green'> cumple </span>" +
                            "</p>" +
                            "";
                    } else
                    {
                        notify1.Text += "<p style='color:gray'>" +
                            "Línea " +li+ ": La columna "+ci+" '" + filecolumns[ci] + "' <span style='color:red'> no cumple </span>" +
                            "</p>" +
                            "";
                    }
                }
            }       
            else
            {
                notify1.Text += "<p style='color:gray'>" +
                    "La línea " + li + " <span style='color:red'> no cumple </span>" +
                    "</p>" +
                    "";
            }
        }
    }

    private bool Is_Length_As(int tablecolumns, int filecolumns)
    {
        return tablecolumns == filecolumns;
    } 

    private bool Is_Less_Than(int filecolumnlength, int tablecolumnlength)
    {
        if (filecolumnlength <= tablecolumnlength) return true;
        return false;
    }

    private void Get_Tables(string connsrt)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
            SqlCommand comm = new SqlCommand("SELECT t.name FROM Sys.Tables t", conn);
            conn.Open();
            using (SqlDataReader reader = comm.ExecuteReader())
            {
                while (reader.Read())
                {
                    RadDropDownTables.Items.Add(reader[0].ToString());
                    System.Diagnostics.Debug.WriteLine(reader[0]);
                }
            }
            conn.Close();
            
        }
        catch (Exception ex)
        {
            notify1.Text = ex.Message;
            throw;
        }
    }
}
