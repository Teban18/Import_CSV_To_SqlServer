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
                <telerik:AjaxSetting AjaxControlID="RadButton2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton2" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager> 

        <telerik:radpagelayout id="RadPageLayout3" runat="server" gridtype="Fluid">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
                            <span class="headertitle">Importación de Datos</span>
                            <br/>
                            <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA" width="100"/>
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
                                                    
                                                </div>
                                            </Content>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Columns>
                                                <telerik:LayoutColumn Span="12" SpanXs="12" SpanSm="12">
                                                    <div class="col">
                                                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="RadAsyncUpload1" Skin="WebBlue" DropZones=".DropZone1" Localization-Select="Cargar archivo"/> 
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
                            <span class="headertitle">Creación de Cargue</span>
                            <br/>
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
                                                        <asp:Label RenderMode="Lightweight" ID="Label4" Skin="WebBlue" runat="server" Text="Campos para el cargue"></asp:Label>    
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
                                                <div class="footer">
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
