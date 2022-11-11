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

        <telerik:RadAjaxManager runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton3">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="modalPopup" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDropDownInter">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton3" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="opparamcard">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="paramcard" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownInter" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="opviscard">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCard1" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel11" LoadingPanelID="RadAjaxLoadingPanel1"/>
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
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Interfaz de salida"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel6" runat="server" Text="Nombre de la interfaz"></telerik:RadLabel>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox7" runat="server" Text=""></telerik:RadTextBox>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel7" runat="server" Text="Tipo de interfaz"></telerik:RadLabel>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox8" runat="server" Text=""></telerik:RadTextBox>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel11" runat="server" Text=""></telerik:RadLabel>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        <telerik:RadButton RenderMode="Lightweight" ID="RadButton2" OnClick="generateInterfaz" CssClass="btnvalid" runat="server" Text="Crear interfaz"></telerik:RadButton>
                                        <a runat="server" id="opparamcard" onServerClick="openCard" href="#javascript">Ver panel de parametrización</a>
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>

                                <telerik:RadCard runat="server" ID="paramcard" Visible="false">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Parametrización de la interfaz"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel12" runat="server" Text="Seleccione la interfaz a parametrizar"></telerik:RadLabel>
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownInter" runat="server" OnSelectedIndexChanged="RadDropDownInter_SelectedIndexChanged" AutoPostBack="true" DefaultMessage="seleccionar"></telerik:RadDropDownList>
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel2" runat="server" Text=""></telerik:RadLabel>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel3" runat="server" Text="Crear nueva columna de la interfaz"></telerik:RadLabel>
                                        <telerik:RadButton RenderMode="Lightweight" ID="RadButton3" OnClick="openModal" CssClass="btnvalid" runat="server" Enabled="false" Text="Crear"></telerik:RadButton>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        <a runat="server" id="opviscard" onServerClick="openVis" href="#javascript">Ver panel de visualización</a>
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>

                                 <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Modal="true" OffsetElementID="main" Style="z-index: 100001;">
                                    <ContentTemplate>
                                        <telerik:RadCard runat="server" ID="RadCard2">
                                            <telerik:CardHeaderComponent runat="server">
                                                <telerik:CardTitleComponent runat="server" Content="Detalle de la columna"></telerik:CardTitleComponent>
                                            </telerik:CardHeaderComponent>
                                            <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel4" runat="server" Text="Nombre"></telerik:RadLabel>
                                            </telerik:CardBodyComponent>
                                            <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel5" runat="server" Text="Alias"></telerik:RadLabel>
                                            </telerik:CardBodyComponent>
                                            <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel13" runat="server" Text="Longitud máxima"></telerik:RadLabel>
                                            </telerik:CardBodyComponent>
                                            <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel14" runat="server" Text="Tipo de dato aceptado"></telerik:RadLabel>
                                            </telerik:CardBodyComponent>
                                            <telerik:CardFooterComponent runat="server">
                                                <telerik:RadButton RenderMode="Lightweight" ID="RadButton4" CssClass="btnvalid" runat="server" Text="Guardar datos"></telerik:RadButton>
                                            </telerik:CardFooterComponent>
                                        </telerik:RadCard>
                                    </ContentTemplate>
                                </telerik:RadWindow>

                                <telerik:RadCard runat="server" ID="RadCard1" Visible="false">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Visualización de la interfaz"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        
                                    </telerik:CardBodyComponent>
                                    <telerik:CardFooterComponent runat="server">
                                        
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>

                            </div>
                        </telerik:LayoutColumn>
                    </Columns>
                </telerik:LayoutRow>
                <telerik:LayoutRow>
                    <Columns>
                        <telerik:LayoutColumn Span="4" SpanXs="12" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server">
                                    <telerik:CardHeaderComponent runat="server">
                                        <telerik:CardTitleComponent runat="server" Content="Interfaz de salida"></telerik:CardTitleComponent>
                                    </telerik:CardHeaderComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownInt" runat="server" Width="80%" DefaultMessage="seleccione interfaz" AutoPostBack="true"></telerik:RadDropDownList>
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel1" runat="server" Width="80%" Text=""></telerik:RadLabel>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel8" runat="server" Text="Tipo de archivo"></telerik:RadLabel>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox4" runat="server" Text=""></telerik:RadTextBox>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel9" runat="server" Text="Separador"></telerik:RadLabel>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox5" runat="server" Text=""></telerik:RadTextBox>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel10" runat="server" Text="Ruta de exportación"></telerik:RadLabel>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox6" runat="server" Text=""></telerik:RadTextBox>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" CssClass="btnvalid" runat="server" OnClick="generateInterfaz" Text="Generar"></telerik:RadButton>
                                    </telerik:CardBodyComponent>
                                    <telerik:CardFooterComponent runat="server">
                                       
                                    </telerik:CardFooterComponent>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="8" SpanXs="12" SpanSm="12">
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
    </form>
</body>
</html>
