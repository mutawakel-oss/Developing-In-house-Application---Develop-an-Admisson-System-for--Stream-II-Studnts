<%@ Page Title="صفحة التقارير" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="reportsection.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainMenuContent" runat="Server">
    <asp:Button ID="btnHomePage" runat="server" CssClass="mainMenuButton" Text="الرئيسية"
        PostBackUrl="~/admin_default_page.aspx" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    
    <asp:UpdatePanel ID="upd_main" runat="server" UpdateMode="Always">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>
            <asp:Table ID="OuterTable" runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableCell Font-Bold="true" Text="معايير البحث">
                    
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:LinkButton OnClick="ShowHideParam" Text="Hide Options" runat="server" ID="LinkParam"></asp:LinkButton>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                <hr />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_1" runat="server">
                    <asp:TableCell ColumnSpan="2">
                        <asp:RadioButton GroupName="TopGroup" Checked="true" ID="TopFromPoolRadioButton"
                            Text="قائمة الطلاب الفائقين" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_2" runat="server">
                    <asp:TableCell ColumnSpan="2">
                <hr />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_3" runat="server">
                    <asp:TableCell ColumnSpan="2">
                        <asp:RadioButton GroupName="StatusGroup" ID="TopNewCandidatesRadioButton" Text="قائمة الطلاب غير المدعوين للمقابلة الشخصية"
                            Checked="true" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_4" runat="server">
                    <asp:TableCell ColumnSpan="2">
                        <asp:RadioButton GroupName="StatusGroup" ID="TopInvitedCandidatesRadioButton" Text="قائمة الطلاب المدعوين للمقابلة الشخصية"
                            runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_5" runat="server">
                    <asp:TableCell ColumnSpan="2">
                <hr />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row_6" runat="server">
                    <asp:TableCell Font-Bold="true" Text="عدد الطلاب">                
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Table ID="Table2" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:TextBox Text="*" Enabled="false" ID="TopTextBox" Width="50" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Req_TopTextBox" runat="server" ErrorMessage="*" ControlToValidate="TopTextBox"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell Font-Bold="true" Text="&nbsp;&nbsp;اسم الكلية"></asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="CollegeNameDropDown" runat="server" Width="150">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="Req_CollegeNameDropDown" runat="server" ErrorMessage="*"
                                        ControlToValidate="CollegeNameDropDown" InitialValue="اختر الكلية"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell Visible="false" Font-Bold="true" Text="&nbsp;&nbsp;Program Name&nbsp;&nbsp;">
                                    <asp:DropDownList ID="ProgramNameDropDown" runat="server" Width="150">
                                    </asp:DropDownList>
                                </asp:TableCell>
                                <asp:TableCell>
                                    
                                        
                                    <asp:Button ID="SearchButton" Text="..." runat="server" OnClick="SearchClick" />
                                    &nbsp;&nbsp;
                                    <asp:HyperLink   Visible=false Font-Bold="true" ID="HyperLink1" Text="Show Report"
                                        runat="server" Target="_blank"  />
                                 <%--   <asp:HyperLink Enabled="false" Font-Bold="true" ID="ShowGraph" Text="Show Graph"
                                        runat="server" Target="_blank" NavigateUrl="~/ShowGraph.aspx" />--%>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                <hr />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="datagrid" runat="server" Width="100%">
                <asp:TableRow>
                    <asp:TableCell>
                        Interview Details
                        <asp:TextBox ToolTip="Enter a venue " ID="VenueTextBox" runat="server" Width="150"></asp:TextBox>
                        &nbsp;
                        <asp:TextBox ToolTip="Enter a date " ID="InterviewDateTextBox" runat="server" Width="150"></asp:TextBox>
                        &nbsp;
                        <asp:TextBox ToolTip="Enter Interview Time" ID="InterviewTime" runat="server" Width="60"></asp:TextBox>
                        &nbsp;
                        <asp:Button OnClick="InviteSelectedStudents" runat="server" Enabled="false" ID="InviteButton_1"
                            Text="Invite" />
                        &nbsp;
                        <asp:Button ID="PrintCommand" Text="Export to PDF"  runat="server"
                            OnClick="PdfPrint" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Font-Bold="true" ID="TotalCell" runat="server">
                        <asp:UpdateProgress ID="p1" runat="server">
                            <ProgressTemplate>
                                <asp:Label ID="Label1" BackColor="Green" runat="server" ForeColor="White" Text="Please wait..."></asp:Label>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                      <%--  <div style="overflow-y: scroll; ">
--%>
                        <asp:DataGrid HeaderStyle-BackColor="ActiveBorder" AlternatingRowStyle-BackColor="WhiteSmoke"
                            HeaderStyle-Height="25" ID="GridView1" AutoGenerateColumns="false" runat="server"
                            OnPageIndexChanging="GridView1_OnPageIndexChanged" PageSize="50"
                            PagerSettings-Position="TopAndBottom" AllowPaging="false" PagerSettings-PageButtonCount="50" OnEditCommand="mDisplayUploads"  >
                            <Columns>
                               <asp:BoundColumn HeaderText="رقم بطاقة الأحوال" DataField="LocalID" ></asp:BoundColumn>
                                
                              
                                <asp:TemplateColumn HeaderStyle-Width="200" HeaderStyle-Font-Names="Simplified Arabic" HeaderText="الإسم">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Font-Size="11" Font-Names="Simplified Arabic" ID="StudentName"
                                            Text='<%# Eval("StudentName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                               
                               
                                <asp:TemplateColumn  HeaderText="معلومات الإتصال" HeaderStyle-Font-Names="Simplified Arabic">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="mob" Text='<%# Eval("mobile") %>' />
                                        <br />
                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("HomePhone") %>' />
                                        <br />
                                         <asp:Label runat="server" ID="Label5" Text='<%# Eval("Email") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                
                               
                                <asp:TemplateColumn HeaderText="شخص للإتصال" HeaderStyle-Font-Names="Simplified Arabic">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="mob2" Text='<%# Eval("RefMobile") %>' />
                                        <br />
                                         <asp:Label runat="server" ID="Label2" Text='<%# Eval("RefName") %>' />
                                         <br />
                                          <asp:Label runat="server"  ID="Label3" Text='<%# Eval("RefWorkPhone") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                
                                <asp:TemplateColumn HeaderStyle-Width="80" HeaderText="المعدل التراكمي" HeaderStyle-Font-Names="Simplified Arabic">
                                    <ItemTemplate>
                                        <asp:Label Font-Bold=true runat="server" ID="HighSchoolPercentage" Text='<%# Eval("gpa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:EditCommandColumn CancelText="Cancel" EditText="المستندات" UpdateText="Update"  ItemStyle-ForeColor=blue></asp:EditCommandColumn>
                                
                                
                                
                               
                              
                            </Columns>
                            
                        </asp:DataGrid>
                        
                       <%-- </div>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>
                        <asp:Button OnClick="InviteSelectedStudents" runat="server" Enabled="false" ID="InviteButton_2"
                            Text="Invite" />
                    </asp:TableCell>
                    <asp:TableCell>
                    
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <%-- Verify Student Modal Popup Extender Control This will check if School Grade more then 90 or less--%>
    <asp:Button ID="btnDisplayUploads" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeUploadsDisplay" runat="server" TargetControlID="btnDisplayUploads"
        PopupControlID="pnlDisplayUploads" BackgroundCssClass="modalBackground"
        DropShadow="false" CancelControlID="btnCloseDisplay">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlDisplayUploads" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
        
            <asp:Label ID="Label11" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
        <asp:Table ID="tblUploads" runat="server" dir="rtl>
            <asp:TableRow>
                <asp:TableCell>
                ملف التسجيل
                </asp:TableCell>
                <asp:TableCell>
                    <asp:LinkButton ID="lnkRegistrtaionFile" runat="server" OnClick="mDisplayRegistrationFile" ></asp:LinkButton>            
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                وثيقة التخرج
                </asp:TableCell>
                <asp:TableCell>
                    <asp:LinkButton ID="lnkGraduationCertificate" runat="server" OnClick="mDisplayGraduation" ></asp:LinkButton>            
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    شهادة إتمام الإمتياز
                </asp:TableCell>
                <asp:TableCell>
                    <asp:LinkButton ID="lnkExcellenceCertificate" runat="server" OnClick="mDisplayExcellence"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    السجل الأكاديمي
                </asp:TableCell>
                <asp:TableCell>
                    <asp:LinkButton ID="lnkAcademicTranscript" runat="server" OnClick="mDisplayTranscript" ></asp:LinkButton>
                    
                </asp:TableCell>
            </asp:TableRow>
       
        </asp:Table>
            
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnCloseDisplay" runat="server" Text="اغلاق" />
            
            
        </center>
    </asp:Panel>
    <%-- End Of School Grade more then 90 Popup Extender Control --%>
        
</asp:Content>
