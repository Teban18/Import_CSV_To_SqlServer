<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
<title>Exportación</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Width="20px">
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadAjaxManager runat="server" ID="RadAjaxMan">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox7" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox8" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton4">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton4" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel19" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDropDownInter">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton4" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="Lay2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="errorcontainer" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownInter" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadTextBox2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager> 

        <telerik:radpagelayout id="RadPageLayout3" runat="server" gridtype="Fluid">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
                        </div>
                    </Content>
                </telerik:LayoutRow>
                <telerik:LayoutRow>
                    <Columns>
                        <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server" Orientation="Vertical">
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
                                            <Tabs>
                                                <telerik:RadTab Text="Crear interfaz" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Parametrizar interfaz" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Formato de salida" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Ver interfaz" Width="200px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                            <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel1" runat="server" Text="Seleccione la interfaz"></telerik:RadLabel>
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownInter" runat="server" OnSelectedIndexChanged="RadDropDownInterSelectedIndexChanged" AutoPostBack="true" DefaultMessage="Seleccionar interfaz"></telerik:RadDropDownList>
                                        </telerik:CardBodyComponent>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="DsInterface"
                                                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True" PageSize="10" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowAutomaticDeletes="true" AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <MasterTableView DataSourceID="DsInterface" AutoGenerateColumns="False"
                                                            DataKeyNames="CODIGO_INTERFAZ" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="CODIGO_INTERFAZ" HeaderText="Codigo" SortExpression="CODIGO_INTERFAZ"
                                                                    UniqueName="CODIGO_INTERFAZ" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="NOMBRE_INTERFAZ" HeaderText="Nombre" SortExpression="NOMBRE_INTERFAZ"
                                                                    UniqueName="NOMBRE_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="TIPO_INTERFAZ" HeaderText="Tipo" SortExpression="TIPO_INTERFAZ"
                                                                    UniqueName="TIPO_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="REGLAS_REGISTRO" HeaderText="Registro" SortExpression="REGLAS_REGISTRO"
                                                                    UniqueName="REGLAS_REGISTRO">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION_OPERATION" HeaderText="Id sesion" SortExpression="ID_SESION_OPERATION"
                                                                    UniqueName="ID_SESION_OPERATION" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REG" HeaderText="Es visible" SortExpression="LOG_REG"
                                                                    UniqueName="LOG_REG" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="DsInterface" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBINTERFAZ_EXPORTACION] ([NOMBRE_INTERFAZ], [TIPO_INTERFAZ], [REGLAS_REGISTRO], [ID_SESION_OPERATION], [LOG_REG]) VALUES (@NOMBRE_INTERFAZ, @TIPO_INTERFAZ, @REGLAS_REGISTRO, @IDSES, @LOG_REG)" 
                                                        SelectCommand="SELECT * FROM [TBINTERFAZ_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBINTERFAZ_EXPORTACION] SET [NOMBRE_INTERFAZ] = @NOMBRE_INTERFAZ, [TIPO_INTERFAZ] = @TIPO_INTERFAZ, [REGLAS_REGISTRO] = @REGLAS_REGISTRO, [LOG_REG] = @LOG_REG WHERE [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ" 
                                                        DeleteCommand="UPDATE [TBINTERFAZ_EXPORTACION] SET [LOG_REG] = 0 WHERE [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="TIPO_INTERFAZ" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="REGLAS_REGISTRO" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="IDSES" Type="String" DefaultValue="asdeeca"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REG" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="TIPO_INTERFAZ" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="REGLAS_REGISTRO" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="LOG_REG" Type="Boolean"></asp:Parameter>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                                 <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel5" runat="server" Text="Consulta sql para traer datos"></telerik:RadLabel>
                                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox2" TextMode="MultiLine" Width="80%" runat="server" AutoPostBack="true" OnTextChanged="radtxtSerachDocument_TextChanged" Text=""></telerik:RadTextBox>
                                                    <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel3" runat="server" Text=""></telerik:RadLabel>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel16" runat="server" Text="Campo clave"></telerik:RadLabel>
                                                    <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox11" runat="server" Text=""></telerik:RadTextBox>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel19" runat="server" Text=""></telerik:RadLabel>
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton4" CssClass="btnvalid" runat="server" OnClick="generateInterfaceColumn" Enabled="false" Text="Cargar"></telerik:RadButton>
                                                </telerik:CardBodyComponent>


                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid2" runat="server" DataSourceID="PaInterface"
                                                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True" PageSize="10" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowAutomaticDeletes="true" AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <MasterTableView DataSourceID="PaInterface" AutoGenerateColumns="False"
                                                            DataKeyNames="TIPO_REGISTRO" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="CODIGO_INTERFAZ" HeaderText="Codigo" SortExpression="CODIGO_INTERFAZ"
                                                                    UniqueName="CODIGO_INTERFAZ" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CONSULTA_SQL" HeaderText="Consulta para traer datos" SortExpression="CONSULTA_SQL"
                                                                    UniqueName="CONSULTA_SQL">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION_OPERATION" HeaderText="Id sesion" SortExpression="ID_SESION_OPERATION"
                                                                    UniqueName="ID_SESION_OPERATION" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REG" HeaderText="Es visible" SortExpression="LOG_REG"
                                                                    UniqueName="LOG_REG" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="PaInterface" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBTIPOREGISTRO_EXPORTACION] ([NOMBRE_INTERFAZ], [TIPO_INTERFAZ], [REGLAS_REGISTRO], [ID_SESION_OPERATION], [LOG_REG]) VALUES (@NOMBRE_INTERFAZ, @TIPO_INTERFAZ, @REGLAS_REGISTRO, @IDSES, @LOG_REG)" 
                                                        SelectCommand="SELECT * FROM [TBTIPOREGISTRO_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBTIPOREGISTRO_EXPORTACION] SET [NOMBRE_INTERFAZ] = @NOMBRE_INTERFAZ, [TIPO_INTERFAZ] = @TIPO_INTERFAZ, [REGLAS_REGISTRO] = @REGLAS_REGISTRO, [LOG_REG] = @LOG_REG WHERE [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ" 
                                                        DeleteCommand="UPDATE [TBTIPOREGISTRO_EXPORTACION] SET [LOG_REG] = 0 WHERE [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="TIPO_INTERFAZ" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="REGLAS_REGISTRO" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="IDSES" Type="String" DefaultValue="asdeeca"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REG" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="TIPO_INTERFAZ" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="REGLAS_REGISTRO" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="LOG_REG" Type="Boolean"></asp:Parameter>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>

                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView4">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage2" SelectedIndex="0"
                                                    Orientation="HorizontalTop" Skin="Silk" >
                                                        <Tabs>
                                                            <telerik:RadTab Text="Estructura de salida"></telerik:RadTab>
                                                        </Tabs>
                                                    </telerik:RadTabStrip>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadMultiPage runat="server" ID="RadMultiPage2"  SelectedIndex="0" CssClass="innerMultiPage">
                                                        <telerik:RadPageView runat="server" ID="PageView2">
                                                            <div runat="server" id="Lay2">

                                                            </div>
                                                        </telerik:RadPageView>
                                                    </telerik:RadMultiPage>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView5">
                                            
                                            </telerik:RadPageView>
                                        </telerik:RadMultiPage>
                                    </telerik:CardBodyComponent>
                                </telerik:RadCard>


                            </div>
                        </telerik:LayoutColumn>
                    </Columns>
                </telerik:LayoutRow>
                
                <telerik:LayoutRow>
                    <Content>
                        <div class="footer">

                        </div>
                    </Content>
                </telerik:LayoutRow>
            </Rows>
        </telerik:radpagelayout>
    </form>
</body>
</html>
