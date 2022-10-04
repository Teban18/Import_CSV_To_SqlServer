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
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="importstatus" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="linesloadedvalid" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="linesloadedinvalid" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="linesloadedtotal" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBoxValidation" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="Confirmtext" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                                        <telerik:CardTitleComponent runat="server" Content="Importer de datos"></telerik:CardTitleComponent>
                                        <telerik:RadButton EnableEmbeddedSkins="false" ID="RadButton6" runat="server" Font-Size="14px" CssClass="k-button k-flat" Text="Ver estructura" OnClick="btn_Structure_Click" Enabled="true"></telerik:RadButton>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server">
                                        <telerik:RadAsyncUpload RenderMode="Lightweight"  runat="server" ID="RadAsyncUpload1" MaxFileInputsCount="1"  HideFileInput="true" Localization-Select="Cargar archivo o arrastrar" overwriteexistingfiles="true" TargetFolder="~/MyFiles"></telerik:RadAsyncUpload>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Archivo tiene título?"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList1" CssClass="ddlist" runat="server" DropDownHeight="">
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
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" Width="100%" EmptyMessage=""></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBox1" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Nombre del cargue"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTables" CssClass="ddlist" runat="server" DropDownHeight=""></telerik:RadDropDownList>       
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" CssClass="btnvalid" runat="server" OnClick="btn_Prevalidate_Click" Text="Pre-validar archivo"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="importstatus" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No pre-validado"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton5" CssClass="btnvalid" runat="server" OnClick="btn_Confirmpv_Click" Text="Ejecutar" Value="0" Enabled="false"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="Confirmtext" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No guardada"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Estado del proceso"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server">
                                        Estado acá
                                    </telerik:CardBodyComponent>    
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Lineas validadas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Totales"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Validas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Invalidas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="linesloadedtotal" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="linesloadedvalid" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="linesloadedinvalid" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Líneas almacenadas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>                
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Totales"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Validas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Invalidas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="RadLinkButton1" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="RadLinkButton2" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="RadLinkButton3" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        <telerik:RadLinkButton EnableEmbeddedSkins="false" runat="server" Font-Size="14px" CssClass="k-button k-flat k-button-icon" Icon-CssClass=""></telerik:RadLinkButton>
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="8" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:RadAjaxPanel>
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid2" AutoGenerateColumns="true" AllowPaging="true" PageSize="11" OnNeedDataSource="RadGrid2_NeedDataSource1" AllowSorting="true" Visible="false">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true"> 
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <telerik:RadTextBox id="RadTextBoxValidation" runat="server" TextMode="MultiLine"  Rows="2" Wrap="true" Width="100%" Height="300" Visible="false" Text="Vacío" Enabled="false"></telerik:RadTextBox>
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
            
         <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Modal="false" OffsetElementID="main" Style="z-index: 100001;">
            <ContentTemplate>
                <div id="myPanel1" runat="server">

                </div>
            </ContentTemplate>
        </telerik:RadWindow>

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
