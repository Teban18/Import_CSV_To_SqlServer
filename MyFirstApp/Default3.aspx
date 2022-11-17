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
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox7" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox8" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGridVis" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton4">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox11" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDropDownInter">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadLabel2" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton5" LoadingPanelID="RadAjaxLoadingPanel1"/>
                        <telerik:AjaxUpdatedControl ControlID="RadButton4" LoadingPanelID="RadAjaxLoadingPanel1"/>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGridVis">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGridVis" LoadingPanelID="RadAjaxLoadingPanel1"/>
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
                        <telerik:LayoutColumn Span="3" SpanXs="3" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server" Orientation="Vertical">
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownInter" runat="server" OnSelectedIndexChanged="RadDropDownInterSelectedIndexChanged" AutoPostBack="true" DefaultMessage="Seleccionar interfaz"></telerik:RadDropDownList>
                                        <telerik:RadLabel RenderMode="Lightweight" ID="RadLabel2" runat="server" Text=""></telerik:RadLabel>
                                    </telerik:CardBodyComponent>
                                </telerik:RadCard>
                            </div>
                        </telerik:LayoutColumn>

                        <telerik:LayoutColumn Span="9" SpanXs="9" SpanSm="12">
                            <div class="col" style="margin-bottom:2rem;">
                                <telerik:RadCard runat="server" Orientation="Vertical">
                                    <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
                                            <Tabs>
                                                <telerik:RadTab Text="Crear interfaz" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Parametrizar interfaz" Width="200px"></telerik:RadTab>
                                                <telerik:RadTab Text="Ver interfaz" Width="200px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
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
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton2" OnClick="generateInterface" CssClass="btnvalid" runat="server" Text="Crear"></telerik:RadButton>
                                                </telerik:CardBodyComponent>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView2">
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
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage2"
                                                    Orientation="HorizontalTop" Skin="Silk" >
                                                        <Tabs>
                                                            <telerik:RadTab Text="Ver todas las interfaces"></telerik:RadTab>
                                                            <telerik:RadTab Text="Ver interfaz seleccionada"></telerik:RadTab>
                                                        </Tabs>
                                                    </telerik:RadTabStrip>
                                                </telerik:CardBodyComponent>
                                                <telerik:CardBodyComponent runat="server" CardActionsAlignment="Stretched">
                                                    <telerik:RadMultiPage runat="server" ID="RadMultiPage2"  SelectedIndex="0" CssClass="innerMultiPage">
                                                        <telerik:RadPageView runat="server" ID="PageView1">
                                                            <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" CssClass="btnvalid" runat="server" OnClick="generateCompleteView" Text="Ver"></telerik:RadButton>
                                                            <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGridVis" AllowPaging="True" AllowSorting="true"
                                                            OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged">
                                                                <ClientSettings>
                                                                    <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                                                </ClientSettings>
                                                            </telerik:RadGrid>
                                                        </telerik:RadPageView>
                                                        <telerik:RadPageView runat="server" ID="PageView2">
                                                            chao
                                                        </telerik:RadPageView>
                                                    </telerik:RadMultiPage>
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
