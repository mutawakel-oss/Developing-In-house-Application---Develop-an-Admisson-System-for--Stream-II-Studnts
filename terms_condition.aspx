<%@ Page Title="صفحة شروط القبول والتسجيل" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="terms_condition.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainMenuContent" Runat="Server">
    <asp:Button ID="btnHomePage" runat=server CssClass="mainMenuButton"  Text="الرئيسية" PostBackUrl="~/index.aspx"/>
                <asp:Button ID="btnContactUs" runat=server CssClass="mainMenuButton"  Text="اتصل بنا" PostBackUrl="~/contact.aspx"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

      <div align="center">
        <asp:Label ID="lblTitle" runat="server" ForeColor="Red"  CssClass="fontFamilyClass" Font-Size="14pt"></asp:Label>
        <br />
      </div>
      <asp:DataGrid id="termsAndConditionGrid" runat="server" Width="825px" BackColor="White" ForeColor="Black" HorizontalAlign="Center" GridLines="Vertical" CellPadding="4" BorderWidth="1px" BorderStyle="None" BorderColor="#DEDFDE" AutoGenerateColumns="False"  >
           <FooterStyle BackColor="#CCCC99" />
           <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Mode="NumericPages" />
           <AlternatingItemStyle BackColor="White" />
           <ItemStyle BackColor="#F7F7DE" Font-Size=small />
           <Columns>
               <asp:BoundColumn HeaderText="" DataField="id"></asp:BoundColumn>
               <asp:BoundColumn HeaderText="الشروط" DataField="condition"></asp:BoundColumn>
           </Columns>
           <HeaderStyle BackColor="#6B696B" Font-Size="Medium" Font-Bold="true" ForeColor="White" />
       </asp:DataGrid>
      <asp:DataGrid id="RulesGrid" runat="server" Width="825px" BackColor="White" ForeColor="Black" HorizontalAlign="Center" GridLines="Vertical" CellPadding="4" BorderWidth="1px" BorderStyle="None" BorderColor="#DEDFDE" AutoGenerateColumns="False"  >
           <FooterStyle BackColor="#CCCC99" />
           <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Mode="NumericPages" />
           <AlternatingItemStyle BackColor="White" />
           <ItemStyle BackColor="#F7F7DE" Font-Size=small />
           <Columns>
               <asp:BoundColumn HeaderText="" DataField="id"></asp:BoundColumn>
               <asp:BoundColumn HeaderText="الأنظمة المتعلقة بالقبول" DataField="condition"></asp:BoundColumn>
           </Columns>
           <HeaderStyle BackColor="#6B696B" Font-Size="Medium" Font-Bold="true" ForeColor="White" />
       </asp:DataGrid>
       
       <asp:DataGrid id="formulaGrid" runat="server" Width="825px" BackColor="White" ForeColor="Black" HorizontalAlign="Center" GridLines="Vertical" CellPadding="4" BorderWidth="1px" BorderStyle="None" BorderColor="#DEDFDE" AutoGenerateColumns="False"  >
           <FooterStyle BackColor="#CCCC99" />
           <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Mode="NumericPages" />
           <AlternatingItemStyle BackColor="White" />
           <ItemStyle BackColor="#F7F7DE" Font-Size=small />
           <Columns>
               <asp:BoundColumn HeaderText="" DataField="id"></asp:BoundColumn>
               
           </Columns>
           <HeaderStyle BackColor="#6B696B" Font-Size="Medium" Font-Bold="true"  ForeColor="White" />
       </asp:DataGrid>
       <asp:UpdatePanel ID="agreementUpdatePanel" runat="server" RenderMode="Inline">
            <ContentTemplate>
               <asp:Table ID="tblAgreement" runat="server" align="rtl">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:CheckBox ID="chkAgreement" runat="server" AutoPostBack="true" Text="قرأت الشروط اعلاه وأوافق عليها" OnCheckedChanged="mAgreementCheckChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnContinue" runat="server" CssClass="mainMenuButton" Text="تابع التسجيل" Enabled="false" OnClick="mGoToRegister"  />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:UpdateProgress ID="upprg15" runat="server">
                        <ProgressTemplate>
                            <asp:Label ID="lblProgress" runat="server" Text="الرجاء الإنتظار..."></asp:Label>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    
                </asp:TableCell>
            </asp:TableRow>
       </asp:Table>
            </ContentTemplate>
       </asp:UpdatePanel>
    
</asp:Content>

