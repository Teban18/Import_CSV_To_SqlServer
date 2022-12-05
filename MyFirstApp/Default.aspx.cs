using System;
using System.Configuration;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;

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
        strtxt = "Bind";
        RadGrid2.Rebind();     
    }

    protected Tuple<DataTable, int> Load_Prevalidation_Table(string[] filedata, Tuple<List<object>, List<object>, List<object>, List<object>, List<object>, List<object>> data)
    {
        DataTable dt = new DataTable();
        int status;
        if (Int32.Parse(RadDropDownList1.SelectedItem.Value) == 0)
        {
            status = 0;
            for (int a = 0; a < data.Item4.Count; a++)
            {
                dt.Columns.Add(new DataColumn
                {
                    ColumnName = data.Item4[a].ToString()
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
                            dr[ci] = "<b> Error: '"+ filecolumns[ci]+ "'</b> Excede longitud del campo";
                            status = 1;
                        }
                        else if (filecolumns[ci].ToString() == "")
                        {
                            if (!bool.Parse(data.Item2[ci].ToString()))
                            {
                                dr[ci] = "<b>No acepta nulo</b>";
                                status = 1;
                            }    
                        }
                        else if (!Regex.IsMatch(filecolumns[ci], Get_DataType("SqlServices", Int32.Parse(data.Item1[ci].ToString()))))
                        {
                            dr[ci] = " <b> Error: '" + filecolumns[ci] + "'</b> No es del tipo esperado";
                            status = 1;
                        }
                        else
                        {
                            dr[ci] = filecolumns[ci];
                        }
                    }
                    else
                    {
                        dr[ci] = "<b>No coincide el numero de columnas</b>";
                        status = 1;
                    }
                }
                dt.Rows.Add(dr);
            }
        }
        else
        {
            status = 0;
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
                                status = 1;
                            }
                            else if (filecolumns[ci].ToString() == "")
                            {
                                if (!bool.Parse(data.Item2[ci].ToString()))
                                {
                                    dr[ci] = "<b>No acepta nulo</b>";
                                    status = 1;
                                }                                    
                            }
                            else if (!Regex.IsMatch(filecolumns[ci], Get_DataType("SqlServices", Int32.Parse(data.Item1[ci].ToString()))))
                            {
                                dr[ci] = " <b> Error: '" + filecolumns[ci] + "'</b> No es del tipo esperado";
                                status = 1;
                            }
                            else
                            {
                                dr[ci] = filecolumns[ci];
                            }
                        }
                        else
                        {
                            dr[ci] = "<b>No coincide el numero de columnas</b>";
                            status = 1;
                        }
                    }
                }
                if (li != 0)
                    dt.Rows.Add(dr);
            }
        }
        return Tuple.Create(dt, status);
    }

    private void Check_Prevalidation(int status)
    {
        if (status == 0)
        {
            RadButton5.Enabled = true;
        }
        else
        {
            RadButton5.Enabled = false;
            paneldesc.InnerHtml = "La prevalidación tiene que estar bien";
        }
    }

    private string Get_DataType(string connsrt, int id)
    {
        string data = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("select tipo_dato from dbo.tbtipo_dato where id_tipo_dato = "+ id, conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                data = reader[0].ToString();
            }
        }
        conn.Close();
        return data;
    }

    protected void RadGrid2_NeedDataSource1(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            if (strtxt == "Bind")
            {
                RadGrid2.Visible = true;
                DataTable table = Load_Prevalidation_Table(File.ReadAllLines(Server.MapPath("~/MyFiles/" + RadAsyncUpload1.UploadedFiles[0].GetName())), Get_Option_Types("SqlServices")).Item1;
                RadGrid2.DataSource = table;
                int stat = Load_Prevalidation_Table(File.ReadAllLines(Server.MapPath("~/MyFiles/" + RadAsyncUpload1.UploadedFiles[0].GetName())), Get_Option_Types("SqlServices")).Item2;
                Check_Prevalidation(stat);
            }     
        } 
        catch (Exception ex)
        {
            RadGrid2.Visible = true;
            List<string> errlist = new List<string>();
            errlist.Add(ex.Message);
            RadGrid2.DataSource = errlist;
            RadButton5.Enabled = false;
            paneldesc.InnerHtml = "La prevalidación tiene que estar bien";
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
                RadDropDownList2.Items.Add(new DropDownListItem(reader[1].ToString(), reader[0].ToString()));
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
        if (Store_Data())
        {
                
        }
    }

    private bool Store_Data()
    {
        DataTable table = Load_Prevalidation_Table(File.ReadAllLines(Server.MapPath("~/MyFiles/" + RadAsyncUpload1.UploadedFiles[0].GetName())), Get_Option_Types("SqlServices")).Item1;
        for (int i = 0; i < table.Rows.Count; i++)
        {
            StringBuilder sb = new StringBuilder();
            paneldesc.InnerHtml += "Línea "+(i+1)+" "+ Store_Data_Into_Loadtable("SqlServices", "asdas34324", "ayycomo", sb.AppendLine(string.Join(",", table.Rows[i].ItemArray)).ToString(), Get_Procedures("SqlServices").Item4[0].ToString(), Get_Procedures("SqlServices").Item3[0].ToString())+"<br>";
        }
        return true;   
    }

    private string Store_Data_Into_Loadtable(string connsrt, string sessionid, string loadcode, string line, string loadtable, string procedure)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@idsesion", sessionid);
        comm.Parameters.AddWithValue("@tablacargue", loadtable);
        comm.Parameters.AddWithValue("@linea", line);
        comm.Parameters.AddWithValue("@codigocargue", loadcode);
        comm.Parameters.AddWithValue("@estado", 0);
        comm.Parameters.AddWithValue("@spliter", ",");
        comm.Parameters.Add("@resultado", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
        conn.Open();
        comm.ExecuteNonQuery();
        string outp = Convert.ToString(comm.Parameters["@resultado"].Value);
        conn.Close();
        return outp;   
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
        RadGrid3.Visible = true;
    }

}
