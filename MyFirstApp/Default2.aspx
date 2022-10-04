<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                <telerik:AjaxSetting AjaxControlID="RadButton2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton2" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="modalPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting> 
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadPageLayout ID="RadPageLayout4" runat="server" GridType="Fluid" CssClass="borderCssClass">
            <Rows>
                <telerik:LayoutRow>
                    <Content>
                        <div class="header">
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
                                                        <asp:Label RenderMode="Lightweight" ID="Label3" runat="server" Text="Nombre del cargue"></asp:Label>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" Width="" EmptyMessage=""></telerik:RadTextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB3" ControlToValidate="RadTextBox3" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label6" runat="server" Text="Tipo de cargue"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownTipeLoad" CssClass="ddlist" runat="server" DropDownHeight=""></telerik:RadDropDownList>
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
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" Width="" EmptyMessage=""></telerik:RadTextBox>  
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
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" Width="" EmptyMessage="type,type..."></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB2" ControlToValidate="RadTextBox2" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label9" runat="server" Text="Posición"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7"  Width="" EmptyMessage="posicion,posicion"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB7" ControlToValidate="RadTextBox7" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label10" runat="server" Text="Descripción"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" Width="" EmptyMessage="desc,desc"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB8" ControlToValidate="RadTextBox8" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label11" runat="server" Text="Longitud"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox9" Width="" EmptyMessage="8,7"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB9" ControlToValidate="RadTextBox9" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label12" runat="server" Text="Formato"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox10" Width="" EmptyMessage="YYYY-MM-DD,YYYY-MM-DD"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB10" ControlToValidate="RadTextBox10" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label13" runat="server" Text="Acepta nulo"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" Width="" EmptyMessage="false,true"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB11" ControlToValidate="RadTextBox11" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label5" runat="server" Text="Procedimiento valida"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" Width="" TextMode="MultiLine" EmptyMessage="ej: SP_TEST"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB4" ControlToValidate="RadTextBox4" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label7" runat="server" Text="Procedimiento almacena"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" Width="" TextMode="MultiLine" EmptyMessage="ej: SP_TEST"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB5" ControlToValidate="RadTextBox5" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <asp:Label RenderMode="Lightweight" ID="Label1" runat="server" Text="Tabla de cargue"></asp:Label>    
                                                    </div>
                                                </telerik:LayoutColumn>
                                                <telerik:LayoutColumn Span="6" SpanXs="6" SpanSm="6">
                                                    <div class="col">
                                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox12" Width="" TextMode="MultiLine" EmptyMessage="ej: TBTEST"></telerik:RadTextBox>  
                                                        <asp:RequiredFieldValidator runat="server" ID="validatorRB12" ControlToValidate="RadTextBox12" ErrorMessage="Ingrese un valor" ForeColor="red"></asp:RequiredFieldValidator> 
                                                    </div>
                                                </telerik:LayoutColumn>
                                            </Columns>
                                        </telerik:LayoutRow>
                                        <telerik:LayoutRow>
                                            <Content>
                                                <div class="footer" style="margin-top:2rem;margin-bottom:2rem;">
                                                    <telerik:RadButton RenderMode="Lightweight" ID="RadButton2" CssClass="btn" OnClick="btnCreate_Click" runat="server" Text="Crear Cargue"></telerik:RadButton>
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
         <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Modal="false" OffsetElementID="main" Style="z-index: 100001;">
            <ContentTemplate>
                <div id="myPanel1" runat="server">

                </div>
            </ContentTemplate>
        </telerik:RadWindow>
    </form>
</body>
</html>
