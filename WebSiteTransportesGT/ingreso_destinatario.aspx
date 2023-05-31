<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDashboard.master" AutoEventWireup="true" CodeFile="ingreso_destinatario.aspx.cs" Inherits="ingreso_destinatario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-heading">
        <div class="page-title">
            <h3><i class="bi bi-person"></i> Destinatarios</h3>
        </div>
    </div>
    <div class="page-content">
        <section class="row">
            <div class="card">
                <div class="card-header">
                    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#nuevoConductorModal">Nuevo</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive-xxl">
                        <asp:GridView ID="GridViewDestinatario" runat="server"
                            EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            OnRowEditing="GridViewDestinatario_RowEditing"
                            OnRowCancelingEdit="GridViewDestinatario_RowCancelingEdit"
                            OnRowUpdating="GridViewDestinatario_RowUpdating"
                            OnRowDeleting="GridViewDestinatario_RowDeleting"
                            OnRowDataBound="GridViewDestinatario_RowDataBound"
                            CssClass="table border-0">
                            <HeaderStyle CssClass=" shadow-sm thead-dark" />
                            <EmptyDataTemplate>
                                <p class="text-center">No hay datos</p>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ControlStyle-CssClass="font-bold">
                                    <ItemTemplate>
                                        <asp:LinkButton CommandName="Edit" CssClass="btn btn-sm p-0 m-0 " data-bs-toggle="tooltip" ToolTip="Editar" Text='<i class="bi bi-pencil "></i>' runat="server" />
                                        <asp:LinkButton CommandName="Delete" CssClass="btn btn-sm" data-bs-toggle="tooltip" ToolTip="Eliminar" Text='<i class="bi bi-trash"></i>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton CommandName="Update" CssClass="btn btn-sm" data-bs-toggle="tooltip" ToolTip="Guardar" Text='<i class="bi bi-save"></i>' runat="server" />
                                        <asp:LinkButton CommandName="Cancel" CssClass="btn btn-sm" data-bs-toggle="tooltip" ToolTip="Cancelar" Text='<i class="bi bi-x-circle"></i>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Codigo">
                                    <ItemTemplate>
                                        <asp:Label ID="labelCodigo" CssClass="text-sm" Text='<%# Eval("Codigo") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre Completo">
                                    <ItemTemplate>
                                        <asp:Label CssClass="fw-bold" ID="labelNombre" Text='<%# Eval("Nombre") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNombre" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Nombre") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Departamento">
                                    <ItemTemplate>
                                        <asp:Label ID="labelDepartamento" Text='<%# Eval("Departamento") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="labelCodDep" Visible="false" Text='<%# Eval("CodDep") %>' runat="server" />
                                         <asp:DropDownList ID="DropDownDepartamento" AutoPostBack="true" 
                                             OnSelectedIndexChanged="DropDownDepartamento_SelectedIndexChanged" 
                                             CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Municipio">
                                    <ItemTemplate>
                                        <asp:Label ID="labelMunicipio" Text='<%# Eval("Municipio") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="labelCodMun" Visible="false" Text='<%# Eval("CodMun") %>' runat="server" />
                                        <asp:DropDownList ID="DropDownMunicipio" CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Direccion">
                                    <ItemTemplate>
                                        <asp:Label ID="labelDireccion" Text='<%# Eval("Direccion") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDireccion" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Direccion") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Referencia">
                                    <ItemTemplate>
                                        <asp:Label ID="labelReferencia" Text='<%# Eval("Referencia") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtReferencia" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Referencia") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Telefono">
                                    <ItemTemplate>
                                        <i class="bi bi-telephone">
                                        <asp:Label ID="labelTelefono" Text='<%# Eval("Telefono") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTelefono" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Telefono") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="modal fade text-left" id="nuevoConductorModal" tabindex="-1" aria-labelledby="myModalLabel1" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title text-white" id="myModalLabel1">Ingreso de destinatario</h5>
                    <button type="button" class="btn btn-sm p-0 text-white" data-bs-dismiss="modal" aria-label="Close">
                        <i class="bi bi-x fs-3"></i>
                    </button>
                </div>

                <div class="modal-body">

                    <div class="input-group mb-3">
                        <span class="input-group-text">Nombre y apellido</span>
                        <asp:TextBox ID="TextBoxNombre" CssClass="form-control" runat="server" />
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Direccion</span>
                        <asp:TextBox ID="TextBoxDireccion" CssClass="form-control" runat="server" />
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Departamento</span>
                                <asp:DropDownList ID="DropDownListDepartamento" AutoPostBack="true" OnSelectedIndexChanged="DropDownListDepartamento_SelectedIndexChanged" CssClass="form-select" runat="server"></asp:DropDownList>
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text">Municipio</span>
                                <asp:DropDownList ID="DropDownListMunicipio" CssClass="form-select" runat="server"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Telefono</span>
                        <asp:TextBox ID="TextBoxTelefono" CssClass="form-control" runat="server" />
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Referencia</span>
                        <asp:TextBox ID="TextBoxReferencia" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Cancelar</span>
                    </button>
                    <asp:Button ID="ButtonGuardar" OnClick="ButtonGuardar_Click" Text="Guardar" CssClass="btn btn-primary ms-1" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

