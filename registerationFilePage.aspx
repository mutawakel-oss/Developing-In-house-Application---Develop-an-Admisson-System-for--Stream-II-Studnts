<%@ Page Title="صفحة تسجيل البيانات" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="registerationFilePage.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainMenuContent" runat="Server">
    <asp:Button ID="btnHomePage" runat="server" CssClass="mainMenuButton" Text="الرئيسية"
        PostBackUrl="~/index.aspx" />
    <asp:Button ID="btnContactUs" runat="server" CssClass="mainMenuButton" Text="اتصل بنا"
        PostBackUrl="~/contact.aspx" />
    <asp:Button ID="btnRegistrationStatus" runat="server" CssClass="mainMenuButton" Text="حالة التسجيل"
        OnClick="mShowStatusExtender" Visible="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">

    <script type="text/javascript">
<!--
        function show() {
            window.open('http://localhost:3140/online%20version/help/com_reg_movie_demo.htm', 'CustomPopUp', 'width=1260,height=630,resizable=yes')
        }
//-->
    </script>

    <ajaxToolkit:CollapsiblePanelExtender ID="PeronalInformationCollaspedPanel" runat="Server"
        TargetControlID="PersonalInfoPanel1" ExpandControlID="PersonalInfoPanel2" CollapseControlID="PersonalInfoPanel2"
        Collapsed="False" TextLabelID="lblPersonalInf" ImageControlID="personalInfPanelImage"
        ExpandedImage="~/assets/ajax_images/collapse_blue.jpg" CollapsedImage="~/assets/ajax_images/expand_blue.jpg"
        SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
    <asp:Panel ID="PersonalInfoPanel2" runat="server" CssClass="collapsePanelHeader"
        Height="30px" BackImageUrl="~/assets/ajax_images/1.png">
        <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; vertical-align: middle;
            cursor: pointer; padding-top: 5px">
            <div style="float: right">
                <asp:ImageButton ID="personalInfPanelImage" runat="server" AlternateText="(Show Details...)"
                    ImageUrl="~/assets/ajax_images/expand_blue.jpg" />
                البيانات الشخصية</div>
            <div style="float: left; margin-left: 20px; width: 1px; height: 14px;">
                &nbsp;</div>
            <br />
            <div style="float: right; vertical-align: middle">
                &nbsp;</div>
        </div>
    </asp:Panel>
    
    <%-- Verify Student Modal Popup Extender Control This will check if School Grade more then 90 or less--%>
    <asp:Button ID="btnCheckSchoolGrade" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeSchoolGrades" runat="server" TargetControlID="btnCheckSchoolGrade"
        PopupControlID="pnlCheckSchoolGrades" BackgroundCssClass="modalBackground"
        DropShadow="false" CancelControlID="btnCloseSchoolGrades">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlCheckSchoolGrades" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label11" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="Label12" runat="server" Text="القبول في الكلية مقتصر على الحاصلين على نسبة 90%  .">                    
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnCloseSchoolGrades" runat="server" Text="اغلاق" />
            <asp:Button ID="btnSchoolGradeContactUs" runat="server" Text="اتصل بنا" PostBackUrl="~/contact.aspx"/>
            
        </center>
    </asp:Panel>
    <%-- End Of School Grade more then 90 Popup Extender Control --%>
    
    
    <%-- Verify Student Modal Popup Extender Control This will check if This Student ID has been already registered with us--%>
    <asp:Button ID="btnCheckStudentHidden" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeCheckStudentExistence" runat="server" TargetControlID="btnCheckStudentHidden"
        PopupControlID="pnlCheckStudentExistence" BackgroundCssClass="modalBackground"
        DropShadow="false" CancelControlID="btnVerifyStudentExistence">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlCheckStudentExistence" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label5" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="Label6" runat="server" Text="رقم بطاقة الأحوال المدخل مسجل مسبقاً, الرجاء تسجيل الدخول بواسطة اسم المستخدم وكلمة المرور .">                    
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyStudentExistence" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student Existence Popup Extender Control --%>
    
    
    <%-- Verify Student Modal Popup Extender Control This will check if This UserName has been already registered with us--%>
    <asp:Button ID="btnCheckUserNameExistence" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeCheckUserName" runat="server" TargetControlID="btnCheckUserNameExistence"
        PopupControlID="pnlCheckUserNameExistence" BackgroundCssClass="modalBackground"
        DropShadow="false" CancelControlID="btnCloseUserName">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlCheckUserNameExistence" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label9" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="Label10" runat="server" Text="اسم المستخدم الذي ادخلته موجود مسبقا، الرجاء اختيار اسم مستخدم آخر.">                    
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnCloseUserName" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student Existence Popup Extender Control --%>
    
    
    <%-- Verify Student Modal Popup Extender Control This will check if Student ID exists in our database.. or this Student will do a plain entry--%>
    <asp:Button ID="btnCheckEmail" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeCheckEmailExistence" runat="server" TargetControlID="btnCheckEmail"
        PopupControlID="pnlCheckEmail" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnCheckEmailExistence">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlCheckEmail" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label7" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="Label8" runat="server" Text="البريد الإلكتروني المدخل موجود مسبقاً في قاعدة البيانات الرجاء ادخال بريد الكتروني آخر. ">                    
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnCheckEmailExistence" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student Email Existence Modal Popup Extender Control --%>
    <%-- Verify Student graduation certificate upload Popup Extender Control This will check if Student uploaded his graduation certificate--%>
    <asp:Button ID="btnUploadGraduation" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeVerifyGraduationUpload" runat="server" TargetControlID="btnUploadGraduation"
        PopupControlID="pnlVerifyGraudationUpload" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnVerifyUpload">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlVerifyGraudationUpload" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label13" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
        الرجاءرفع وثيقة التخرج باتباع الآتي:
        <br />
1-	اضغط على زر "Browse" المقابل لخانة "شهادة التخرج".
<br />
2-	حدد موقع صورة شهادة التخرج مع العلم أنه يشترط ان يكون امتدادها .jpg وأن لا يكون حجمها أكبر من 4 ميجابايت.
<br />
3-	اضغط على زر "ارفع المستندات" حتى يتم رفع الصورة.


            
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyUpload" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student graducation certificate upload Modal Popup Extender Control --%>
      <%-- Verify Student excellence certificate upload Popup Extender Control This will check if Student uploaded his graduation certificate--%>
    <asp:Button ID="btnHiddenExcellenceCertificate" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeVirifyExcellenceUpload" runat="server" TargetControlID="btnHiddenExcellenceCertificate"
        PopupControlID="pnlVerifyExcellenceUpload" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnVerifyExcellence">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlVerifyExcellenceUpload" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label14" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            الرجاءرفع شهادة إتمام الإمتياز باتباع الآتي:
            <br />
1-	اضغط على زر "Browse" المقابل لخانة "شهادة اتمام الإمتياز".
<br />
2-	حدد موقع صورة شهادة اتمام الإمتياز مع العلم أنه يشترط ان يكون امتدادها .jpg وأن لا يكون حجمها أكبر من 4 ميجابايت.
<br />
3-	اضغط على زر "ارفع المستندات" حتى يتم رفع الصورة.

        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyExcellence" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student excellence certificate upload Modal Popup Extender Control --%>
     <%-- Verify Student academic transcript upload Popup Extender Control This will check if Student uploaded his graduation certificate--%>
    <asp:Button ID="btnHiddenAcademicTranscirpt" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeVerifyAcademicTranscript" runat="server" TargetControlID="btnHiddenAcademicTranscirpt"
        PopupControlID="pnlVerifyAcademicTranscript" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnVerifyAcademicTranscript">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlVerifyAcademicTranscript" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label15" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            الرجاءرفع السجل الأكاديمي باتباع الآتي:
            <br />
1-	اضغط على زر "Browse" المقابل لخانة "السجل الأكاديمي".
<br />
2-	حدد موقع ملف السجل الأكاديمي مع العلم أنه يشترط ان تكون كل الصور الخاصة بالسجل الأكاديمي مجموعة في ملف مضغوط zip. وان لا يتعدى حجم الملف 4 ميجابايت.
<br />
3-	اضغط على زر "ارفع المستندات" حتى يتم رفع الصورة.


        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyAcademicTranscript" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student academic transcritpt upload Modal Popup Extender Control --%>
    <%-- Verify Student Modal Popup Extender Control --%>
    <asp:Button ID="btnVerifyStudentHidden" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeVerifyStudent" runat="server" TargetControlID="btnVerifyStudentHidden"
        PopupControlID="pnlVerifyStudent" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnVerifyStudent">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlVerifyStudent" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="lblVerifyStudentHeading" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="lblVerifyStudentBody" runat="server" Text=" رقم بطاقة الأحوال الذي ادخلته غير موجود في قاعدتي البيانات الواردة لنا رسميا من وزارة التربية والتعليم ووزراة التعليم العالي ، يمكنك متابعة التسجيل يدويا بملئ الحقول المطلوبة. ">                    
                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyStudent" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Student Options Modal Popup Extender Control --%>
    <asp:Panel ID="PersonalInfoPanel1" runat="server" CssClass="collapsePanel" Height="1px">
        <asp:UpdatePanel ID="uptMain" runat="server">
            <ContentTemplate>
                <asp:Table ID="tblPersonalInf" runat="server" align="rtl" CssClass='tabTable'>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4" >
                            <asp:Label ID="lblPersonalInfoHelp" runat="server" ForeColor="Red"  Text="ادخل رقم بطاقة الأحوال ثم اضغط على زر 'تحقق'" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLocalId" runat="server" Text="رقم بطاقة الأحوال"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="3">
                            <asp:TextBox ID="txtLocalId" runat="server" MaxLength="10" Width="170px"></asp:TextBox>
                            <asp:Button ID="btnVerify" runat="server" Text="تحقق" OnClick="btnVerify_Click" CssClass="mainMenuButton"
                                CausesValidation="true" ValidationGroup="localIdValidationGroup" Visible="false" />
                            <asp:RequiredFieldValidator ID="IDValidator" runat="server" ControlToValidate="txtLocalId"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLocalId"
                                ErrorMessage="*" ValidationGroup="localIdValidationGroup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="IDExpressionValidator" Font-Bold="true" ControlToValidate="txtLocalId"
                                ErrorMessage="رقم بطاقة الأحوال المدخل غير مقبول الرجاء التأكد من صحته" runat="server"
                                ValidationExpression="\d{10}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="IDExpressionValidator2" Font-Bold="true" ControlToValidate="txtLocalId"
                                runat="server" ValidationExpression="\d{10}" ValidationGroup="localIdValidationGroup"></asp:RegularExpressionValidator>
                            <asp:UpdateProgress AssociatedUpdatePanelID="uptMain" ID="uppMain" runat="server">
                                <ProgressTemplate>
                                    <asp:Label ID="lblMain" BackColor="Green" runat="server" ForeColor="White" Text="الرجاء الإنتظار"
                                        Width="100"></asp:Label>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblFullName" runat="server" Text="الإسم كاملاً"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblFullNameValue" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4" align="center">
                            <asp:Label ID="lblNameAsPassport" runat="server" Text="ادخل الإسم حسب جواز السفر!"
                                ForeColor="Red"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblFirstNameAr" runat="server" Text="الإسم الأول"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFirstNameAr" runat="server" MaxLength="25" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="firstNameArValidator" runat="server" ControlToValidate="txtFirstNameAr"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFirstNameEn" runat="server" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="firstNameEnVlidator" runat="server" ControlToValidate="txtFirstNameEn"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblFirstNameEn" runat="server" Text="First Name"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMiddleNameAr" runat="server" Text="اسم الأب"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMiddleNameAr" runat="server" MaxLength="25" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="middleNameArValidator" runat="server" ControlToValidate="txtMiddleNameAr"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMiddleNameEn" runat="server" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="middleNameEnVlidator" runat="server" ControlToValidate="txtMiddleNameEn"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblMiddleNameEn" runat="server" Text="Father Name"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblGrnadFatherAr" runat="server" Text="اسم الجد"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtGrandFatherAr" runat="server" MaxLength="25" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="grandFatherArValidator" runat="server" ControlToValidate="txtGrandFatherAr"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtGrandFatherEn" runat="server" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="grandFatherEnValidator" runat="server" ControlToValidate="txtGrandFatherEn"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblGrandFatherEn" runat="server" Text="Grand Father Name"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblFamilyNameAr" runat="server" Text="اللقب"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFamilyNameAr" runat="server" MaxLength="25" Width="170px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="familyNameArValidaotr" runat="server" ControlToValidate="txtFamilyNameAr"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtFamilyNameEn" runat="server" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="familyNameEnValidaotr" Font-Bold="true" runat="server"
                                ControlToValidate="txtFamilyNameEn" ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblFamilyNameEn" runat="server" Text="Family Name"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblBirthDateHijri" runat="server" Text="تاريخ الميلاد"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlHirjiDay" runat="server" OnSelectedIndexChanged="HijriDayChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlHirjriMonth" runat="server" OnSelectedIndexChanged="HijriMonthChanged"
                                AutoPostBack="true">
                                <asp:ListItem>مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem>رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem>رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem>جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem>جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem>رَجَب</asp:ListItem>
                                <asp:ListItem>شَعْبانُ</asp:ListItem>
                                <asp:ListItem>رَمَضانُ</asp:ListItem>
                                <asp:ListItem>شَوّال</asp:ListItem>
                                <asp:ListItem>ذُو القَعدة</asp:ListItem>
                                <asp:ListItem>ذُو الحِجّة</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlHirjiYear" runat="server" OnSelectedIndexChanged="HijriYearChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEnglishDay" runat="server" ReadOnly="true" Width="40"></asp:TextBox>
                            <asp:TextBox ID="txtEnglishMonth" runat="server" ReadOnly="true" Width="55"></asp:TextBox>
                            <%--<asp:DropDownList ID="ddlLatinianDay" runat="server"></asp:DropDownList>--%>
                            <%--<asp:DropDownList ID="ddlLatinianMonth" runat="server">
                                                <asp:ListItem >يناير</asp:ListItem>
                                                <asp:ListItem>فبراير</asp:ListItem>
                                                <asp:ListItem >مارس</asp:ListItem>
                                                <asp:ListItem >ابريل</asp:ListItem>
                                                <asp:ListItem >مايو</asp:ListItem>
                                                <asp:ListItem >يونيو</asp:ListItem>
                                                <asp:ListItem >يوليو</asp:ListItem>
                                                <asp:ListItem >أغسطس</asp:ListItem>
                                                <asp:ListItem >سبتمبر</asp:ListItem>
                                                <asp:ListItem >أكتوبر</asp:ListItem>
                                                <asp:ListItem >نوفمبر</asp:ListItem>
                                                <asp:ListItem >ديسمبر</asp:ListItem>
                                           </asp:DropDownList>--%>
                            <asp:TextBox ID="txtEnglishYear" runat="server" ReadOnly="true" Width="40"></asp:TextBox>
                            <%--<asp:DropDownList ID="ddlLatinianYear" runat="server"></asp:DropDownList>--%>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblLatinianDate" runat="server" Text="Birth Date"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPlaceOfBirth" runat="server" Text="مكان الميلاد"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <%--<asp:DropDownList ID="ddlPlaceOfBirth" runat="server"></asp:DropDownList>--%>
                            <asp:TextBox ID="txtPlaceOfBirth" runat="server" Width="170px" MaxLength="20"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <ajaxToolkit:CollapsiblePanelExtender ID="addressInfCollapsedPanel" runat="Server"
        TargetControlID="addressInfoPanel1" ExpandControlID="addresslInfoPanel2" CollapseControlID="addresslInfoPanel2"
        Collapsed="False" TextLabelID="lblAddressInf" ImageControlID="addressInfPanelImage"
        ExpandedImage="~/assets/ajax_images/collapse_blue.jpg" CollapsedImage="~/assets/ajax_images/expand_blue.jpg"
        SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
    <asp:Panel ID="addresslInfoPanel2" runat="server" CssClass="collapsePanelHeader"
        Height="30px" BackImageUrl="~/assets/ajax_images/2.png">
        <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; vertical-align: middle;
            cursor: pointer; padding-top: 5px">
            <div style="float: right">
                <asp:ImageButton ID="addressInfPanelImage" runat="server" AlternateText="(Show Details...)"
                    ImageUrl="~/assets/ajax_images/expand_blue.jpg" />
                بيانات العنوان</div>
            <div style="float: left; margin-left: 20px; width: 1px; height: 14px;">
                &nbsp;</div>
            <br />
            <div style="float: right; vertical-align: middle">
                &nbsp;</div>
        </div>
    </asp:Panel>
    <asp:Panel ID="addressInfoPanel1" runat="server" CssClass="collapsePanel" Height="1px">
        <asp:UpdatePanel ID="uptAddress" runat="server">
            <ContentTemplate>
                <asp:Table ID="tblAddressFeilds" runat="server" align="rtl" CssClass='tabTable col2'>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStudentAddress" runat="server" Text="العنوان"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStudentAddress" runat="server" MaxLength="100" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="studentAddressValidator" runat="server" ControlToValidate="txtStudentAddress"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblCountry" runat="server" Text="البلد"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlStudentCountry" Width="155px" runat="server" OnSelectedIndexChanged="AddressCountyChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:UpdateProgress ID="upprg15" runat="server" AssociatedUpdatePanelID="uptAddress">
                                <ProgressTemplate>
                                    <asp:Label ID="lblProgress" runat="server" Text="الرجاء الإنتظار..."></asp:Label>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblCity" runat="server" Text="المنطقة"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlStudentCity" runat="server" Width="155px">
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStudentMobile" runat="server" Text="رقم الجوال"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStudentMobile" runat="server" MaxLength="8" Width="110px"></asp:TextBox>
                            <asp:DropDownList ID="ddlStudMobilePrefix" runat="server">
                                <asp:ListItem Text="05" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="studentMobileValidator" runat="server" ControlToValidate="txtStudentMobile"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblMobileHint" runat="server"  Text="الرجاء ادخال رقم جوال داخل المملكة العربية السعودية"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="studentMobileExpression" Font-Bold="true" ControlToValidate="txtStudentMobile"
                                ErrorMessage=" رقم الجوال المدخل غير مقبول الرجاء التأكد من صحته" runat="server"
                                ValidationExpression="\d{8}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStudentHomePhone" runat="server" Text="رقم الهاتف"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStudentHomePhone" runat="server" MaxLength="7" Width="110px"></asp:TextBox>
                            <asp:DropDownList ID="ddlStudentPhonePrefix" runat="server">
                                <asp:ListItem Text="01" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="02"></asp:ListItem>
                                <asp:ListItem Text="03"></asp:ListItem>
                                <asp:ListItem Text="04"></asp:ListItem>
                                <asp:ListItem Text="05"></asp:ListItem>
                                <asp:ListItem Text="06"></asp:ListItem>
                                <asp:ListItem Text="07"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="studentHomePhoneValidator" runat="server" ControlToValidate="txtStudentHomePhone"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="studentHomePhoneExpression" Font-Bold="true"
                                ControlToValidate="txtStudentHomePhone" ErrorMessage=" رقم هاتف المنزل المدخل غير مقبول الرجاء التأكد من صحته"
                                runat="server" ValidationExpression="\d{7}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail" runat="server" Text="البريد الإلكتروني"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="studentEmailValidator" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="studentEmailExpressionValidator" Font-Bold="true"
                                ControlToValidate="txtEmail" ErrorMessage="البريد الإلكتروني المدخل غير مقبول الرجاء التأكد من صحته"
                                runat="server" ValidationExpression="^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"
                                ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail2" runat="server" Text="اعد كتابةالبريد الإلكتروني"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEmail2" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="studentRetypedMailValidator" runat="server" ControlToValidate="txtEmail2"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CompareValidator ID="emailCompareValidator" runat="server" ErrorMessage="البريد الإلكتروني غير مطابق الرجاء التأكد منه"
                                ControlToCompare="txtEmail" ControlToValidate="txtEmail2" ValidationGroup="studentInformationGroup"></asp:CompareValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="studentRetypedEmailExpression" Font-Bold="true"
                                ControlToValidate="txtEmail2" ErrorMessage="البريد الإلكتروني المدخل غير مقبول الرجاء التأكد من صحته"
                                runat="server" ValidationExpression="^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"
                                ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblReferenceName" runat="server" Text="اسم شخص للإتصال عند الحاجة"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtReferenceName" runat="server" MaxLength="25 " Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="referenceNameValidator" runat="server" ControlToValidate="txtReferenceName"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblReferenceRelation" runat="server" Text="صلة القرابة"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlRleationShip" runat="server" Width="155px">
                                <%--<asp:ListItem Text="أب" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="أخ" ></asp:ListItem>
                                <asp:ListItem Text="شخص آخر" ></asp:ListItem>--%>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblRefernceMobile" runat="server" Text="رقم الجوال"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtReferenceMobile" runat="server" MaxLength="8" Width="110px"></asp:TextBox>
                            <asp:DropDownList ID="ddlRefMobilePrefix" runat="server">
                                <asp:ListItem Text="05" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="referenceMobileValidaotr" runat="server" ControlToValidate="txtReferenceMobile"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblMobilePhone2" runat="server"  Text="الرجاء ادخال رقم جوال داخل المملكة العربية السعودية"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="referenceMobileExpression" Font-Bold="true" ControlToValidate="txtReferenceMobile"
                                ErrorMessage=" رقم الجوال المدخل غير مقبول الرجاء التأكد من صحته" runat="server"
                                ValidationExpression="\d{8}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblReferenceHomePhone" runat="server" Text="رقم هاتف المنزل"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtRefHomePhone" runat="server" MaxLength="7" Width="110px"></asp:TextBox>
                            <asp:DropDownList ID="ddlRefPhonePrefix" runat="server">
                                <asp:ListItem Text="01" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="02"></asp:ListItem>
                                <asp:ListItem Text="03"></asp:ListItem>
                                <asp:ListItem Text="04"></asp:ListItem>
                                <asp:ListItem Text="05"></asp:ListItem>
                                <asp:ListItem Text="06"></asp:ListItem>
                                <asp:ListItem Text="07"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="refHomePhoneValidator" runat="server" ControlToValidate="txtRefHomePhone"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="refHomePhoneExpression" Font-Bold="true" ControlToValidate="txtRefHomePhone"
                                ErrorMessage=" رقم هاتف المنزل المدخل غير مقبول الرجاء التأكد من صحته" runat="server"
                                ValidationExpression="\d{7}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblRefWorkPhone" runat="server" Text="رقم هاتف العمل"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtRefWorkPhone" runat="server" MaxLength="7" Width="110px"></asp:TextBox>
                            <asp:DropDownList ID="ddlRefWorkPhone" runat="server">
                                <asp:ListItem Text="01" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="02"></asp:ListItem>
                                <asp:ListItem Text="03"></asp:ListItem>
                                <asp:ListItem Text="04"></asp:ListItem>
                                <asp:ListItem Text="05"></asp:ListItem>
                                <asp:ListItem Text="06"></asp:ListItem>
                                <asp:ListItem Text="07"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="refWorkPhoneValidator" runat="server" ControlToValidate="txtRefWorkPhone"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RegularExpressionValidator ID="refWorkPhoneExpression" Font-Bold="true" ControlToValidate="txtRefWorkPhone"
                                ErrorMessage=" رقم هاتف العمل المدخل غير مقبول الرجاء التأكد من صحته" runat="server"
                                ValidationExpression="\d{7}" ValidationGroup="studentInformationGroup"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
        TargetControlID="gradesInfoPanel1" ExpandControlID="gradeslInfoPanel2" CollapseControlID="gradeslInfoPanel2"
        Collapsed="False" TextLabelID="lblGradesInf" ImageControlID="gradesInfPanelImage"
        ExpandedImage="~/assets/ajax_images/collapse_blue.jpg" CollapsedImage="~/assets/ajax_images/expand_blue.jpg"
        SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
    <asp:Panel ID="gradeslInfoPanel2" runat="server" CssClass="collapsePanelHeader" Height="30px"
        BackImageUrl="~/assets/ajax_images/3.png">
        <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; vertical-align: middle;
            cursor: pointer; padding-top: 5px">
            <div style="float: right">
                <asp:ImageButton ID="gradesInfPanelImage" runat="server" AlternateText="(Show Details...)"
                    ImageUrl="~/assets/ajax_images/expand_blue.jpg" />
                بيانات الدرجات</div>
            <div style="float: left; margin-left: 20px; width: 1px; height: 14px;">
                &nbsp;</div>
            <br />
            <div style="float: right; vertical-align: middle">
                &nbsp;</div>
        </div>
    </asp:Panel>
    <asp:Panel ID="gradesInfoPanel1" runat="server" CssClass="collapsePanel" Height="1px">
        <div align="center">
            
        </div>
        <asp:UpdatePanel ID="uptGrades" runat="server">
            <ContentTemplate>
               <!--Here we will put the high school fields -->
                <asp:Table ID="tb_Academic" Font-Size="Smaller" runat="server" Width="100%" CssClass='tabTable'>
                            <asp:TableRow Font-Size="Smaller">
                           <asp:TableCell Font-Size="10"  Font-Names="Tahoma" Width="150px" ID="degree">الدرجة العلمية</asp:TableCell>
                           <asp:TableCell>
                            <asp:TextBox ID="txtDegree_1"  MaxLength="20" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDegree_1" ErrorMessage="Degree" ValidationGroup="studentInformationGroup" >*</asp:RequiredFieldValidator>                       
                           </asp:TableCell>                           
                           <asp:TableCell>
                            
                           </asp:TableCell>
                           <asp:TableCell  >
                           </asp:TableCell>                           
                           </asp:TableRow>                           
                           
                           <asp:TableRow >
                           <asp:TableCell Font-Size="10"  Font-Names="Tahoma">التخصص في درجة البكالوريوس  </asp:TableCell>
                           <asp:TableCell>
                            <asp:TextBox ID="txtSpeciality_1"  MaxLength="50" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSpeciality_1" ErrorMessage="Speciality"  ValidationGroup="studentInformationGroup">*</asp:RequiredFieldValidator>                       
                           </asp:TableCell>                           
                           <asp:TableCell>
                           </asp:TableCell>
                           <asp:TableCell></asp:TableCell>                           
                           </asp:TableRow>
                                                      
                        
                           
                           <asp:TableRow Font-Size="Smaller">
                           <asp:TableCell Font-Size="10"  Font-Names="Tahoma">اســـم الجـامعة</asp:TableCell>
                           <asp:TableCell>
                            <asp:TextBox ID="txtUniversity_1"  MaxLength="50" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtUniversity_1" ErrorMessage="Name of University"  ValidationGroup="studentInformationGroup">*</asp:RequiredFieldValidator>                       
                           </asp:TableCell>                           
                           <asp:TableCell>
                           </asp:TableCell>
                           <asp:TableCell></asp:TableCell>                           
                           </asp:TableRow>
                           
                       
                           
                           <asp:TableRow Font-Size="Smaller">
                           <asp:TableCell Font-Size="10"  Font-Names="Tahoma">الدولة</asp:TableCell>
                           <asp:TableCell>
                           <asp:DropDownList ID="ddlUniversityCountry" runat="server"></asp:DropDownList>
                           </asp:TableCell>                           
                           <asp:TableCell>
                           </asp:TableCell>
                           <asp:TableCell></asp:TableCell>                           
                           </asp:TableRow>
                           
                           
                           <asp:TableRow Font-Size="Smaller" Visible=false>
                           <asp:TableCell ColumnSpan="2" Font-Bold="true" ID="universityAttendance" Font-Size="10" >فترة الدراسة </asp:TableCell>
                           <asp:TableCell ColumnSpan="2" HorizontalAlign="Left"></asp:TableCell>                           
                           <asp:TableCell></asp:TableCell>
                           <asp:TableCell></asp:TableCell>
                           </asp:TableRow>
                           
                           <asp:TableRow Font-Size="Smaller" Visible="false">
                           <asp:TableCell ID="fromDate" Font-Size="10"  Font-Names="Tahoma"> تاريخ بداية الدراسة</asp:TableCell>
                           <asp:TableCell>
                           <asp:DropDownList runat="server" ID="ddlDegreeFromDay" Width="34px"></asp:DropDownList>&nbsp;
                           <asp:DropDownList ID="ddlFromMonth_1" runat="server" Width="60px">
                            <asp:ListItem >مُحَرَّم</asp:ListItem>
                            <asp:ListItem>صَقَر</asp:ListItem>
                            <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                            <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                            <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                            <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                            <asp:ListItem >رَجَب</asp:ListItem>
                            <asp:ListItem >شَعْبانُ</asp:ListItem>
                            <asp:ListItem >رَمَضانُ</asp:ListItem>
                            <asp:ListItem >شَوّال</asp:ListItem>
                            <asp:ListItem >ذُو القَعدة</asp:ListItem>
                            <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                           </asp:DropDownList>&nbsp;
                           <asp:DropDownList ID="ddlDegreeFromYear" runat="server" Width="50px">
                            <asp:ListItem>1400</asp:ListItem>
                            <asp:ListItem>1401</asp:ListItem>
                            <asp:ListItem>1402</asp:ListItem>
                            <asp:ListItem>1403</asp:ListItem>
                            <asp:ListItem>1404</asp:ListItem>
                            <asp:ListItem>1405</asp:ListItem>
                            <asp:ListItem>1406</asp:ListItem>
                            <asp:ListItem>1407</asp:ListItem>
                            <asp:ListItem>1408</asp:ListItem>
                            <asp:ListItem>1409</asp:ListItem>
                            <asp:ListItem>1410</asp:ListItem>
                            <asp:ListItem>1411</asp:ListItem>
                            <asp:ListItem>1412</asp:ListItem>
                            <asp:ListItem>1413</asp:ListItem>
                            <asp:ListItem>1414</asp:ListItem>
                            <asp:ListItem>1415</asp:ListItem>
                            <asp:ListItem>1416</asp:ListItem>
                            <asp:ListItem>1417</asp:ListItem>
                            <asp:ListItem>1418</asp:ListItem>
                            <asp:ListItem>1419</asp:ListItem>
                            <asp:ListItem>1420</asp:ListItem>
                            <asp:ListItem>1421</asp:ListItem>
                            <asp:ListItem>1422</asp:ListItem>
                            <asp:ListItem>1423</asp:ListItem>
                            <asp:ListItem>1424</asp:ListItem>
                            <asp:ListItem>1425</asp:ListItem>
                            <asp:ListItem>1426</asp:ListItem>
                            <asp:ListItem>1427</asp:ListItem>
                            <asp:ListItem>1428</asp:ListItem>
                            <asp:ListItem>1429</asp:ListItem>
                            <asp:ListItem>1430</asp:ListItem>
                           </asp:DropDownList>                           
                           </asp:TableCell>                           
                           <asp:TableCell>
                                                
                           </asp:TableCell>
                           <asp:TableCell></asp:TableCell>                           
                           </asp:TableRow>    
                           
                           <asp:TableRow Font-Size="Smaller">
                           <asp:TableCell ID="ToGradudationDate" Font-Size="10"  Font-Names="Tahoma">تاريخ التخرج</asp:TableCell>
                           <asp:TableCell>
                           <asp:DropDownList runat="server" ID="ddlDegreeToDay" Width="40px">
                            
                           </asp:DropDownList>&nbsp;
                           <asp:DropDownList ID="ddlToMonth_1" runat="server" Width="60px">
                            <asp:ListItem >مُحَرَّم</asp:ListItem>
                            <asp:ListItem>صَقَر</asp:ListItem>
                            <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                            <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                            <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                            <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                            <asp:ListItem >رَجَب</asp:ListItem>
                            <asp:ListItem >شَعْبانُ</asp:ListItem>
                            <asp:ListItem >رَمَضانُ</asp:ListItem>
                            <asp:ListItem >شَوّال</asp:ListItem>
                            <asp:ListItem >ذُو القَعدة</asp:ListItem>
                            <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                           </asp:DropDownList>&nbsp;
                           <asp:DropDownList ID="ddlDegreeToYear" runat="server" Width="50px">
                            <asp:ListItem>1426</asp:ListItem>
                            <asp:ListItem>1427</asp:ListItem>
                            <asp:ListItem>1428</asp:ListItem>
                            <asp:ListItem>1429</asp:ListItem>
                            <asp:ListItem>1430</asp:ListItem>
                           </asp:DropDownList>                           
                           </asp:TableCell>                           
                           <asp:TableCell>
                           </asp:TableCell>
                           <asp:TableCell></asp:TableCell>                           
                           </asp:TableRow>      
                           
                           <asp:TableRow Font-Size="Smaller">
                           <asp:TableCell ID="GpaScore" Font-Size="10"  Font-Names="Tahoma">المعـدل التـراكمي </asp:TableCell>
                           <asp:TableCell ColumnSpan="3" Font-Size="10">
                            
                            <asp:UpdatePanel ID="upd_grade" runat="server" ChildrenAsTriggers=true>
                                <ContentTemplate>                                
                                    <asp:RadioButton AutoPostBack=true OnCheckedChanged="grader" ID="outof100" GroupName="grp_out_of" TextAlign="Left" runat="server" Text="من 100" />
                                    <asp:RadioButton AutoPostBack=true Checked=true OnCheckedChanged="grader" ID="outof5" GroupName="grp_out_of" TextAlign="Left" runat="server" Text="من 5" />
                                    <asp:RadioButton AutoPostBack=true OnCheckedChanged="grader" ID="outof4" GroupName="grp_out_of" TextAlign="Left" runat="server" Text="من 4" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdateProgress ID="UpdateProgress1"   runat=server AssociatedUpdatePanelID="upd_grade" DynamicLayout=true>
                                <ProgressTemplate>
                                    <div style="background-color:Red;width:120px" id="st" runat="server">
                                    الرجاء الإنتضار...
                                    </div>
                                    
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                           </asp:TableCell>   
                           <asp:TableCell></asp:TableCell>               
                           <asp:TableCell></asp:TableCell>
                           </asp:TableRow>      
                           
                           <asp:TableRow Font-Size="Smaller">
                            <asp:TableCell Font-Size="10"  Font-Names="Tahoma">علامات</asp:TableCell>
                            <asp:TableCell ColumnSpan=2>
                                <asp:UpdatePanel ID="upd_pnl1" runat="server">
                                    <ContentTemplate>
                                    <asp:TextBox runat="server" ID="txtMarks"></asp:TextBox>                                
                                    <asp:Label ID="lblMarksStatus" ForeColor=Red runat="server" Visible=false></asp:Label>
                                    <ajaxToolkit:TextBoxWatermarkExtender ID="ajax_marks" runat="server" BehaviorID="marks_beha" 
                                    TargetControlID="txtMarks" WatermarkText="ادخل المعدل من 5" WatermarkCssClass="watermarked">                                    
                                    </ajaxToolkit:TextBoxWatermarkExtender>
                                    
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtMarks" ErrorMessage="Marks" ValidationGroup="studentInformationGroup">*</asp:RequiredFieldValidator>   
                                    <asp:RangeValidator runat="server" ControlToValidate="txtMarks" ID="rng_gpa"  
                                    MaximumValue="100" MinimumValue="0" Type=Double ErrorMessage="Invalid GPA" ValidationGroup="studentInformationGroup">*</asp:RangeValidator>
                              </ContentTemplate>
                              </asp:UpdatePanel>
                            </asp:TableCell>
                           </asp:TableRow>
                           </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <%-- Study Options Duplication Modal Popup Extender Control --%>
    <asp:Button ID="btnOptionsExptender" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeStudyOptions" runat="server" TargetControlID="btnOptionsExptender"
        PopupControlID="pnlStudyOptions" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnStudyOptions">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlStudyOptions" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="lblStudyOptionsHeading" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="lblStudyOptionsInfo" runat="server" Text="لقد حددت هذا الخيار من قبل الرجاء تحديد خيار آخر">                    
            </asp:Label>
        </div>
        <br />
        <br />
        <br />
        <center>
            <asp:Button ID="btnStudyOptions" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Study Options Modal Popup Extender Control --%>
    <%-- Study Options Required Modal Popup Extender Control --%>
    <asp:Button ID="btnStudyOptionRequired" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeStudyOptionRequired" runat="server" TargetControlID="btnStudyOptionRequired"
        PopupControlID="pnlStudyOptionsRequired" BackgroundCssClass="modalBackground"
        DropShadow="false" CancelControlID="btnStudyOptionsRequired">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlStudyOptionsRequired" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="Label3" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="justify">
            <asp:Label ID="Label4" runat="server" Text="لابد من تحديد خيار واحد من خيارات الدراسة">                    
            </asp:Label>
        </div>
        <br />
        <br />
        <br />
        <center>
            <asp:Button ID="btnStudyOptionsRequired" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Study Options Modal Popup Extender Control --%>
    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
        TargetControlID="studyOptionsInfoPanel1" ExpandControlID="studyOptionslInfoPanel2"
        CollapseControlID="studyOptionslInfoPanel2" Collapsed="False" TextLabelID="lblOptionsInf"
        ImageControlID="optionsInfPanelImage" ExpandedImage="~/assets/ajax_images/collapse_blue.jpg"
        CollapsedImage="~/assets/ajax_images/expand_blue.jpg" SuppressPostBack="true"
        SkinID="CollapsiblePanelDemo" />
    <asp:Panel ID="studyOptionslInfoPanel2" runat="server" CssClass="collapsePanelHeader"
        Height="30px" BackImageUrl="~/assets/ajax_images/4.png">
        <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; vertical-align: middle;
            cursor: pointer; padding-top: 5px">
            <div style="float: right">
                <asp:ImageButton ID="optionsInfPanelImage" runat="server" AlternateText="(Show Details...)"
                    ImageUrl="~/assets/ajax_images/expand_blue.jpg" />
                رفع المستندات</div>
            <div style="float: left; margin-left: 20px; width: 1px; height: 14px;">
                &nbsp;</div>
            <br />
            
            <div style="float: right; vertical-align: middle">
                &nbsp;</div>
                
        </div>
    </asp:Panel>
    <asp:Panel ID="studyOptionsInfoPanel1" runat="server" CssClass="collapsePanel" Height="1px">
        <asp:UpdatePanel ID="uptOptions" runat="server">
            <ContentTemplate>
            </ContentTemplate>
        </asp:UpdatePanel>
                <asp:Table ID="tblUploadptions" runat="server" align="ltr" CssClass='tabTable'>
                  <asp:TableRow>
                    <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                        <asp:Label ID="lblSchoolHlep" runat="server" ForeColor="Red" Text="اضغط على زر 'فيديو للتوضيح' لمعرفة طريقة رفع المستندات"></asp:Label>
                            <input type="button" name="flower" onclick="show()" class="mainMenuButton" value="فيديو للتوضيح">
                    </asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblGraduationCert" runat="server" Text="شهادة التخرج "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:FileUpLoad id="fileUploadGraduationCertPic" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:ImageButton ID="lnkDisplayGraduationCertificate" runat="server" ImageUrl="~/assets/preview.png" ToolTip="عرض وثيقة التخرج المرفوعة مسبقاً" OnClick="mDisplayGraduationCertificate" Visible="false" CausesValidation="false" />
                    &nbsp;
                    
                    <asp:ImageButton ID="lnkReplaceGraduationCertificate" runat="server" ImageUrl="~/assets/replace.png" ToolTip="تبديل وثيقة التخرج المرفوعة مسبقاً" Visible="false" OnClick="mReplaceGraduationCertificate" CausesValidation="false" />
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:Label ID="lblFileUploadGraduationCert" runat=server  ForeColor=red></asp:Label>
                    </asp:TableCell>
                    
                  </asp:TableRow>
                  <asp:TableRow ID="rowExcellenceCert" runat="server">
                    <asp:TableCell >
                        <asp:Label ID="lblExcellenceCert" runat="server" Text="شهادة إتمام الامتياز  "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:FileUpLoad id="fileUploadExcellenceCert" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:ImageButton ID="lnkDisplayExcellenceCertificate" runat="server" ImageUrl="~/assets/preview.png" ToolTip="عرض شهادة إتمام الإمتياز المرفوعة مسبقاً" OnClick="mDisplayExcellenceCertificate" Visible="false" CausesValidation="false"/>
                            &nbsp;
                        <asp:ImageButton ID="lnkReplaceExcellenceCertificate" runat="server" ImageUrl="~/assets/replace.png" ToolTip="تبديل شهادة إتمام الإمتياز المرفوعة مسبقاً" Visible="false" OnClick="mReplaceExcellenceCertificate" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:Label ID="lblExcellenceCertMessage" runat=server  ForeColor=red></asp:Label>
                    </asp:TableCell>
                   
                  </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAcademicTranscriptPic" runat="server" Text="السجل الأكاديمي"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:FileUpLoad id="fileUploadAcademicTranscript" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:ImageButton ID="lnkDisplayAcademicTranscript" runat="server" ImageUrl="~/assets/preview.png" ToolTip="عرض السجل الأكاديمي المرفوع مسبقاً" OnClick="mDisplayAcademicTranscirpt" Visible="false" CausesValidation="false"/>
                            &nbsp;
                        <asp:ImageButton ID="lnkReplaceAcademicTranscript" runat="server" ImageUrl="~/assets/replace.png" ToolTip="تبديل السجل الأكاديمي المرفوع مسبقاً" Visible="false" OnClick="mReplaceAcademicTranscript" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:Label ID="FileUploadAcademicTranscriptMessage" runat=server  ForeColor=red></asp:Label>
                    </asp:TableCell>
                  
                  </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnUploadDocuments" runat="server" Text="ارفع المستندات"  CssClass="mainMenuButton" CausesValidation="false" OnClick="mUploadStudentFiles"/>
                    </asp:TableCell>
                  </asp:TableRow>
                </asp:Table>
            
    </asp:Panel>
    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
        TargetControlID="accountDetailsInfoPanel1" ExpandControlID="accountDetailslInfoPanel2"
        CollapseControlID="accountDetailslInfoPanel2" Collapsed="False" TextLabelID="lblAccountDetailsInf"
        ImageControlID="accountDetailsPanelImage" ExpandedImage="~/assets/ajax_images/collapse_blue.jpg"
        CollapsedImage="~/assets/ajax_images/expand_blue.jpg" SuppressPostBack="true"
        SkinID="CollapsiblePanelDemo" />
    <asp:Panel ID="accountDetailslInfoPanel2" runat="server" CssClass="collapsePanelHeader"
        Height="30px" BackImageUrl="~/assets/ajax_images/5.png">
        <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; vertical-align: middle;
            cursor: pointer; padding-top: 5px">
            <div style="float: right">
                <asp:ImageButton ID="accountDetailsPanelImage" runat="server" AlternateText="(Show Details...)"
                    ImageUrl="~/assets/ajax_images/expand_blue.jpg" />
                تفاصيل الحساب</div>
            <div style="float: left; margin-left: 20px; width: 1px; height: 14px;">
                &nbsp;</div>
            <br />
            <div style="float: right; vertical-align: middle">
                &nbsp;</div>
        </div>
    </asp:Panel>
    <%-- Verify Student Password Popup Extender Control --%>
    <asp:Button ID="btnStudentPassword" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="mpeStudentPassword" runat="server" TargetControlID="btnStudentPassword"
        PopupControlID="pnlStudentPassword" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnVerifyStudentPassword">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlStudentPassword" runat="server" Direction="RightToLeft" CssClass="modalPopup"
        Style="display: none" Width="300" Height="200">
        <center>
            <asp:Label ID="lblStudentPasswordHeading" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية"
                Font-Bold="true"></asp:Label>
        </center>
        <hr />
        <br />
        <div align="center">
            <asp:Label ID="lblStudentPasswordBody" runat="server" Text="كلمة المرور المدخلة غير مطابقة">                    
            </asp:Label>
        </div>
        <br />
        <br />
        <center>
            <asp:Button ID="btnVerifyStudentPassword" runat="server" Text="اغلاق" />
        </center>
    </asp:Panel>
    <%-- End Of Study Password Modal Popup Extender Control --%>
    <asp:Panel ID="accountDetailsInfoPanel1" runat="server" CssClass="collapsePanel"
        Height="1px">
        <asp:UpdatePanel ID="uptUserName" runat="server">
            <ContentTemplate>
                <asp:Table ID="tblAccountDetails" runat="server" align="rtl" CssClass='tabTable'>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblUserName" runat="server" Text="اسم المستخدم"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="25" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="userNameValidator" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPassword" runat="server" Text="كلمة المرور"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblRetypedPassword" runat="server" Text="اعد كتابة كلمة المرور"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtRetypedPassword" runat="server" MaxLength="15" TextMode="Password"
                                Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="retypedPasswordValidator" runat="server" ControlToValidate="txtRetypedPassword"
                                ErrorMessage="*" ValidationGroup="studentInformationGroup"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="2">
                            <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="كلمة المرور المدخلة غير مطابقة الرجاء التأكد ."
                                ControlToCompare="txtPassword" ControlToValidate="txtRetypedPassword" ValidationGroup="studentInformationGroup"></asp:CompareValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <%-- Registration Status Extender Control --%>
    <asp:Button ID="btnHidden" Style="display: none;" runat="server" Text="Fake" />
    <ajaxToolkit:ModalPopupExtender ID="registratinoStatusExtender" runat="server" TargetControlID="btnHidden"
        PopupControlID="statusPnl" BackgroundCssClass="modalBackground" DropShadow="false"
        CancelControlID="btnStatusCancel">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel Direction="LeftToRight" ID="statusPnl" runat="server" CssClass="modalPopup"
        Style="display: none" Width="800" Height="600" ScrollBars="Both">
        <asp:Panel ID="Panel2" runat="server" Style="cursor: move; background-color: #DDDDDD;
            border: solid 1px Gray; color: Black">
            <div>
                <asp:Label ID="Label1" runat="server" Text="نظام التسجيل الإلكتروني - ملخص حالة التسجيل"></asp:Label>
            </div>
        </asp:Panel>
        <b><span>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </span></b>
        <div align="center">
            <asp:Label ID="lblItemDisplay" runat="server" ForeColor="red" Font-Size="Larger"
                Text="ملخص حالة التسجيل"></asp:Label>
            <br />
            <table dir="rtl" border="1" cellpadding="0" cellspacing="0" style="font-weight: bold;"
                id="tbl_status" runat="server">
                <tr style="background-color: LightGrey;">
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        ملخص مراحل التسجيل
                    </td>
                    <td>
                        الشــــــــــــــــــــــــــــــــرح
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_progress" Checked="true" runat="server" />
                    </td>
                    <td>
                        جاري التسجيل
                    </td>
                    <td>
                        أنت لازلت في مرحلة التسجيل
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_registred" runat="server" />
                    </td>
                    <td>
                        التسجيل مكتمل
                    </td>
                    <td>
                        لقد أتممت عملية إدخال بيانات التسجيل بنجاح
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_invited" runat="server" />
                    </td>
                    <td>
                        أنت مدعو للمقابلة الشخصية (بانتظار تأكيدك )
                    </td>
                    <td>
                        لقد تم اختيارك بناء على مفاضلة الدرجة المكافئة للمقابلة الشخصية ( أول مرحلة في القبول
                        المبدئي ) في يوم وتاريخ اضغط هنا لتسجيل قبولك الدعوة للمقابلة الشخصية. يجب عليك
                        ملاحظة إن عدم قبول الدعوة سيسقط دعوتك حيث إن النظام سيتخطاك إلى دعوة متقدمين آخرين
                        لذلك ننصحك بمتابعة الدخول إلى الموقع يوميا أو مراقبة بريدك الالكتروني حيث سيتم دعوتك
                        بهاتين الطريقتين
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_acknowledged" runat="server" />
                    </td>
                    <td>
                        أنت مدعو للمقابلة الشخصية (وقد أكدت قبولك للدعوة)
                    </td>
                    <td>
                        بمجرد قبولك الدعوة أعلاه سيعكس النظام جاهزيتك لحضور المقابلة الشخصية ، لقبول الدعوة
                        للمقابلة الرجاء
                        <br />
                        <asp:LinkButton ID="lnkAcknowledge" Text="الضغط هنا." runat="server" Enabled="false"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_interviewed" runat="server" />
                    </td>
                    <td>
                        الحضور للمقابلة الشخصية
                    </td>
                    <td>
                        لقد تم حضورك الفعلي للمقابلة الشخصية
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_accepted" runat="server" />
                    </td>
                    <td>
                        مقبول
                    </td>
                    <td>
                        لقد تم قبولك
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox Enabled="false" ID="chk_status_rejected" runat="server" />
                    </td>
                    <td>
                        غير مقبول
                    </td>
                    <td>
                        نعتذر عن قبولك هذا العام
                    </td>
                </tr>
                </b>
            </table>
            <br />
        </div>
        <div style="text-align: center;">
            <asp:Button ID="btnStatusCancel" runat="server" Text="اغلاق" /></div>
    </asp:Panel>
    <%-- End of registration status extender --%>
    <asp:UpdatePanel ID="uptSave" runat="server">
        <ContentTemplate>
            <asp:Table ID="tblSubmission" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="mainMenuButton" Text="سجل" CausesValidation="true"
                            ValidationGroup="studentInformationGroup" OnClick="btnSave_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--Hidden Field--%>
    <asp:TextBox runat=server ID="HIDDEN_COLLEGE_ID" Visible=false></asp:TextBox>
    <asp:TextBox runat=server ID="HIDDEN_" Visible=false></asp:TextBox>
    <asp:TextBox runat=server ID="hiddenGraduationCollegeName" Visible=false></asp:TextBox>
    
</asp:Content>
