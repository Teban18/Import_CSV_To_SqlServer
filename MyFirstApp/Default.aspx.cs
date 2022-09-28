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
using System.Web.UI.HtmlControls;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Get_Option_Name("SqlServices");
                Get_Creation_PrepareLoading("SqlServices");
            }
        } 
        catch{}
    }

    public static string strtxt;
    protected void btn_Prevalidate_Click(object sender, EventArgs e)
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

    /*protected DataTable Load_Prevalidation_Table(string[] filedata, Tuple<List<object>, List<object>, List<object>, List<object>, List<object>, List<object>> data)
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
                    dt.Columns.Add(new DataColumn { ColumnName = filecolumns[ci], DataType = Type.GetType(Get_DataType("SqlServices", data.Item1[ci].ToString())), AllowDBNull=bool.Parse(data.Item2[ci].ToString())});
                }
                else
                {
                    if (filecolumns[ci].ToString() == "")
                    {
                        dr[ci] = DBNull.Value;
                    } else
                    {
                        dr[ci] = filecolumns[ci];
                    }
                }
            }
            if (li != 0)
                dt.Rows.Add(dr);
        }
        return dt;
    }*/

    protected DataTable Load_Prevalidation_Table(string[] filedata, Tuple<List<object>, List<object>, List<object>, List<object>, List<object>, List<object>> data)
    {
        DataTable dt = new DataTable();
        if (Int32.Parse(RadDropDownList1.SelectedItem.Value) == 0)
        {
            for (int a = 0; a < data.Item4.Count; a++)
            {
                dt.Columns.Add(new DataColumn
                {
                    ColumnName = data.Item4[a].ToString()/*,
                    DataType = Type.GetType(Get_DataType("SqlServices", data.Item1[a].ToString()))*/
                });
            }
            for (int li = 0; li < filedata.Length; li++)
            {
                DataRow dr = dt.NewRow();
                string[] filecolumns = filedata[li].Split(get_Spliter());
                for (int ci = 0; ci < filecolumns.Length; ci++)
                {
                    if (data.Item4.Count == filecolumns.Length)
                    {
                        if (filecolumns[ci].Count() > Int32.Parse(data.Item5[ci].ToString()))
                        {
                            dr[ci] = "<b>'"+ filecolumns[ci]+"' Excede longitud del campo</b>";
                        }
                        else if (filecolumns[ci].ToString() == "")
                        {
                            if (!bool.Parse(data.Item2[ci].ToString()))
                                dr[ci] = "<b>No acepta nulo</b>";
                        }
                        else
                        {
                            dr[ci] = filecolumns[ci];
                        }
                    }
                    else
                    {
                        dr[ci] = "<b>No coincide el numero de columnas</b>";
                    }
                }
                dt.Rows.Add(dr);
            }
        }
        else
        {
            for (int li = 0; li < filedata.Length; li++)
            {
                DataRow dr = dt.NewRow();
                string[] filecolumns = filedata[li].Split(get_Spliter());
                for (int ci = 0; ci < filecolumns.Length; ci++)
                {
                    if (li == 0)
                    {
                        dt.Columns.Add(new DataColumn 
                        { 
                            ColumnName = filecolumns[ci]
                        });
                    }
                    else
                    {
                        if (data.Item4.Count == filecolumns.Length)
                        {
                            if (filecolumns[ci].Count() > Int32.Parse(data.Item5[ci].ToString()))
                            {
                                dr[ci] = "<b>'"+ filecolumns[ci] + "' Excede longitud del campo</b>";
                            }
                            else if (filecolumns[ci].ToString() == "")
                            {
                                if (!bool.Parse(data.Item2[ci].ToString()))
                                    dr[ci] = "<b>No acepta nulo</b>";
                            }
                            else
                            {
                                dr[ci] = filecolumns[ci];
                            }
                        }
                        else
                        {
                            dr[ci] = "<b>No coincide el numero de columnas</b>";
                        }
                    }
                }
                if (li != 0)
                    dt.Rows.Add(dr);
            }
        }
        return dt;
    }

    private string Get_DataType(string connsrt, string alias)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("select tipo_dato from dbo.tbtipo_dato where alias_tipo_dato = '"+ alias.ToString()+"'", conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                alias = reader[0].ToString();
            }
        }
        conn.Close();
        return alias;
    }

    protected void RadGrid2_NeedDataSource1(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            if (strtxt == "Bind")
            {
                RadGrid2.Visible = true;
                RadGrid2.DataSource = Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices"));
                importstatus.Text = "Pre-validado";
                RadButton5.Enabled = true;
            }     
        } 
        catch (Exception ex)
        {
            RadGrid2.Visible = true;
            List<string> errlist = new List<string>();
            errlist.Add("Error");
            errlist.Add(ex.Message);
            RadGrid2.DataSource = errlist;
            RadButton5.Enabled = false;
            importstatus.Text = "No Pre-validado";
        }
    }

    private Tuple<List<object>, List<object>, List<object>, List<object>, List<object>, List<object>> Get_Option_Types(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT a.CAMP_TIPO, a.CAMP_NULO, a.CAMP_POSICION, a.CAMP_DESCRIPCION, a.CAMP_LONGITUD, a.CAMP_FORMATO FROM TBCAMPOS_CARGUE AS a RIGHT JOIN TBOPCION_CARGUE AS b ON a.OP_CODIGO = b.OPC_CODIGO WHERE b.OPC_CODIGO =" + RadDropDownTables.SelectedItem.Value, conn);
        conn.Open();
        List<object> typeresults = new List<object>();
        List<object> nuleresults = new List<object>();
        List<object> posresults = new List<object>();
        List<object> descresults = new List<object>();
        List<object> longresults = new List<object>();
        List<object> formresults = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                typeresults.Add(reader[0]);
                nuleresults.Add(reader[1]);
                posresults.Add(reader[2]);
                descresults.Add(reader[3]);
                longresults.Add(reader[4]);
                formresults.Add(reader[5]);
            }
        }
        conn.Close();
        return Tuple.Create(typeresults,nuleresults,posresults,descresults,longresults,formresults);
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
   
    private char get_Spliter()
    {
        return char.Parse(RadTextBox1.Text);
    }

    protected void btn_Confirmpv_Click(object sender, EventArgs e)
    {
        try
        {
            if (Store_Data())
            {
                RadTextBoxValidation.Text = "Cargado";
                //send_Validation_Data("SqlServices", "asdas34324", Get_Procedures("SqlServices").Item1[0].ToString());
            }
        }
        catch (Exception ex)
        {
            RadTextBoxValidation.Text = "";
            RadTextBoxValidation.Visible = true;
            RadTextBoxValidation.Text = ex.Message;
        }
    }

    private bool Store_Data()
    {
        for (int i = 0; i < Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices")).Rows.Count; i++)
        {
            StringBuilder sb = new StringBuilder();
            Store_Data_Into_Loadtable("SqlServices", "asdas34324", sb.AppendLine(string.Join(",", Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices")).Rows[i].ItemArray)).ToString(), Get_Procedures("SqlServices").Item4[0].ToString(), Get_Procedures("SqlServices").Item3[0].ToString());
        }
        return true;
    }

    private void Store_Data_Into_Loadtable(string connsrt, string sessionid, string line, string loadtable, string procedure)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@idsesion", sessionid);
        comm.Parameters.AddWithValue("@tablacargue", loadtable);
        comm.Parameters.AddWithValue("@linea", line);
        comm.Parameters.AddWithValue("@spliter", ",");
        conn.Open();
        comm.ExecuteNonQuery();
        conn.Close();
    }

    private string send_Validation_Data(string connsrt, string sessionid, string procedure)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@idsesion", sessionid);
        comm.Parameters.Add("@resultado", SqlDbType.VarChar, -1).Direction = ParameterDirection.Output;
        conn.Open();
        comm.ExecuteNonQuery();
        string result = comm.Parameters["@resultado"].Value.ToString();
        conn.Close();
        return result;  
    }

    private Tuple<List<object>, List<object>, List<object>, List<object>> Get_Procedures(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT a.NOMBRE_PROC_VALIDA, a.NOMBRE_PROC_ALMACENA, NOMBRE_CARGA_TABLA, NOMBRE_TABLA FROM TBPROCEDIMIENTOS_CARGUE AS a RIGHT JOIN TBOPCION_CARGUE AS b ON a.OP_CODIGO = b.OPC_CODIGO WHERE b.OPC_CODIGO =" + RadDropDownTables.SelectedItem.Value, conn);
        conn.Open();
        List<object> pvalidate = new List<object>();
        List<object> pstore = new List<object>();
        List<object> pload = new List<object>();
        List<object> ptable = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                pvalidate.Add(reader[0]);
                pstore.Add(reader[1]);
                pload.Add(reader[2]);
                ptable.Add(reader[3]);
            }
        }
        conn.Close();
        return Tuple.Create(pvalidate, pstore, pload, ptable);
    }

    protected void btn_Structure_Click(object sender, EventArgs e)
    {
        try
        {
            myPanel1.InnerHtml = "";
            myPanel1.InnerHtml += "<table>";
            myPanel1.InnerHtml += "<tr><th>Columna</th><th>Tipo</th><th>Puede ser nula</th><th>Posición</th><th>Descripción</th><th>Longitud del campo</th><th>Formato</th></tr>";
            for (int i = 0; i < Get_Option_Types("SqlServices").Item1.Count(); i++)
            {
                myPanel1.InnerHtml += "<tr><td>Columna " + (i + 1) + "</td><td>" + Get_Option_Types("SqlServices").Item1[i] + "</td><td>" + Get_Option_Types("SqlServices").Item2[i] + "</td><td>" + Get_Option_Types("SqlServices").Item3[i] + "</td><td>" + Get_Option_Types("SqlServices").Item4[i] + "</td><td>" + Get_Option_Types("SqlServices").Item5[i] + "</td><td>" + Get_Option_Types("SqlServices").Item6[i] + "</td></tr>";
            }
            myPanel1.InnerHtml += "</table>";
        }
        catch (Exception ex)
        {
            myPanel1.InnerHtml = ex.Message;
        }
        modalPopup.VisibleOnPageLoad = true;
        modalPopup.Visible = true;
    }
    /* ----------------------------------  Storing Module  ----------------------------------------------  */

    /*protected void Load_Storing_Multiline(int countervalid, int counterinvalid, int counter)
    {
        RadTextBoxStoring.Text = "";
        RadTextBoxStoring.Visible = true;
        RadLinkButton2.Text = Get_Procedures("SqlServices").Item2[0].ToString();
        foreach (DataRow row in Load_Prevalidation_Table(Read_File(@"C:\Users\MARIO RUEDA\Documents\cargues\" + Return_File()), Get_Option_Types("SqlServices")).Rows)
        {
            counter++;
            StringBuilder sb = new StringBuilder();
            RadTextBoxStoring.Text += "Linea "+counter+" "+send_Storing_Data("SqlServices", sb.AppendLine(string.Join(get_Spliter().ToString(), row.ItemArray)).ToString(), Get_Procedures("SqlServices").Item2[0].ToString())+"\n";
        }
        RadLinkButton1.Text = counter.ToString();
        storeline.Text = "Almacenado";
        RadButton5.Enabled = false; 
    }

    private string send_Storing_Data(string connsrt, string line, string procedure)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@linea", line);
        comm.Parameters.AddWithValue("@spliter", get_Spliter());
        comm.Parameters.AddWithValue("@idsesion", "asdas123sdasd");
        comm.Parameters.Add("@resultado", SqlDbType.VarChar, -1).Direction = ParameterDirection.Output;
        conn.Open();
        comm.ExecuteNonQuery();
        string result = comm.Parameters["@resultado"].Value.ToString();
        conn.Close();
        return result;
    }*/
        
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
            if (validatorRB2.IsValid && validatorRB3.IsValid && validatorRB4.IsValid && validatorRB5.IsValid && validatorRB6.IsValid && validatorRB7.IsValid && validatorRB8.IsValid && validatorRB9.IsValid && validatorRB11.IsValid && validatorRB12.IsValid)
            {
                Creation_Type("SqlServices", RadTextBox3.Text.ToString(), Int32.Parse(RadDropDownTipeLoad.SelectedItem.Value), RadTextBox4.Text.ToString(), RadTextBox5.Text.ToString(), RadTextBox12.Text.ToString(), RadTextBox2.Text.ToString(), RadTextBox7.Text.ToString(), RadTextBox8.Text.ToString(), RadTextBox9.Text.ToString(), RadTextBox10.Text.ToString(), RadTextBox11.Text.ToString(), 0);
                myPanel1.InnerHtml = "Opción "+ RadTextBox3.Text.ToString() +" creada con éxito";
                RadButton2.Enabled = false;
            }
            else
            {
                myPanel1.InnerHtml = "Hay campos vacíos";
            }
        }
        catch (Exception ex)
        {
            myPanel1.InnerHtml = ex.Message;
        }
        modalPopup.VisibleOnPageLoad = true;
        modalPopup.Visible = true;
    }

    private char get_Spliter_Creation()
    {
        return char.Parse(RadTextBox6.Text);
    }

    private void Creation_Type(string connsrt, string name, int typeload, string spvalidate, string spstore, string ptable, string fields, string position, string description, string length, string format, string acceptnull, int init)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SP_SAVELOADTYPE", conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@Nombre_carga", name);
        comm.Parameters.AddWithValue("@Tipo_carga", typeload);
        comm.Parameters.AddWithValue("@Nombre_pa_valida", spvalidate);
        comm.Parameters.AddWithValue("@Nombre_pa_almacena", spstore);
        comm.Parameters.AddWithValue("@Nombre_pa_tabla", ptable);
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
