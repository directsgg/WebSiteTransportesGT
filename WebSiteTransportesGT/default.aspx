<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin- Transportes GT</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
    <link rel="stylesheet" href="assets/vendors/toastify/toastify.css">
    <script src="assets/vendors/toastify/toastify.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="auth">
            <div class="row h-100">
                <div class="col-lg-5 col-12">
                    <div id="auth-left">
                        <h1 class="auth-title text-wrap">Transportes GT</h1>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="TextBoxUsuario" CssClass="form-control form-control-xl" runat="server" placeholder="Usuario"/>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="TextBoxContrasenia" CssClass="form-control form-control-xl" TextMode="Password" runat="server" placeholder="Contraseña"/>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <asp:Button ID="IniciarSesion" OnClick="IniciarSesion_Click" CssClass="btn btn-primary btn-block btn-lg shadow-lg mt-5" Text="Iniciar Sesion" runat="server" />
                    </div>
                </div>
                <div class="col-lg-7 d-none d-lg-block">
                    <div id="auth-right">
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
