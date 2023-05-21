<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Kerimcokurpinar.contact" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
      <div class="container-fluid">
       
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="col-lg-4">
                <a href="#" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Kerim</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Çokurpınar</span>
                </a>
            </div>
            <div class="col-lg-4 col-6 text-left">
                
                    <div class="input-group">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ürün Ara"></asp:TextBox>
                       
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <asp:Button ID="Button1" runat="server" Text="Ara" CssClass="Buton" />
                            </span>
                        </div>
                    </div>
                
            </div>
            <div class="col-lg-4 col-6 text-right">
                <p class="m-0">İletişim</p>
                <h5 class="m-0">+90 555 555 55 55</h5>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                    <div class="navbar-nav w-100">
                        <% 
                            using (SqlConnection conn = new SqlConnection(connectionString))
                            {
                                string query = "SELECT kategori_id, kategori_adi FROM Kategoriler";
                                using (SqlCommand cmd = new SqlCommand(query, conn))
                                {
                                    conn.Open();
                                    SqlDataReader reader = cmd.ExecuteReader();
                                    while (reader.Read())
                                    {
                                        string kategoriAdi = reader["kategori_adi"].ToString();
                                        int kategoriId = Convert.ToInt32(reader["kategori_id"]);
                                        Response.Write("<a href='' class='nav-item nav-link'>" + kategoriAdi + "</a>");
                                    }
                                    reader.Close();
                                }
                            }
                        %>
                    </div>
                </nav>

            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <a href="#" class="text-decoration-none d-block d-lg-none">
                        <span class="h1 text-uppercase text-dark bg-light px-2">Kerim</span>
                        <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Çokurpınar</span>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.aspx" class="nav-item nav-link active">Ana Sayfa</a>
                            <a href="urunler.aspx" class="nav-item nav-link">Ürünler</a>
                            <a href="urunekle.aspx" class="nav-item nav-link">Ürün Ekle</a>                       
                            <a href="contact.aspx" class="nav-item nav-link">İletişim</a>
                            <a href="Giris.aspx" class="nav-item nav-link">Kullanıcı İşlemleri</a>
                        </div>
                       
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <span class="breadcrumb-item active">Contact</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Contact Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Contact Us</span></h2>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form bg-light p-30">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                          <div class="control-group">
                            <input type="text" class="form-control" id="name" placeholder="İsim Soyisim" required="required" data-validation-required-message="İsim Soyisim" />
                            <p class="help-block text-danger"></p>
                          </div>
                          <div class="control-group">
                            <input type="email" class="form-control" id="email" placeholder="Mail Adresiniz" required="required" data-validation-required-message="Mail Adresiniz" />
                            <p class="help-block text-danger"></p>
                          </div>
                          <div class="control-group">
                            <input type="text" class="form-control" id="subject" placeholder="Telefon Numarası" required="required" data-validation-required-message="Telefon Numarası" />
                            <p class="help-block text-danger"></p>
                          </div>
                          <div class="control-group">
                            <textarea class="form-control" rows="8" id="message" placeholder="Mesaj" required="required" data-validation-required-message="Mesaj"></textarea>
                            <p class="help-block text-danger"></p>
                          </div>
                          <div>
                            <button class="btn btn-primary py-2 px-4" type="button" id="sendMessageButton">Gönder</button>
                          </div>
                        </form>
                </div>
            </div>
           
        </div>
    </div>
        <script>
              document.getElementById("sendMessageButton").addEventListener("click", function() {
                var name = document.getElementById("name").value;
                var email = document.getElementById("email").value;
                var subject = document.getElementById("subject").value;
                var message = document.getElementById("message").value;
                var messageText = "Girilen Bilgiler:\n\n" +
                                  "İsim Soyisim: " + name + "\n" +
                                  "Mail Adresi: " + email + "\n" +
                                  "Telefon Numarası: " + subject + "\n" +
                                  "Mesaj: " + message;
                alert(messageText);
              });
            form.reset(); // reset form fields
            location.reload();
            const form = document.getElementById("contactForm");
            form.addEventListener("submit", function (event) {
                event.preventDefault(); // prevent form submission
                const name = document.getElementById("name").value;
                const email = document.getElementById("email").value;
                const phone = document.getElementById("subject").value;
                const message = document.getElementById("message").value;
                const info = `İsim Soyisim: ${name}\nMail Adresi: ${email}\nTelefon Numarası: ${phone}\nMesaj: ${message}`;
                alert(info);
                form.reset(); // reset form fields
                location.reload(); // reload the page
            });
        </script>
    <!-- Contact End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
    </form>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
