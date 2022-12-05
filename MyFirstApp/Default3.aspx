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
                <telerik:AjaxSetting AjaxControlID="RadGrid2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGrid3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid3" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                                                <telerik:RadTab Text="Definición general" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Definición de datos" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Definición de salida" Width="200px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="DsInterface"
                                                    AllowPaging="True" PageSize="10" AllowAutomaticInserts="true" AllowAutomaticUpdates="true" AllowAutomaticDeletes="true" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <MasterTableView DataSourceID="DsInterface" AutoGenerateColumns="False" Caption="Datos generales"
                                                            DataKeyNames="ID_INTERFAZ" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="ID_INTERFAZ" HeaderText="Código interfaz" SortExpression="ID_INTERFAZ"
                                                                    UniqueName="ID_INTERFAZ" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="NOMBRE_INTERFAZ" HeaderText="Nombre interfaz" SortExpression="NOMBRE_INTERFAZ"
                                                                    UniqueName="NOMBRE_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="ES_LONGITUD_FIJA" HeaderText="Es longitud fija" SortExpression="ES_LONGITUD_FIJA"
                                                                    UniqueName="ES_LONGITUD_FIJA">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION" HeaderText="Id sesión" SortExpression="ID_SESION"
                                                                    UniqueName="ID_SESION" ReadOnly="true">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_CREACION" HeaderText="Creación" SortExpression="FECHA_CREACION"
                                                                    UniqueName="FECHA_CREACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_ULTIMA_MODIFICACION" HeaderText="Última modificación" SortExpression="FECHA_ULTIMA_MODIFICACION"
                                                                    UniqueName="FECHA_ULTIMA_MODIFICACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REGISTRO" HeaderText="Es visible" SortExpression="LOG_REGISTRO"
                                                                    UniqueName="LOG_REGISTRO" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="DsInterface" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBDEF_EXPORTACION] ([NOMBRE_INTERFAZ], [ES_LONGITUD_FIJA], [ID_SESION], [FECHA_CREACION], [FECHA_ULTIMA_MODIFICACION], [LOG_REGISTRO]) VALUES (@NOMBRE_INTERFAZ, @ES_LONGITUD_FIJA, 'session1', CONVERT(varchar, GETDATE(), 120), CONVERT(varchar, GETDATE(), 120), @LOG_REGISTRO)" 
                                                        SelectCommand="SELECT * FROM [TBDEF_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBDEF_EXPORTACION] SET [NOMBRE_INTERFAZ] = @NOMBRE_INTERFAZ, [ES_LONGITUD_FIJA] = @ES_LONGITUD_FIJA, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120), [LOG_REGISTRO] = @LOG_REGISTRO WHERE [ID_INTERFAZ] = @ID_INTERFAZ" 
                                                        DeleteCommand="UPDATE [TBDEF_EXPORTACION] SET [LOG_REGISTRO] = 0, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120) WHERE [ID_INTERFAZ] = @ID_INTERFAZ" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID_INTERFAZ" Type="Int64"></asp:Parameter>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="ES_LONGITUD_FIJA" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_LONGITUD_FIJA" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="ID_INTERFAZ" Type="Int64"/>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid4" runat="server" DataSourceID="DsInterface"
                                                    AllowPaging="True" PageSize="10" AllowAutomaticInserts="true" AllowAutomaticUpdates="true" AllowAutomaticDeletes="true" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <MasterTableView DataSourceID="DsInterface" AutoGenerateColumns="False" Caption="Parametros"
                                                            DataKeyNames="ID_INTERFAZ" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="ID_INTERFAZ" HeaderText="Código interfaz" SortExpression="ID_INTERFAZ"
                                                                    UniqueName="ID_INTERFAZ" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="NOMBRE_INTERFAZ" HeaderText="Nombre interfaz" SortExpression="NOMBRE_INTERFAZ"
                                                                    UniqueName="NOMBRE_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="ES_LONGITUD_FIJA" HeaderText="Es longitud fija" SortExpression="ES_LONGITUD_FIJA"
                                                                    UniqueName="ES_LONGITUD_FIJA">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION" HeaderText="Id sesión" SortExpression="ID_SESION"
                                                                    UniqueName="ID_SESION" ReadOnly="true">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_CREACION" HeaderText="Creación" SortExpression="FECHA_CREACION"
                                                                    UniqueName="FECHA_CREACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_ULTIMA_MODIFICACION" HeaderText="Última modificación" SortExpression="FECHA_ULTIMA_MODIFICACION"
                                                                    UniqueName="FECHA_ULTIMA_MODIFICACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REGISTRO" HeaderText="Es visible" SortExpression="LOG_REGISTRO"
                                                                    UniqueName="LOG_REGISTRO" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBDEF_EXPORTACION] ([NOMBRE_INTERFAZ], [ES_LONGITUD_FIJA], [ID_SESION], [FECHA_CREACION], [FECHA_ULTIMA_MODIFICACION], [LOG_REGISTRO]) VALUES (@NOMBRE_INTERFAZ, @ES_LONGITUD_FIJA, 'session1', CONVERT(varchar, GETDATE(), 120), CONVERT(varchar, GETDATE(), 120), @LOG_REGISTRO)" 
                                                        SelectCommand="SELECT * FROM [TBDEF_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBDEF_EXPORTACION] SET [NOMBRE_INTERFAZ] = @NOMBRE_INTERFAZ, [ES_LONGITUD_FIJA] = @ES_LONGITUD_FIJA, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120), [LOG_REGISTRO] = @LOG_REGISTRO WHERE [ID_INTERFAZ] = @ID_INTERFAZ" 
                                                        DeleteCommand="UPDATE [TBDEF_EXPORTACION] SET [LOG_REGISTRO] = 0, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120) WHERE [ID_INTERFAZ] = @ID_INTERFAZ" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID_INTERFAZ" Type="Int64"></asp:Parameter>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"/>
                                                            <asp:Parameter Name="ES_LONGITUD_FIJA" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="NOMBRE_INTERFAZ" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_LONGITUD_FIJA" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="ID_INTERFAZ" Type="Int64"/>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid2" runat="server" DataSourceID="PaInterface"
                                                    AllowPaging="True" PageSize="10" AllowAutomaticInserts="true" AllowAutomaticUpdates="true" AllowAutomaticDeletes="true" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <ClientSettings>
                                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="true"></Scrolling>
                                                        </ClientSettings>
                                                        <MasterTableView DataSourceID="PaInterface" AutoGenerateColumns="False" Caption="Tipos de registro"
                                                            DataKeyNames="ID_TIPOREG" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="ID_TIPOREG" HeaderText="Código tipo registro" SortExpression="ID_TIPOREG"
                                                                    UniqueName="ID_TIPOREG" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CODIGO_INTERFAZ" HeaderText="Código interfaz asociada" SortExpression="CODIGO_INTERFAZ"
                                                                    UniqueName="CODIGO_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="POSICION_PARAM" HeaderText="Posición tipo registro" SortExpression="POSICION_PARAM"
                                                                    UniqueName="POSICION_PARAM">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="SENTENCIA_SQL" HeaderText="Sentencia Sql" SortExpression="SENTENCIA_SQL"
                                                                    UniqueName="SENTENCIA_SQL">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="ES_PROCEDIMIENTO" HeaderText="Es procedimiento almacenado" SortExpression="ES_PROCEDIMIENTO"
                                                                    UniqueName="ES_PROCEDIMIENTO">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION" HeaderText="Id sesión" SortExpression="ID_SESION"
                                                                    UniqueName="ID_SESION" ReadOnly="true">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_CREACION" HeaderText="Creación" SortExpression="FECHA_CREACION"
                                                                    UniqueName="FECHA_CREACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_ULTIMA_MODIFICACION" HeaderText="Última modificación" SortExpression="FECHA_ULTIMA_MODIFICACION"
                                                                    UniqueName="FECHA_ULTIMA_MODIFICACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REGISTRO" HeaderText="Es visible" SortExpression="LOG_REGISTRO"
                                                                    UniqueName="LOG_REGISTRO" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="PaInterface" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBTREG_EXPORTACION] ([CODIGO_INTERFAZ], [POSICION_PARAM], [SENTENCIA_SQL], [ES_PROCEDIMIENTO], [ID_SESION], [FECHA_CREACION], [FECHA_ULTIMA_MODIFICACION], [LOG_REGISTRO]) VALUES (@CODIGO_INTERFAZ, @POSICION_PARAM, @SENTENCIA_SQL, @ES_PROCEDIMIENTO, 'insertesesionaqui',CONVERT(varchar, GETDATE(), 120), CONVERT(varchar, GETDATE(), 120), @LOG_REGISTRO)" 
                                                        SelectCommand="SELECT * FROM [TBTREG_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBTREG_EXPORTACION] SET [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ, [POSICION_PARAM] = @POSICION_PARAM, [SENTENCIA_SQL] = @SENTENCIA_SQL, [ES_PROCEDIMIENTO] = @ES_PROCEDIMIENTO, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120), [LOG_REGISTRO] = @LOG_REGISTRO WHERE [ID_TIPOREG] = @ID_TIPOREG" 
                                                        DeleteCommand="UPDATE [TBTREG_EXPORTACION] SET [LOG_REGISTRO] = 0, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120) WHERE [ID_TIPOREG] = @ID_TIPOREG" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID_TIPOREG" Type="Int64"></asp:Parameter>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="POSICION_PARAM" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="SENTENCIA_SQL" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_PROCEDIMIENTO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="POSICION_PARAM" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="SENTENCIA_SQL" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_PROCEDIMIENTO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="ID_TIPOREG" Type="Int64"></asp:Parameter>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid5" runat="server" DataSourceID="PaInterface"
                                                    AllowPaging="True" PageSize="10" AllowAutomaticInserts="true" AllowAutomaticUpdates="true" AllowAutomaticDeletes="true" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <ClientSettings>
                                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="true"></Scrolling>
                                                        </ClientSettings>
                                                        <MasterTableView DataSourceID="PaInterface" AutoGenerateColumns="False" Caption="Estructura de campos"
                                                            DataKeyNames="ID_TIPOREG" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="ID_TIPOREG" HeaderText="Código tipo registro" SortExpression="ID_TIPOREG"
                                                                    UniqueName="ID_TIPOREG" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CODIGO_INTERFAZ" HeaderText="Código interfaz asociada" SortExpression="CODIGO_INTERFAZ"
                                                                    UniqueName="CODIGO_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="POSICION_PARAM" HeaderText="Posición tipo registro" SortExpression="POSICION_PARAM"
                                                                    UniqueName="POSICION_PARAM">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="SENTENCIA_SQL" HeaderText="Sentencia Sql" SortExpression="SENTENCIA_SQL"
                                                                    UniqueName="SENTENCIA_SQL">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridCheckBoxColumn DataField="ES_PROCEDIMIENTO" HeaderText="Es procedimiento almacenado" SortExpression="ES_PROCEDIMIENTO"
                                                                    UniqueName="ES_PROCEDIMIENTO">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridBoundColumn DataField="ID_SESION" HeaderText="Id sesión" SortExpression="ID_SESION"
                                                                    UniqueName="ID_SESION" ReadOnly="true">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_CREACION" HeaderText="Creación" SortExpression="FECHA_CREACION"
                                                                    UniqueName="FECHA_CREACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_ULTIMA_MODIFICACION" HeaderText="Última modificación" SortExpression="FECHA_ULTIMA_MODIFICACION"
                                                                    UniqueName="FECHA_ULTIMA_MODIFICACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REGISTRO" HeaderText="Es visible" SortExpression="LOG_REGISTRO"
                                                                    UniqueName="LOG_REGISTRO" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBTREG_EXPORTACION] ([CODIGO_INTERFAZ], [POSICION_PARAM], [SENTENCIA_SQL], [ES_PROCEDIMIENTO], [ID_SESION], [FECHA_CREACION], [FECHA_ULTIMA_MODIFICACION], [LOG_REGISTRO]) VALUES (@CODIGO_INTERFAZ, @POSICION_PARAM, @SENTENCIA_SQL, @ES_PROCEDIMIENTO, 'insertesesionaqui',CONVERT(varchar, GETDATE(), 120), CONVERT(varchar, GETDATE(), 120), @LOG_REGISTRO)" 
                                                        SelectCommand="SELECT * FROM [TBTREG_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBTREG_EXPORTACION] SET [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ, [POSICION_PARAM] = @POSICION_PARAM, [SENTENCIA_SQL] = @SENTENCIA_SQL, [ES_PROCEDIMIENTO] = @ES_PROCEDIMIENTO, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120), [LOG_REGISTRO] = @LOG_REGISTRO WHERE [ID_TIPOREG] = @ID_TIPOREG" 
                                                        DeleteCommand="UPDATE [TBTREG_EXPORTACION] SET [LOG_REGISTRO] = 0, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120) WHERE [ID_TIPOREG] = @ID_TIPOREG" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID_TIPOREG" Type="Int64"></asp:Parameter>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="POSICION_PARAM" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="SENTENCIA_SQL" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_PROCEDIMIENTO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="POSICION_PARAM" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="SENTENCIA_SQL" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="ES_PROCEDIMIENTO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="ID_TIPOREG" Type="Int64"></asp:Parameter>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView4">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid3" runat="server" DataSourceID="FrInterface"
                                                    AllowPaging="True" PageSize="10" AllowAutomaticInserts="true" AllowAutomaticUpdates="true" AllowAutomaticDeletes="true" MasterTableView-PagerStyle-AlwaysVisible="true"
                                                    AllowSorting="true" AllowFilteringByColumn="true">
                                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                                        <ClientSettings>
                                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="true"></Scrolling>
                                                        </ClientSettings>
                                                        <MasterTableView DataSourceID="FrInterface" AutoGenerateColumns="False" Caption="Archivo de salida"
                                                            DataKeyNames="ID_FORMATO" CommandItemDisplay="Top" AllowFilteringByColumn="true">
                                                            <Columns>
                                                                <telerik:GridEditCommandColumn HeaderText="Editar" UniqueName="EditCommandColumn">
                                                                </telerik:GridEditCommandColumn>
                                                                <telerik:GridBoundColumn DataField="ID_FORMATO" HeaderText="Código formato" SortExpression="ID_FORMATO"
                                                                    UniqueName="ID_FORMATO" InsertVisiblityMode="AlwaysHidden">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CODIGO_INTERFAZ" HeaderText="Código interfaz asociada" SortExpression="CODIGO_INTERFAZ"
                                                                    UniqueName="CODIGO_INTERFAZ">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="SEPARADOR" HeaderText="Separador" SortExpression="SEPARADOR"
                                                                    UniqueName="SEPARADOR">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridNumericColumn DataField="LONGITUD_CAMPO" HeaderText="Longitud campo" SortExpression="LONGITUD_CAMPO"
                                                                    UniqueName="LONGITUD_CAMPO">
                                                                </telerik:GridNumericColumn>
                                                                <telerik:GridBoundColumn DataField="JOKER_CAMPO" HeaderText="Joker campo" SortExpression="JOKER_CAMPO"
                                                                    UniqueName="JOKER_CAMPO">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="NOMBRE_ARCHIVO_SALIDA" HeaderText="Nombre archivo" SortExpression="NOMBRE_ARCHIVO_SALIDA"
                                                                    UniqueName="NOMBRE_ARCHIVO_SALIDA">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="TIPO_ARCHIVO_SALIDA" HeaderText="Tipo archivo" SortExpression="TIPO_ARCHIVO_SALIDA"
                                                                    UniqueName="TIPO_ARCHIVO_SALIDA">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_CREACION" HeaderText="Creación" SortExpression="FECHA_CREACION"
                                                                    UniqueName="FECHA_CREACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridDateTimeColumn DataField="FECHA_ULTIMA_MODIFICACION" HeaderText="Última modificación" SortExpression="FECHA_ULTIMA_MODIFICACION"
                                                                    UniqueName="FECHA_ULTIMA_MODIFICACION" ReadOnly="true">
                                                                </telerik:GridDateTimeColumn>
                                                                <telerik:GridCheckBoxColumn DataField="LOG_REGISTRO" HeaderText="Es visible" SortExpression="LOG_REGISTRO"
                                                                    UniqueName="LOG_REGISTRO" DefaultInsertValue="True">
                                                                </telerik:GridCheckBoxColumn>
                                                                <telerik:GridButtonColumn HeaderText="Dar de baja" CommandName="Delete"  />
                                                            </Columns>    
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="FrInterface" ConnectionString="<%$ ConnectionStrings:SqlServices %>" ProviderName="System.Data.SqlClient" 
                                                        InsertCommand="INSERT INTO [TBFORM_EXPORTACION] ([CODIGO_INTERFAZ], [SEPARADOR], [LONGITUD_CAMPO], [JOKER_CAMPO], [NOMBRE_ARCHIVO_SALIDA], [TIPO_ARCHIVO_SALIDA], [FECHA_CREACION], [FECHA_ULTIMA_MODIFICACION], [LOG_REGISTRO]) VALUES (@CODIGO_INTERFAZ, @SEPARADOR, @LONGITUD_CAMPO, @JOKER_CAMPO, @NOMBRE_ARCHIVO_SALIDA, @TIPO_ARCHIVO_SALIDA, CONVERT(varchar, GETDATE(), 120), CONVERT(varchar, GETDATE(), 120), @LOG_REGISTRO)" 
                                                        SelectCommand="SELECT * FROM [TBFORM_EXPORTACION]" 
                                                        UpdateCommand="UPDATE [TBFORM_EXPORTACION] SET [CODIGO_INTERFAZ] = @CODIGO_INTERFAZ, [SEPARADOR] = @SEPARADOR, [LONGITUD_CAMPO] = @LONGITUD_CAMPO, [JOKER_CAMPO] = @JOKER_CAMPO, [NOMBRE_ARCHIVO_SALIDA] = @NOMBRE_ARCHIVO_SALIDA, [TIPO_ARCHIVO_SALIDA] = @TIPO_ARCHIVO_SALIDA, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120), [LOG_REGISTRO] = @LOG_REGISTRO WHERE [ID_FORMATO] = @ID_FORMATO" 
                                                        DeleteCommand="UPDATE [TBFORM_EXPORTACION] SET [LOG_REGISTRO] = 0, [FECHA_ULTIMA_MODIFICACION] = CONVERT(varchar, GETDATE(), 120) WHERE [ID_FORMATO] = @ID_FORMATO" 
                                                        runat="server">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID_FORMATO" Type="Int64"></asp:Parameter>
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="SEPARADOR" Type="Char"></asp:Parameter>
                                                            <asp:Parameter Name="LONGITUD_CAMPO" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="NOMBRE_ARCHIVO_SALIDA" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="TIPO_ARCHIVO_SALIDA" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="JOKER_CAMPO" Type="Char"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="CODIGO_INTERFAZ" Type="Int64"/>
                                                            <asp:Parameter Name="SEPARADOR" Type="Char"></asp:Parameter>
                                                            <asp:Parameter Name="LONGITUD_CAMPO" Type="Int32"></asp:Parameter>
                                                            <asp:Parameter Name="NOMBRE_ARCHIVO_SALIDA" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="TIPO_ARCHIVO_SALIDA" Type="String"></asp:Parameter>
                                                            <asp:Parameter Name="JOKER_CAMPO" Type="Char"></asp:Parameter>
                                                            <asp:Parameter Name="LOG_REGISTRO" Type="Boolean"></asp:Parameter>
                                                            <asp:Parameter Name="ID_FORMATO" Type="Int64"></asp:Parameter>
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </telerik:CardBodyComponent>
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
