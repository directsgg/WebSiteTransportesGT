using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetGeneralTableAdapters;

public partial class ingreso_destinatario : System.Web.UI.Page
{
    DestinatarioTableAdapter destinatarioTableAdapter = new DestinatarioTableAdapter();
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

            CargarTablaDestinatario();
        }
    }

    protected void CargarTablaDestinatario()
    {
        GridViewDestinatario.DataSource = destinatarioTableAdapter.GetDataDestinatario();
        GridViewDestinatario.DataBind();
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
        TextBoxNombre.Text = "";
        TextBoxDireccion.Text = "";
        TextBoxTelefono.Text = "";
        TextBoxReferencia.Text = "";
        DropDownListDepartamento.SelectedIndex = 0;
        ActualizarDropDowListMunicipio();
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string nombre = TextBoxNombre.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string referencia = TextBoxReferencia.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        if (!string.IsNullOrEmpty(nombre))
        {
            if (!string.IsNullOrEmpty(referencia))
            {
                if (!string.IsNullOrEmpty(direccion))
                {
                    if (telefono.Length == 8)
                    {
                        if (!string.IsNullOrEmpty(codigoMunicipio))
                        {
                            destinatarioTableAdapter.InsertDestinatario(nombre, direccion,
                                int.Parse(codigoMunicipio), referencia, telefono);
                            Restablecer();
                            CargarTablaDestinatario();
                            toastifyExito("Registro guardado");
                        }
                        else toastifyError("Error:Ingrese municipio y departamento");
                    }
                    else toastifyError("Error:Ingrese telefono");
                }
                else toastifyError("Error:Ingrese direccion");
            }
            else toastifyError("Error:Ingrese referencia");
        }
        else toastifyError("Error:Ingrese nombre y apellido");

    }

    protected void GridViewDestinatario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            rowEditIndex = e.NewEditIndex;
            GridViewDestinatario.EditIndex = e.NewEditIndex;
            CargarTablaDestinatario();

            DropDownList dropDownListDep = (DropDownList)GridViewDestinatario.Rows[e.NewEditIndex].FindControl("DropDownDepartamento");
            dropDownListDep.DataSource = departamentoTableAdapter.GetDataDepartamento();
            dropDownListDep.DataValueField = "Codigo";
            dropDownListDep.DataTextField = "Departamento";
            dropDownListDep.DataBind();
            string codDep = (GridViewDestinatario.Rows[e.NewEditIndex].FindControl("labelCodDep") as Label).Text;
            dropDownListDep.SelectedValue = codDep;

            DropDownList dropDownListMun = (DropDownList)GridViewDestinatario.Rows[rowEditIndex].FindControl("DropDownMunicipio");
            actualizarDropDowMun(int.Parse(codDep), dropDownListMun);
            string codMun = (GridViewDestinatario.Rows[rowEditIndex].FindControl("labelCodMun") as Label).Text;
            dropDownListMun.SelectedValue = codMun;
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void DropDownDepartamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDownListDep = (DropDownList)GridViewDestinatario.Rows[rowEditIndex].FindControl("DropDownDepartamento");
        DropDownList dropDownListMun = (DropDownList)GridViewDestinatario.Rows[rowEditIndex].FindControl("DropDownMunicipio");
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

    protected void GridViewDestinatario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewDestinatario.EditIndex = -1;
        CargarTablaDestinatario();
    }

    protected void GridViewDestinatario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        try
        {
            string codigo = (GridViewDestinatario.Rows[e.RowIndex].FindControl("labelCodigo") as Label).Text; 
            string nombre = (GridViewDestinatario.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            string direccion = (GridViewDestinatario.Rows[e.RowIndex].FindControl("txtDireccion") as TextBox).Text;
            string telefono = (GridViewDestinatario.Rows[e.RowIndex].FindControl("txtTelefono") as TextBox).Text;
            string referencia = (GridViewDestinatario.Rows[e.RowIndex].FindControl("txtReferencia") as TextBox).Text;
            string codigoMunicipio = (GridViewDestinatario.Rows[e.RowIndex].FindControl("DropDownMunicipio") as DropDownList).SelectedValue;
            if (!string.IsNullOrEmpty(codigo))
            {
                if (!string.IsNullOrEmpty(nombre))
                {
                    if (!string.IsNullOrEmpty(referencia))
                    {
                        if (!string.IsNullOrEmpty(direccion))
                        {
                            if (telefono.Length == 8)
                            {
                                if (!string.IsNullOrEmpty(codigoMunicipio))
                                {
                                    destinatarioTableAdapter.UpdateDestinatario(nombre, direccion,
                                        int.Parse(codigoMunicipio), referencia, telefono, int.Parse(codigo));
                                    GridViewDestinatario.EditIndex = -1;
                                    CargarTablaDestinatario();
                                    toastifyExito("Registro actualizado");
                                }
                                else toastifyError("Error:Ingrese municipio y departamento");
                            }
                            else toastifyError("Error:Ingrese telefono");
                        }
                        else toastifyError("Error:Ingrese direccion");
                    }
                    else toastifyError("Error:Ingrese referencia");
                }
                else toastifyError("Error:Ingrese nombre y apellido");
            }
            else toastifyError("Error:Ingrese codigo)");
        }
        catch (Exception ex)
        {
            toastifyError("Error: " + ex.Message);
        }
    }

    protected void GridViewDestinatario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (LinkButton button in e.Row.Cells[0].Controls.OfType<LinkButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        string item = (e.Row.FindControl("labelCodigo") as Label).Text + " - " +
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

    protected void GridViewDestinatario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string codigo = (GridViewDestinatario.Rows[e.RowIndex].FindControl("labelCodigo") as Label).Text;
            destinatarioTableAdapter.DeleteDestinatario(int.Parse(codigo));
            CargarTablaDestinatario();
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