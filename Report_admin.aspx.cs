﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    //GeneralClass.Program objProgram = new GeneralClass.Program();
    GeneralClass.Student objStudent = new GeneralClass.Student();
    string strStudentID = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:
        /// Author: hussaint
        /// Date :6/28/2009 11:10:07 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            if (Request.QueryString.Count > 0)
            {
                if (Session["AdminId"] == null || Session["AdminId"].ToString().Equals(""))
                {
                    Response.Redirect("adminlogin.aspx", false);
                }

                strStudentID = Request.QueryString[0].ToString();

                mCreateReport(strStudentID);

            }
            
        }
        catch (Exception Page_Load_Exp)
        {

        }
        finally
        {
            
        }
    }
    private void mCreateReport(string strID)
    {
        try
        {
            objStudent = objStudent.GetStudentByID(strID);
            mCreateRow("رقم بطاقة الأحوال", objStudent.strLocalId);
            mCreateRow("الإسم (بالإنجليزية)", objStudent.strFirstNameEn + " " + objStudent.strMiddleNameEn + " " + objStudent.strGrandFatherNameEn + " " + objStudent.strFamilyNameEn);
            mCreateRow("الإسم (بالعربية)", objStudent.strFirstNameAr + " " + objStudent.strMiddleNameAr + " " + objStudent.strGrandFatherNameAr + " " + objStudent.strFamilyNameAr);
            mCreateRow("تاريخ الميلاد", objStudent.strDateOfBirth);
            mCreateRow("مكان الميلاد", objStudent.strPlaceOfBirth);
            mCreateRow("العنوان", objStudent.strAddress);
            mCreateRow("البلد", objStudent.strStudentCountry);
            mCreateRow("المدينة", objStudent.strStudentCity);
            mCreateRow("رقم الجوال", objStudent.strStudentMobile);
            mCreateRow("رقم الهاتف", objStudent.strStudentPhone);
            mCreateRow("البريد الإلكتروني", objStudent.strEmail);
            mCreateRow("شخص للإتصال به عند الحاجة", objStudent.strRefName);
            mCreateRow("صلة القرابة", objStudent.strRefRelationId);
            mCreateRow("رقم الجوال", objStudent.strRefMobile);
            mCreateRow("رقم هاتف المنزل", objStudent.strRefHomePhone);
            mCreateRow("رقم هاتف العمل", objStudent.strRefWorkPhone);
            mCreateRow("اسم المستخدم", objStudent.strUserName);
            mCreateRow("اسم المدرسة", objStudent.strSchoolName);
            mCreateRow("البلد", objStudent.strShcoolCountry);
            mCreateRow("المدينة", objStudent.strSchoolCity);
            mCreateRow("سنة التخرج", objStudent.strGraduationyear);
            
            

        }
        catch (Exception exp)
        {

        }
        finally
        { 
        
        }
    }
    private void mCreateRow(string strCaption,string strValue)
    {

        //=====================================================//
        /// <summary>
        /// Description: This will create the Table using all the Details from the object of student Class
        /// Author: hussaint
        /// Date :6/28/2009 12:53:31 PM
        /// Parameter:
        /// input: strCaption is the caption of the Attribute, strValue is the value of Attribute
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
            TableRow objRow = new TableRow();
            TableCell objCell = new TableCell();

            objCell.Text = strCaption;
            objRow.Cells.Add(objCell);

            objCell = new TableCell();
            objCell.Text = strValue ;
            objRow.Cells.Add(objCell);

            tblMain.Rows.Add(objRow);

        }
        catch (Exception mAddRowInTable_Exp)
        {

        }
        finally
        { 
        
        }
    }
}
