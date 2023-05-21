<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="KerimÖdev.sepet" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Kerim Çokurpınar</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

 
    <link href="img/favicon.ico" rel="icon">

  
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  


    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


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

    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
           
            </div>
        </div>
    </div>

  <%--  <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Ürün Adı</th>
                            <th>Fiyatı</th>
                            <th>Adet</th>
                            <th>Toplam Fiyat</th>
                            <th>Sepetten Kaldır</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td class="align-middle"><img src="img/product-2.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td class="align-middle"><img src="img/product-3.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td class="align-middle"><img src="img/product-4.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                        <tr>
                            <td class="align-middle"><img src="img/product-5.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <form class="mb-30" action="">
                   
                </form>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Toplam Tutar</span></h5>
                <div class="bg-light p-30 mb-5">
                
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Toplam Fiyat</h5>
                            <h5>$160</h5>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Alışverişi Tamamla</button>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
 <div class="container-fluid">
  <div class="row px-xl-5">
    <div class="col-lg-8 table-responsive mb-5">
      <table class="table table-light table-borderless table-hover text-center mb-0">
        <thead class="thead-dark">
          <tr>
            <th>Ürün Adı</th>
            <th>Fiyatı</th>
            <th>Adet</th>
            <th>Toplam Fiyat</th>
            <th>Sepetten Kaldır</th>
          </tr>
        </thead>
        <tbody class="align-middle">
          <%  
          // Sepet verilerini veritabanından al
          using (SqlConnection conn = new SqlConnection(connectionString))
          {
            string kullaniciId = "string kullaniciAdi = HttpContext.Current.User.Identity.Name;"; 

            SqlCommand cmd = new SqlCommand("SELECT * FROM Sepet WHERE KullaniciID = @kullaniciId", conn);
            cmd.Parameters.AddWithValue("@kullaniciId", kullaniciId);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
              %>
              <tr>
                <td class="align-middle">
                  <img src="<%= reader["urun_resim"] %>" alt="" style="width: 50px;"> <%= reader["urun_adi"] %>
                </td>
                <td class="align-middle"><%= reader["urun_fiyati"] %></td>
                <td class="align-middle">
                  <div class="input-group quantity mx-auto" style="width: 100px;">
                    <div class="input-group-btn">
                      <button class="btn btn-sm btn-primary btn-minus">
                        <i class="fa fa-minus"></i>
                      </button>
                    </div>
                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="<%= reader["adet"] %>">
                    <div class="input-group-btn">
                      <button class="btn btn-sm btn-primary btn-plus">
                        <i class="fa fa-plus"></i>
                      </button>
                    </div>
                  </div>
                </td>
                <td class="align-middle"><%= reader["toplam_fiyat"] %></td>
                <td class="align-middle">
                  <a href="sepettenkaldir.aspx?sepet_id=<%= reader["sepet_id"] %>" class="btn btn-sm btn-danger">
                    <i class="fa fa-times"></i>
                  </a>
                </td>
              </tr>
              <%  
            }
            reader.Close();
          }
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>


    

    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>



    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

  
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>


    <script src="js/main.js"></script>
            </form>
</body>

</html>
  
