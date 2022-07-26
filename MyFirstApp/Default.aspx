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

        <!-- New controls -->   
        <telerik:RadAjaxManager runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <div class="menucontainer">
            <span class="header">Importación de datos</span>
            <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA"/>
            <div class="grid1">
                <telerik:RadButton 
                    RenderMode="Lightweight" 
                    CssClass="btn"
                    ID="RadButton3"
                    Skin="WebBlue"
                    runat="server" 
                    Text="Definir Estructura">
                </telerik:RadButton>
            </div>
            <div class="grid1">
                <telerik:RadAsyncUpload 
                    RenderMode="Lightweight" 
                    runat="server" 
                    ID="RadAsyncUpload1" 
                    Skin="WebBlue"
                    DropZones=".DropZone1"
                    Localization-Select="Seleccionar archivos"
                /> 
            </div> 
            <div class="grid1">
                <div class="DropZone1">
                    <p>O arrastrelos aquí</p>
                    <p>📁</p>
                </div>
            </div>
            <div class="grid1">
                <asp:Label 
                    RenderMode="Lightweight" 
                    ID="Label1" 
                    Skin="WebBlue"
                    runat="server" 
                    Text="Separador">
                </asp:Label>
                <telerik:RadTextBox 
                    RenderMode="Lightweight" 
                    runat="server" 
                    ID="RadTextBox1" 
                    Skin="WebBlue"
                    Width="50px" 
                    EmptyMessage="">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator 
                    runat="server" 
                    ControlToValidate="RadTextBox1" 
                    ErrorMessage="Ingrese un valor" 
                    ForeColor="red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="grid1">
                <asp:Label 
                    RenderMode="Lightweight" 
                    ID="Label2" 
                    Skin="WebBlue"
                    runat="server" 
                    Text="Tabla BD">
                </asp:Label>
                <telerik:RadDropDownList 
                    RenderMode="Lightweight" 
                    ID="RadDropDownTables" 
                    CssClass="ddlist"
                    runat="server"  
                    DropDownHeight="200px" 
                    Skin="WebBlue">
                </telerik:RadDropDownList>
            </div>
            <div class="grid1">
                 <asp:UpdatePanel 
                    ID="panel2" 
                    runat="server"
                    UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadButton 
                            RenderMode="Lightweight" 
                            ID="RadButton1" 
                            CssClass="btn"
                            runat="server"
                            Skin="WebBlue"
                            OnClick="btnValidate_Click"
                            Text="Validar Archivo">
                        </telerik:RadButton>
                        <telerik:RadNotification 
                            RenderMode="Lightweight" 
                            ID="notify1" 
                            runat="server" 
                            Text="Initial text" 
                            Position="Center"
                            AutoCloseDelay="0"   
                            Title="Validación" 
                            EnableRoundedCorners="true">
                        </telerik:RadNotification>
                    </ContentTemplate>
                </asp:UpdatePanel>       
            </div>
            <div class="grid1">
                <telerik:RadButton 
                    RenderMode="Lightweight" 
                    CssClass="btn"
                    ID="RadButton2"
                    Skin="WebBlue"
                    runat="server" 
                    Text="Procesar">
                </telerik:RadButton>
            </div>
        </div>


        <telerik:RadGrid 
            runat="server"
            ID="RadGrid2"
            AutoGenerateColumns="false"
            AllowPaging="true"
            AllowSorting="true" 
            PageSize="5"
            AllowFilteringByColumn="true"
            >
            <ClientSettings>
                <Scrolling 
                    AllowScroll="True" 
                    >
                </Scrolling>
                <ClientEvents 
                    OnGridCreated="GridCreated" 
                    />
            </ClientSettings>
            <MasterTableView
                AutoGenerateColumns="true" 
                >
                <Columns>
                </Columns> 
            </MasterTableView>
        </telerik:RadGrid>

        <script type="text/javascript">
            //Put your JavaScript code here.
            function GridCreated(sender, args) {
                $('.rgDataDiv').removeAttr('style');
                $('.rgDataDiv').attr('style', 'overflow-x: scroll;');
            }
        </script>
        <div>

        </div>
    </form>
</body>
</html>
