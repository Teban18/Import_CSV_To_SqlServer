using System;
using System.Configuration;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using Newtonsoft.Json.Linq;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Option_Name("SqlServices");
        }
        
    }

    public static string strtxt;
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        try
        {
            strtxt = "Bind";
            RadGrid2.Rebind();
            
        } catch (Exception ex)
        {
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add("Descripción del error: "+ex.Message);
            RadGrid2.DataSource = errlist;
        }
    }

    protected string Return_File()
    {
        List<object> list = new List<object>();
        foreach (UploadedFile f in RadAsyncUpload1.UploadedFiles)
        {
            list.Add(f.GetName());
        }
        return list.ElementAt(0).ToString();
    }

    /*private Tuple<List<object>, List<object>, List<object>> Read_Table(string dbtable, string connstr)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connstr].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT t.name, c.max_length, c.is_nullable FROM sys.columns c JOIN sys.types t ON c.user_type_id = t.user_type_id WHERE c.object_id = Object_id('"+dbtable+"')", conn);
        conn.Open();
        List<object> typeresults = new List<object>();
        List<object> lengthresults = new List<object>();
        List<object> nullableresults = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                typeresults.Add(reader[0]);
                lengthresults.Add(reader[1]);
                nullableresults.Add(reader[2]);
            }
        }
        conn.Close();
        return Tuple.Create(typeresults, lengthresults, nullableresults);   
    }*/ 

    private string[] Read_File(string path)
    { 
        string[] lines = File.ReadAllLines(path);
        return lines;   
    }

    protected DataTable Load_Table(string[] filedata, char spliter, List<object> types)
    {
        DataTable dt = new DataTable();
        for (int li = 0; li < filedata.Length; li++)
        {
            DataRow dr = dt.NewRow();
            string[] filecolumns = filedata[li].Split(spliter); 
            for (int ci = 0; ci < filecolumns.Length; ci++)
            {
                if (li == 0)
                {
                    dt.Columns.Add(new DataColumn { ColumnName = filecolumns[ci], DataType = Get_Type(typeAlias, types[ci].ToString()) });
                }
                else
                {
                    dr[ci] = filecolumns[ci];
                }
            }
            dt.Rows.Add(dr);
        }
        dt.Rows.RemoveAt(0);
        return dt;
    }

    protected void RadGrid2_NeedDataSource1(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            if (strtxt == "Bind")
            {
               RadGrid2.DataSource = Load_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\" + Return_File()), char.Parse(RadTextBox1.Text), Get_Option_Types("SqlServices"));
               RadGrid2.MasterTableView.Caption = "La primera fila de su archivo es tomada como el encabezado de la tabla";
            }
        } catch (Exception ex)
        {
            RadGrid2.MasterTableView.Caption = "Oops :(";
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add("Descripción del error: "+ex.Message);
            RadGrid2.DataSource = errlist;
        }
    }

    private List<object> Get_Option_Types(string connsrt)
    {
        System.Diagnostics.Debug.Write(RadDropDownTables.SelectedItem.Text);
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT a.CAMP_TIPO FROM TBCAMPOS_CARGUE AS a INNER JOIN TBOPCION_CARGUE AS b ON a.OP_CODIGO = b.OPC_CODIGO WHERE b.OPC_CODIGO ="+RadDropDownTables.SelectedItem.Text, conn);
        conn.Open();
        List<object> typeresults = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                typeresults.Add(reader[0]);
            }
        }
        conn.Close();
        return typeresults;
    }

    private void Get_Option_Name(string connsrt)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
            SqlCommand comm = new SqlCommand("SELECT OPC_CODIGO, OPC_NOMBRE FROM TBOPCION_CARGUE", conn);
            conn.Open();
            using (SqlDataReader reader = comm.ExecuteReader())
            {
                while (reader.Read())
                {
                    RadDropDownTables.Items.Add(reader[0].ToString());
                }
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            RadGrid2.MasterTableView.Caption = "Oops :(";
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add("Descripción del error: " + ex.Message);
            RadGrid2.DataSource = errlist;
        }
    }

    static Dictionary<string, Type> typeAlias = new Dictionary<string, Type>
    {
        { "bool" , typeof(bool) },
        { "byte" , typeof(byte) },
        { "char" , typeof(char) },
        { "decimal" , typeof(decimal) },
        { "double" , typeof(double) },
        { "float" , typeof(float) },
        { "int32" , typeof(Int32) },
        { "int64" , typeof(Int64) },
        { "long" , typeof(long) },
        { "object" , typeof(object) },
        { "sbyte" , typeof(sbyte) },
        { "short" , typeof(short) },
        { "string" , typeof(string) },
        { "uint" , typeof(uint) },
        { "ulong" , typeof(ulong) },
        { "void" , typeof(void) }
    };

    private System.Type Get_Type(Dictionary<string, Type> typealias, string typecolumn)
    {
        return typeAlias[typecolumn];
    }

    /*private JObject Json_Parameters()
    {
        string jsondata = @"{
            'dicttables': [
                {
                    'name':'contabilidad',
                    'code':'cont1',
                    'storedprocedures':'',
                    'typeofload':'',
                    'types': [
                        'decimal',
                        'string',
                        'string',
                        'string',
                        'string',
                        'string',
                        'string',
                        'string',
                        'string',
                        'string'
                    ],
                    'tables': {
                        'TBEMPLEADO':'',
                        'TBCLIENTE':''
                    }
                }
            ]
        }";
        return JObject.Parse(jsondata);
    }*/

    /*protected void Get_Tables(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT t.name FROM Sys.Tables t", conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                System.Diagnostics.Debug.Write(reader[0].ToString());
                RadDropDownOption.Items.Add(reader[0].ToString());
            }
        }
        conn.Close(); 
    }*/

}
