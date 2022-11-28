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
using System.Collections;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetInterfazName("SqlServices");
        }
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

    /*protected void generateInterface(object sender, EventArgs e)
    {
        try
        {
            RadLabel11.Text = insertGeneralDataInterface("SqlServices", RadTextBox7.Text, Int32.Parse(RadTextBox8.Text), "cc", "asasas");
        }
        catch (Exception ex)
        {
            RadLabel11.Text = ex.Message;
        }
    }*/

    protected void RadDropDownInterSelectedIndexChanged(object sender, EventArgs e)
    {
        RadButton4.Enabled = true;
        try
        {
            for (int i = 0; i < GetInterfaceRegType("SqlServices", Int32.Parse(RadDropDownInter.SelectedItem.Value)).Item1.Count; i++)
            {
                DefineGridStructure(GetInterfaceRegType("SqlServices", Int32.Parse(RadDropDownInter.SelectedItem.Value)).Item2[i].ToString(), Lay2);
            }
        }
        catch (Exception ex)
        {
            
        }
    }

    private Tuple<List<object>, List<object>> GetInterfaceRegType(string connsrt, int intcode)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connsrt].ConnectionString);
        SqlCommand comm = new SqlCommand("select * from dbo.tbtiporegistro_exportacion where Codigo_interfaz = @ic", conn);
        conn.Open();
        comm.Parameters.AddWithValue("@ic", intcode);
        List<object> sqlconn = new List<object>();
        List<object> keyf = new List<object>();
        using (SqlDataReader reader = comm.ExecuteReader())
        {
            while (reader.Read())
            {
                sqlconn.Add(reader[2].ToString());
                keyf.Add(reader[3].ToString());
            }
        }
        conn.Close();
        return Tuple.Create(keyf, sqlconn);
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

    public DataTable GetDataTable(string connstr, string sqlsentence)
    {
        string query = sqlsentence;

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

    private void DefineGridStructure(string sqlsentence, Control parent)
    {
        RadGrid RadGrid1 = new RadGrid();
        //RadGrid1.MasterTableView.DataKeyNames = new string[] { "CustomerID" };
        //RadGrid1.Skin = "Default";
        //RadGrid1.Width = Unit.Percentage(100);
        RadGrid1.PageSize = 10;
        RadGrid1.AllowPaging = true;
        RadGrid1.AutoGenerateColumns = true;
        RadGrid1.AllowFilteringByColumn = true;
        RadGrid1.DataSource = GetDataTable("SqlServices", sqlsentence);

        //RadAjaxManager ram = new RadAjaxManager();
        //ram.AjaxSettings.AddAjaxSetting(RadGrid1,RadGrid1);
        /*
        GridBoundColumn boundColumn;
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "CustomerID";
        boundColumn.HeaderText = "CustomerID";
        RadGrid1.MasterTableView.Columns.Add(boundColumn);
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "ContactName";
        boundColumn.HeaderText = "Contact Name";
        RadGrid1.MasterTableView.Columns.Add(boundColumn);

        //Detail table - Orders (II in hierarchy level)
        GridTableView tableViewOrders = new GridTableView(RadGrid1);
        tableViewOrders.DataSourceID = "SqlDataSource2";
        tableViewOrders.DataKeyNames = new string[] { "OrderID" };
        GridRelationFields relationFields = new GridRelationFields();
        relationFields.MasterKeyField = "CustomerID";
        relationFields.DetailKeyField = "CustomerID";
        tableViewOrders.ParentTableRelation.Add(relationFields);
        RadGrid1.MasterTableView.DetailTables.Add(tableViewOrders);
        //Add columns
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "OrderID";
        boundColumn.HeaderText = "OrderID";
        tableViewOrders.Columns.Add(boundColumn);
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "OrderDate";
        boundColumn.HeaderText = "Date Ordered";
        tableViewOrders.Columns.Add(boundColumn);
        //Detail table Order-Details (III in hierarchy level)
        GridTableView tableViewOrderDetails = new GridTableView(RadGrid1);
        tableViewOrderDetails.DataSourceID = "SqlDataSource3";
        tableViewOrderDetails.DataKeyNames = new string[] { "OrderID" };
        GridRelationFields relationFields2 = new GridRelationFields();
        relationFields2.MasterKeyField = "OrderID";
        relationFields2.DetailKeyField = "OrderID";
        tableViewOrderDetails.ParentTableRelation.Add(relationFields2);
        tableViewOrders.DetailTables.Add(tableViewOrderDetails);
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "UnitPrice";
        boundColumn.HeaderText = "Unit Price";
        tableViewOrderDetails.Columns.Add(boundColumn);
        boundColumn = new GridBoundColumn();
        boundColumn.DataField = "Quantity";
        boundColumn.HeaderText = "Quantity";
        tableViewOrderDetails.Columns.Add(boundColumn);
        //Add the RadGrid instance to the controls*/
        parent.Controls.Add(RadGrid1);
        RadAjaxMan.AjaxSettings.AddAjaxSetting(RadGrid1, RadGrid1, RadAjaxLoadingPanel1);
    }


    //test 


    protected void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            if (!(e.Item is GridEditFormInsertItem))
            {
                GridEditableItem item = e.Item as GridEditableItem;
                GridEditManager manager = item.EditManager;
                GridTextBoxColumnEditor ci = manager.GetColumnEditor("CODIGO_INTERFAZ") as GridTextBoxColumnEditor;
            }
        }
    }
    protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SetMessage("Customer cannot be inserted. Reason: " + e.Exception.Message);
        }
        else
        {
            SetMessage("New customer is inserted!");
        }
    }
    private void DisplayMessage(string text)
    {
        RadGrid1.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
    }

    private void SetMessage(string message)
    {
        gridMessage = message;
    }

    private string gridMessage = null;

    protected void RadGrid1_PreRender(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(gridMessage))
        {
            DisplayMessage(gridMessage);
        }
    }

    protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
    {
        if (e.Item is GridEditableItem)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);
        }
    }

}