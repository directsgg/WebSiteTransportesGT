using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;
using System.Data;

public partial class historial_conduccion : System.Web.UI.Page
{
    ConductorTableAdapter conductorTableAdapter = new ConductorTableAdapter();
    CamionTableAdapter camionTableAdapter = new CamionTableAdapter();
    HistorialConduccionTableAdapter historialConduccionTableAdapter = new HistorialConduccionTableAdapter();
    private static int rowEditIndex = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //conductor
            GridViewConductor.DataSource = conductorTableAdapter.GetDataConductor();
            GridViewConductor.DataBind();
            //camion
            GridViewCamion.DataSource = camionTableAdapter.GetDataCamion();
            GridViewCamion.DataBind();

            CargarTablaHistorial();
        }
    }

    protected void CargarTablaHistorial()
    {
        GridViewHistorial.DataSource = historialConduccionTableAdapter.GetDataHistorial();
        GridViewHistorial.DataBind();
    }

    protected void GridViewConductor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewConductor, "Select$" + e.Row.RowIndex);
        }
    }

    protected void GridViewCamion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewCamion, "Select$" + e.Row.RowIndex);
        }
    }

    private void Restablecer()
    {
        GridViewConductor.SelectedIndex = -1;
        GridViewCamion.SelectedIndex = -1;
        TextBoxEstadoInicial.Text = "";
        TextBoxEstadoFinal.Text = "";
        TextBoxKmInicial.Text = "";
        TextBoxKmFinal.Text = "";
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string fechaSalida = TextBoxFSalida.Text;
        string fechaRetorno = TextBoxFRetorno.Text;
        string estadoInicial = TextBoxEstadoInicial.Text;
        string estadoFinal = TextBoxEstadoFinal.Text;
        string kmInicial = TextBoxKmInicial.Text;
        string kmFinal = TextBoxKmFinal.Text;

        if (GridViewConductor.SelectedIndex >= 0)
        {
            if (GridViewCamion.SelectedIndex >= 0)
            {
                if (!string.IsNullOrEmpty(fechaSalida))
                {
                    if (!string.IsNullOrEmpty(fechaRetorno))
                    {
                        if (!string.IsNullOrEmpty(estadoInicial))
                        {
                            if (!string.IsNullOrEmpty(estadoFinal))
                            {
                                if (!string.IsNullOrEmpty(kmInicial))
                                {
                                    if (!string.IsNullOrEmpty(kmFinal))
                                    {
                                        string matricula = (GridViewCamion.SelectedRow.FindControl("labelMatricula") as Label).Text;
                                        string dpi = (GridViewConductor.SelectedRow.FindControl("labelDpi") as Label).Text;

                                        DataTable tablaCamionEstado = camionTableAdapter.GetDataPorMatricula(matricula);
                                        string estadoCamion = tablaCamionEstado.Rows[0]["CodEstado"].ToString();
                                        if (estadoCamion != "2")
                                        {
                                            historialConduccionTableAdapter.InsertHistorial(fechaSalida, fechaRetorno,
                                                estadoInicial, estadoFinal, matricula, dpi,
                                                int.Parse(kmInicial), int.Parse(kmFinal));
                                            camionTableAdapter.UpdateEstadoCamion(matricula);
                                            Restablecer();
                                            CargarTablaHistorial();
                                            toastifyExito("Registro guardado");
                                        }
                                        else
                                        {
                                            toastifyError("Error: camion en uso");
                                        }
                                    }
                                    else
                                    {
                                        toastifyError("Error: ingrese kilometraje final");
                                    }
                                }
                                else
                                {
                                    toastifyError("Error: ingrese kilometraje inicial");
                                }
                            }
                            else
                            {
                                toastifyError("Error: ingrese estado final");
                            }
                        }
                        else
                        {
                            toastifyError("Error: ingrese estado inicial");
                        }
                    }
                    else
                    {
                        toastifyError("Error: ingrese fecha retorno");
                    }
                }
                else
                {
                    toastifyError("Error: ingrese fecha salida");
                }
            }
            else
            {
                toastifyError("Error: seleccione camion");
            }
        }
        else
        {
            toastifyError("Error: seleccione conductor del camion");
        }
    }

    protected void GridViewHistorial_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridViewHistorial_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GridViewHistorial_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GridViewHistorial_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridViewHistorial_RowDataBound(object sender, GridViewRowEventArgs e)
    {

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