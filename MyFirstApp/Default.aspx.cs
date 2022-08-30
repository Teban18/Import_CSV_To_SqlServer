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
using System.Text;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Option_Name("SqlServices");
            Get_Creation_PrepareLoading("SqlServices");
        }
        
    }

    /* ----------------------------------  Pre-Validation Module  ---------------------------------------------  */

    public static string strtxt;
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        try
        {
            strtxt = "Bind";
            RadGrid2.Rebind();
        } 
        catch (Exception ex)
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

    private string[] Read_File(string path)
    { 
        string[] lines = File.ReadAllLines(path);
        return lines;   
    }

    protected DataTable Load_Prevalidation_Table(string[] filedata, Tuple<List<object>, List<object>> data)
    {
        DataTable dt = new DataTable();
        for (int li = 0; li < filedata.Length; li++)
        {
            DataRow dr = dt.NewRow();
            string[] filecolumns = filedata[li].Split(get_Spliter()); 
            for (int ci = 0; ci < filecolumns.Length; ci++)
            {
                if (li == 0)
                {
                    dt.Columns.Add(new DataColumn { ColumnName = filecolumns[ci], DataType = Get_Type(typeAlias, data.Item1[ci].ToString()), AllowDBNull= bool.Parse(data.Item2[ci].ToString())});
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
                RadGrid2.Visible = true;
                RadGrid2.DataSource = Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices"));    
                RadButton3.Enabled = true;
                importstatus.Text = "Pre-validado";
            }
        } catch (Exception ex)
        {
            RadGrid2.Visible = true;
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add("Descripción del error: "+ex.Message);
            RadGrid2.DataSource = errlist;
            RadButton3.Enabled = false;
            importstatus.Text = "No Pre-validado";
        }
    }

    private Tuple<List<object>, List<object>> Get_Option_Types(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT a.CAMP_TIPO, a.CAMP_NULO FROM TBCAMPOS_CARGUE AS a RIGHT JOIN TBOPCION_CARGUE AS b ON a.OP_CODIGO = b.OPC_CODIGO WHERE b.OPC_CODIGO ="+RadDropDownTables.SelectedItem.Value, conn);
        conn.Open();
        List<object> typeresults = new List<object>();
        List<object> nuleresults = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                typeresults.Add(reader[0]);
                nuleresults.Add(reader[1]);
            }
        }
        conn.Close();
        return Tuple.Create(typeresults,nuleresults);
    }

    private void Get_Option_Name(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT OPC_CODIGO, OPC_NOMBRE FROM TBOPCION_CARGUE", conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                RadDropDownTables.Items.Add(new DropDownListItem(reader[1].ToString(), reader[0].ToString()));
            }
        }
        conn.Close();   
    }

    static Dictionary<string, Type> typeAlias = new Dictionary<string, Type>
    {
        { "bool" , typeof(bool) },
        { "byte" , typeof(byte) },
        { "char" , typeof(string) },
        { "decimal" , typeof(decimal) },
        { "double" , typeof(double) },
        { "float" , typeof(float) },
        { "int32" , typeof(string) },
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


    /* --------------------------------  Validation module  -------------------------------------------- */
    
    
    public static string strtxt2;
    protected void btnProcess_Click(object sender, EventArgs e)
    {
        try
        {
            strtxt2 = "Bind";
            RadGrid3.Rebind(); 
        } 
        catch (Exception ex)
        {
            System.Diagnostics.Debug.Write(ex.Message);
            totallines.Text = "0";
            spvalidate.Text = "x";
            totalvalidlines.Text = "0";
        }
    }

    private char get_Spliter()
    {
        return char.Parse(RadTextBox1.Text);
    }

    protected List<object> Load_Validation_Table(List<object> listvalidation, int countervalid, int counterinvalid, int counter)
    {
        totallines.Text = Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices")).Rows.Count.ToString();
        spvalidate.Text = Get_Procedures("SqlServices").Item1[0].ToString();
        foreach (DataRow row in Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices")).Rows)
        {
            StringBuilder sb = new StringBuilder();
            if (send_Processing_Data("SqlServices", sb.AppendLine(string.Join(get_Spliter().ToString(), row.ItemArray)).ToString(), Get_Procedures("SqlServices").Item1[0].ToString()).Item1 == 0)
            {
                countervalid += 1;
                listvalidation.Add("Línea " + counter + " validada");
            }
            else
            {
                counterinvalid += 1;
                listvalidation.Add("Línea " + counter + " no validada, causa " + send_Processing_Data("SqlServices", sb.AppendLine(string.Join(get_Spliter().ToString(), row.ItemArray)).ToString(), Get_Procedures("SqlServices").Item1[0].ToString()).Item2);
            }
            counter++;
        }
        RadButton4.Enabled = true;
        totalvalidlines.Text = countervalid.ToString();
        totalinvalidlines.Text = counterinvalid.ToString();
        return listvalidation;
    }

    protected void RadGrid3_NeedDataSource1(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            if (strtxt2 == "Bind")
            {
                RadGrid3.Visible = true;
                RadGrid3.DataSource = Load_Validation_Table(new List<object>(), 0, 0, 1);
                validstatus.Text = "Validado";
            }
        }
        catch (Exception ex)
        {
            RadGrid3.Visible = true;
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add("Descripción del error: " + ex.Message);
            RadGrid3.DataSource = errlist;
            RadButton4.Enabled = false;
            validstatus.Text = "No validado";
        }
    }

    private Tuple<Int32, string> send_Processing_Data(string connsrt, string line, string procedure)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@linea", line);
        comm.Parameters.AddWithValue("@spliter", get_Spliter());
        comm.Parameters.AddWithValue("@idsesion", "asdas123sdasd");
        comm.Parameters.Add("@resultado", SqlDbType.Int, -1).Direction = ParameterDirection.Output;
        comm.Parameters.Add("@log", SqlDbType.VarChar, -1).Direction = ParameterDirection.Output;
        conn.Open();
        comm.ExecuteNonQuery();
        int result = (int)comm.Parameters["@resultado"].Value;
        string logg = comm.Parameters["@log"].Value.ToString();
        conn.Close();
        return Tuple.Create(result, logg);  
    }

    private Tuple<List<object>, List<object>> Get_Procedures(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT a.NOMBRE_PROC_VALIDA, a.NOMBRE_PROC_ALMACENA FROM TBPROCEDIMIENTOS_CARGUE AS a RIGHT JOIN TBOPCION_CARGUE AS b ON a.OP_CODIGO = b.OPC_CODIGO WHERE b.OPC_CODIGO =" + RadDropDownTables.SelectedItem.Value, conn);
        conn.Open();
        List<object> pvalidate = new List<object>();
        List<object> pstore = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                pvalidate.Add(reader[0]);
                pstore.Add(reader[1]);
            }
        }
        conn.Close();
        return Tuple.Create(pvalidate, pstore);
    }

    /* ----------------------------------  Creation Module  ----------------------------------------------  */

    private void Get_Creation_PrepareLoading(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT AC_CODIGO, AC_NOMBRE FROM TBALMACENAMIENTO_CARGUE", conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                RadDropDownTipeLoad.Items.Add(new DropDownListItem(reader[1].ToString(), reader[0].ToString()));
            }
        }
        conn.Close();
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (validatorRB2.IsValid && validatorRB3.IsValid && validatorRB4.IsValid && validatorRB5.IsValid && validatorRB6.IsValid && validatorRB7.IsValid && validatorRB8.IsValid && validatorRB9.IsValid && validatorRB11.IsValid)
            {
                Creation_Type("SqlServices", RadTextBox3.Text.ToString(), Int32.Parse(RadDropDownTipeLoad.SelectedItem.Value), RadTextBox4.Text.ToString(), RadTextBox5.Text.ToString(), RadTextBox2.Text.ToString(), RadTextBox7.Text.ToString(), RadTextBox8.Text.ToString(), RadTextBox9.Text.ToString(), RadTextBox10.Text.ToString(), RadTextBox11.Text.ToString(), 0);
            }
            else
            {
                System.Diagnostics.Debug.Write("problem");
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.Write(ex.Message);
        }
    }

    private char get_Spliter_Creation()
    {
        return char.Parse(RadTextBox6.Text);
    }

    private void Creation_Type(string connsrt, string name, int typeload, string spvalidate, string spstore, string fields, string position, string description, string length, string format, string acceptnull, int init)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SP_SAVELOADTYPE", conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@Nombre_carga", name);
        comm.Parameters.AddWithValue("@Tipo_carga", typeload);
        comm.Parameters.AddWithValue("@Nombre_pa_valida", spvalidate);
        comm.Parameters.AddWithValue("@Nombre_pa_almacena", spstore);
        comm.Parameters.AddWithValue("@spliter", get_Spliter_Creation());
        comm.Parameters.AddWithValue("@campos", fields);
        comm.Parameters.AddWithValue("@posicion", position);
        comm.Parameters.AddWithValue("@descripcion", description);
        comm.Parameters.AddWithValue("@longitud", length);
        comm.Parameters.AddWithValue("@formato", format);
        comm.Parameters.AddWithValue("@nulo", acceptnull);
        comm.Parameters.AddWithValue("@scope", init);
        conn.Open();
        comm.ExecuteNonQuery();
        conn.Close();
    }

}
