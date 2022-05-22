<%@ Page Language="C#" AutoEventWireup="true" CodeFile="email_rejection_form.aspx.cs" Inherits="email_rejection_form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btnSend" runat="server" Text="Send"  OnClick="mSendEmail"/>
    </div>
    </form>
</body>
</html>
