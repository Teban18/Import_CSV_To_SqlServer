using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetInterfazName("SqlServices");
    }

    private void GetInterfazName(string connsrt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("SELECT * FROM dbo.TBINTERFAZ_EXPORTACION", conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                RadDropDownInter.Items.Add(new DropDownListItem(reader[1].ToString(), reader[0].ToString()));
            }
        }
        conn.Close();
    }

    private string insertGeneralDataInterface(string connsrt, string interfacename, int interfacetype, string interfacerules, string idsession)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
            SqlCommand comm = new SqlCommand("INSERT INTO dbo.TBINTERFAZ_EXPORTACION (NOMBRE_INTERFAZ,TIPO_INTERFAZ,REGLAS_REGISTRO,ID_SESION_OPERATION) VALUES (@in,@it,@ir,@is);", conn);
            conn.Open();
            comm.Parameters.AddWithValue("@in", interfacename);
            comm.Parameters.AddWithValue("@it", interfacetype);
            comm.Parameters.AddWithValue("@ir", interfacerules);
            comm.Parameters.AddWithValue("@is", idsession);
            comm.ExecuteNonQuery();
            conn.Close();
            return "Cargado con éxito";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        
    }

    protected void generateInterface(object sender, EventArgs e)
    {
        try
        {
            RadLabel11.Text = insertGeneralDataInterface("SqlServices", RadTextBox7.Text, Int32.Parse(RadTextBox8.Text), "cc", "asasas");
            RadTextBox7.Text = null;
            RadTextBox8.Text = null;
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }

    protected void RadDropDownInterSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GetInterfaceRegType("SqlServices", Int32.Parse(RadDropDownInter.SelectedItem.Value));
            RadButton4.Enabled = true;
            RadButton1.Enabled = true;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.Write(ex.Message);        
        }
        
    }

    private void GetInterfaceRegType(string connsrt, int intcode)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("select * from dbo.tbinterfaz_exportacion where Codigo_interfaz = @ic", conn);
        conn.Open();
        comm.Parameters.AddWithValue("@ic", intcode);
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                RadLabel2.Text = "Tipo de interfaz : " + reader[2].ToString() + " Reglas : " + reader[3].ToString();
            }
        }
        conn.Close();
    }

    private string insertParamDataInterface(string connsrt, int codeinterface, string sqlsentence, string keyfield)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("INSERT INTO dbo.TBTIPOREGISTRO_EXPORTACION (CODIGO_INTERFAZ,CONSULTA_SQL,CAMPO_CLAVE) VALUES (@ci,@cs,@cc);", conn);
        conn.Open();
        comm.Parameters.AddWithValue("@ci", codeinterface);
        comm.Parameters.AddWithValue("@cs", sqlsentence);
        comm.Parameters.AddWithValue("@cc", keyfield);
        comm.ExecuteNonQuery();
        conn.Close();
        return "Cargado con éxito";
    }

    protected void generateInterfaceColumn(object sender, EventArgs e)
    {
        try
        {
            RadLabel19.Text = insertParamDataInterface("SqlServices", Int32.Parse(RadDropDownInter.SelectedItem.Value), RadTextBox2.Text, RadTextBox11.Text);
            RadTextBox2.Text = null; 
        }
        catch (Exception ex)
        {
            RadLabel19.Text = ex.Message;
        }
    }

    protected void radtxtSerachDocument_TextChanged(object sender, EventArgs e)
    {
        try
        {
            sqlSentenceValidator("SqlServices", RadTextBox2.Text);
            RadLabel3.Text = "Sentencia validada por la bd :)";
        }
        catch (Exception ex)
        {
            RadLabel3.Text = "Hay errores en la sentecia : "+ex.Message;
        }
        
    }

    private void sqlSentenceValidator(string connsrt, string sentence)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(sentence, conn);
        conn.Open();
        comm.ExecuteNonQuery();
        conn.Close();
    }

    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {
        LoadDataForRadGrid1();
    }

    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadDataForRadGrid1();
    }

    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        LoadDataForRadGrid1();
    }

    private void LoadDataForRadGrid1()
    {
        RadGridVis.DataSource = GetDataTable("SqlServices");
    }

    public DataTable GetDataTable(string connstr)
    {
        string query = "SELECT * FROM dbo.TBTIPOREGISTRO_EXPORTACION";

        String ConnString = ConfigurationManager.ConnectionStrings[connstr].ConnectionString;
        SqlConnection conn = new SqlConnection(ConnString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(query, conn);

        DataTable myDataTable = new DataTable();

        conn.Open();
        try
        {
            adapter.Fill(myDataTable);
        }
        finally
        {
            conn.Close();
        }

        return myDataTable;
    }

    protected void generateCompleteView(object sender, EventArgs e)
    {
        try
        {
            LoadDataForRadGrid1();
            RadGridVis.DataBind();
        }
        catch (Exception ex)
        {
            
        }
    }

    /*protected void tabClick(object sender, RadTabStripEventArgs e)
    {
        checkTabOption(e.Tab.UniqueID);
        
    }

    private void checkTabOption(string id)
    {
        if (id == "RadTabStrip1$i1")
        {
            System.Diagnostics.Debug.Write("Abajo");
        }
        else if (id == "RadTabStrip1$i0")
        {
            System.Diagnostics.Debug.Write("Arriba");
            LoadDataForRadGrid1();
            RadGridVis.DataBind();
        }
    }*/


}