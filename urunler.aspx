<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="Kerimcokurpinar.urunler" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                        <input id="searchText" type="text" class="form-control" placeholder="Ürün Ara">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button" onclick="searchProducts()">Ara</button>
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
    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-8">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                      
                    </div>
                    <div class="container-fluid pt-5">

                    <div class="row px-xl-5 pb-3">
                        <div class="container-fluid pt-5 pb-3">
                            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Ürünler</span></h2>
                            <div class="row px-xl-5">
                                <%  
                                    using (SqlConnection conn = new SqlConnection(connectionString))
                                    {
                                        SqlCommand cmd = new SqlCommand("SELECT * FROM Urunler", conn);
                                        conn.Open();
                                        SqlDataReader reader = cmd.ExecuteReader();
                                        while (reader.Read())
                                        {
                                %>
                                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">  
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <a href="UrunDetayı.aspx?urun_id=<%= reader["urun_id"] %>">
                                                    <img class="img-fluid w-100" src="<%= reader["urun_fotografi1"] %>" alt=""/>
                                                </a>
                                            </div>
                                            <div class="text-center py-4">
                                                <a class="h6 text-decoration-none text-truncate" href="#">
                                                    <%= reader["urun_adi"] %>
                                                </a>
                                                <div class="d-flex align-items-center justify-content-center mt-2">
                                                    <h5><%= reader["urun_fiyati"] %></h5>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center mb-1">
                            
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <%  
                                        }
                                        reader.Close();
                                    }
                                %>            
                            </div>
                        </div>
                  
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->


 


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
        <script>
            function searchProducts() {
                // Aranacak kelimeyi al
                var searchText = document.getElementById("searchText").value;
        
                // Tüm ürünleri seç
                var products = document.querySelectorAll(".product-item");
        
                // Her ürün için döngü yap
                for (var i = 0; i < products.length; i++) {
                    var product = products[i];
            
                    // Ürün adını ve açıklamasını al
                    var productName = product.querySelector("a.text-truncate").textContent;
                    var productDesc = product.querySelector("div.d-flex.align-items-center.justify-content-center.mb-1").textContent;
            
                    // Eğer aranan kelime ürün adı veya açıklamasında geçiyorsa, ürünü göster
                    if (productName.includes(searchText) || productDesc.includes(searchText)) {
                        product.style.display = "block";
                    }
                    else {
                        product.style.display = "none";
                    }
                }
            }
            
           
          
        </script>

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
