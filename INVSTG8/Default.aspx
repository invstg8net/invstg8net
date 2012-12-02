<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Investigate Net REQUEST<br />
        *Required<br />
        <br />
        <br />
    
        <asp:Label ID="lblSensitivity" runat="server" Text="is this request sensitive?"></asp:Label>
    
        <br />
        YES or NO</div>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
        DataSourceID="dsSensitive" DataTextField="sensitivityName" 
        DataValueField="idSensitivityLevel">
    </asp:RadioButtonList>
    <br />
    <br />
    <asp:Label ID="lblRiskLevel" runat="server" Text="Risk Level?"></asp:Label>
    <br />
    If you answered YES aboce, list the severity of the personal risk to you<asp:RadioButtonList 
        ID="RadioButtonList2" runat="server" DataSourceID="dsRisk" 
        DataTextField="riskLevelName" DataValueField="idRiskLevel">
    </asp:RadioButtonList>
    <br />
    <br />
    <asp:Label ID="lblUrgency" runat="server" Text="Urgency"></asp:Label>
    <br />
    How soon do you need this information?<asp:RadioButtonList 
        ID="RadioButtonList3" runat="server" DataSourceID="dsUrgency" 
        DataTextField="UrgencyLevelName" DataValueField="idUrgencyLevel">
    </asp:RadioButtonList>
    <br />
    <br />
    Region<br />
    Which region is this request about?<asp:RadioButtonList ID="RadioButtonList4" 
        runat="server" DataSourceID="dsRegion" DataTextField="RegionName" 
        DataValueField="idRegion">
    </asp:RadioButtonList>
    <br />
    <br />
    Enter your request<br />
    Enter details of your request<br />
    <asp:TextBox ID="txtRequest" runat="server" Height="109px" Width="546px"></asp:TextBox>
    <br />
    <br />
    <br />
    Keywords*<br />
    Enter keywords and themes associated with your request that would help make a 
    computer search easier.<br />
    <asp:TextBox ID="txtKeywords" runat="server" Height="109px" Width="546px"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="dsRegion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT * FROM region WHERE (RegionIsActive = 1) ORDER BY idRegion"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSensitive" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT * FROM sensitivitylevel WHERE (sensitvitiyLevelIsActive = 1) ORDER BY idSensitivityLevel"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsRisk" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM risklevel WHERE (riskLevelIsActive = 1) ORDER BY idRiskLevel">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUrgency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mydbConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mydbConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT * FROM urgencylevel WHERE (UrgencyLevelIsActive = 1) ORDER BY idUrgencyLevel">
    </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>
