using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;
using System.Data;

public partial class ingreso_paquete : System.Web.UI.Page
{
    HistorialConduccionTableAdapter historialConduccionTableAdapter = new HistorialConduccionTableAdapter();
    DestinatarioTableAdapter destinatarioTableAdapter = new DestinatarioTableAdapter();
    PaqueteTableAdapter paqueteTableAdapter = new PaqueteTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //historial
            GridViewHistorial.DataSource = historialConduccionTableAdapter.GetDataHistorial();
            GridViewHistorial.DataBind();
            //destinatario
            GridViewDestinatario.DataSource = destinatarioTableAdapter.GetDataDestinatario();
            GridViewDestinatario.DataBind();

            CargarTablaPaquete();
        }
    }

    private void CargarTablaPaquete()
    {
        DataTable tabla = paqueteTableAdapter.GetDataPaquete();
        GridViewPaquete.DataSource = tabla;
        GridViewPaquete.DataBind();
    }

    private void Restablecer()
    {
        GridViewHistorial.SelectedIndex = -1;
        GridViewDestinatario.SelectedIndex = -1;
        TextBoxDescripcionPaquete.Text = "";
        TextBoxTipoPaquete.Text = "";
        TextBoxPesoPaquete.Text = "";
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string descripcion = TextBoxDescripcionPaquete.Text;
        string tipo = TextBoxTipoPaquete.Text;
        string peso = TextBoxPesoPaquete.Text;

        if (GridViewHistorial.SelectedIndex >= 0)
        {
            if (GridViewDestinatario.SelectedIndex >= 0)
            {
                string codigoControl = (GridViewHistorial.SelectedRow.FindControl("labelCodigoControl") as Label).Text;
                string codigoDestinatario = (GridViewDestinatario.SelectedRow.FindControl("labelCodigo") as Label).Text;
                paqueteTableAdapter.InsertPaquete(descripcion, tipo, peso,
                    int.Parse(codigoControl), int.Parse(codigoDestinatario));
                Restablecer();
                CargarTablaPaquete();
                toastifyExito("Registro guardado");
            }
            else
            {
                toastifyError("Error: seleccione destinatario");
            }
        }
        else
        {
            toastifyError("Error: seleccione conductor y camion");
        }
    }

    protected void GridViewPaquete_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridViewPaquete_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GridViewPaquete_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GridViewPaquete_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridViewPaquete_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GridViewHistorial_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewHistorial, "Select$" + e.Row.RowIndex);
        }
    }

    protected void GridViewDestinatario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewDestinatario, "Select$" + e.Row.RowIndex);
        }
    }

    protected void toastifyExito(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "ToastifyMensaje",
                "<script>" +
                "Toastify({ " +
                "text: '" + mensaje + "'," +
                " backgroundColor: '#41cb06'," +
                " close:true, gravity:'top', " +
                "position: 'center', " +
                "duration: 4000 }).showToast();" +
                "</script>"
                );
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