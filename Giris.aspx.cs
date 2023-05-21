using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KerimÖdev
{
    public partial class kullaniciislemleri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      

        protected void btnGiris_Click1(object sender, EventArgs e)
        {
            string kullaniciAdi = txtKullaniciAdi.Text;
            string sifre = txtSifre.Text;

            string connectionString = "Data Source=KERIM\\MSSQLSERVER02;Initial Catalog=kerimcokurpinar;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Kullanicilar WHERE KullaniciAdi = @KullaniciAdi AND Sifre = @Sifre";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                    command.Parameters.AddWithValue("@Sifre", sifre);

                    int result = (int)command.ExecuteScalar();

                    if (result > 0)
                    {
                        // Kullanıcı girişi başarılı
                        FormsAuthentication.RedirectFromLoginPage(kullaniciAdi, false);
                    }
                    else
                    {
                        // Kullanıcı adı veya şifre yanlış
                        lblMessage.Text = "Geçersiz kullanıcı adı veya şifre.";
                    }
                }
            }

            Response.Redirect("urunekle.aspx");
            // Eğer kullanıcı girişi başarılı ise yönlendirme yapılır
            FormsAuthentication.RedirectFromLoginPage(kullaniciAdi, false);

        }
    }
}