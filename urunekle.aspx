<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunekle.aspx.cs" Inherits="Kerimcokurpinar.urunekle" %>
<% if (!User.Identity.IsAuthenticated)
   {
       Response.Redirect("~/Giris.aspx");
   }
%>
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





    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Ürün Ekle</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Ürün Adı</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Fiyatı</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Boyutu</label>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Rengi</label>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Fotografı 1</label>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Fotografı  2</label>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Fotografı 3</label>
                             <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>    
                          
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Açıklaması</label>
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Bilgisi</label>
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Ürün Ek Bilgisi</label>
                            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Kategori ID</label>
                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>    
                            
                        </div>
                        <asp:Button ID="btnurunekle" runat="server" Text="Ekle" CssClass="btn btn-block btn-primary font-weight-bold py-3" OnClick="btnurunekle_Click" />
                    </div>
                </div>
              
            </div>
           
        </div>
    </div>
    <!-- Checkout End -->
        <br />
        <br />
        <br />
        <br /> 
        <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Kategori Ekle</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Kategori Adı Adı</label>
                            <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Açıklama</label>
                            <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>                                             
                        <div class="col-md-6 form-group">
                            <label>Kategori Fotografı</label>
                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>                       
                        <asp:Button ID="btnkategoriekle" runat="server" Text="Ekle" CssClass="btn btn-block btn-primary font-weight-bold py-3" OnClick="btnkategoriekle_Click" />
                    </div>
                </div>
               
            </div>
           
        </div>
    </div>
        <br />
        <br />
        <br />
        <br /> 
        <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Slider Ekle</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Slider Adı Adı</label>
                            <asp:TextBox ID="SliderAdi" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Slider Açıklama</label>
                            <asp:TextBox ID="SliderAciklama" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>                                             
                        <div class="col-md-6 form-group">
                            <label>Slider Fotografı</label>
                            <asp:TextBox ID="SliderFotografi" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>    
                        <div class="col-md-6 form-group">
                            <label>Slider Link</label>
                            <asp:TextBox ID="SliderLink" runat="server" CssClass="form-control"></asp:TextBox>    
                        </div>  
                        <asp:Button ID="Button2" runat="server" Text="Ekle" CssClass="btn btn-block btn-primary font-weight-bold py-3" OnClick="Button2_Click" />
                    </div>
                </div>
               
            </div>
           
        </div>
    </div>

  
  



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
