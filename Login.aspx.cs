using System;
using System.Collections.Generic;
 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLLV2;
using System.Data;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        DivError.Visible = false;
        lblError.Text = "";
        if (!Page.IsPostBack)
        {

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region Login
        try
        {

            if ((TxtUserName.Text.Trim().Length != 0) && (txtpassword.Text.Trim().Length != 0))
            {
                string ErrorMessage = "";
                DataTable DtUsers = Users_info.Verify_User("1", TxtUserName.Text.Trim(), txtpassword.Text.Trim(), ref ErrorMessage);
                if (ErrorMessage.Length < 1)
                {
                    if (DtUsers.Rows.Count > 0)
                    {
                        Session["UserID"] = Convert.ToString(DtUsers.Rows[0]["UserID"]);
                        Session["UserName"] = Convert.ToString(DtUsers.Rows[0]["UserName"]);
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        DivError.Visible = true;
                        lblError.Text = "Invalid User Name or Password";
                    }
                }
                else
                {
                    DivError.Visible = true;
                    lblError.Text = ErrorMessage;
                }
            }
        }
        catch (Exception exp)
        {
            DivError.Visible = true;
            lblError.Text = exp.Message;
        }

        #endregion
    }

}