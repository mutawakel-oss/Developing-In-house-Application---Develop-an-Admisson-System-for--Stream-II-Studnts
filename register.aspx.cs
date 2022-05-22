using System; 
using System.Collections.Generic; 
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
    GeneralClass.Program objProgram = new GeneralClass.Program();
    GeneralClass.Student objStudent = new GeneralClass.Student();
    GeneralClass.Dates objDate = new GeneralClass.Dates();
    int intCollegeId =0;
    string strCollegeGraduated ="";
 

    
    protected void Page_Load(object sender, EventArgs e)
    {

        

        //=====================================================//
        /// <summary>
        /// Description: It will handle the Page Load Event
        /// Author: hussaint
        /// Date :6/23/2009 12:33:40 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            if (Session["college_id"] != null) 
            {
                intCollegeId =int.Parse(Session["college_id"].ToString());
                HIDDEN_COLLEGE_ID.Text = intCollegeId.ToString();
            }
            else
            {
                Response.Redirect("~/index.aspx",false);
            }
            

            //Will have to remove this line
            //intCollegeId = 2;             

            if (!IsPostBack)
            {   
                

                //Here we are gonna check if this is a new user or an existing one came by providing login and password information
                //If the StudentId Session variable is empty.. then its a new user... otherwise an existing one
                if (Session["StudentId"] == null || Session["StudentId"].ToString().Equals(""))
                {
                    if ((Session["GraduationCollegeNameText"] != null) || (hiddenGraduationCollegeName.Text!=""))
                    {
                        if(Session["GraduationCollegeNameText"] != null)
                        hiddenGraduationCollegeName.Text = Session["GraduationCollegeNameText"].ToString();
                        strCollegeGraduated = Session["GraduatedCollegeName"].ToString();
                        mFillDropDownLists();
                        mConvertDates();
                        mEnableDisableControls(true);
                        if (strCollegeGraduated == "COS")
                            rowExcellenceCert.Visible = false;
                        else
                            rowExcellenceCert.Visible = true;
                    }
                    else
                        Response.Redirect("~/index.aspx", false);
                }
                else
                {
                    objStudent = objStudent.GetStudentByID(Session["StudentId"].ToString());                    
                    txtLocalId.Enabled = false;
                    btnVerify.Enabled = false;
                    mFillDropDownLists();
                    mConvertDates();
                    mFillStudentDetailsInForm(objStudent);
                    btnSubmit.Text = "احفظ التغييرات";
                }
                
                
            }
        }
        catch (Exception Page_Load_Exp)
        {
            objProgram.gAddLog("register.aspx", "Page_Load", Page_Load_Exp.Message);
            Response.Redirect("~/error.aspx?error=" + HttpUtility.UrlEncode("حدث خطأ اثناء محاولة عرض صفحة التسجيل، الرجاء الظغط عل زر 'اتصل بنا' لإرسال طلب مساعدة من المسؤولين عن النظام."),false);

        }
        finally
        { 
        
        }       

    }
    
    protected void mFillStudentDetailsInForm(GeneralClass.Student objStudent)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to Fill the student details in the Registration form using his Student ID
        /// Author: hussaint
        /// Date :6/29/2009 11:35:29 AM
        /// Parameter:
        /// input: strStudentId is the Database ID of the Student
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            
            
            txtLocalId.Text = objStudent.strLocalId;
            txtFirstNameAr.Text = objStudent.strFirstNameAr;
            txtFirstNameEn.Text = objStudent.strFirstNameEn;
            txtMiddleNameAr.Text = objStudent.strMiddleNameAr;
            txtMiddleNameEn.Text = objStudent.strMiddleNameEn;
            txtGrandFatherAr.Text = objStudent.strGrandFatherNameAr;
            txtGrandFatherEn.Text = objStudent.strGrandFatherNameEn;
            txtFamilyNameAr.Text = objStudent.strFamilyNameAr;
            txtFamilyNameEn.Text = objStudent.strFamilyNameEn;
            txtPlaceOfBirth.Text = objStudent.strPlaceOfBirth;
            objProgram.strData = objStudent.strDateOfBirth.Split('/');                             
            ddlHirjiDay.Text = objProgram.strData[0];
            mSetListIndex(ddlHirjriMonth, objProgram.strData[1]);            
            ddlHirjiYear.Text = objProgram.strData[2];  
            
            txtStudentAddress.Text = objStudent.strAddress;
            mSetListIndex(ddlStudentCountry,objStudent.strStudentCountry);                                
            mSetListIndex(ddlStudentCity, objStudent.strStudentCity);              
            txtStudentMobile.Text = objStudent.strStudentMobile;


            if (objStudent.strStudentPhone.Length > 7)
            {

                mSetListIndex(ddlStudentPhonePrefix,objStudent.strStudentPhone.Substring(0,2));                
                txtStudentHomePhone.Text = objStudent.strStudentPhone.Substring(2);
            }
            else
            {
                txtStudentHomePhone.Text = objStudent.strStudentPhone;
            }

            txtEmail.Text= objStudent.strEmail;
            txtEmail2.Text = objStudent.strEmail;     
            mSetListIndex(ddlRleationShip,objStudent.strRefRelationId);
            txtReferenceName.Text = objStudent.strRefName;
            txtReferenceMobile.Text = objStudent.strRefMobile;

            if (objStudent.strRefHomePhone.Length > 7)
            {

                mSetListIndex(ddlRefPhonePrefix,objStudent.strRefHomePhone.Substring(0,2)); 
                txtRefHomePhone.Text = objStudent.strRefHomePhone.Substring(2);

            }
            else
            {
                txtRefHomePhone.Text = objStudent.strRefHomePhone;
            }

            if (objStudent.strRefWorkPhone.Length > 7)
            {

                mSetListIndex(ddlRefWorkPhone, objStudent.strRefWorkPhone.Substring(0, 2));                 
                txtRefWorkPhone.Text = objStudent.strRefWorkPhone.Substring(2);
            }
            else
            {
                txtRefWorkPhone.Text = objStudent.strRefWorkPhone;
            }

            txtUserName.Text = objStudent.strUserName;
            txtPassword.Attributes.Add("value", objStudent.strPassword);
            txtRetypedPassword.Attributes.Add("value", objStudent.strPassword);

            txtDegree_1.Text = objStudent.strAcademicDegree;
            txtSpeciality_1.Text = objStudent.strSpeciality;
            txtUniversity_1.Text = objStudent.strUniversityName;
            mSetListIndex(ddlUniversityCountry, objStudent.strUniversityCountry);

            objProgram.strData = objStudent.strStudyFrom.Split('/');
            ddlDegreeFromDay.Text = objProgram.strData[0];
            mSetListIndex(ddlFromMonth_1, objProgram.strData[1]);
            ddlDegreeFromYear.Text = objProgram.strData[2];

            objProgram.strData = objStudent.strStudyTo.Split('/');

            ddlDegreeToDay.Text = objProgram.strData[0];
            mSetListIndex(ddlToMonth_1, objProgram.strData[1]);
            ddlDegreeToYear.Text = objProgram.strData[2];
            txtMarks.Text = objStudent.strGPA;
            if (objStudent.strGPAOutof == "100")
            {
                outof100.Checked = true;
                outof4.Checked = false;
                outof5.Checked = false;
            }
            else
                if (objStudent.strGPAOutof == "4")
                {
                    outof4.Checked = true;
                    outof100.Checked = false;
                    outof5.Checked = false;
                }
                else
                    if (objStudent.strGPAOutof == "5")
                    {
                        outof5.Checked = true;
                        outof100.Checked = false;
                        outof4.Checked = false;
                    }
            fileUploadGraduationCertPic.Enabled = false;
            fileUploadExcellenceCert.Enabled = false;
            fileUploadAcademicTranscript.Enabled = false;
            btnUploadDocuments.Enabled = false;
            lnkDisplayAcademicTranscript.Visible = true;
            lnkDisplayExcellenceCertificate.Visible = true;
            lnkDisplayGraduationCertificate.Visible = true;
            lnkReplaceAcademicTranscript.Visible = true;
            lnkReplaceExcellenceCertificate.Visible = true;
            lnkReplaceGraduationCertificate.Visible = true;
            
            mConvertDates();
            //The following code will be used to visible or invisible the excellence certificate upload control depending to the college of the student
            hiddenGraduationCollegeName.Text = objStudent.strGraduationCollegeName;
            if (objStudent.strGraduationCollegeName.ToString() == "كلية العلوم")
                rowExcellenceCert.Visible = false;

        }
        catch (Exception mFillStudentDetailsInForm_Exp)
        {
            objProgram.gAddLog("register.aspx", "mFillStudentDetailsInForm", mFillStudentDetailsInForm_Exp.Message);
            Response.Redirect("~/error.aspx?error=" + HttpUtility.UrlEncode("حدث خطأ اثناء محاولة عرض صفحة التسجيل، الرجاء الظغط عل زر 'اتصل بنا' لإرسال طلب مساعدة من المسؤولين عن النظام."),false);
        }
        finally
        { 
        
        }
    
    }
    private void mSetListIndex(DropDownList ddlTemp, string strCaption)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to Set the Index of a particular item in Drop Down List
        /// Author: hussaint
        /// Date :6/29/2009 1:33:55 PM
        /// Parameter:
        /// input: ddlTemp is the DropDownList, strCaption is text of the Item tht we are searching for.
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            for (objProgram.intLoopCounter = 0; objProgram.intLoopCounter < ddlTemp.Items.Count; objProgram.intLoopCounter++)
            {
                if (ddlTemp.Items[objProgram.intLoopCounter].Text.Equals(strCaption))
                {
                    ddlTemp.SelectedIndex = objProgram.intLoopCounter;
                    return;
                }
            }

        }
        catch (Exception mGetListIndex_Exp)
        {

        }
        finally
        { 
        
        }
    
    }
    protected void HijriDayChanged(object sender,EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Index Changed Event of the Hijri Day Drop Down List
        /// Author: hussaint
        /// Date :6/24/2009 10:24:53 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {           

            mConvertDates();

        }
        catch (Exception HijriDayChanged_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void HijriMonthChanged(object sender,EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Index Changed Event of the Hijri Month Drop Down List
        /// Author: hussaint
        /// Date :6/24/2009 10:24:53 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            mConvertDates();

        }
        catch (Exception HijriDayChanged_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void HijriYearChanged(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Index Changed Event of the Hijri Year Drop Down List
        /// Author: hussaint
        /// Date :6/24/2009 10:24:53 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            mConvertDates();

        }
        catch (Exception HijriDayChanged_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void AddressCountyChanged(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: will be used to handle the Selected Index Changed Event of Address Country
        /// Author: hussaint
        /// Date :6/24/2009 10:51:28 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {            

            objProgram.strSql = "SELECT id,city_name FROM city_preset WHERE country_id = " + ddlStudentCountry.SelectedValue.ToString();
            objProgram.gFillDropDownList(objProgram.strSql, ddlStudentCity); 

        }
        catch (Exception AddressCountyChanged_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void SchoolCountryChanged(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the selected index changed event of the School country Drop Drown List
        /// Author: hussaint
        /// Date :6/24/2009 11:01:17 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {           

            //objProgram.strSql = "SELECT id,city_name FROM city_preset WHERE country_id = " + ddlSchoolCountry.SelectedValue.ToString();
            //objProgram.gFillDropDownList(objProgram.strSql, ddlSchoolCity); 

        }
        catch (Exception SchoolCountryChanged_Exp)
        {

        }
        finally
        { 
        
        }
    }
    private void mConvertDates()
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to convert the Hijri date used by user to English Date
        /// Author: hussaint
        /// Date :6/24/2009 10:20:59 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            objProgram.strSql = ddlHirjiDay.SelectedItem.Text + "/" + Convert.ToString(ddlHirjriMonth.SelectedIndex + 1) + "/" + ddlHirjiYear.SelectedItem.Text;
            objProgram.strSql = objDate.HijriToGreg(objProgram.strSql, "dd-MM-yyyy");
            txtEnglishDay.Text = objProgram.strSql.Substring(0, 2);
            txtEnglishMonth.Text = objProgram.strSql.Substring(3, 2);
            txtEnglishYear.Text = objProgram.strSql.Substring(6);
        }
        catch (Exception mConvertDates_Exp)
        {

        }
        finally
        { 
        
        }
    }

    protected void mShowStatusExtender(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to show the registratino status extender "registratinoStatusExtender"
        /// Author: mutawakelm
        /// Date :6/20/2009 12:38:27 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            registratinoStatusExtender.Show();
        }
        catch (Exception exp)
        {
        }
    }
    private void mFillDropDownLists()
    {

        //=====================================================//
        /// <summary>
        /// Description: This will populate all the drop down list at the page.. Like Birth Date, City and Country..
        /// Author: hussaint
        /// Date :6/23/2009 12:27:55 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            for (objProgram.intLoopCounter = 1; objProgram.intLoopCounter <= 30; objProgram.intLoopCounter++)
            { 
                ddlHirjiDay.Items.Add(objProgram.intLoopCounter.ToString());
                ddlDegreeFromDay.Items.Add(objProgram.intLoopCounter.ToString());
                ddlDegreeToDay.Items.Add(objProgram.intLoopCounter.ToString());
            }
            objProgram.strSql = "SELECT birth_start_date,birth_end_date FROM college_preset WHERE id =1 " ; //Here we got to put the session variable Session["college_id"]

            objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);


            if (objProgram.drData.HasRows && objProgram.drData.Read())
            {
                for (objProgram.intLoopCounter = int.Parse(objProgram.drData["birth_start_date"].ToString()); objProgram.intLoopCounter <= int.Parse(objProgram.drData["birth_end_date"].ToString()); objProgram.intLoopCounter++)
                {
                    ddlHirjiYear.Items.Add(objProgram.intLoopCounter.ToString());
                    
                }
            }

            objProgram.drData.Close();

            objProgram.gFillDropDownList("SELECT id,relation_name FROM relationship_preset", ddlRleationShip);
            //objProgram.gFillDropDownList("SELECT id,country_name FROM country_preset", ddlSchoolCountry);
            objProgram.gFillDropDownList("SELECT id,country_name FROM country_preset",ddlStudentCountry);
            objProgram.gFillDropDownList("SELECT id,country_name FROM country_preset", ddlUniversityCountry);

            //If this is a new student.. then fill the city with the cities of Saudi Arabia.. otherwise.. dont fill and leave it to 
            //process of index changed event of ddlCountry..
            if (Session["StudentId"] == null || Session["StudentId"].ToString().Equals(""))
            {
                objProgram.gFillDropDownList("SELECT id,city_name FROM city_preset WHERE country_id = 1", ddlStudentCity);
                //objProgram.gFillDropDownList("SELECT id,city_name FROM city_preset WHERE country_id = 1", ddlSchoolCity);
            }
            else
            {
                objProgram.gFillDropDownList("SELECT id,city_name FROM city_preset WHERE country_id = (SELECT id FROM country_preset WHERE country_name ='" + objStudent.strStudentCountry + "')", ddlStudentCity);
                //objProgram.gFillDropDownList("SELECT id,city_name FROM city_preset WHERE country_id = (SELECT id FROM country_preset WHERE country_name ='" + objStudent.strShcoolCountry + "')", ddlSchoolCity);
            }

            
            

            

        }
        catch (Exception mFillDropDownLists_Exp)
        {
            objProgram.gDisposeDataBaseObjects();                        
        }
        finally
        {
            objProgram.gDisposeDataBaseObjects();        
        }
    }    
    protected void ddlOption1_Changed(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Selected Index changed events of option drop down lists.
        /// Author: hussaint
        /// Date :6/24/2009 4:54:44 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            
        }
        catch (Exception ddlOption1_Changed_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void ddlOption2_Changed(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Selected Index changed events of option drop down lists.
        /// Author: hussaint
        /// Date :6/24/2009 4:54:44 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            
        }
        catch (Exception ddlOption1_Changed_Exp)
        {

        }
        finally
        {

        }
    }
    protected void ddlOption3_Changed(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to handle the Selected Index changed events of option drop down lists.
        /// Author: hussaint
        /// Date :6/24/2009 4:54:44 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            
        }
        catch (Exception ddlOption1_Changed_Exp)
        {

        }
        finally
        {

        }
    }
   
    protected void btnVerify_Click(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: will be used to handle the click event of btnVerify.
        /// Author: hussaint
        /// Date :6/24/2009 1:09:53 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {

            string strSchoolGrade = "";
            
            if (!txtLocalId.Text.Trim().Equals(""))
            {


                if (objProgram.gCheckRecordExistence("student_registration", "local_id", txtLocalId.Text.Trim(), "S"))
                {
                    mpeCheckStudentExistence.Show();
                    return;
                }                

                //objProgram.strSql = "SELECT * FROM imported_data_new WHERE local_id = " + txtLocalId.Text;
                objProgram.strSql = "SELECT A.local_id,A.studentnamearabic,A.SchoolNameArabic,A.secondyearpercentage AS sec_year,A.thirdyearpercent AS third_year,B.birth_place,B.mobile,B.home_phone,B.gudrat_grade,C.tahsili_mark As tahseeli_marks FROM high_school_master A left outer join imported_data_new B ON A.local_id = B.local_id " +
                                    " LEFT OUTER JOIN Tehseeli_results C ON A.local_id = C.local_id WHERE A.local_id = '" + txtLocalId.Text.Trim() + "' order by B.gudrat_grade DESC";

                objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                if (objProgram.drData.HasRows)
                {
                    if (objProgram.drData.Read())
                    {


                        if (objProgram.drData["third_year"].ToString().Equals(""))
                        {
                            strSchoolGrade = "0";
                        }
                        else
                        {
                            strSchoolGrade = objProgram.drData["sec_year"].ToString() == "0" ? objProgram.drData["third_year"].ToString() : Convert.ToString((double.Parse(objProgram.drData["sec_year"].ToString()) + double.Parse(objProgram.drData["third_year"].ToString())) / 2);
                        }


                        lblFullNameValue.Text = objProgram.drData["studentnamearabic"].ToString();
                        objProgram.strData = objProgram.drData["studentnamearabic"].ToString().Split(' ');
                        if (objProgram.strData.Length > 0)
                        {
                            txtFirstNameAr.Text = objProgram.strData[0];
                        }

                        if (objProgram.strData.Length > 1)
                        {
                            txtMiddleNameAr.Text = objProgram.strData[1];
                        }

                        if (objProgram.strData.Length > 2)
                        {
                            txtGrandFatherAr.Text = objProgram.strData[2];
                        }

                        if (objProgram.strData.Length > 3)
                        {
                            txtFamilyNameAr.Text = objProgram.strData[3];
                        }

                        txtPlaceOfBirth.Text = objProgram.drData["birth_place"].ToString();


                        //txtGeneralPercentage.Text = strSchoolGrade.ToString();

                        //txtGodarat.Text = objProgram.drData["gudrat_grade"].ToString() == "" ? "0" : objProgram.drData["gudrat_grade"].ToString();

                        //txtKnowExam.Text = objProgram.drData["tahseeli_marks"].ToString() == "" ? "0" : objProgram.drData["tahseeli_marks"].ToString();

                        txtStudentMobile.Text = objProgram.drData["mobile"].ToString();

                        txtStudentHomePhone.Text = objProgram.drData["home_phone"].ToString();

                        //txtSchoolName.Text = objProgram.drData["SchoolNameArabic"].ToString();


                        if (double.Parse(strSchoolGrade) < 90)
                        {
                            mpeSchoolGrades.Show();                            
                        }
                        else
                        {
                            mEnableDisableControls(true);                           

                        }

                        mCalculateMarks();
                    }
                }
                else
                {                    
                    mpeVerifyStudent.Show();
                    intCollegeId = int.Parse(Session["college_id"].ToString());
                    if (intCollegeId == 1 || intCollegeId == 2)
                    {
                        mEnableDisableControls(false);                           
                    }
                    else if (intCollegeId == 3 || intCollegeId == 4)
                    {
                        mEnableDisableControls(true);                           
                    }
                }
            }
            
            objProgram.drData.Close();


        }
        catch (Exception btnVerify_Click_Exp)
        {
            objProgram.gDisposeDataBaseObjects();
        }
        finally
        {
            objProgram.gDisposeDataBaseObjects();
        }
    }
    private void mEnableDisableControls(bool blnFlag)
    {

        //=====================================================//
        /// <summary>
        /// Description: This procedure would be used to Enable Disable Controls
        /// Author: hussaint
        /// Date :6/27/2009 2:03:48 PM
        /// Parameter:
        /// input: blnFlag would be used to determine that whether to keep the controls Enable or Disable
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {

            //txtLocalId.Enabled = !blnFlag;

            txtFirstNameAr.Enabled = blnFlag;
            txtFirstNameEn.Enabled = blnFlag;

            txtMiddleNameAr.Enabled = blnFlag;
            txtMiddleNameEn.Enabled = blnFlag;

            txtGrandFatherAr.Enabled = blnFlag;
            txtGrandFatherEn.Enabled = blnFlag;

            txtFamilyNameAr.Enabled = blnFlag;
            txtFamilyNameEn.Enabled = blnFlag;

            txtPlaceOfBirth.Enabled = blnFlag;       
            ddlHirjiDay.Enabled = blnFlag;
            ddlHirjriMonth.Enabled = blnFlag;
            ddlHirjiYear.Enabled = blnFlag;

            txtEnglishDay.Enabled = blnFlag;
            txtEnglishMonth.Enabled = blnFlag;
            txtEnglishYear.Enabled = blnFlag;

            txtStudentAddress.Enabled = blnFlag;
            ddlStudentCountry.Enabled = blnFlag;
            ddlStudentCity.Enabled = blnFlag;
            txtStudentMobile.Enabled = blnFlag;
            txtStudentHomePhone.Enabled = blnFlag;
            txtEmail.Enabled = blnFlag;
            txtEmail2.Enabled = blnFlag;
            txtReferenceName.Enabled = blnFlag;
            txtReferenceMobile.Enabled = blnFlag;
            txtRefHomePhone.Enabled = blnFlag;
            txtRefWorkPhone.Enabled = blnFlag;
            //txtSchoolName.Enabled = blnFlag;
            //ddlSchoolCountry.Enabled = blnFlag;
            //ddlSchoolCity.Enabled = blnFlag;
            //txtGraduationYear.Enabled = blnFlag;
            //lnkSchoolGPA.Enabled = blnFlag;
            //btnCalculate.Enabled = blnFlag;
            txtUserName.Enabled = blnFlag;
            txtPassword.Enabled = blnFlag;
            txtRetypedPassword.Enabled = blnFlag; 


        }
        catch (Exception mEnableDisableControls_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void mCalculateMarks()
    {

        //=====================================================//
        /// <summary>
        /// Description: This will be used to calculate the marks based upon the total marks and percentage.. 
        /// Author: hussaint
        /// Date :6/27/2009 11:30:52 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            //double dblVerifyTemp = 0;

            //if (!double.TryParse(txtGeneralPercentage.Text.Trim(), out dblVerifyTemp)) txtGeneralPercentage.Text = "0";
            //if (!double.TryParse(txtGodarat.Text.Trim(), out dblVerifyTemp)) txtGodarat.Text = "0";
            //if (!double.TryParse(txtKnowExam.Text.Trim(), out dblVerifyTemp)) txtKnowExam.Text = "0";


            ////This is the Calculation Part of the Marks section
            //if (!txtGeneralPercentage.Text.Trim().Equals(""))
            //{
            //    txtGPAFinal.Text = Convert.ToString(Math.Round(double.Parse(txtGeneralPercentage.Text.Trim()) * (double.Parse(txtGPApoint.Text.Trim().Substring(0, 2)) / 100),2));
            //}

            //if (!txtGodarat.Text.Trim().Equals(""))
            //{
            //    txtGodaratFinal.Text = Convert.ToString(Math.Round(double.Parse(txtGodarat.Text.Trim()) * (double.Parse(txtGodaratPoint.Text.Trim().Substring(0, 2)) / 100),2));
            //}

            //if (!txtKnowExam.Text.Trim().Equals(""))
            //{
            //    txtKnowFinal.Text = Convert.ToString(Math.Round(double.Parse(txtKnowExam.Text.Trim()) * (double.Parse(txtKnowPoint.Text.Trim().Substring(0, 2)) / 100),2));
            //}

            //txtTotalConvertedMarks.Text = Convert.ToString(double.Parse(txtGPAFinal.Text.Trim()) + double.Parse(txtGodaratFinal.Text.Trim()) + double.Parse(txtKnowFinal.Text.Trim()));

        }
        catch (Exception mCalculateMarks_Exp)
        {

        }
        finally
        { 
        
        }
        
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This will be used to handle the click event of btnCalculate
        /// Author: hussaint
        /// Date :6/27/2009 11:33:30 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {           

            //txtGeneralPercentage.Enabled = false;           
            //txtGodarat.Enabled = false;           
            //txtKnowExam.Enabled = false;

            mCalculateMarks();
        }
        catch (Exception btnCalculate_Click_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void lnkSchoolGpa_Click(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description: This will handle the Click event of the lnkSchoolGpa
        /// Author: hussaint
        /// Date :6/27/2009 11:28:09 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {           

            //txtGeneralPercentage.Enabled = true;           
            //txtGodarat.Enabled = true;           
            //txtKnowExam.Enabled = true;            

        }
        catch (Exception lnkSchoolGpa_Click_Exp)
        {

        }
        finally
        { 
        
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:
        /// Author: hussaint
        /// Date :6/27/2009 3:40:01 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//        
        int intStudentId = 0;
        try
        {
            
            if (!mValidate()) return;


            if (Session["StudentId"] == null || Session["StudentId"].ToString().Equals(""))
            {
                objStudent.strStudent_Registration_Id = "";
            }
            else
            {
                objStudent.strStudent_Registration_Id = Session["StudentId"].ToString();
            }
            
            objStudent.strLocalId = txtLocalId.Text.Trim();
            objStudent.strFirstNameAr = txtFirstNameAr.Text.Trim();
            objStudent.strFirstNameEn = txtFirstNameEn.Text.Trim();
            objStudent.strMiddleNameAr = txtMiddleNameAr.Text.Trim();
            objStudent.strMiddleNameEn = txtMiddleNameEn.Text.Trim();
            objStudent.strGrandFatherNameAr = txtGrandFatherAr.Text.Trim();
            objStudent.strGrandFatherNameEn = txtGrandFatherEn.Text.Trim();
            objStudent.strFamilyNameAr = txtFamilyNameAr.Text.Trim();
            objStudent.strFamilyNameEn = txtFamilyNameEn.Text.Trim();
            objStudent.strPlaceOfBirth = txtPlaceOfBirth.Text.Trim();
            objStudent.strDateOfBirth = ddlHirjiDay.SelectedItem.Text + "/" + ddlHirjriMonth.SelectedItem.Text + "/" + ddlHirjiYear.SelectedItem.Text;
            objStudent.strAddress = txtStudentAddress.Text.Trim();
            objStudent.strStudentCountry = ddlStudentCountry.SelectedValue.ToString();

            if (!ddlStudentCity.SelectedValue.Equals(""))
            {
                objStudent.strStudentCity = ddlStudentCity.SelectedValue.ToString();
            }
            else
            {
                objStudent.strStudentCity = "";
            }

            objStudent.strStudentMobile = txtStudentMobile.Text.Trim();
            objStudent.strStudentPhone = ddlStudentPhonePrefix.SelectedItem.Text  + txtStudentHomePhone.Text.Trim();
            objStudent.strEmail = txtEmail.Text.Trim();
            objStudent.strRefRelationId = ddlRleationShip.SelectedValue.ToString();  
            objStudent.strRefName = txtReferenceName.Text.Trim();
            objStudent.strRefMobile = txtReferenceMobile.Text.Trim();
            objStudent.strRefHomePhone = ddlRefPhonePrefix.SelectedItem.Text + txtRefHomePhone.Text.Trim();
            objStudent.strRefWorkPhone = ddlRefWorkPhone.SelectedItem.Text + txtRefWorkPhone.Text.Trim();
            objStudent.strUserName = txtUserName.Text.Trim();
            objStudent.strPassword = objProgram.Encrypt(txtPassword.Text.Trim());
            objStudent.strUniversityName = txtUniversity_1.Text.Trim();
            objStudent.strUniversityCountry = ddlUniversityCountry.SelectedValue.ToString();
            objStudent.strAcademicDegree = txtDegree_1.Text.Trim();
            objStudent.strSpeciality = txtSpeciality_1.Text.Trim();
            objStudent.strGraduationCollegeName = hiddenGraduationCollegeName.Text.Trim();
            objStudent.strStudyFrom = ddlDegreeFromDay.SelectedItem.Text + "/" + ddlFromMonth_1.SelectedItem.Text + "/" + ddlDegreeFromYear.SelectedItem.Text;
            objStudent.strStudyTo = ddlDegreeToDay.SelectedItem.Text + "/" + ddlToMonth_1.SelectedItem.Text + "/" + ddlDegreeToYear.SelectedItem.Text;
            objStudent.strGPA = txtMarks.Text.Trim();
            if (outof100.Checked == true)
                objStudent.strGPAOutof = "100";
            else
                if(outof4.Checked==true)
                    objStudent.strGPAOutof = "4";
                else
                    if(outof5.Checked==true)
                        objStudent.strGPAOutof = "5";
            //objStudent.strSchoolName = txtSchoolName.Text.Trim();
            //objStudent.strShcoolCountry = ddlSchoolCountry.SelectedValue.ToString();
            //objStudent.strHighSchoolMarks = txtGeneralPercentage.Text.Trim();
            //objStudent.strGodarat = txtGodarat.Text.Trim();
            //objStudent.strKnowExam = txtKnowExam.Text.Trim();
            //objStudent.strAlternateCollege = rdPrefrences.SelectedIndex.ToString();             

            


            intStudentId =  objStudent.SaveStudent();

            //After Getting the StudentId It will create the Session Variable to pass this ID to Report Part.
            if (intStudentId > 0)
            {
                if (Session["StudentId"] == null || Session["StudentId"].ToString().Equals(""))
                {

                    Session.Add("StudentId", intStudentId.ToString());
                }

                Response.Redirect("Report.aspx",false);
            }

        }
        catch (Exception btnSave_Click_Exp)
        {
            objProgram.gAddLog("register.aspx", "btnSave_Click", btnSave_Click_Exp.Message);
            Response.Redirect("~/error.aspx?error=" + HttpUtility.UrlEncode("حدث خطأ اثناء محاولة حفظ بياناتك ، الرجاء الظغط عل زر 'اتصل بنا' لإرسال طلب مساعدة من المسؤولين عن النظام."),false);
        }
        finally
        {
            objStudent = null;
        }
    }
    protected bool mValidate()
    {

        //=====================================================//
        /// <summary>
        /// Description: This would be used to perform the validation before saving the Information
        /// Author: hussaint
        /// Date :6/27/2009 12:13:10 PM
        /// Parameter:
        /// input:
        /// output: Bool suggesting that whether this operations succeeded or failed
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            bool blnResult = true;

            
            //if (!txtPassword.Text.ToString().Trim().Equals(txtRetypedPassword.Text.ToString().Trim()))
            //{
            //    blnResult = false;
            //    mpeStudentPassword.Show(); 
            //}

            //if (!txtEmail.Text.ToString().Trim().Equals(txtEmail2.Text.ToString().Trim()))
            //{
            //    blnResult = false;
            //    mpeCheckEmailExistence.Show();
            //}

            if (Session["StudentId"] == null || Session["StudentId"].ToString().Equals(""))
            {
                if (objProgram.gCheckRecordExistence("student_registration", "local_id", txtLocalId.Text.Trim(), "S"))
                {
                    mpeCheckStudentExistence.Show();
                    blnResult = false;
                    return blnResult;
                }

                if (objProgram.gCheckRecordExistence("student_registration", "user_name", txtUserName.Text.Trim(), "S"))
                {
                    mpeCheckUserName.Show();
                    blnResult = false;
                    return blnResult;
                }

                if (objProgram.gCheckRecordExistence("student_registration", "email_address", txtEmail.Text.Trim(), "S"))
                {
                    mpeCheckEmailExistence.Show();
                    blnResult = false;
                    return blnResult;
                }

            }
            //The following code will validate the uploading of documents
            if (fileUploadGraduationCertPic.Enabled == true)
            {
                
                mpeVerifyGraduationUpload.Show();
                blnResult = false;
                return blnResult;
            }
            if ((fileUploadExcellenceCert.Enabled == true)&&(fileUploadExcellenceCert.Visible==true))
            {
                mpeVirifyExcellenceUpload.Show();
                blnResult = false;
                return blnResult;
            }
            if (fileUploadAcademicTranscript.Enabled == true)
            {
                mpeVerifyAcademicTranscript.Show();
                blnResult = false;
                return blnResult;
            }


            
            return blnResult;
        }
        catch (Exception mValidate_Exp)
        {
            return false;
        }
        finally
        { 
        
        }
    }
    protected void grader(object o, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        //txtMark.Text = "";
        RadioButton radMarks = (RadioButton)o;
        //Control radControl = RadPanelbar2.FindItemByValue("aca");
        AjaxControlToolkit.TextBoxWatermarkExtender txtMarksExt = (AjaxControlToolkit.TextBoxWatermarkExtender)radMarks.FindControl("ajax_marks");
        if (txtMarksExt == null) return;
        if (radMarks.ID.ToString() == "outof100")
        {
            txtMarksExt.WatermarkText = "ادخل المعدل من 100";
        }
        else if (radMarks.ID.ToString() == "outof5")
        {
            txtMarksExt.WatermarkText = "ادخل المعدل من 5";
        }
        else if (radMarks.ID.ToString() == "outof4")
        {
            txtMarksExt.WatermarkText = "ادخل المعدل من 4";
        }

        UpdatePanel upd_pnl1 = (UpdatePanel)radMarks.FindControl("upd_pnl1");
        if (upd_pnl1 != null)
        {
            RangeValidator rng_gpa = (RangeValidator)upd_pnl1.ContentTemplateContainer.FindControl("rng_gpa");
            if (rng_gpa != null)
            {

                if (radMarks.ID.ToString() == "outof5")
                {
                    rng_gpa.MinimumValue = "3.50";
                    rng_gpa.MaximumValue = "5.00";
                }
                else if (radMarks.ID.ToString() == "outof4")
                {
                    rng_gpa.MinimumValue = "2.50";
                    rng_gpa.MaximumValue = "4.00";
                }
                else if (radMarks.ID.ToString() == "outof100")
                {
                    rng_gpa.MinimumValue = "75.00";
                    rng_gpa.MaximumValue = "100.00";
                }
            }
        }
    }
    protected void mUploadStudentFiles(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to upload the documents of the register to the server specified folder
        /// Author: mutawakelm
        /// Date :03/03/2008 11:06:45 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {


            //The following code will be used to create a new folder fot the student with the local id name

            if (txtLocalId.Text == "")
            {
                Page.Controls.Add(new LiteralControl("<script language='javascript'> window.alert('الرجاء ادخال رقم بطاقة الأحوال قبل محاولة رفع المستندات')</script>"));

                return;
            }

            if (!string.IsNullOrEmpty(txtLocalId.Text.ToString()))
            {
                txtLocalId.Enabled = false;
                System.IO.Directory.CreateDirectory(Server.MapPath("uploads\\") + txtLocalId.Text.ToString() + "\\");
            }
            if (fileUploadGraduationCertPic.Enabled == true)
            {

                if ((!(fileUploadGraduationCertPic.PostedFile.ContentType.Equals("image/pjpeg")) || (fileUploadGraduationCertPic.PostedFile.ContentLength / 1048576 > 4)))
                {
                    if (fileUploadGraduationCertPic.HasFile)
                        lblFileUploadGraduationCert.Text = "يجب ان يكون امتداد الصورة .jpg وأن يكون حجمها اقل من 4ميجا بايت";

                }
                else
                    if (fileUploadGraduationCertPic.HasFile)
                    {

                        string pictureImageSplitter = fileUploadGraduationCertPic.FileName.ToString();
                        fileUploadGraduationCertPic.SaveAs(Server.MapPath("uploads\\") + txtLocalId.Text.ToString() + "\\graduation_certificate." + pictureImageSplitter.Substring(pictureImageSplitter.Length - 3, 3).ToString());
                        fileUploadGraduationCertPic.Enabled = false;
                        lblFileUploadGraduationCert.Text = "";

                    }
            }
            if ((fileUploadExcellenceCert.Enabled == true) && (fileUploadExcellenceCert.Visible==true))
            {
                if ((!(fileUploadExcellenceCert.PostedFile.ContentType.Equals("image/pjpeg")) || (fileUploadExcellenceCert.PostedFile.ContentLength / 1048576 > 4)))
                {
                    if (fileUploadExcellenceCert.HasFile)
                        lblExcellenceCertMessage.Text = "يجب ان يكون امتداد الصورة .jpg وأن يكون حجمها اقل من 4ميجا بايت";

                }
                else
                    if (fileUploadExcellenceCert.HasFile)
                    {

                        string pictureImageSplitter = fileUploadExcellenceCert.FileName.ToString();

                        fileUploadExcellenceCert.SaveAs(Server.MapPath("uploads\\") + txtLocalId.Text.ToString() + "\\Excellence_certificate." + pictureImageSplitter.Substring(pictureImageSplitter.Length - 3, 3).ToString());
                        fileUploadExcellenceCert.Enabled = false;
                        lblExcellenceCertMessage.Text = "";

                    }
            }
            if (fileUploadAcademicTranscript.Enabled == true)
            {
                string fileUploadType = fileUploadAcademicTranscript.PostedFile.ContentType.ToString();
                if (!(fileUploadType == "application/octet-stream" || fileUploadType == "application/zip" || fileUploadType == "application/x-zip-compressed" || fileUploadType == "application/x-zip") || (fileUploadAcademicTranscript.PostedFile.ContentLength / 1048576 > 4))
                {
                    if (fileUploadAcademicTranscript.HasFile)
                        FileUploadAcademicTranscriptMessage.Text = "يجب ان يكون امتداد الملف .zip وأن يكون حجمه اقل من 4ميجا بايت";

                }
                else
                    if (fileUploadAcademicTranscript.HasFile)
                    {

                        string pictureImageSplitter = fileUploadAcademicTranscript.FileName.ToString();

                        fileUploadAcademicTranscript.SaveAs(Server.MapPath("uploads\\") + txtLocalId.Text.ToString() + "\\Academic_Transcript." + pictureImageSplitter.Substring(pictureImageSplitter.Length - 3, 3).ToString());
                        fileUploadAcademicTranscript.Enabled = false;
                        FileUploadAcademicTranscriptMessage.Text = "";

                    }
            }
         



        }
        catch (Exception mUploadStudentFiles_Exp)
        {
            
        }
    }
    protected void mDisplayGraduationCertificate(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to display the already uploaded graduation certificate
        /// Author: mutawakelm
        /// Date :11/23/2009 3:07:04 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            string myScript = "\n";
   
            myScript += "<script language="+"'"+"javascript"+"'"+" >\n";
            myScript += "window.open('" + "uploads/" + txtLocalId.Text + "/graduation_certificate.jpg" + "');\n";
            myScript += "</" + "script>\n";
            RegisterStartupScript("popup",myScript);


            //string clientScript = "<script language=javascript>window.open(contact.aspx, null,height=340,width=640,status=no,toolbar=no,me nubar=no,location=no)</script>";
            //Page.RegisterStartupScript("s",clientScript);
            //Response.Redirect("~/uploads/" + txtLocalId.Text + "/graduation_certificate.jpg");
        }
        catch (Exception exp)
        {
        }
    }

    protected void mDisplayExcellenceCertificate(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to display the already uploaded excellence certificate
        /// Author: mutawakelm
        /// Date :11/23/2009 3:07:04 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            string myScript = "\n";
            myScript += "<script language=" + "'" + "javascript" + "'" + " >\n";
            myScript += "window.open('" + "uploads/" + txtLocalId.Text + "/Excellence_certificate.jpg" + "');\n";
            myScript += "</" + "script>\n";
            RegisterStartupScript("popup", myScript);
            //Response.Redirect("~/uploads/" + txtLocalId.Text + "/Excellence_certificate.jpg");
        }
        catch (Exception exp)
        {
        }
    }

    protected void mDisplayAcademicTranscirpt(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to display the already uploaded academic transcript.
        /// Author: mutawakelm
        /// Date :11/23/2009 3:07:04 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            string myScript = "\n";
            myScript += "<script language=" + "'" + "javascript" + "'" + " >\n";
            myScript += "window.open('" + "uploads/" + txtLocalId.Text + "/Academic_Transcript.zip" + "');\n";
            myScript += "</" + "script>\n";
            RegisterStartupScript("popup", myScript);
            //Response.Redirect("~/uploads/" + txtLocalId.Text + "/Academic_Transcript.jpg");
        }
        catch (Exception exp)
        {
        }
    }
    protected void mReplaceGraduationCertificate(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will enable uploading the graduation certificate again.
        /// Author: mutawakelm
        /// Date :11/23/2009 3:20:18 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            fileUploadGraduationCertPic.Enabled = true;
            btnUploadDocuments.Enabled = true;
        }
        catch (Exception exp)
        {
        }
    }

    protected void mReplaceExcellenceCertificate(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will enable uploading the excellence certificate again.
        /// Author: mutawakelm
        /// Date :11/23/2009 3:20:18 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {

            fileUploadExcellenceCert.Enabled = true;
            btnUploadDocuments.Enabled = true;
        }
        catch (Exception exp)
        {
        }
    }

    protected void mReplaceAcademicTranscript(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will enable uploading the academic transcript again.
        /// Author: mutawakelm
        /// Date :11/23/2009 3:20:18 PM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {

            fileUploadAcademicTranscript.Enabled = true;
            btnUploadDocuments.Enabled = true;
        }
        catch (Exception exp)
        {
        }
    }
}
