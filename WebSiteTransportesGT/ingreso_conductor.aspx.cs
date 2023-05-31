using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;

public partial class ingreso_chofer : System.Web.UI.Page
{
    ConductorTableAdapter conductorTableAdapter = new ConductorTableAdapter();
    departamentoTableAdapter departamentoTableAdapter = new departamentoTableAdapter();
    municipioTableAdapter municipioTableAdapter = new municipioTableAdapter();
    private static int rowEditIndex = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListDepartamento.DataSource = departamentoTableAdapter.GetDataDepartamento();
            DropDownListDepartamento.DataValueField = "Codigo";
            DropDownListDepartamento.DataTextField = "Departamento";
            DropDownListDepartamento.DataBind();
            ActualizarDropDowListMunicipio();

            CargarTablaConductor();
        }
    }

    protected void CargarTablaConductor()
    {
        GridViewConductor.DataSource = conductorTableAdapter.GetDataConductor();
        GridViewConductor.DataBind();
    }

    protected void DropDownListDepartamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        ActualizarDropDowListMunicipio();
    }

    protected void ActualizarDropDowListMunicipio()
    {
        int codDepa = int.Parse(DropDownListDepartamento.SelectedValue);
        DropDownListMunicipio.DataSource = municipioTableAdapter.GetDataMunicipio(codDepa);
        DropDownListMunicipio.DataValueField = "Codigo";
        DropDownListMunicipio.DataTextField = "Municipio";
        DropDownListMunicipio.DataBind();
    }

    protected void Restablecer()
    {
        TextBoxDpi.Text = "";
        TextBoxNombre.Text = "";
        TextBoxDireccion.Text = "";
        TextBoxTelefono.Text = "";
        TextBoxSalario.Text = "";
        DropDownListDepartamento.SelectedIndex = 0;
        ActualizarDropDowListMunicipio();
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string dpi = TextBoxDpi.Text;
        string nombre = TextBoxNombre.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string salario = TextBoxSalario.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        if (dpi.Length == 13)
        {
            if (!string.IsNullOrEmpty(nombre))
            {
                if (!string.IsNullOrEmpty(salario))
                {
                    if (!string.IsNullOrEmpty(direccion))
                    {
                        if (telefono.Length == 8)
                        {
                            if (!string.IsNullOrEmpty(codigoMunicipio))
                            {
                                conductorTableAdapter.InsertConductor(dpi, nombre, telefono, direccion, salario, int.Parse(codigoMunicipio));
                                Restablecer();
                                CargarTablaConductor();
                                toastifyExito("Registro guardado");
                            }
                            else toastifyError("Error:Ingrese municipio y departamento");
                        }
                        else toastifyError("Error:Ingrese telefono");
                    }
                    else toastifyError("Error:Ingrese direccion");
                }
                else toastifyError("Error:Ingrese salario");
            }
            else toastifyError("Error:Ingrese nombre y apellido");
        }
        else toastifyError("Error:Ingrese dpi (13 digitos)");
    }

    protected void GridViewConductor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            rowEditIndex = e.NewEditIndex;
            GridViewConductor.EditIndex = e.NewEditIndex;
            CargarTablaConductor();

            DropDownList dropDownListDep = (DropDownList)GridViewConductor.Rows[e.NewEditIndex].FindControl("DropDownDepartamento");
            dropDownListDep.DataSource = departamentoTableAdapter.GetDataDepartamento();
            dropDownListDep.DataValueField = "Codigo";
            dropDownListDep.DataTextField = "Departamento";
            dropDownListDep.DataBind();
            string codDep = (GridViewConductor.Rows[e.NewEditIndex].FindControl("labelCodDep") as Label).Text;
            dropDownListDep.SelectedValue = codDep;

            DropDownList dropDownListMun = (DropDownList)GridViewConductor.Rows[rowEditIndex].FindControl("DropDownMunicipio");
            actualizarDropDowMun(int.Parse(codDep), dropDownListMun);
            string codMun = (GridViewConductor.Rows[rowEditIndex].FindControl("labelCodMun") as Label).Text;
            dropDownListMun.SelectedValue = codMun;
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void DropDownDepartamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDownListDep = (DropDownList)GridViewConductor.Rows[rowEditIndex].FindControl("DropDownDepartamento");
        DropDownList dropDownListMun = (DropDownList)GridViewConductor.Rows[rowEditIndex].FindControl("DropDownMunicipio");
        int codDepa = int.Parse(dropDownListDep.SelectedValue);
        actualizarDropDowMun(codDepa, dropDownListMun);
    }

    protected void actualizarDropDowMun(int codDepa, DropDownList dropDownListMun)
    {
        dropDownListMun.DataSource = municipioTableAdapter.GetDataMunicipio(codDepa);
        dropDownListMun.DataValueField = "Codigo";
        dropDownListMun.DataTextField = "Municipio";
        dropDownListMun.DataBind();
    }

    protected void GridViewConductor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewConductor.EditIndex = -1;
        CargarTablaConductor();
    }

    protected void GridViewConductor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string dpi = (GridViewConductor.Rows[e.RowIndex].FindControl("labelDpi") as Label).Text; ;
            string nombre = (GridViewConductor.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            string direccion = (GridViewConductor.Rows[e.RowIndex].FindControl("txtDireccion") as TextBox).Text;
            string telefono = (GridViewConductor.Rows[e.RowIndex].FindControl("txtTelefono") as TextBox).Text;
            string salario = (GridViewConductor.Rows[e.RowIndex].FindControl("txtSalario") as TextBox).Text;
            string codigoMunicipio = (GridViewConductor.Rows[e.RowIndex].FindControl("DropDownMunicipio") as DropDownList).SelectedValue;
            if (!string.IsNullOrEmpty(dpi))
            {
                if (!string.IsNullOrEmpty(nombre))
                {
                    if (!string.IsNullOrEmpty(salario))
                    {
                        if (!string.IsNullOrEmpty(direccion))
                        {
                            if (telefono.Length == 8)
                            {
                                if (!string.IsNullOrEmpty(codigoMunicipio))
                                {
                                    conductorTableAdapter.UpdateConductor(nombre, telefono, direccion, salario, int.Parse(codigoMunicipio), dpi);
                                    GridViewConductor.EditIndex = -1;
                                    CargarTablaConductor();
                                    toastifyExito("Registro actualizado");
                                }
                                else toastifyError("Error:Ingrese municipio y departamento");
                            }
                            else toastifyError("Error:Ingrese telefono");
                        }
                        else toastifyError("Error:Ingrese direccion");
                    }
                    else toastifyError("Error:Ingrese salario");
                }
                else toastifyError("Error:Ingrese nombre y apellido");
            }
            else toastifyError("Error:Ingrese dpi");
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void GridViewConductor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (LinkButton button in e.Row.Cells[0].Controls.OfType<LinkButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        string item = (e.Row.FindControl("labelDpi") as Label).Text + " - " +
                                   (e.Row.FindControl("labelNombre") as Label).Text;
                        button.Attributes["onclick"] = "if(!confirm('¿Desea eliminar el registro: " + item + "?')){ return false; };";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void GridViewConductor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string dpi = (GridViewConductor.Rows[e.RowIndex].FindControl("labelDpi") as Label).Text;
            conductorTableAdapter.DeleteConductor(dpi);
            CargarTablaConductor();
            toastifyExito("Registro eliminado");
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