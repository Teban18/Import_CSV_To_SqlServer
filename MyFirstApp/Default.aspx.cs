using System;
using System.Configuration;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Tables("SqlServices");
        }
        
    }

    public static string strtxt;
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        strtxt = "Bind";
        RadGrid2.Rebind();
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
            
            return null;
        }
        
    }
 
    private Tuple<List<object>, List<object>, List<object>> Read_Table(string dbtable, string connstr)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connstr].ConnectionString);
            SqlCommand comm = new SqlCommand("SELECT t.name, c.max_length, c.is_nullable FROM sys.columns c JOIN sys.types t ON c.user_type_id = t.user_type_id WHERE c.object_id = Object_id('"+dbtable+"')", conn);
            //SqlCommand comm = new SqlCommand("SELECT DATA_TYPE,IS_NULLABLE,CHARACTER_MAXIMUM_LENGTH FROM BD_TGData.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+dbtable+"'; ", conn);
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
        }
        catch (Exception ex)
        {
            
            return null;
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
            
            return null;
        }
        
    }

    protected DataTable Structure_Validator(List<object> tablestructure, List<object> columnlength, List<object> isnullable, string[] filedata, char spliter)
    {   
        DataTable dt = new DataTable();
        dt.Clear();
        var watch = System.Diagnostics.Stopwatch.StartNew();
        for (int li = 0; li < filedata.Count(); li++)
        {
            DataRow newRow = dt.NewRow();
            string[] filecolumns = filedata[li].Split(spliter);
            if (Is_Length_As(filecolumns.Count(), tablestructure.Count()))
            {
                for (int ci = 0; ci < filecolumns.Count(); ci++)
                {
                    if (Has_Title(li))
                    {
                        dt.Columns.Add(filecolumns[ci]);
                    } else
                    {
                        if (Is_Nullable(System.Convert.ToInt32(isnullable[ci]), filecolumns[ci].Count()))
                        {
                            if (Is_Less_Than(filecolumns[ci].Count(), System.Convert.ToInt32(columnlength[ci])))
                            {
                                newRow[ci] = filecolumns[ci];
                            } else
                            {
                                newRow[ci] = "<abbr title='Error' style='text-decoration:none'><span style='color:red'> Error </span></abbr>";
                            }
                        } else
                        {
                            newRow[ci] = "<abbr title='Error' style='text-decoration:none'><span style='color:red'> Error </span></abbr>";
                        }
                    }    
                }
            } else
            {
                newRow[0] = "Longitud inválida";
            }
            dt.Rows.Add(newRow);
        }
        watch.Stop();
        System.Diagnostics.Debug.WriteLine(watch.Elapsed.TotalSeconds);
        return dt;
    }

    protected void RadGrid2_NeedDataSource1(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            if (strtxt == "Bind")
            {
                RadGrid2.DataSource = Structure_Validator(
                Read_Table(RadDropDownTables.SelectedItem.Text, "SqlServices").Item1,
                Read_Table(RadDropDownTables.SelectedItem.Text, "SqlServices").Item2,
                Read_Table(RadDropDownTables.SelectedItem.Text, "SqlServices").Item3,
                Read_File(@"C:\Users\MARIO RUEDA\Documents\" + Return_File()),
                char.Parse(RadTextBox1.Text)
            );
            }
        } catch (Exception ex)
        {
            List<string> errlist = new List<string>();
            errlist.Add(ex.Message);
            RadGrid2.DataSource = errlist;
        }
            /*DataTable dt = new DataTable();
            for (int li = 0; li < 20; li++)
            {
                DataRow newRow = dt.NewRow();
                for (int ci = 0; ci < 3; ci++)
                {
                    if (li == 0)
                    {
                        dt.Columns.Add("Hey" + ci);
                    }
                    newRow[ci] = ci;
                    System.Diagnostics.Debug.WriteLine("Hola"+ci);
                }
                dt.Rows.Add(newRow);
            }
            RadGrid2.DataSource = dt;*/   
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

    private bool Is_Nullable(int nullablevalue, int filecolum)
    {
        if (nullablevalue == 0 && filecolum > 0) return true;
        else if (nullablevalue == 0 && filecolum == 0) return false;
        else if (nullablevalue == 1 && filecolum > 0) return true;
        else if (nullablevalue == 1 && filecolum == 0) return true;
        return false;
    }

    private Dictionary<string,string> Is_Same_Type() 
    {
        Dictionary<string, string> datatype = new Dictionary<string, string>();
        datatype.Add("bigint", "int");
        datatype.Add("varchar", "char");
        datatype.Add("bit", "bool");
        return datatype;
    }

    private bool Has_Title(int titleline)
    {
        if (titleline == 0) return true;
        return false;
    }

    /*private void Online_Table(List<object> tablestructure, List<object> columnlength, List<object> isnullable, string[] filedata, char spliter, int filecount)
    {
        notify1.Text += "<table style='border-collapse:collapse;text-align:center;max-width:80vw;'>";
        for (int li = 0; li < filecount; li++)
        {
            notify1.Text += "<tr style='border: 1px solid black'>";
            notify1.Text += "<td style='border: 1px solid;padding:8px;'><p style='color:blue'>Línea " + (li + 1) + "</td>";
            string[] filecolumns = filedata[li].Split(spliter);
            if (Is_Length_As(filecolumns.Count(), tablestructure.Count()))
            {
                for (int ci = 0; ci < filecolumns.Count(); ci++)
                {
                    if (Is_Nullable(System.Convert.ToInt32(isnullable[ci]), filecolumns[ci].Count()))
                    {
                        if (Is_Less_Than(filecolumns[ci].Count(), System.Convert.ToInt32(columnlength[ci])))
                        {
                            notify1.Text += "<td style='border: 1px solid;padding:8px;'><p style='color:grey'>" + filecolumns[ci] + "</p></td>";
                        }
                        else
                        {
                            notify1.Text += "<td style='border: 1px solid;padding:8px;'><abbr style='text-decoration:underline red' title='El contenido supera el largo máximo de la columna en la BD'><p style='color:red'>" + filecolumns[ci] + "</abbr></p></td>";
                        }
                    }
                    else
                    {
                        notify1.Text += "<td style='border: 1px solid;padding:8px;'><abbr style='text-decoration:underline red' title='Esta columna no puede estar vacía'><p style='color:red'> Error </abbr></p></td>";
                    }
                }
            }
            else
            {
                notify1.Text += "<td style='border: 1px solid;padding:8px;'><abbr style='text-decoration:underline red' title='Longitud de la fila no corresponde con longitud de la tabla'><p style='color:red'>Fila no válida</abbr></p></td>";
            }
            notify1.Text += "</tr>";
        }
    }*/

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
                }
            }
            conn.Close();
            
        }
        catch (Exception ex)
        {
           
            throw;
        }
    }

    public List<object> Data_Processor (List<object> validlines)
    {
        return validlines;
    }
    
}
