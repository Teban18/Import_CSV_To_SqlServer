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
        
    }

    /*    Interfaz general   */

    private string insert_General_Data_Interface(string connsrt, string interfacename, int interfacetype, string interfacerules, string procedure, string idsession)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand(procedure, conn);
        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@idsesion", idsession);
        comm.Parameters.AddWithValue("@nombreint", interfacename);
        comm.Parameters.AddWithValue("@tipoint", interfacetype);
        comm.Parameters.AddWithValue("@reglasint", interfacerules);
        comm.Parameters.Add("@resultado", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
        conn.Open();
        comm.ExecuteNonQuery();
        string outp = Convert.ToString(comm.Parameters["@resultado"].Value);
        conn.Close();
        return outp;
    }

    protected void generateInterfaz(object sender, EventArgs e)
    {
        try
        {
            RadLabel11.Text = insert_General_Data_Interface("SqlServices", RadTextBox7.Text, Int32.Parse(RadTextBox8.Text), "cc", "SP_INTERFAZ_GEN", "asasas");
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }

    protected void openCard(object sender, EventArgs e)
    {
        try
        {
            Get_Interfaz_Name("SqlServices");
            paramcard.Visible = true;
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }

    /*   Parametrizacion de interfaz   */

    protected void RadDropDownInter_SelectedIndexChanged(object sender, EventArgs e)
    {
        Get_Interfaz_Reg_Type("SqlServices", Int32.Parse(RadDropDownInter.SelectedItem.Value));
        RadButton3.Enabled = true;
    }

    private void Get_Interfaz_Name(string connsrt)
    {
        RadDropDownInter.Items.Clear();
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

    private void Get_Interfaz_Reg_Type(string connsrt, int intcode)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("select * from dbo.tbinterfaz_exportacion where Codigo_interfaz =" + intcode, conn);
        conn.Open();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                RadLabel2.Text = "Tipo de interfaz : " + reader[2].ToString() + " Reglas : " + reader[3].ToString();
            }
        }
        conn.Close();
    }

    protected void openVis(object sender, EventArgs e)
    {
        try
        {
            RadCard1.Visible = true;
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }

    protected void openModal(object sender, EventArgs e)
    {
        try
        {
            modalPopup.VisibleOnPageLoad = true;
            modalPopup.Visible = true;
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }

    /* Visualizacion de la interfaz */



}