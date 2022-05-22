<%@ Page Title="نظام التسجيل الإلكتروني - الصفحة الرئيسية" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>
<%@ register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainMenuContent" Runat="Server">
    <asp:Button ID="btnHomePage" runat=server CssClass="mainMenuButton"  Text="الرئيسية" PostBackUrl="~/index.aspx"/>
                <asp:Button ID="btnContactUs" runat=server CssClass="mainMenuButton"  Text="اتصل بنا" PostBackUrl="~/contact.aspx"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
<%-- The following panel will contain the University welcome Letter--%>
<asp:Panel ID="pnlWelcomeLetter" runat="server" Width="830px">
    <div>
        <table cellpadding="0" cellspacing="0" border="0" >
            <tr>
                <td valign="top">
                    <table class='msg' border='0' cellpadding='0' cellspacing='0'>
	                    <tr><td class='header' colspan='3'/></tr>
	                    <tr>
		                    <td class='rightBorder' />
		                    <td class='msgBody'>
		                    أعزاءنا الطلاب
		                    <br />
		                         باسم  جامعة الملك سعود بن عبدالعزيز للعلوم الصحية نرحب بكم جميعًا وأنتم تطمحون إلى مواصلة طريق العلم والمعرفة عبر دراسة الطب والحصول على درجة البكالوريوس في هذا المجال الحيوي كتخصص جديد يُضاف إلى ما سبق أن توَّجتم به مسيرتكم الجامعية في كليات العلوم أو العلوم الطبية التطبيقية أو الصيدلة أو الطب البيطري. 
                                ويسعدنا ـ وأنتم تضعون أولى خطواتكم في هذه الجامعة الرائدة ـ اصطحابكم في جولة للتعرف على نظام التسجيل الإلكتروني بها.. ولا شك أن استيعابكم لكامل خطوات هذا النظام سيمكنكم من استكمال كل عمليات التسجيل عن بعد بنجاح من أي مكان في مختلف أنحاء المملكة، ويكفيكم مؤونة عناء الحضور إلى موقع الجامعة.. 
                                وليترقَّب كل من تنطبق عليهم شروط الالتحاق بالكلية استدعاءً للمقابلة الشخصية.. مع التنويه إلى أن من لم تصله دعوة للمقابلة فهم خارج المنافسة، ونتمنى له التوفيق في موقع آخر. 
                                وندعو الراغبين في الاستفسار، أو في الحصول على معلومات إضافية إلى الاتصال بعمادة القبول والتسجيل أو عبر البريد الإلكتروني كما هو مبيَّن في الطلب.
                                <div align=right style="color:Red;font-size:14px">
                                <hr />
                               سيبدأ التسجيل يوم السبت 25 ذو الحجة 1430 هـ الموافق 12 ديسمبر 2009 م، وينتهي يوم الأربعاء 20 محرم 1431هـ الموافق 6 يناير 2010 م.
                                
                                </div>
		                    </td>
		                    <td class='leftBorder' />
	                    </tr>
	                    <tr>
		                    <td class='rightBottomCorner' />
		                    <td class='bottomCorner' />
		                    <td class='leftBottomCorner' />
	                    </tr>
                    </table>
                </td>
                <td valign="top" class='leftPane'>
                    <table border="0" cellpadding="0" cellspacing="0"  width="100%"  align=center>
                        <tr height="90">
                        <td valign="top">
                            <%-- The following table will contain the login control --%>
                            <asp:Panel ID="loginPnl" runat="server" DefaultButton="btnLogin">
                            <asp:Table ID="tblLogin" runat="server" align="rtl" GridLines="None" CssClass="loginTable">
                                <asp:TableRow CssClass='loginTableHeader'>
                                      <asp:TableCell>
                                      </asp:TableCell>
                                      <asp:TableCell>
                                     </asp:TableCell>
                                    </asp:TableRow>
                                  <asp:TableRow>
                                      <asp:TableCell>
                                         <asp:Label ID="lblUserNAME" runat=server Text="اسم المستخدم" ></asp:Label>
                                      </asp:TableCell>
                                      <asp:TableCell>
                                          <asp:TextBox ID="txtUserName" runat="server"  Width="100px" MaxLength="20"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="userNameVlidator" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" ValidationGroup="loginGroup"></asp:RequiredFieldValidator>
                                     </asp:TableCell>
                                    </asp:TableRow>
                                  <asp:TableRow>
                                       <asp:TableCell>
                                            <asp:Label ID="lblPassword" runat="server" Text="كلمة المرور" ></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtPassword" runat="server" Width="100px" MaxLength="15" TextMode="Password"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ValidationGroup="loginGroup"></asp:RequiredFieldValidator>
                                         </asp:TableCell>
                                 </asp:TableRow>
                                  <asp:TableRow  HorizontalAlign="Center">
                                      <asp:TableCell >
                                         <asp:Button ID="btnLogin" runat="server" CausesValidation="true" ValidationGroup="loginGroup"  CssClass='loginButton' OnClick="btnLogin_Click" />
                                     </asp:TableCell>
                                     <asp:TableCell Width="100px">
                                        <asp:LinkButton ID="lnkForgotePassword" runat="server" Text="نسيت كلمة المرور" PostBackUrl="~/getpassword.aspx" Visible=false></asp:LinkButton>
                                     </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow >
                                      <asp:TableCell>
                                            
                                      </asp:TableCell>
                                      <asp:TableCell>
                                     </asp:TableCell>
                                    </asp:TableRow>
                            </asp:Table>
                            </asp:Panel>

                        </td>
                        </tr>
                        <tr height="200" >
                            <td valign="top">
                                <asp:Panel ID="pnlAdvertiseMent" runat="server"  Direction="RightToLeft" CssClass="advTable">
                                     <marquee id="mrqAds" direction ="up" scrollamount="2" scrolldelay ="3" > <p> <A><div align="justify"><asp:Literal ID="literalAds" runat="server"></asp:Literal></div></A> </p> </marquee></asp:Panel>
                            </td>
                        </tr>
                    </table>
                 </td>
            </tr>
        </table>
        
        
        
    </div>
   
    
        <asp:UpdatePanel ID="UpdatePanel15" runat="server" RenderMode="Inline">
            <ContentTemplate>
                    <div align="rtl" class="collegeChoicesTable" ><font size="3" class="fontFamilyClass">
حدد الكلية التي تخرجت منها من القائمة ادناه </font>
                        <br /><asp:DropDownList ID="ddlColleges" runat="server" Visible="false"/>
                        <asp:DropDownList ID="ddlStudentGraduatedCollege" runat="server">
                            <asp:ListItem Text="كلية العلوم الطبية التطبيقية" Value="COAMS"></asp:ListItem>
                            <asp:ListItem Text="كلية العلوم" Value="COS"></asp:ListItem>
                            <asp:ListItem Text="كلية الصيدلة" Value="COP"></asp:ListItem>
                            <asp:ListItem Text="كلية الطب البيطري" Value="COV"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Table ID="tblCollegeChoice" runat="server" align="rtl">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Center" VerticalAlign="Middle">                                        
                                        <asp:CheckBox ID="chkAssurance" CssClass="fontFamilyClass"  runat="server" Font-Size="12pt" TextAlign="Right" Text="أنا متأكد من اختياري للكلية التي تخرجت منها" ForeColor=Red AutoPostBack="true" OnCheckedChanged="mAssuranceCheckChanged"  />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign=Center VerticalAlign=Middle>
                                  <asp:Button ID="btnNext" runat="server" Text="الصفحة التالية" CssClass="mainMenuButton top5" OnClick="mShowCollegesExtender" Enabled="false" />
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
                    </div>
   
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Panel>
<div style='height:15px;'/>
<%-- Failure of login Modal Popup Extender Control --%>
                <asp:Button ID="btnOptionsExptender" Style="display: none;" runat="server" Text="Fake" />
			    
                <ajaxToolkit:ModalPopupExtender ID="mpeLoginFailure" runat="server" 
                    TargetControlID="btnOptionsExptender"  PopupControlID="pnlLoginFailure" 
                    BackgroundCssClass="modalBackground" 
                    DropShadow="false"  CancelControlID="btnLoginFailure">
                </ajaxToolkit:ModalPopupExtender>
                
                <asp:Panel ID="pnlLoginFailure" runat="server" Direction="RightToLeft" CssClass="modalPopup" Style="display:none" Width="300" Height="200">
                <center>
                    <asp:Label ID="lblStudyOptionsHeading" runat="server" Text="جامعة الملك سعود بن عبدالعزيز للعلوم الصحية" Font-Bold="true"></asp:Label>                    
                </center>
                <hr />
                <br />
                    <div align="justify">
                    <asp:Label ID="lblLoginFaliureInfo" runat="server" Text="اسم المستخدم او كلمة المرور غير صحيح الرجاء التأكد من صحتهم.">                    
                    </asp:Label>
                    </div>
                    <br /><br /><br /><br /><br /><br />
                    <center>
                        <asp:Button ID="btnLoginFailure" runat="server" Text="اغلاق"/>                    
                    </center>
                </asp:Panel>                
                
                
<%-- Failure of login Modal Popup Extender Control --%>
         
</asp:Content>


