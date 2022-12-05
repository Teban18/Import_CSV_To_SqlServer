<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default"  Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Design.css" rel="stylesheet" type="text/css" />
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
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

        <telerik:RadAjaxManager runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGrid3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="paneldesc" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBoxValidation" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton6">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton6" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid3" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                                <telerik:RadCard runat="server">
                                    <telerik:CardBodyComponent runat="server">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
                                            <Tabs>
                                                <telerik:RadTab Text="Prevalidación" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Validación y almacenamiento" Width="200px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Nombre del cargue"></telerik:RadLinkButton>
                                                    <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTables" runat="server" DropDownHeight=""></telerik:RadDropDownList>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Archivo tiene título?"></telerik:RadLinkButton>
                                                    <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList1" runat="server" DropDownHeight="">
                                                        <Items>
                                                            <telerik:DropDownListItem Text="Si" Value="1"/>
                                                            <telerik:DropDownListItem Text="No" Value="0"/>
                                                        </Items>
                                                    </telerik:RadDropDownList>   
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Caracter separador"></telerik:RadLinkButton> 
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage=""></telerik:RadTextBox>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadAsyncUpload RenderMode="Lightweight"  runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1"  HideFileInput="true" Localization-Select="Cargar archivo" overwriteexistingfiles="true" TargetFolder="~/MyFiles"></telerik:RadAsyncUpload>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" runat="server" OnClick="btn_Prevalidate_Click" Text="Pre-validar archivo"></telerik:RadButton>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid2" AutoGenerateColumns="true" AllowFilteringByColumn="true" AllowPaging="true" OnNeedDataSource="RadGrid2_NeedDataSource1" PageSize="5" Visible="false">
                                                        <ClientSettings>
                                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                                        </ClientSettings>
                                                        <MasterTableView AutoGenerateColumns="true" AllowFilteringByColumn="true"> 
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton5" CssClass="btnvalid" runat="server" OnClick="btn_Confirmpv_Click" Text="Ejecutar" Value="0" Enabled="false"></telerik:RadButton>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <div runat="server" id="paneldesc">

                                                    </div>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                        </telerik:RadMultiPage>
                                    </telerik:CardBodyComponent>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server">
                                    <telerik:CardBodyComponent runat="server">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
                                            <Tabs>
                                                <telerik:RadTab Text="Estructura esperada" Width="200px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage2"  SelectedIndex="0" CssClass="outerMultiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Nombre del cargue"></telerik:RadLinkButton>
                                                    <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList2" runat="server" DropDownHeight=""></telerik:RadDropDownList>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadButton runat="server" ID="RadButton6" OnClick="btn_Structure_Click" Text="Ver estructura del cargue" Enabled="true"></telerik:RadButton>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid3" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" AllowFilteringByColumn="true" AllowPaging="true" PageSize="10" Visible="false" MasterTableView-PagerStyle-AlwaysVisible="true">
                                                        <ClientSettings>
                                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                                        </ClientSettings>
                                                        <MasterTableView DataSourceID="SqlDataSource1">
                                                            <Columns>
                                                                <telerik:GridBoundColumn DataField="CAMP_DESCRIPCION" FilterControlAltText="Filter column column" HeaderText="Campo esperado" ReadOnly="True" UniqueName="Supplier">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="alias_tipo_dato" FilterControlAltText="Filter column column" HeaderText="Tipo de dato permitido" UniqueName="Prime">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CAMP_LONGITUD" FilterControlAltText="Filter column1 column" HeaderText="Longitud maxima permitida" UniqueName="RSDCSv">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CAMP_NULO" FilterControlAltText="Filter column2 column" HeaderText="Recibe nulos" UniqueName="Mill">
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn DataField="CAMP_FORMATO" FilterControlAltText="Filter column3 column" HeaderText="Formato esperado" UniqueName="Eng">
                                                                </telerik:GridBoundColumn>
                                                            </Columns>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SqlServices %>"
                                                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM TBCAMPOS_CARGUE c INNER JOIN TBOPCION_CARGUE o on c.OP_CODIGO = o.OPC_CODIGO INNER JOIN TBTIPO_DATO t on c.CAMP_TIPO = t.id_tipo_dato WHERE o.OPC_CODIGO = @tables" runat="server">
                                                        <SelectParameters>
                                                            <asp:ControlParameter Name="tables" ControlID="RadDropDownList2" />
                                                        </SelectParameters>
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
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:RadAjaxPanel>
        <script type="text/javascript">
            //Put your JavaScript code here.
            function GridCreated(sender, args) {
                $('.rgDataDiv').removeAttr('style');
                $('.rgDataDiv').attr('style', 'overflow-x: scroll;');
            }
        </script>
    </form>
</body>
</html>
