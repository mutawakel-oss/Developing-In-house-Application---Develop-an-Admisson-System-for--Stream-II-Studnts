using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class email_rejection_form : System.Web.UI.Page
{
    GeneralClass.Program objProgram = new GeneralClass.Program();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void mSendEmail(object sender, EventArgs e)
    {
        try
        {
            string message = "جامعة الملك سعود بن عبد العزيز للعلوم الصحية - عمادة القبول والتسجيل  - عزيزي  المتقدم نشكر لك رغبتك بالانضمام لبرنامج دبلوم ما بعد البكالوريوس في تقنيات القلب والاوعية الدموية ونعتذر عن عدم قبولك  مع تمنياتنا لك بالتوفيق  ";
            string query = "select * from test";
            System.Data.Odbc.OdbcDataReader reader = objProgram.gRetrieveRecord(query);
            if (reader.Read())
            {
                while (reader.Read())
                {
                    
                    objProgram.SendMail("noreply@ksau-hs.edu.sa", reader["email_address"].ToString(),"إشعار بعدم الترشيح للمقابلة ", message);
                }
                reader.Close();
            }
            else
                reader.Close();
            
            

            
           
        }
        catch (Exception exp)
        {
        }
    }
}
