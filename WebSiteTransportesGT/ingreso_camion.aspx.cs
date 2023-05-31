using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;

public partial class ingreso_camion : System.Web.UI.Page
{
    CamionTableAdapter camionTableAdapter = new CamionTableAdapter();
    marcaTableAdapter marcaTableAdapter = new marcaTableAdapter();
    lineaTableAdapter lineaTableAdapter = new lineaTableAdapter();
    modeloTableAdapter modeloTableAdapter = new modeloTableAdapter();
    tipoTableAdapter tipoTableAdapter = new tipoTableAdapter();
    estado_camionTableAdapter estado_CamionTableAdapter = new estado_camionTableAdapter();
    private static int rowEditIndex = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListMarca.DataSource = marcaTableAdapter.GetDataMarca();
            DropDownListMarca.DataValueField = "Codigo";
            DropDownListMarca.DataTextField = "Marca";
            DropDownListMarca.DataBind();
            ActualizarDropDowListLinea();

            DropDownListModelo.DataSource = modeloTableAdapter.GetDataModelo();
            DropDownListModelo.DataValueField = "Codigo";
            DropDownListModelo.DataTextField = "Modelo";
            DropDownListModelo.DataBind();

            DropDownListTipo.DataSource = tipoTableAdapter.GetDataTipo();
            DropDownListTipo.DataValueField = "Codigo";
            DropDownListTipo.DataTextField = "Tipo";
            DropDownListTipo.DataBind();

            DropDownListEstado.DataSource = estado_CamionTableAdapter.GetDataEstado();
            DropDownListEstado.DataValueField = "Codigo";
            DropDownListEstado.DataTextField = "Estado";
            DropDownListEstado.DataBind();

            CargarTablaCamion();
        }
    }

    protected void CargarTablaCamion()
    {
        GridViewCamion.DataSource = camionTableAdapter.GetDataCamion();
        GridViewCamion.DataBind();
    }

    protected void DropDownListMarca_SelectedIndexChanged(object sender, EventArgs e)
    {
        ActualizarDropDowListLinea();
    }

    protected void ActualizarDropDowListLinea()
    {
        int codMarca = int.Parse(DropDownListMarca.SelectedValue);
        DropDownListLinea.DataSource = lineaTableAdapter.GetDataLinea(codMarca);
        DropDownListLinea.DataValueField = "Codigo";
        DropDownListLinea.DataTextField = "Linea";
        DropDownListLinea.DataBind();
    }

    protected void Restablecer()
    {
        TextBoxMatricula.Text = "";
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string matricula = TextBoxMatricula.Text;
        string codLinea = DropDownListLinea.SelectedValue;
        string codTipo = DropDownListTipo.SelectedValue;
        string codModelo = DropDownListModelo.SelectedValue;
        string codEstado = DropDownListEstado.SelectedValue;
        if (!string.IsNullOrEmpty(matricula))
        {
            camionTableAdapter.InsertCamion(matricula, int.Parse(codLinea),
                int.Parse(codModelo), int.Parse(codTipo), int.Parse(codEstado));
            Restablecer();
            CargarTablaCamion();
            toastifyExito("Registro guardado");
        }
        else toastifyError("Error:Ingrese matricula");
    }

    protected void GridViewCamion_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            rowEditIndex = e.NewEditIndex;
            GridViewCamion.EditIndex = e.NewEditIndex;
            CargarTablaCamion();

            DropDownList dropDownMod = (DropDownList)GridViewCamion.Rows[e.NewEditIndex].FindControl("DropDownMod");
            dropDownMod.DataSource = modeloTableAdapter.GetDataModelo();
            dropDownMod.DataValueField = "Codigo";
            dropDownMod.DataTextField = "Modelo";
            dropDownMod.DataBind();
            string codModelo = (GridViewCamion.Rows[e.NewEditIndex].FindControl("labelCodModelo") as Label).Text;
            dropDownMod.SelectedValue = codModelo;


            DropDownList dropDownTip = (DropDownList)GridViewCamion.Rows[e.NewEditIndex].FindControl("DropDownTip");
            dropDownTip.DataSource = tipoTableAdapter.GetDataTipo();
            dropDownTip.DataValueField = "Codigo";
            dropDownTip.DataTextField = "Tipo";
            dropDownTip.DataBind();
            string codTipo = (GridViewCamion.Rows[e.NewEditIndex].FindControl("labelCodTipo") as Label).Text;
            dropDownTip.SelectedValue = codTipo;

            DropDownList dropDownMarc = (DropDownList)GridViewCamion.Rows[e.NewEditIndex].FindControl("DropDownMarc");
            dropDownMarc.DataSource = marcaTableAdapter.GetDataMarca();
            dropDownMarc.DataValueField = "Codigo";
            dropDownMarc.DataTextField = "Marca";
            dropDownMarc.DataBind();
            string codMarca = (GridViewCamion.Rows[e.NewEditIndex].FindControl("labelCodMarca") as Label).Text;
            dropDownMarc.SelectedValue = codMarca;

            DropDownList dropDownEst = (DropDownList)GridViewCamion.Rows[e.NewEditIndex].FindControl("DropDownEst");
            dropDownEst.DataSource = estado_CamionTableAdapter.GetDataEstado();
            dropDownEst.DataValueField = "Codigo";
            dropDownEst.DataTextField = "Estado";
            dropDownEst.DataBind();
            string codEstado = (GridViewCamion.Rows[e.NewEditIndex].FindControl("labelCodEstado") as Label).Text;
            dropDownEst.SelectedValue = codEstado;


            DropDownList dropDownListLin = (DropDownList)GridViewCamion.Rows[rowEditIndex].FindControl("DropDownLin");
            actualizarDropDowLin(int.Parse(codMarca), dropDownListLin);
            string codLinea = (GridViewCamion.Rows[e.NewEditIndex].FindControl("labelCodLinea") as Label).Text;
            dropDownListLin.SelectedValue = codLinea;
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void DropDownMarc_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDownListMarc = (DropDownList)GridViewCamion.Rows[rowEditIndex].FindControl("DropDownMarc");
        DropDownList dropDownListLin = (DropDownList)GridViewCamion.Rows[rowEditIndex].FindControl("DropDownLin");
        int codMarca = int.Parse(dropDownListMarc.SelectedValue);
        actualizarDropDowLin(codMarca, dropDownListLin);
    }

    protected void actualizarDropDowLin(int codMarca, DropDownList dropDownListLin)
    {
        dropDownListLin.DataSource = lineaTableAdapter.GetDataLinea(codMarca);
        dropDownListLin.DataValueField = "Codigo";
        dropDownListLin.DataTextField = "Linea";
        dropDownListLin.DataBind();
    }

    protected void GridViewCamion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewCamion.EditIndex = -1;
        CargarTablaCamion();
    }

    protected void GridViewCamion_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string matricula = (GridViewCamion.Rows[e.RowIndex].FindControl("labelMatricula") as Label).Text;
            string codLinea = (GridViewCamion.Rows[rowEditIndex].FindControl("DropDownLin") as DropDownList).SelectedValue;
            string codTipo = (GridViewCamion.Rows[rowEditIndex].FindControl("DropDownTip") as DropDownList).SelectedValue;
            string codModelo = (GridViewCamion.Rows[rowEditIndex].FindControl("DropDownMod") as DropDownList).SelectedValue;
            string codEstado = (GridViewCamion.Rows[rowEditIndex].FindControl("DropDownEst") as DropDownList).SelectedValue;
            if (!string.IsNullOrEmpty(matricula))
            {
                camionTableAdapter.UpdateCamion(int.Parse(codLinea), int.Parse(codModelo), int.Parse(codTipo),
                    int.Parse(codEstado), matricula);
                GridViewCamion.EditIndex = -1;
                CargarTablaCamion();
                toastifyExito("Registro actualizado");
            }
            else toastifyError("Error:Ingrese matricula");
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
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