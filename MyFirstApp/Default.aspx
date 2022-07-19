<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default"  Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
    
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadGrid 
        runat="server"
        ID="RadGrid2"
        AutoGenerateColumns="false"
        AllowPaging="true"
        AllowSorting="true" 
        PageSize="5"
        AllowFilteringByColumn="true"
        OnNeedDataSource="RadGrid2_NeedDataSource"
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
