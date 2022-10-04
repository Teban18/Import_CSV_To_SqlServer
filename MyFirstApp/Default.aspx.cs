using System;
using System.Configuration;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Text;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Get_Option_Name("SqlServices");
            }
        } 
        catch{}
    }

    public static string strtxt;
  
    protected void btn_Prevalidate_Click(object sender, EventArgs e)
    {
        try
        {
            //Save_File();
            System.Diagnostics.Debug.Write(RadAsyncUpload1.TargetFolder);
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

    /*protected void Save_File()
    {
        string name = "~/Imagenes/Archivosimporter/";
        if (!Directory.Exists(Server.MapPath(name))) 
        {
            Directory.CreateDirectory(Server.MapPath(name));
        }
        RadAsyncUpload1.UploadedFiles[0].SaveAs(Server.MapPath(name + RadAsyncUpload1.UploadedFiles[0].GetName()), true);
        pathp = name + RadAsyncUpload1.UploadedFiles[0].GetName();
    }*/

    private string[] Read_File(string path)
    { 
        string[] lines = File.ReadAllLines(path);
        return lines;   
    }

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
                RadGrid2.DataSource = Load_Prevalidation_Table(File.ReadAllLines(Server.MapPath("~/MyFiles/"+RadAsyncUpload1.UploadedFiles[0].GetName())), Get_Option_Types("SqlServices"));
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
        for (int i = 0; i < Load_Prevalidation_Table(Read_File(Server.MapPath("")), Get_Option_Types("SqlServices")).Rows.Count; i++)
        {
            StringBuilder sb = new StringBuilder();
            Store_Data_Into_Loadtable("SqlServices", "asdas34324", sb.AppendLine(string.Join(",", Load_Prevalidation_Table(Read_File(""), Get_Option_Types("SqlServices")).Rows[i].ItemArray)).ToString(), Get_Procedures("SqlServices").Item4[0].ToString(), Get_Procedures("SqlServices").Item3[0].ToString());
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

}
