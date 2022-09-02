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
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="importstatus" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="modalPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton5">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownTables" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="Confirmtext" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="totallines" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="totalvalidlines" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="totalinvalidlines" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="spvalidate" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton4" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="validstatus" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBoxValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton4">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBoxStoring" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton6">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="modalPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="myPanel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="myTable1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton6" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager> 

        <telerik:radpagelayout id="RadPageLayout3" runat="server" gridtype="Fluid">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
                            <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA" width="100"/>
                        </div>
                    </Content>
                </telerik:LayoutRow>
                <telerik:LayoutRow>
                    <Columns>
                        <telerik:LayoutColumn Span="4" SpanXs="12" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server" Skin="WebBlue">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Pre-validación de datos"></telerik:CardTitleComponent>
                                        <telerik:RadButton EnableEmbeddedSkins="false" ID="RadButton6" runat="server" Font-Size="14px" CssClass="k-button k-flat" Text="Ver estructura" OnClick="btn_Structure_Click" Enabled="true"></telerik:RadButton>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server">
                                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="RadAsyncUpload1" Skin="WebBlue" DropZones=".DropZone1" Localization-Select="Cargar archivo"/>
                                        <div class="DropZone1">
                                            <p>O arrastrelos aquí</p>
                                            <p>📁</p>
                                        </div>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Separador"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" Skin="WebBlue" Width="100%" EmptyMessage=""></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBox1" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Tipo de cargue"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTables" CssClass="ddlist" runat="server" DropDownHeight="" Skin="WebBlue"></telerik:RadDropDownList>       
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" CssClass="btnvalid" runat="server" Skin="WebBlue" OnClick="btn_Prevalidate_Click" Text="Pre-validar Archivo"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="importstatus" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No pre-validado"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton5" CssClass="btnvalid" runat="server" Skin="WebBlue" OnClick="btn_Confirm_Click" Text="Guardar estado" Value="0" Enabled="false"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="Confirmtext" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No guardado"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Validación de datos"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton3" CssClass="btnvalid" runat="server" Skin="WebBlue" OnClick="btn_Validate_Click" Text="Validar Archivo" Enabled="false"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="validstatus" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No validado"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Procedimiento"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="spvalidate" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="x">
                                            </telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Líneas totales"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="totallines" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0">
                                            </telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Líneas validadas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="totalvalidlines" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="Líneas Invalidadas"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" ID="totalinvalidlines" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="0"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Almacenamiento de datos"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardActionsContainerComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton4" CssClass="btnvalid" runat="server" Skin="WebBlue" OnClick="btnStore_Click" Text="Almacenar Archivo" Enabled="false"></telerik:RadButton>
                                        </telerik:CardActionComponent>
                                        <telerik:CardActionComponent runat="server">
                                            <telerik:RadLinkButton EnableEmbeddedSkins="false" CssClass="k-button k-flat k-primary" Font-Size="14px" runat="server" Text="No Almacenado"></telerik:RadLinkButton>
                                        </telerik:CardActionComponent>
                                    </telerik:CardActionsContainerComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        <telerik:RadLinkButton EnableEmbeddedSkins="false" runat="server" Font-Size="14px" CssClass="k-button k-flat k-button-icon" Icon-CssClass="p-icon p-i-facebook">
                                        </telerik:RadLinkButton>
                                        <telerik:RadLinkButton EnableEmbeddedSkins="false" runat="server" Font-Size="14px" CssClass="k-button k-flat k-button-icon" Icon-CssClass="p-icon p-i-pinterest"></telerik:RadLinkButton>
                                        <telerik:RadLinkButton EnableEmbeddedSkins="false" runat="server" Font-Size="14px" CssClass="k-button k-flat k-button-icon" Icon-CssClass="p-icon p-i-twitter"></telerik:RadLinkButton>
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="8" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:RadAjaxPanel>
                                <telerik:RadGrid runat="server" ID="RadGrid2" Skin="WebBlue" AllowPaging="true" AutoGenerateColumns="false" PageSize="10" OnNeedDataSource="RadGrid2_NeedDataSource1" AllowFilteringByColumn="true" Visible="false">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true"> 
                                        <Columns></Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <telerik:RadTextBox id="RadTextBoxValidation" runat="server" TextMode="MultiLine" Skin="WebBlue" Rows="2" Wrap="true" Width="100%" Height="334" Visible="false" Text="Vacío" Enabled="false"></telerik:RadTextBox>
                                <telerik:RadTextBox id="RadTextBoxStoring" runat="server" TextMode="MultiLine" Skin="WebBlue" Rows="2" Wrap="true" Width="100%" Height="280" Visible="false" Text="Vacío"></telerik:RadTextBox>
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

        <hr/>

        <telerik:RadPageLayout ID="RadPageLayout4" runat="server" GridType="Fluid" CssClass="borderCssClass">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
                            <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA" width="100"/>
                        </div>
                    </Content>
                </telerik:LayoutRow>
                <telerik:LayoutRow >
                    <Columns>
                        <telerik:LayoutColumn Span="4" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:radpagelayout id="RadPageLayout5" runat="server" gridtype="Fluid">
                                    <Rows>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="header">
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Columns>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label3" Skin="WebBlue" runat="server" Text="Nombre del cargue"></asp:Label>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" Skin="WebBlue" Width="" EmptyMessage=""></telerik:RadTextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB3" ControlToValidate="RadTextBox3" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label6" Skin="WebBlue" runat="server" Text="Tipo de cargue"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTipeLoad" CssClass="ddlist" runat="server" DropDownHeight="" Skin="WebBlue"></telerik:RadDropDownList>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredTipeload" ControlToValidate="RadDropDownTipeLoad" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label8" Skin="WebBlue" runat="server" Text="Separador"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" Skin="WebBlue" Width="" EmptyMessage=""></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB6" ControlToValidate="RadTextBox6" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label4" Skin="WebBlue" runat="server" Text="Tipo de dato"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" Skin="WebBlue" Width="" EmptyMessage="type,type..."></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB2" ControlToValidate="RadTextBox2" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label9" Skin="WebBlue" runat="server" Text="Posición"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7" Skin="WebBlue" Width="" EmptyMessage="posicion,posicion"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB7" ControlToValidate="RadTextBox7" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label10" Skin="WebBlue" runat="server" Text="Descripción"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" Skin="WebBlue" Width="" EmptyMessage="desc,desc"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB8" ControlToValidate="RadTextBox8" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label11" Skin="WebBlue" runat="server" Text="Longitud"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox9" Skin="WebBlue" Width="" EmptyMessage="8,7"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB9" ControlToValidate="RadTextBox9" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label12" Skin="WebBlue" runat="server" Text="Formato"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox10" Skin="WebBlue" Width="" EmptyMessage="YYYY-MM-DD,YYYY-MM-DD"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB10" ControlToValidate="RadTextBox10" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label13" Skin="WebBlue" runat="server" Text="Acepta nulo"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" Skin="WebBlue" Width="" EmptyMessage="false,true"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB11" ControlToValidate="RadTextBox11" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label5" Skin="WebBlue" runat="server" Text="Validación"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" Skin="WebBlue" Width="" TextMode="MultiLine" EmptyMessage="ej: xxxx-xxxx"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB4" ControlToValidate="RadTextBox4" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label7" Skin="WebBlue" runat="server" Text="Almacenamiento"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" Skin="WebBlue" Width="" TextMode="MultiLine" EmptyMessage="ej: xxxx-xxxx"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB5" ControlToValidate="RadTextBox5" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                            </Columns>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="footer" style="margin-top:2rem;margin-bottom:2rem;">
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton2" CssClass="btn" OnClick="btnCreate_Click" runat="server" Skin="WebBlue" Text="Crear Cargue"></telerik:RadButton>
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                    </Rows>
                                </telerik:radpagelayout>
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
        </telerik:RadPageLayout>    

         <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Skin="WebBlue" Modal="true" OffsetElementID="main" Style="z-index: 100001;">
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
