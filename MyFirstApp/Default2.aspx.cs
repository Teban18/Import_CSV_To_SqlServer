using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Get_Creation_PrepareLoading("SqlServices");
            }
        }
        catch { }
    }

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
                myPanel1.InnerHtml = "Opción " + RadTextBox3.Text.ToString() + " creada con éxito";
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