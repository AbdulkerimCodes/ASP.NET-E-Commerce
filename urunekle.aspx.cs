using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kerimcokurpinar
{
    public partial class urunekle : System.Web.UI.Page
    {
        public string connectionString = "Data Source=KERIM\\MSSQLSERVER02;Initial Catalog=kerimcokurpinar;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnurunekle_Click(object sender, EventArgs e)
        {
            // Kullanıcının girdiği verileri al
            string urunAdi = TextBox2.Text;
            decimal urunFiyati = decimal.Parse(TextBox3.Text);
            string urunBoyutu = TextBox4.Text;
            string urunRengi = TextBox5.Text;
            string urunFotografi1 = TextBox6.Text;
            string urunFotografi2 = TextBox7.Text;
            string urunFotografi3 = TextBox8.Text;
            string urunAciklamasi = TextBox9.Text;
            string urunBilgisi = TextBox10.Text;
            string urunEkBilgisi = TextBox11.Text;
            int kategori_id = int.Parse(TextBox12.Text);

            string query = "INSERT INTO Urunler(urun_adi, urun_fiyati, urun_boyutu, urun_rengi, urun_fotografi1, urun_fotografi2, urun_fotografi3, urun_aciklamasi, urun_bilgisi, urun_ek_bilgisi, kategori_id) VALUES (@urunAdi, @urunFiyati, @urunBoyutu, @urunRengi, @urunFotografi1, @urunFotografi2, @urunFotografi3, @urunAciklamasi, @urunBilgisi, @urunEkBilgisi, @kategori_id)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Parametreleri ekle
                        command.Parameters.AddWithValue("@urunAdi", urunAdi);
                        command.Parameters.AddWithValue("@urunFiyati", urunFiyati);
                        command.Parameters.AddWithValue("@urunBoyutu", urunBoyutu);
                        command.Parameters.AddWithValue("@urunRengi", urunRengi);
                        command.Parameters.AddWithValue("@urunFotografi1", urunFotografi1);
                        command.Parameters.AddWithValue("@urunFotografi2", urunFotografi2);
                        command.Parameters.AddWithValue("@urunFotografi3", urunFotografi3);
                        command.Parameters.AddWithValue("@urunAciklamasi", urunAciklamasi);
                        command.Parameters.AddWithValue("@urunBilgisi", urunBilgisi);
                        command.Parameters.AddWithValue("@urunEkBilgisi", urunEkBilgisi);
                        command.Parameters.AddWithValue("@kategori_id", kategori_id);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Ürün başarıyla eklendi.');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Eklenirken Bir Hata Oluştu.');", true);

                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Bir hata oluştu: " + ex.Message);
                }
                finally
                {
                    connection.Close();
                }
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                TextBox12.Text = "";

            }




        }

        protected void btnkategoriekle_Click(object sender, EventArgs e)
        {
            // Bağlantıyı aç
            SqlConnection connection = new SqlConnection("Data Source=KERIM\\MSSQLSERVER02;Initial Catalog=kerimcokurpinar;Integrated Security=True;");
            connection.Open();

            // SQL sorgusu
            string query = "INSERT INTO Kategoriler (kategori_adi, kategori_aciklamasi, kategori_img) VALUES (@kategoriAdi, @aciklama, @kategoriFotografi)";

            // Komut nesnesi
            SqlCommand command = new SqlCommand(query, connection);

            // Parametreleri ekle
            command.Parameters.AddWithValue("@kategoriAdi", TextBox13.Text);
            command.Parameters.AddWithValue("@aciklama", TextBox14.Text);
            command.Parameters.AddWithValue("@kategoriFotografi", TextBox17.Text);

            // Sorguyu çalıştır
            command.ExecuteNonQuery();

            // Bağlantıyı kapat
            connection.Close();

            // Mesaj göster
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Kategori başarıyla eklendi.');", true);

            // TextBox'ları temizle
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox17.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // TextBox'ların değerlerini al
            string sliderBaslik = SliderAdi.Text;
            string sliderAciklama = SliderAciklama.Text;
            string sliderResim = SliderFotografi.Text;
            string sliderLink = SliderLink.Text;

            // SQL sorgusu
            string query = "INSERT INTO Slider (slider_baslik, slider_aciklama, slider_resim, slider_link) VALUES (@sliderBaslik, @sliderAciklama, @sliderResim, @slider_link)";

            // Bağlantıyı aç
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Sorguyu yürüt
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@sliderBaslik", sliderBaslik);
                    command.Parameters.AddWithValue("@sliderAciklama", sliderAciklama);
                    command.Parameters.AddWithValue("@sliderResim", sliderResim);
                    command.Parameters.AddWithValue("@slider_link", sliderLink);

                    command.ExecuteNonQuery();
                }
            }

            // TextBox'ları temizle
            SliderAdi.Text = "";
            SliderAciklama.Text = "";
            SliderFotografi.Text = "";
            SliderLink.Text = "";

            // Kullanıcıya mesaj göster
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Slider başarıyla eklendi.');", true);

        }
    }
}