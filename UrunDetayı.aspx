<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UrunDetayı.aspx.cs" Inherits="Kerimcokurpinar.UrunDetayı" %>
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
       <!-- Topbar Start -->
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
                <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                    <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Kategori</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
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




    <!-- Shop Detail Start -->
    
 <%

     int urunId;
     string urun_id = Request.QueryString["urun_id"] ?? "";
     if (!int.TryParse(urun_id, out urunId))
     {
         // urun_id parametresi geçersiz, hata mesajı göster
         Response.Write("Geçersiz ürün ID");
         return;
     }

     using (SqlConnection connection = new SqlConnection(connectionString))
     {
         connection.Open();
         string urun_adi = "", urun_fiyati = "", urun_bilgisi = "", urun_boyutu = "", urun_rengi = "", urun_fotografi1 = "", urun_fotografi2 = "", urun_fotografi3 = "";

         string query = "SELECT urun_adi, urun_fiyati, urun_bilgisi, urun_boyutu, urun_rengi, urun_fotografi1, urun_fotografi2, urun_fotografi3 FROM Urunler WHERE urun_id = @urun_id";
         using (SqlCommand command = new SqlCommand(query, connection))
         {
             command.Parameters.AddWithValue("@urun_id", urunId);

             using (SqlDataReader reader = command.ExecuteReader())
             {
                 if (reader.HasRows)
                 {
                     reader.Read(); // Only read one row
                     urun_adi = reader.GetString(reader.GetOrdinal("urun_adi"));
                     urun_fiyati = reader.GetDecimal(reader.GetOrdinal("urun_fiyati")).ToString();
                     urun_bilgisi = reader.GetString(reader.GetOrdinal("urun_bilgisi"));
                     urun_boyutu = reader.GetString(reader.GetOrdinal("urun_boyutu"));
                     urun_rengi = reader.GetString(reader.GetOrdinal("urun_rengi"));
                     urun_fotografi1 = reader.GetString(reader.GetOrdinal("urun_fotografi1"));
                     urun_fotografi2 = reader.GetString(reader.GetOrdinal("urun_fotografi2"));
                     urun_fotografi3 = reader.GetString(reader.GetOrdinal("urun_fotografi3"));
                 }
             }
         }


%>
       <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                <div class="carousel-item">
                    <img class="w-100 h-100" src="<%= urun_fotografi2 %>" alt="Image">
                </div>
                <div class="carousel-item active">
                    <img class="w-100 h-100" src="<%= urun_fotografi1 %>" alt="Image">
                </div>
                
                <div class="carousel-item">
                    <img class="w-100 h-100" src="<%= urun_fotografi3 %>" alt="Image">
                </div>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                 <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            
               
                
            
               <div class="row">
    
            
    <div class="col-lg-7 h-auto mb-30">
        <div class="h-100 bg-light p-30">
            <h3><%=urun_adi%></h3>
            <h3 class="font-weight-semi-bold mb-4"><%=urun_fiyati%></h3>
            <p class="mb-4"><%=urun_bilgisi%></p>
            <div class="d-flex mb-3">
                <strong class="text-dark mr-3">Boyut</strong>
                
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="size-1" name="size">
                        <label class="custom-control-label" for="size-1"><%=urun_boyutu%></label>
                    </div>
               
            </div>
            <div class="d-flex mb-4">
                <strong class="text-dark mr-3">Colors:</strong>
                
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="color-1" name="color">
                        <label class="custom-control-label" for="color-1"><%=urun_rengi%></label>
                    </div>                  
                
            </div>
        </div>
    </div>      
</div>

            
   
                              
   <% 



    
   

    }
    // buraya kadar olan kod, sayfada gösterim yapmak için veritabanından çekilen ürün bilgilerini kullandı
%>


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
</body>
</html>
