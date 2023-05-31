using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    usuarioTableAdapter usuarioTableAdapter = new usuarioTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
    }

    protected void IniciarSesion_Click(object sender, EventArgs e)
    {
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxContrasenia.Text;

        if(!string.IsNullOrEmpty(usuario) &&
            !string.IsNullOrEmpty(contrasenia))
        {
            DataTable tablaUsuario = usuarioTableAdapter.GetDataUsuario(usuario, contrasenia);
            if(tablaUsuario.Rows.Count == 1)
            {
                Session.Add("usuario", usuario);
                Response.Redirect("ingreso_conductor.aspx");
            }
            else
            {
                toastifyError("Error: usuario o contraseña incorrecto");
            }
        }
        else
        {
            toastifyError("Error: ingrese usuario y contraseña");
        }
    }

    protected void toastifyError(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "ToastifyMensaje",
                "<script>" +
                "Toastify({ " +
                "text: '" + mensaje + "'," +
                "backgroundColor: '#e11313'," +
                "close:true, gravity:'top', " +
                "position: 'center', " +
                "duration: 4000 }).showToast();" +
                "</script>"
                );
    }
}