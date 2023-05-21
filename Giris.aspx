<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="KerimÖdev.kullaniciislemleri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <title></title>
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
	

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrap">
			<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
			<asp:TextBox ID="txtKullaniciAdi" runat="server" placeholder="Kullanici adi"></asp:TextBox>
		<div class="bar">
		
	<i></i>
		</div>
		<asp:TextBox ID="txtSifre" runat="server" placeholder="Sifre"></asp:TextBox>
		<a href="http://www.istiklalsoft.com" class="forgot_link">Unuttum?</a>
            <asp:Button ID="btnGiris" runat="server" Text="Giriş" OnClick="btnGiris_Click1" />
	
	</div>

  <script src="js/index.js"></script>
    </form>

</body>
</html>
