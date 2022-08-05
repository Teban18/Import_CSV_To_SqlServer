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

        <div class="container">   
            <div class="menucontainer">
                <span class="header">Importación de datos</span>
                <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA"/>
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
                        Text="Tipo de cargue">
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
                    <telerik:RadButton 
                        RenderMode="Lightweight" 
                        ID="RadButton1" 
                        CssClass="btn"
                        runat="server"
                        Skin="WebBlue"
                        OnClick="btnValidate_Click"
                        Text="Validar Archivo">
                    </telerik:RadButton>        
                </div>
            </div>

            <div class="validationcontainer">
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                    <telerik:RadGrid 
                        runat="server"
                        ID="RadGrid2"
                        Skin="WebBlue"
                        AllowPaging="true"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        OnNeedDataSource="RadGrid2_NeedDataSource1"
                        AllowFilteringByColumn="true"
                        >
                        <ClientSettings>
                            <Scrolling 
                                AllowScroll="true"
                                ScrollHeight=""
                                UseStaticHeaders="true"
                            >
                            </Scrolling>
                        </ClientSettings>
                        <MasterTableView
                            CommandItemDisplay="top"
                            AutoGenerateColumns="true" 
                            >
                            
                            <Columns>
                            </Columns> 

                            <CommandItemTemplate>
                                <telerik:RadButton 
                                    RenderMode="Lightweight" 
                                    Skin="WebBlue" 
                                    ID="RadButton4" 
                                    runat="server" 
                                    Text="Procesar archivo" 
                                    ButtonType="StandardButton" 
                                    UseSubmitBehavior="true"/>
                            </CommandItemTemplate>

                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadAjaxPanel>
            </div>

            <div class="menucontainer">
                <span class="header">Crear tipo de cargue</span>
                <img class="logo" src="https://erp.tgdata.com.co/Imagenes/TGData.png" alt="Logo TGDATA"/>
                <div class="grid1">
                    <asp:Label 
                        RenderMode="Lightweight" 
                        ID="Label4" 
                        Skin="WebBlue"
                        runat="server" 
                        Text="Tipo de cargue">
                    </asp:Label>
                    <telerik:RadDropDownList 
                        RenderMode="Lightweight" 
                        ID="RadDropDownOption" 
                        CssClass="ddlist"
                        runat="server"  
                        DropDownHeight="200px" 
                        Skin="WebBlue">
                    </telerik:RadDropDownList>
                </div>
            </div>

        </div>

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
