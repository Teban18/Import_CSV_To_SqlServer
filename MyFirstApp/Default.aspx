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
                        <telerik:AjaxUpdatedControl ControlID="Progress1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="cardesc" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="Progress1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="linesloadedvalid" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="linesloadedinvalid" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="linesloadedtotal" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBoxValidation" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="cardesc" LoadingPanelID="RadAjaxLoadingPanel1"/>
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
                        <telerik:LayoutColumn Span="4" SpanXs="12" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:RadButton runat="server" ID="RadButton6" OnClick="btn_Structure_Click" Text="Ver estructura del cargue" Enabled="true"></telerik:RadButton>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server">
                                        <telerik:RadAsyncUpload RenderMode="Lightweight"  runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1"  HideFileInput="true" Localization-Select="Cargar archivo o arrastrar" overwriteexistingfiles="true" TargetFolder="~/MyFiles"></telerik:RadAsyncUpload>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Archivo tiene título?"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList1" runat="server" DropDownHeight="">
                                                <Items>
                                                    <telerik:DropDownListItem Text="Si" Value="1"/>
                                                    <telerik:DropDownListItem Text="No" Value="0"/>
                                                </Items>
                                            </telerik:RadDropDownList>       
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Separador"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" Width="50" EmptyMessage=""></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBox1" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Nombre del cargue"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTables" runat="server" DropDownHeight=""></telerik:RadDropDownList>       
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" runat="server" OnClick="btn_Prevalidate_Click" Text="Pre-validar archivo"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton5" CssClass="btnvalid" runat="server" OnClick="btn_Confirmpv_Click" Text="Ejecutar" Value="0" Enabled="false"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Estado del proceso"></telerik:CardTitleComponent>
                                        <telerik:RadProgressBar RenderMode="Lightweight" ID="Progress1" runat="server" Width="100%" BarType="Percent" Value="0" MaxValue="4" ShowLabel="true" >
                                            <AnimationSettings Duration="500" EnableChunkAnimation="true" />
                                        </telerik:RadProgressBar>
                                         <telerik:RadLabel runat="server" ID="RadLabel3" MarkDisplayMode="Optional" OptionalMark=" (no iniciado)"></telerik:RadLabel>
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>
                                <br />
                                 <telerik:RadCard runat="server" Orientation="Vertical" ID="cardesc" Visible="false">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Descripción del proceso"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <ContentTemplateTile>
                                        <div ID="paneldesc" runat="server">
                                        </div>
                                    </ContentTemplateTile>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="8" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid3" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" AllowFilteringByColumn="true" AllowPaging="true" PageSize="5" Visible="false">
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
                                        <asp:ControlParameter Name="tables" ControlID="RadDropDownTables" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid2" AutoGenerateColumns="true" AllowFilteringByColumn="true" AllowPaging="true" OnNeedDataSource="RadGrid2_NeedDataSource1" PageSize="5" Visible="false">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true" AllowFilteringByColumn="true"> 
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                            <div class="col">
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
