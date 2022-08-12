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
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadAjaxManager runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadButton1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager> 

        <telerik:radpagelayout id="RadPageLayout3" runat="server" gridtype="Fluid">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
                            <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA" width="150"/>
                        </div>
                    </Content>
                </telerik:LayoutRow>
                <telerik:LayoutRow>
                    <Columns>
                        <telerik:LayoutColumn Span="4" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:radpagelayout id="RadPageLayout2" runat="server" gridtype="Fluid">
                                    <Rows>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="header">
                                                    <span class="header">Importación de datos</span>
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Columns>
                                                <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                                                    <div class="col">
                                                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="RadAsyncUpload1" Skin="WebBlue" DropZones=".DropZone1" Localization-Select="Seleccionar archivo"/> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                                                    <div class="col">
                                                        <div class="DropZone1">
                                                            <p>O arrastrelos aquí</p>
                                                            <p>📁</p>
                                                        </div>   
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label1" Skin="WebBlue" runat="server" Text="Separador"></asp:Label>   
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" Skin="WebBlue" Width="" EmptyMessage=""></telerik:RadTextBox>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBox1" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label2" Skin="WebBlue" runat="server" Text="Tipo de cargue"></asp:Label> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTables" CssClass="ddlist" runat="server" DropDownHeight="" Skin="WebBlue"></telerik:RadDropDownList>   
                                                    </div>
                                                </telerik:LayoutColumn>
                                            </Columns>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="footer">
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" CssClass="btn" runat="server" Skin="WebBlue" OnClick="btnValidate_Click" Text="Validar Archivo"></telerik:RadButton>  
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                    </Rows>
                                </telerik:radpagelayout>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="8" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                    <telerik:RadGrid runat="server" ID="RadGrid2" Skin="WebBlue" AllowPaging="true" AutoGenerateColumns="false" PageSize="10" OnNeedDataSource="RadGrid2_NeedDataSource1" AllowFilteringByColumn="true">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="" UseStaticHeaders="false"></Scrolling>
                                        </ClientSettings>
                                        <MasterTableView CommandItemDisplay="top" AutoGenerateColumns="true">
                                            <Columns></Columns> 
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </telerik:RadAjaxPanel>
                            </div>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                            <div class="col">
                                <telerik:radpagelayout id="RadPageLayout1" runat="server" gridtype="Fluid">
                                    <Rows>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="header">
                                                    <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA"/>
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Columns>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label4" Skin="WebBlue" runat="server" Text="Nombre del cargue"></asp:Label>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" Skin="WebBlue" Width="" EmptyMessage=""></telerik:RadTextBox>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBox3" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label5" Skin="WebBlue" runat="server" Text="Tipo de cargue"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" Skin="WebBlue" Width="" EmptyMessage=""></telerik:RadTextBox>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                            </Columns>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="footer">Footer</div>
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
                        <div class="footer">Footer</div>
                    </Content>
                </telerik:LayoutRow>
            </Rows>
        </telerik:radpagelayout>
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
