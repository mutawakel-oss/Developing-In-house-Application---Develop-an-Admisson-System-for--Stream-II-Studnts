#region Copyright KSU-HS,COM. 2009
//
// All rights are reserved. Reproduction or transmission in whole or in part, in
// any form or by any means, electronic, mechanical or otherwise, is prohibited
// without the prior written consent of the copyright owner.
//
// Filename: Program.cs
//
#endregion


using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Mail;
using System.DirectoryServices;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace GeneralClass
{
    public  class Program
    {
        /*The timspan is used to findout the execution time
         * 
         * */
        
        public  string strSql = "";
        public  string APP_MSG_TITLE = "";
        
        public  OdbcConnection REG_CONN = new OdbcConnection();

        //public  OdbcConnection REG_CONN = new OdbcConnection();
        
        public  SqlConnection KSUHS_CONN = new SqlConnection();

        public OdbcTransaction objTrans;
     
        public  NameValueCollection FieldValue = new NameValueCollection();

        public  OdbcDataReader drData;
        public  int intResult = 0;
        public int intLoopCounter = 0;
        public  System.Web.UI.WebControls.ListItem objListItem=null;
        public string[] strData;

        //====these variables used to store current user name==========
        public  string strUserName;
        public  string strUserType;
        public  int intUserID;
        //=============================================================
        public  string UserName
        {
            get { return strUserName; }
            set { strUserName = value; }
        }
        public  string UserType
        {
            get { return strUserType; }
            set { strUserType = value; }
        }
        public  int UserID
        {
            get { return intUserID; }
            set { intUserID = value; }
        }        

        public  int DatabaseConnect()
        {
            try
            {
                string strDBConnectionString = "DSN=reg_ksuhs;uid=sa;pwd=dbadmin";

                if (REG_CONN.State.ToString().Trim() == "Open")
                    {
                        return 1;
                    }

                    REG_CONN.ConnectionString = strDBConnectionString;
                    REG_CONN.Open();
                    if (REG_CONN.State.ToString().Trim() != "Open")//if database connection failed then
                    {
                        return 0; //return 1;
                    }
                    else//if database connection success then
                    {
                        return 1; // return 0;
                    }                
                
            }
            catch (SqlException SQLException)
            {  
                return -1;
            }

        }
        public  void DataBaseClose()
        {
            try
            {
                if (REG_CONN.State.ToString().Trim() == "Open")
                {
                    REG_CONN.Close();
                }
            }
            catch (Exception exp)
            {

            }
            finally
            { 
            
            }
        }
        public void gDisposeDataBaseObjects()
        {

            //=====================================================//
            /// <summary>
            /// Description: This Routine will dispose all the database objects in the Program Class to prevent connection leakage
            /// Author: hussaint
            /// Date :6/24/2009 3:14:30 PM
            /// Parameter:
            /// input:
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                if (drData != null)
                {
                    drData.Close();
                    drData.Dispose();
                    drData = null;
                }

                if (REG_CONN != null)
                {
                    REG_CONN.Dispose();
                    REG_CONN = null;
                }

            }
            catch (Exception gDisposeDataBaseObjects_Exp)
            {

            }
            finally
            { 
            
            }
        }
        public  void AddComboItems(string p_tablename, string p_displaymember, string p_valuemember, System.Web.UI.WebControls.DropDownList Combo)
        {
            try
            {
                DatabaseConnect(); 

                //This function used to get a dataset, which can be used to populate the control like combobox
                //Parameter: 
                //p_tablename. The table name from where the data need to popluate.
                //p_DisplayMember. The display field. This is the filed the combox will display.
                //p_ValueMember. The value member property. This stored the ID field we passed in.
                //Combo. The name of the combo box. This function fills the data in to this combo box
                //This function will only display one field value in the combbox
                //DatabaseConnect();
                //SqlDataAdapter dataadapter = new SqlDataAdapter("SELECT " + p_displaymember + "," + p_valuemember + " FROM " + p_tablename + " ORDER BY " + p_displaymember, REG_CONN);

                OdbcDataAdapter dataadapter = new OdbcDataAdapter("SELECT " + p_displaymember + "," + p_valuemember + " FROM " + p_tablename + " ORDER BY " + p_valuemember, REG_CONN);
                DataSet dataset = new DataSet();
                dataadapter.Fill(dataset, p_tablename);
                Combo.DataSource = dataset;
                Combo.DataTextField = p_displaymember;
                Combo.DataValueField = p_valuemember;
                Combo.DataBind();
            }
            catch (Exception exp)
            {

            }
            finally
            {
                
            }
        }
        public  OdbcDataReader gDataReader(string tablename, string fields, string Where)
        {
            try
            {
                DatabaseConnect();
                //This fuction used to return the datareader object to the client form.
                //Parameter:
                //tablename: This is the table name used for command object
                //fields: This is the field name used for command object
                //return: DataReader object
                //->Start

                OdbcCommand odbcCommand = new OdbcCommand("SELECT " + fields + " FROM " + tablename + " WHERE " + Where, REG_CONN);
                OdbcDataReader datareader = null;
                datareader = odbcCommand.ExecuteReader();
                return datareader;
            }
            catch (Exception exp)
            {
                return null;
            }
            finally
            {
                
            }
            //->End
        }
        public  int InsertRecordStatement(string tablename)
        {
            try
            {
                DatabaseConnect();
                //Return generated insert statement                
                string strSQLStatement = PrepareInsertSQLStatement(tablename);
                //Accesing the stored procedure from the database.
                //SP Name: InsertStatement.
                //Parmeter: 
                //TableName
                //SQL Statement
                //Return Value from the stored procedure.
                //(?,?,?): accepting three parameter: 2 Input and 1 output parameter.
                OdbcCommand p_Command = new OdbcCommand("{ call InsertRecord (?, ?,?)}", REG_CONN,objTrans);
                p_Command.CommandType = CommandType.StoredProcedure;
                OdbcParameter prm = p_Command.Parameters.Add("@tablename", OdbcType.VarChar);
                prm.Direction = ParameterDirection.Input;
                prm.Value = tablename;
                OdbcParameter prm1 = p_Command.Parameters.Add("@statement", OdbcType.VarChar);
                prm1.Direction = ParameterDirection.Input;
                prm1.Value = strSQLStatement;

                //Specify the Return Parameter
                OdbcParameter prm2 = p_Command.Parameters.Add("@ReturnValue", OdbcType.Int);
                prm2.Direction = ParameterDirection.ReturnValue;

                p_Command.ExecuteNonQuery();
                //return the value to the stored procedure.

                if (p_Command.Parameters[2].Value.ToString() != "")
                {
                    return (int)p_Command.Parameters[2].Value;
                }
                else
                    return 0;

            }
            catch (OdbcException odbcexp)
            {
                return 0;
            }
            finally
            {
                
            }
        }
        public  void Add(string p_fieldName, string p_fieldValue, string p_dataType)
        {
            try
            {
                //This function used to store the field name and the value for the table.
                //parameter:
                //p_fieldName: Database table field Name
                //p_fieldValue: field value
                //p_dataType: field data type
                //Return value: none
                p_fieldValue = p_fieldValue.Replace("'", "''");
                if (p_dataType == "I")
                {
                    //If value type is Integer, then donot use the quots
                    FieldValue.Add(p_fieldName, p_fieldValue);
                }
                if (p_dataType == "S" || p_dataType == "D")
                {
                    //If value type is string or dare, then use the quots
                    FieldValue.Add(p_fieldName, "'" + p_fieldValue + "'");
                }
            }
            catch (Exception exp)
            {

            }
            finally
            { 
            
            }
        }
        private  string PrepareInsertSQLStatement(string tablename)
        {
            try
            {
                //This function allows you to Prepare an SQL Statement from the collection.
                //Parameter:
                //tablename
                //Return value: Insert Statement String
                string FieldNames = "INSERT INTO " + tablename + " (", FieldValues = "(";
                for (int i = 0; i <= FieldValue.Count - 1; i++)
                {
                    FieldNames += FieldValue.GetKey(i).ToString() + ",";
                    FieldValues += (FieldValue.GetValues(FieldValue.Keys[i])[0]).ToString() + ",";
                }
                FieldNames = FieldNames.Remove(FieldNames.Length - 1);
                FieldNames += ") VALUES";
                FieldValues = FieldValues.Remove(FieldValues.Length - 1);
                FieldValues += ")";

                FieldValue.Clear();

                return FieldNames + FieldValues;
            }
            catch (Exception exp)
            {
                return "";
            }
            finally
            { 
            
            }

        }
        public  int UpdateRecordStatement(string tablename, string p_keyField, string p_KeyValue)
        {
            try
            {
                DatabaseConnect();


                string strSQLStatement = PrepareUpdateSQLStatement(tablename, p_keyField, p_KeyValue);

                //Accesing the stored procedure from the database.
                //SP Name: InsertStatement.
                //Parmeter: 
                //TableName
                //SQL Statement
                //Return Value from the stored procedure.
                //(?,?,?): accepting three parameter: 2 Input and 1 output parameter.
                OdbcCommand p_Command = new OdbcCommand("{ call UpdateRecord (?, ?,?)}", REG_CONN,objTrans);
                p_Command.CommandType = CommandType.StoredProcedure;
                OdbcParameter prm = p_Command.Parameters.Add("@tablename", OdbcType.VarChar);
                prm.Direction = ParameterDirection.Input;
                prm.Value = tablename;
                OdbcParameter prm1 = p_Command.Parameters.Add("@statement", OdbcType.VarChar);
                prm1.Direction = ParameterDirection.Input;
                prm1.Value = strSQLStatement;

                //Specify the Return Parameter
                OdbcParameter prm2 = p_Command.Parameters.Add("@ReturnValue", OdbcType.Int);
                prm2.Direction = ParameterDirection.ReturnValue;

                p_Command.ExecuteNonQuery();
                //return the value to the stored procedure.

                return (int)p_Command.Parameters[2].Value;
            }
            catch (Exception exp)
            {
                return -1;
            }
            finally
            { 
            
            }


        }
        public  string PrepareUpdateSQLStatement(string tablename, string p_keyField, string p_KeyValue)
        {
            try
            {
                //This function allows you to Prepare an SQL Statement from the collection.
                //Parameter:
                //tablename
                //Return value: Update Statement String
                string FieldNames = "UPDATE " + tablename + " SET ", FieldValues = "";
                //Generating the update statement by looping through the collection
                for (int i = 0; i <= FieldValue.Count - 1; i++)
                {
                    FieldValues += FieldValue.GetKey(i).ToString() + "=" + (FieldValue.GetValues(FieldValue.Keys[i])[0]).ToString() + ",";
                }
                FieldValues = FieldValues.Remove(FieldValues.Length - 1);
                FieldValues += " WHERE " + p_keyField + "=" + p_KeyValue;

                FieldValue.Clear();
                //return the final statement.
                return FieldNames + FieldValues;
            }
            catch (Exception exp)
            {
                return "";
            }
            finally
            { 
            
            
            }
        }
        public  void AddComboItemX(string p_tablename, string p_LangName1, string p_LangName2, string p_orderby, System.Web.UI.WebControls.DropDownList combo)
        {
            try
            {
                DatabaseConnect();
 
                DataTable list = new DataTable();
                OdbcDataReader reader = null;
                int intRow = 0;
                int intCol = 0;
                list.Columns.Add(new DataColumn("Name", typeof(string)));
                list.Columns.Add(new DataColumn("Id", typeof(int)));

                reader = gDataReader(p_tablename, "Id," + p_LangName1 + "," + p_LangName2, " ID >0");
                while (reader.Read())
                {
                    list.Rows.Add(list.NewRow());
                    list.Rows[intRow][0] = reader[p_LangName1].ToString().Trim() + " - " + reader[p_LangName2].ToString().Trim();
                    list.Rows[intRow][intCol + 1] = reader["Id"];
                    intRow += 1;
                }

                combo.DataSource = list;
                combo.DataTextField = "Name";
                combo.DataValueField = "Id";
            }
            catch (Exception exp)
            {

            }
            finally
            {
                
            }
        }
        public  void gClearTable(string strTableName)
        {
            try
            {
                DatabaseConnect();

                strSql = "DELETE FROM " + strTableName;
                OdbcCommand objCommand = new OdbcCommand(strSql, REG_CONN);
                objCommand.CommandType = CommandType.Text;
                objCommand.ExecuteNonQuery();
            }
            catch (OdbcException odbcexp)
            {
                
            }
            finally
            { 
            }
        }
        public  DataSet gDataSet(string p_TableName, string p_FieldName, string p_Where)
        {
            try
            {
                DatabaseConnect();

                OdbcDataAdapter dataadapter = new OdbcDataAdapter("SELECT " + p_FieldName + " FROM " + p_TableName + p_Where, REG_CONN);
                DataSet dataset = new DataSet();
                dataadapter.Fill(dataset, p_TableName);
                return dataset;
            }
            catch (OdbcException odbcexp)
            {
                return null;
            }
            finally
            {
                
            }
        }
        public  DataTable gDataTable(string p_TableName, string p_FieldName, string p_Where)
        {
            try
            {
                DatabaseConnect();

                OdbcDataAdapter dataadapter = new OdbcDataAdapter("SELECT " + p_FieldName + " FROM " + p_TableName + p_Where, REG_CONN);
                DataTable dtTemp = new DataTable();
                dataadapter.Fill(dtTemp);
                return dtTemp;
            }
            catch (OdbcException odbcexp)
            {
                return null;
            }
            finally
            {
                
            }
        }
        public  DataTable gSqlDataTable(string strSql)
        {
            try
            {
                DatabaseConnect();

                OdbcDataAdapter dataadapter = new OdbcDataAdapter(strSql, REG_CONN);
                DataTable dtTemp = new DataTable();
                dataadapter.Fill(dtTemp);
                return dtTemp;
            }
            catch (OdbcException odbcexp)
            {
                return null;
            }
            finally
            {
                
            }
        }
        public  OdbcDataReader gRetrieveRecord(string p_SQLStatement)
        {//->
            //This function used to return a recordset from the database stored procedure.
            //Paramerer: p_SQLStatement for @selectstatement
            try
            {
                DatabaseConnect();
                //This function returns the recordset from the stored procedure

                OdbcCommand sp_Command = new OdbcCommand("{ call ReturnGeneralRecord(?)}", REG_CONN);
                OdbcParameter prm = sp_Command.Parameters.Add("@selectstatement", OdbcType.VarChar);
                prm.Direction = ParameterDirection.Input;
                prm.Value = p_SQLStatement;

                sp_Command.CommandType = CommandType.StoredProcedure;
                OdbcDataReader sp_Reader = sp_Command.ExecuteReader();
                return sp_Reader;
            }
            catch (Exception exp)
            {
                return null;
            }
            finally
            {
                
            }
        }
        public  OdbcDataReader gRetrieveHistory(string p_student_id, string p_exam_year)
        {
            try
            {
                DatabaseConnect();
                OdbcCommand sp_command = new OdbcCommand("{ call RetrieveHistory(?,?)}", REG_CONN);
                OdbcParameter prm1 = sp_command.Parameters.Add("@student_id", OdbcType.VarChar);
                prm1.Direction = ParameterDirection.Input;
                prm1.Value = p_student_id;

                OdbcParameter prm2 = sp_command.Parameters.Add("@p_exam_year", OdbcType.VarChar);
                prm2.Direction = ParameterDirection.Input;
                prm2.Value = p_exam_year;

                sp_command.CommandType = CommandType.StoredProcedure;
                OdbcDataReader sp_Reader = sp_command.ExecuteReader();

                return sp_Reader;

            }
            catch (OdbcException exp)
            {
                return null;
            }
            finally 
            {
                    
            }
        }
        public  void gDeleteRecord(string p_SQLStatement)
        {
            try
            {
                DatabaseConnect();
                //This function returns the recordset from the stored procedure                
                OdbcCommand sp_Command = new OdbcCommand("{ call execsql(?)}", REG_CONN);
                OdbcParameter prm = sp_Command.Parameters.Add("@sql", OdbcType.VarChar);
                prm.Direction = ParameterDirection.Input;
                prm.Value = p_SQLStatement;

                sp_Command.CommandType = CommandType.StoredProcedure;
                OdbcDataReader sp_Reader = sp_Command.ExecuteReader();
                sp_Reader.Close();

            }
            catch (OdbcException exp)
            {
            }
            finally
            {
                
            }
        }
        public  DataSet gDataSetGridView(string strSQL, string p_TableName)
        {
            try
            {
                DatabaseConnect();
                OdbcDataAdapter dataadapter = new OdbcDataAdapter(strSQL, REG_CONN);
                DataSet dataset = new DataSet();
                dataadapter.Fill(dataset, p_TableName);
                return dataset;
            }
            catch (OdbcException odbcexp)
            {
                return null;
            }
            finally
            {
                
            }
        }
        public  void gFillDropDownList(string strSql,System.Web.UI.WebControls.DropDownList ddlList)
        {

            //=====================================================//
            /// <summary>
            /// Description: It Will fill the Drop Down List for ASP.NET with the required Query..
            /// Author: hussaint
            /// Date :6/20/2009 12:42:46 PM
            /// Parameter:
            /// input:
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                ddlList.Items.Clear();

                drData = gRetrieveRecord(strSql);

                while (drData.Read())
                {
                    objListItem = new System.Web.UI.WebControls.ListItem(drData[1].ToString(), drData[0].ToString());
                    ddlList.Items.Add(objListItem);
                }

                drData.Close();

            }
            catch (Exception mFillDropDownList_Exp)
            {
                if (drData != null) drData.Close();
            }
            finally
            {
                if (drData != null) drData.Close();
            }
        }
        //====================EMAIL communication======================
        public  void SendMail(string FROM, string TO, string SUBJECT, string BODY)
        {
            //================FROM and TO==================//
            MailMessage mail = new MailMessage();
            mail.To = TO;
            mail.From = FROM;
            mail.Subject = SUBJECT;
            mail.Body = "<div dir='rtl'>" + BODY +"</div>";
            mail.Body = BODY;
            mail.BodyFormat = MailFormat.Html;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            //MailAttachment objAttachment = new MailAttachment(HttpContext.Current.Server.MapPath("images//contents.JPG"));                                  
            //mail.Attachments.Add(objAttachment);                      
            

            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "med/wtest");
            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "test123");
            
            //=============SMTP Server==================/
            SmtpMail.SmtpServer = "mail1.ksuhs.edu.sa";
            //==========================================/
            //====Sending email to the email address====/
            try
            {
                SmtpMail.Send(mail);
            }
            catch (Exception exp)
            {

            }
        }

        public string Encrypt(string strData)
        {
            try
            {
                byte[] hash = Hashing.GetHashKey("TayyabHussain@yahoo.com");
                return Hashing.Encrypt(hash, strData);
            }
            catch (Exception exp)
            {                
                return "-1";
            }
            finally
            {

            }
        }
        public string Decrypt(string strData)
        {
            try
            {
                byte[] hash = Hashing.GetHashKey("TayyabHussain@yahoo.com");
                return Hashing.Decrypt(hash, strData);
            }
            catch (Exception exp)
            {                
                return "-1";

            }
            finally
            {

            }
        }
        public bool gCheckRecordExistence(string strTableName, string strColName, string strColValue,string strColType)
        {

            //=====================================================//
            /// <summary>
            /// Description: this will check that if particular record exists already in the System.
            /// Author: hussaint
            /// Date :6/28/2009 3:50:22 PM
            /// Parameter:
            /// input: strTableName is the Name of the Table, strColName is the name of the Column in Table and strColValue is the Value of Column
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                DatabaseConnect();
                //This function returns the recordset from the stored procedure

                if (strColType == "S")
                {
                    this.strSql = "SELECT * FROM " + strTableName + " WHERE " + strColName + "='" + strColValue + "'";
                }
                else if(strColType == "I")
                {
                    this.strSql = "SELECT * FROM " + strTableName + " WHERE " + strColName + "=" + strColValue + "";
                }

                OdbcCommand sp_Command = new OdbcCommand("{ call ReturnGeneralRecord(?)}", REG_CONN);
                OdbcParameter prm = sp_Command.Parameters.Add("@selectstatement", OdbcType.VarChar);
                prm.Direction = ParameterDirection.Input;
                prm.Value = this.strSql;

                sp_Command.CommandType = CommandType.StoredProcedure;
                OdbcDataReader sp_Reader = sp_Command.ExecuteReader();

                if (sp_Reader.HasRows)
                {
                    sp_Reader.Close();
                    return true;
                }
                else
                {
                    sp_Reader.Close();
                    return false;
                }

                

            }
            catch (Exception gCheckRecordExistence_Exp)
            {
                return true;
            }
            finally
            { 
                
            }
        }
        public string BulkInsert(string p_sql)
        {
            try
            {

                DatabaseConnect();

                OdbcCommand p_Command = new OdbcCommand("{ call BulkInsert (?, ?)}", REG_CONN);
                p_Command.CommandType = CommandType.StoredProcedure;
                OdbcParameter prm = p_Command.Parameters.Add("@Statement", OdbcType.VarChar);
                prm.Value = p_sql;

                OdbcParameter prm2 = p_Command.Parameters.Add("@ReturnValue", OdbcType.Int);
                prm2.Direction = ParameterDirection.ReturnValue;

                p_Command.ExecuteNonQuery();
                //return the value to the stored procedure.
                if (p_Command.Parameters[1].Value.ToString() != "")
                    return p_Command.Parameters[1].Value.ToString();
                else
                {
                    return "";
                }
            }
            catch (Exception exp)
            {
                return "";
                this.DataBaseClose();
            }
            finally
            {
                this.DataBaseClose();
            }

        }
        public void gAddLog(string strModuleName, string strMethodName, string strErrorString)
        {

            //=====================================================//
            /// <summary>
            /// Description: This will Add the Error Log in the Log Files
            /// Author: hussaint
            /// Date :7/7/2009 3:17:02 PM
            /// Parameter:
            /// input:
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            //System.IO.StreamWriter objFile=null;
            //string strFilePath="";

            //if(!System.IO.Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "Logs"))
            //{
            // System.IO.Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "Logs");
            //}

            //strFilePath = AppDomain.CurrentDomain.BaseDirectory + "Logs\\"+ DateTime.Now.Date.ToShortDateString().Replace('/','-') + ".txt";
            try
            {


                // if (!System.IO.File.Exists( strFilePath))
                // {
                // objFile = new StreamWriter(strFilePath);
                // objFile.WriteLine("Module =" + strModuleName);
                // objFile.WriteLine("Method =" + strMethodName);
                // objFile.WriteLine("Error =" + strErrorString);
                // objFile.WriteLine("------------------------------------------------------------------");
                // objFile.Flush();
                // objFile.Close();
                // }
                // else
                // {
                // objFile = System.IO.File.AppendText(strFilePath);
                // objFile.WriteLine("Module =" + strModuleName);
                // objFile.WriteLine("Method =" + strMethodName);
                // objFile.WriteLine("Error =" + strErrorString);
                // objFile.WriteLine("------------------------------------------------------------------");
                // objFile.Flush();
                // objFile.Close();
                // }
                this.Add("module_name", strModuleName, "S");
                this.Add("procedure_name", strMethodName, "S");
                this.Add("error", strErrorString, "S");

                intResult = this.InsertRecordStatement("error_logs");

                

            }


            catch (Exception mAddLog_Exp)
            {
                //if (objFile != null)
                //{
                // objFile.Dispose();
                // objFile = null;
                //}

            }
            finally
            {
                //objFile.Dispose();
                //objFile = null;

            }
        }


    }

    public class User
    {
        public string strUserId;
        public string strColleges;
        public string strRole = "";
        private bool blnResult = false;
        protected Program objProgram = new Program();

        public User()
        {

            //=====================================================//
            /// <summary>
            /// Description: Constructor for the Class
            /// Author: hussaint
            /// Date :6/17/2009 11:25:45 AM
            /// Parameter:
            /// input:
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                strUserId = "";
                strRole = "";

            }
            catch (Exception User_Exp)
            {

            }
            
            
        }
        public bool SignIn(string strUser,string strPassword,string strDomain,string strType)
        {

            //=====================================================//
            /// <summary>
            /// Description: Used for sing in Process by all the users of the system
            /// Author: hussaint
            /// Date :6/17/2009 11:39:17 AM
            /// Parameter:
            /// input: string strUser,string strPassword,string strDomain,string strType
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                blnResult = false;

                if (strType == "A")
                {
                    this.strUserId = "";
                    this.strRole = "";
                    this.strColleges = "";

                    blnResult = ldapConnect(strUser, strPassword, strDomain);
                    //If Ldap authentication is a success then it should authenticate with the Database and should get the
                    //Role of the administrator                    
                    if (blnResult)
                    {

                        this.strUserId = strUser;

                        objProgram.strSql = "SELECT role,college_id FROM authentication WHERE username = '" + strUser + "'";
                        objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                        objProgram.drData.Read();
                        this.strRole = objProgram.drData[0].ToString();
                        this.strColleges = objProgram.drData[1].ToString();
                        objProgram.drData.Close();
                    }
                }
                else if(strType == "S")
                {
                    objProgram.strSql = "SELECT id,college_id FROM student_registration WHERE user_name = '" + strUser + "' AND password = '" + objProgram.Encrypt(strPassword) + "'";
                    objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                    if (objProgram.drData.HasRows)
                    {
                        if (objProgram.drData.Read())
                        {
                            this.strUserId = objProgram.drData[0].ToString();
                            this.strColleges = objProgram.drData[1].ToString();                            
                        }
                    }
                    objProgram.drData.Close();
                }

                return blnResult;
            }
            catch (Exception SignIn_Exp)
            {
                objProgram.gDisposeDataBaseObjects();
                return false;                
            }
            finally
            {
                objProgram.gDisposeDataBaseObjects();
            }


            
        }
        public bool SignInWithoutPass(string strUser, string strPassword, string strDomain, string strType)
        {

            //=====================================================//
            /// <summary>
            /// Description: Used for sing in Process by all the users of the system
            /// Author: hussaint
            /// Date :6/17/2009 11:39:17 AM
            /// Parameter:
            /// input: string strUser,string strPassword,string strDomain,string strType
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                blnResult = false;

                if (strType == "A")
                {
                    this.strUserId = "";
                    this.strRole = "";
                    this.strColleges = "";

                    blnResult = ldapConnect(strUser, strPassword, strDomain);
                    //If Ldap authentication is a success then it should authenticate with the Database and should get the
                    //Role of the administrator                    
                    if (blnResult)
                    {

                        this.strUserId = strUser;

                        objProgram.strSql = "SELECT role,college_id FROM authentication WHERE username = '" + strUser + "'";
                        objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                        objProgram.drData.Read();
                        this.strRole = objProgram.drData[0].ToString();
                        this.strColleges = objProgram.drData[1].ToString();
                        objProgram.drData.Close();
                    }
                }
                else if (strType == "S")
                {
                    objProgram.strSql = "SELECT id,college_id FROM student_registration WHERE local_id = '" + strUser + "' ";
                    objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                    if (objProgram.drData.HasRows)
                    {
                        if (objProgram.drData.Read())
                        {
                            this.strUserId = objProgram.drData[0].ToString();
                            this.strColleges = objProgram.drData[1].ToString();
                        }
                    }
                    objProgram.drData.Close();
                }

                return blnResult;
            }
            catch (Exception SignIn_Exp)
            {
                objProgram.gDisposeDataBaseObjects();
                return false;
            }
            finally
            {
                objProgram.gDisposeDataBaseObjects();
            }



        }
        public bool SignOut(string strType)
        {

            //=====================================================//
            /// <summary>
            /// Description:
            /// Author: hussaint
            /// Date :6/17/2009 11:40:31 AM
            /// Parameter:
            /// input:
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                if (strType.Equals("A"))
                {
                    strUserId = "";
                }
                return true;

            }
            catch (Exception SignOut_Exp)
            {
                return false;
            }            
        }        
        private bool ldapConnect(string username, string password, string strDomain)
        {
            
        //=====================================================//	     
         /// Description: Used for Ldap Authentication
         /// Author: hussaint
        /// Date :6/17/2009 11:41:08 AM
         /// Parameter:
            /// input: string username, string password, string strDomain
         /// output:
         /// Example:
        /// <summary>
        //=====================================================//

            bool authentic = false;
            try
            {
                //DirectoryEntry entry = new DirectoryEntry("LDAP://192.168.101.100", "med\\" + username, password);
                DirectoryEntry entry = null;
                if (strDomain.Equals("M"))
                {
                    entry = new DirectoryEntry("LDAP://10.8.128.101", "med\\" + username, password);
                }
                else if (strDomain.Equals("K"))
                {
                    entry = new DirectoryEntry("LDAP://10.8.128.101:3268", "KSUSH\\" + username, password);
                }

                object nativeObject = entry.NativeObject;
                authentic = true;
                return authentic;
            }
            catch (Exception exp)
            {

            }
            try
            {
                if (authentic == false)
                {
                    DirectoryEntry entry = new DirectoryEntry("LDAP://ksuhs.edu.sa"
                        , "ksuhs\\" + username, password);
                    object nativeObject = entry.NativeObject;
                    authentic = true;

                    return authentic;
                }


                return authentic;
            }
            catch (Exception exp)
            {
                return false;
            }
        }
    }
    public class Administrator : User
    {        

        public Administrator()
        {
            
        }
        public Administrator(string strId, string strAdminRole)
        {
            this.strUserId = strId;
            this.strRole = strAdminRole;
        }

        public void ViewReport()
        { 
        
        }
        public void InviteStudent()
        { 
        
        }



    }
    public class Student : User
    {
        #region 'Varibles to hold the Student Data'

        public string strStudent_Registration_Id = "";
        public string strStudent_Academic_Data_Id = "";
        public string strLocalId = "";
        public string  strFirstNameAr="";
        public string  strFirstNameEn="";
        public string strMiddleNameAr="";
        public string strMiddleNameEn="";
        public string strGrandFatherNameAr = "";
        public string strGrandFatherNameEn = "";
        public string strFamilyNameAr = "";
        public string strFamilyNameEn = "";
        public string strPlaceOfBirth = "";
        public string strMaritalStatus = "";
        public string strNoOfDependents = "";
        public string strDateOfBirth = "";
        public string strAddress="";
        public string strStudentCountry = "";
        public string strStudentCity  ="";
        public string strStudentMobile = "";
        public string strStudentPhone = "";
        public string strEmail  ="";
        public string strRefRelationId = "";
        public string strRefName  = "";
        public string strRefMobile = "";
        public string strRefHomePhone ="";
        public string strRefWorkPhone="";
        public string strSchoolName ="";
        public string strShcoolCountry = "";
        public string strSchoolCity = "";
        public string strGraduationyear = "";
        public string strUserName  = "";
        public string strPassword = "";

        public string strAcademicDegree = "";
        public string strSpeciality = "";
        public string strGraduationCollegeName = "";
        public string strUniversityName = "";
        public string strUniversityCountry = "";
        public string strStudyFrom = "";
        public string strStudyTo = "";
        public string strGPA = "";
        public string strGPAOutof = "";
        #endregion

        public int SaveStudent()
        {

            //=====================================================//
            /// <summary>
            /// Description: Will be used to Save the Student Record and returned the saved student ID
            /// Author: hussaint
            /// Date :6/27/2009 3:26:29 PM
            /// Parameter:
            /// input:
            /// output: returns an interger that is the ID of the student record
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
              
                
                int intResult = 0;

                objProgram.Add("local_id", this.strLocalId, "I");

                objProgram.Add("college_id", "1", "I");
                objProgram.Add("first_name", this.strFirstNameEn, "S");
                objProgram.Add("first_name_ar", this.strFirstNameAr, "S");
                objProgram.Add("father_name", this.strMiddleNameEn, "S");
                objProgram.Add("father_name_ar", this.strMiddleNameAr, "S");

                objProgram.Add("last_name", this.strFamilyNameEn, "S");
                objProgram.Add("last_name_ar", this.strFamilyNameAr, "S");

                objProgram.Add("grand_father", this.strGrandFatherNameEn, "S");
                objProgram.Add("grand_father_ar", this.strGrandFatherNameAr , "S");

                objProgram.Add("date_of_birth", this.strDateOfBirth, "S");
                objProgram.Add("place_of_birth", this.strPlaceOfBirth, "S");               

                objProgram.Add("address", this.strAddress, "S");

                if (this.strStudentCity != "")
                {
                    objProgram.Add("city", this.strStudentCity, "I");
                }

                objProgram.Add("country", this.strStudentCountry, "I");
                objProgram.Add("mobile", this.strStudentMobile, "S");
                objProgram.Add("email_address", this.strEmail, "S");

                objProgram.Add("home_phone", this.strStudentPhone, "S");
                objProgram.Add("ref_name", this.strRefName, "S");
                objProgram.Add("relationship_id", this.strRefRelationId, "I");
                objProgram.Add("ref_mobile", this.strRefMobile, "S");

                objProgram.Add("ref_home_phone", this.strRefHomePhone, "S");
                objProgram.Add("ref_work_phone", this.strRefWorkPhone, "S");
                objProgram.Add("user_name", this.strUserName, "S");
                
                ////If Student has Academic Data Id associated with it.. This means that he is in Update Mode
                ////And in Update mode we are not gonna update the Password
                //if (this.strStudent_Registration_Id.Equals(""))
                //{
                    objProgram.Add("password", this.strPassword, "S");
                //}
                    

                objProgram.DatabaseConnect();                 
                objProgram.objTrans =  objProgram.REG_CONN.BeginTransaction();

                if (this.strStudent_Registration_Id.Equals(""))
                {
                    intResult = objProgram.InsertRecordStatement("student_registration");

                    if (intResult <= 0)
                    {
                        throw new Exception("Error Occured During Student Information Save");
                    }
                }
                else
                {
                    intResult = objProgram.UpdateRecordStatement("student_registration", "id", this.strStudent_Registration_Id);

                    if (intResult == 0)
                    {
                        throw new Exception("Error Occured During Student Information Update");
                    }
                }


                //If This is the Update mode.. then no need to put the Student_id.. coz we are not gonna change this..
                if (this.strStudent_Registration_Id.Equals(""))
                {
                    objProgram.Add("student_id", intResult.ToString(), "I");
                }

                objProgram.Add("university_name", this.strUniversityName, "S");
                objProgram.Add("country", this.strUniversityCountry, "I");
                objProgram.Add("academic_degree", this.strAcademicDegree, "S");
                objProgram.Add("speciality", this.strSpeciality, "S");
                objProgram.Add("college_name", this.strGraduationCollegeName, "S");
                objProgram.Add("study_from", this.strStudyFrom, "S");
                objProgram.Add("study_to", this.strStudyTo, "S");
                objProgram.Add("gpa", this.strGPA, "S");
                objProgram.Add("gpa_outof", this.strGPAOutof, "S");

                if (this.strStudent_Registration_Id.Equals(""))
                {
                    if (objProgram.InsertRecordStatement("student_academic_data") <= 0)
                    {
                        throw new Exception("Error Occured During Student Marks Save");
                    }
                }
                else
                {
                    if (objProgram.UpdateRecordStatement("student_academic_data", "student_id", this.strStudent_Registration_Id) == 0)
                    {
                        throw new Exception("Error Occured During Student Marks Update");
                    }
                }

                objProgram.objTrans.Commit();

                return intResult;

            }
            catch (Exception SaveStudent_Exp)
            {
                objProgram.objTrans.Rollback();                
                return -1;
            }
            finally
            { 
            
            }
        }
        public Student GetStudentByID(string strStudentID)
        {

            //=====================================================//
            /// <summary>
            /// Description: This Method would return the Student object for a particular ID
            /// Author: hussaint
            /// Date :6/28/2009 11:27:00 AM
            /// Parameter:
            /// input: Student ID To Retrieve the Student
            /// output:
            /// Example:
            /// <summary>
            //=====================================================//
            try
            {
                Student objResult = new Student();
                string strSchoolGrade="";

                objProgram.strSql = "SELECT A.*,B.*,C.*,D.id,D.college_name,E.* FROM student_registration A INNER JOIN country_preset B ON A.country = B.id LEFT OUTER JOIN city_preset C ON ";
                objProgram.strSql += "A.city = C.id INNER JOIN college_preset D ON A.college_id = D.id INNER JOIN relationship_preset E ON A.relationship_id = E.id WHERE A.id =" + strStudentID;

                objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                if (objProgram.drData.Read())
                {
                    objResult.strUserId = strStudentID; 
                    objResult.strLocalId = objProgram.drData["local_id"].ToString();
                    objResult.strFirstNameEn = objProgram.drData["first_name"].ToString();
                    objResult.strFirstNameAr = objProgram.drData["first_name_ar"].ToString();
                    objResult.strMiddleNameEn = objProgram.drData["father_name"].ToString();
                    objResult.strMiddleNameAr = objProgram.drData["father_name_ar"].ToString();
                    objResult.strMiddleNameAr = objProgram.drData["father_name_ar"].ToString();
                    objResult.strFamilyNameEn = objProgram.drData["last_name"].ToString();
                    objResult.strFamilyNameAr = objProgram.drData["last_name_ar"].ToString();
                    objResult.strGrandFatherNameEn = objProgram.drData["grand_father"].ToString();
                    objResult.strGrandFatherNameAr = objProgram.drData["grand_father_ar"].ToString();
                    objResult.strDateOfBirth = objProgram.drData["date_of_birth"].ToString();
                    objResult.strPlaceOfBirth = objProgram.drData["place_of_birth"].ToString();
                    objResult.strAddress = objProgram.drData["address"].ToString();
                    objResult.strStudentCity = objProgram.drData["city_name"].ToString();
                    objResult.strStudentCountry = objProgram.drData["country_name"].ToString();
                    objResult.strStudentMobile = objProgram.drData["mobile"].ToString();
                    objResult.strStudentPhone = objProgram.drData["home_phone"].ToString();
                    objResult.strEmail = objProgram.drData["email_address"].ToString();
                    objResult.strRefName = objProgram.drData["ref_name"].ToString();
                    objResult.strRefRelationId = objProgram.drData["relation_name"].ToString();
                    objResult.strRefMobile = objProgram.drData["ref_mobile"].ToString();
                    objResult.strRefHomePhone = objProgram.drData["ref_home_phone"].ToString();
                    objResult.strRefWorkPhone = objProgram.drData["ref_work_phone"].ToString();
                    objResult.strUserName = objProgram.drData["user_name"].ToString();                                        
                    objResult.strPassword = objProgram.Decrypt(objProgram.drData["password"].ToString());
                    
                }

                objProgram.drData.Close();


                //objProgram.strSql = "SELECT A.id As 'Record_id',* FROM  student_academic_data A INNER JOIN country_preset B ON A.country = B.id LEFT OUTER JOIN city_preset C ";
                //objProgram.strSql += "ON A.city = C.id WHERE student_id = " + strStudentID;

                objProgram.strSql = "SELECT D.local_id,A.id As 'Record_id',A.*,B.*,D.* FROM  student_academic_data A INNER JOIN country_preset B ON A.country = B.id INNER JOIN student_registration D ON A.student_id = D.id WHERE D.id ="+strStudentID ;


                objProgram.drData = objProgram.gRetrieveRecord(objProgram.strSql);
                if (objProgram.drData.Read())
                {

                    //if (objProgram.drData["third_year"].ToString().Equals(""))
                    //{
                    //    strSchoolGrade = "0";
                    //}
                    //else
                    //{
                    //    strSchoolGrade = objProgram.drData["sec_year"].ToString() == "0" ? objProgram.drData["third_year"].ToString() : Convert.ToString((double.Parse(objProgram.drData["sec_year"].ToString()) + double.Parse(objProgram.drData["third_year"].ToString())) / 2);
                    //}

                    objResult.strStudent_Academic_Data_Id = objProgram.drData["Record_id"].ToString();
                    
                    objResult.strAcademicDegree = objProgram.drData["academic_degree"].ToString();
                    objResult.strSpeciality = objProgram.drData["speciality"].ToString();
                    objResult.strUniversityName = objProgram.drData["university_name"].ToString();
                    objResult.strUniversityCountry = objProgram.drData["country"].ToString();
                    objResult.strStudyFrom = objProgram.drData["study_from"].ToString();
                    objResult.strStudyTo = objProgram.drData["study_to"].ToString();
                    objResult.strGPA = objProgram.drData["gpa"].ToString();
                    objResult.strGPAOutof = objProgram.drData["gpa_outof"].ToString();
                    objResult.strGraduationCollegeName = objProgram.drData["college_name"].ToString();
                    

                    
                }

                objProgram.drData.Close();

                return objResult;

            }
            catch (Exception GetStudentByID_Exp)
            {
                return null;
            }
            finally
            { 
            
            }
            
        }
            
    }

    internal static class Hashing
    {

        internal static byte[] GetHashKey(string hashKey)
        {
            // Initialise
            UTF8Encoding encoder = new UTF8Encoding();

            // Get the salt
            string salt = "I am a nice little salt";
            byte[] saltBytes = encoder.GetBytes(salt);

            // Setup the hasher
            Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(hashKey, saltBytes);

            // Return the key
            return rfc.GetBytes(16);
        }

        internal static string Encrypt(byte[] key, string dataToEncrypt)
        {
            // Initialise
            AesManaged encryptor = new AesManaged();

            // Set the key
            encryptor.Key = key;
            encryptor.IV = key;

            // create a memory stream
            using (MemoryStream encryptionStream = new MemoryStream())
            {
                // Create the crypto stream
                using (CryptoStream encrypt = new CryptoStream(encryptionStream, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    // Encrypt
                    byte[] utfD1 = UTF8Encoding.UTF8.GetBytes(dataToEncrypt);
                    encrypt.Write(utfD1, 0, utfD1.Length);
                    encrypt.FlushFinalBlock();
                    encrypt.Close();

                    // Return the encrypted data
                    return Convert.ToBase64String(encryptionStream.ToArray());
                }
            }
        }

        internal static string Decrypt(byte[] key, string encryptedString)
        {
            // Initialise
            AesManaged decryptor = new AesManaged();
            byte[] encryptedData = Convert.FromBase64String(encryptedString);

            // Set the key
            decryptor.Key = key;
            decryptor.IV = key;

            // create a memory stream
            using (MemoryStream decryptionStream = new MemoryStream())
            {
                // Create the crypto stream
                using (CryptoStream decrypt = new CryptoStream(decryptionStream, decryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    // Encrypt
                    decrypt.Write(encryptedData, 0, encryptedData.Length);
                    decrypt.Flush();
                    decrypt.Close();

                    // Return the unencrypted data
                    byte[] decryptedData = decryptionStream.ToArray();
                    return UTF8Encoding.UTF8.GetString(decryptedData, 0, decryptedData.Length);
                }
            }
        }
    }
}