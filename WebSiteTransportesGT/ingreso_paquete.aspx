<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDashboard.master" AutoEventWireup="true" CodeFile="ingreso_paquete.aspx.cs" Inherits="ingreso_paquete" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="assets/css/style_formstep.css" rel="stylesheet" />
    <script src="assets/js/script_formstep.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-heading">
        <div class="page-title">
            <h3><i class="bi bi-box"></i>Listado de paquetes</h3>
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
                        <asp:GridView ID="GridViewPaquete" runat="server"
                            EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            OnRowEditing="GridViewPaquete_RowEditing"
                            OnRowCancelingEdit="GridViewPaquete_RowCancelingEdit"
                            OnRowUpdating="GridViewPaquete_RowUpdating"
                            OnRowDeleting="GridViewPaquete_RowDeleting"
                            OnRowDataBound="GridViewPaquete_RowDataBound"
                            CssClass="table  border-0">
                            <HeaderStyle CssClass=" shadow-sm thead-dark" />
                            <EmptyDataTemplate>
                                <p class="text-center">No hay datos</p>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo">
                                    <ItemTemplate>
                                        <asp:Label ID="labelCodigoPaquete" CssClass="text-sm" Text='<%# Eval("CodigoPaquete") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Datos Conduccion">
                                    <ItemTemplate>
                                        <div class="text-start ">
                                            Conductor:
                                            <asp:Label ID="labelDpiConductor" CssClass="fw-bold text-break" Text='<%# Eval("DpiConductor") %>' runat="server" />
                                            <asp:Label ID="labelNombreConductor2" CssClass="text-break" Text='<%# Eval("NombreConductor") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            Camion:
                                            <asp:Label CssClass="fw-bold text-break" ID="MatriculaCamion" Text='<%# Eval("MatriculaCamion") %>' runat="server" />
                                            <asp:Label ID="labelTipoCamion" CssClass="d-inline" Text='<%# Eval("TipoCamion") %>' runat="server" />
                                            <asp:Label ID="labelMarcaCamion" CssClass="d-inline" Text='<%# Eval("MarcaCamion") %>' runat="server" />
                                            <asp:Label ID="labelLineaCamion" CssClass="d-inline" Text='<%# Eval("LineaCamion") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Datos destinatario">
                                    <ItemTemplate>
                                        <div class="text-start">
                                            Destinatario:
                                                <asp:Label CssClass="fw-bold text-break" ID="labelNombreDestinatario" Text='<%# Eval("NombreDestinatario") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            Direccion:
                                            <asp:Label ID="labelDepartamentoDestinatario" CssClass="text-break" Text='<%# Eval("DepartamentoDestinatario") %>' runat="server" />
                                            <asp:Label ID="labelMunicipioDestinatario" CssClass="text-break" Text='<%# Eval("MunicipioDestinatario") %>' runat="server" />
                                            <asp:Label ID="labelDireccionDestinatario" CssClass="text-break" Text='<%# Eval("DireccionDestinatario") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            Referencia:
                                            <asp:Label ID="labelReferenciaDestinatario" CssClass="text-break" Text='<%# Eval("ReferenciaDestinatario") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            <i class="bi bi-telephone"></i>
                                            <asp:Label ID="labelTelefonoDestinatario" CssClass="text-break" Text='<%# Eval("TelefonoDestinatario") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Paquete">
                                    <ItemTemplate>
                                        <div class="text-start">
                                            Descripcion:
                                            <asp:Label ID="labelDescripcionPaquete" CssClass="text-break" Text='<%# Eval("DescripcionPaquete") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            Tipo:
                                            <asp:Label ID="labelTipoPaquete" CssClass="text-break" Text='<%# Eval("TipoPaquete") %>' runat="server" />
                                        </div>
                                        <div class="text-start">
                                            Peso:
                                            <asp:Label ID="labelPesoPaquete" CssClass="text-break" Text='<%# Eval("PesoPaquete") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
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
        <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title text-white" id="myModalLabel1">Ingreso de paquete</h5>
                    <button type="button" class="btn btn-sm p-0 text-white" data-bs-dismiss="modal" aria-label="Close">
                        <i class="bi bi-x fs-3"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 mx-0">
                            <div id="msform">
                                <!-- progressbar -->
                                <ul id="progressbar">
                                    <li class="active" id="account"><strong>Camion</strong></li>
                                    <li id="personal"><strong>Destinatario</strong></li>
                                    <li id="confirm"><strong>Adicional</strong></li>
                                </ul>
                                <!-- fieldsets -->
                                <fieldset>
                                    <div class="form-card">
                                        <h2 class="fs-title text-center"><i class="bi bi-clipboard"></i>Seleccione camion y conductor</h2>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="table-responsive-xxl">
                                                    <asp:GridView ID="GridViewHistorial" runat="server"
                                                        EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                                        OnRowDataBound="GridViewHistorial_RowDataBound"
                                                        CssClass="table border-0 cursor-pointer">
                                                        <HeaderStyle CssClass="shadow-sm thead-dark" />
                                                        <EmptyDataTemplate>
                                                            <p class="text-center">No hay datos</p>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle CssClass="bg-primary text-white" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Codigo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelCodigoControl" CssClass="text-sm" Text='<%# Eval("CodigoControl") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Datos Conductor">
                                                                <ItemTemplate>
                                                                    <div class="text-start ">
                                                                        Dpi:<asp:Label ID="labelDpiConductor" CssClass="fw-bold text-break" Text='<%# Eval("Dpi") %>' runat="server" />
                                                                    </div>
                                                                    <div class="text-start">
                                                                        Nombre:<asp:Label ID="labelNombreConductor" CssClass="text-break" Text='<%# Eval("NombreConductor") %>' runat="server" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Datos camion">
                                                                <ItemTemplate>
                                                                    <div class="text-start ">
                                                                        Matricula:
                                                                         <asp:Label CssClass="fw-bold text-break" ID="labelMatricula" Text='<%# Eval("Matricula") %>' runat="server" />
                                                                    </div>
                                                                    <div class="text-start">
                                                                        Camion:
                                                                    <asp:Label ID="labelTipoCamion" CssClass="d-inline" Text='<%# Eval("TipoCamion") %>' runat="server" />
                                                                        <asp:Label ID="labelMarcaCamion" CssClass="d-inline" Text='<%# Eval("MarcaCamion") %>' runat="server" />
                                                                        <asp:Label ID="labelLineaCamion" CssClass="d-inline" Text='<%# Eval("LineaCamion") %>' runat="server" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Control">
                                                                <ItemTemplate>
                                                                    <p class="text-center m-0">Fecha programada</p>
                                                                    <div class="text-start">
                                                                        Salida:
                                                                        <asp:Label ID="labelFechaSalida" CssClass="text-break" Text='<%# Eval("FechaSalida") %>' runat="server" />
                                                                    </div>
                                                                    <div class="text-start">
                                                                        Retorno:
                                                                        <asp:Label ID="labelFechaRetorno" CssClass="text-break" Text='<%# Eval("FechaRetorno") %>' runat="server" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <input type="button" name="next" class="next action-button" value="Siguiente" />
                                </fieldset>
                                <fieldset>
                                    <div class="form-card">
                                        <h2 class="fs-title text-center"><i class="bi bi-person"></i>Seleccione destinatario</h2>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="table-responsive-xxl">
                                                    <asp:GridView ID="GridViewDestinatario" runat="server"
                                                        EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                                        OnRowDataBound="GridViewDestinatario_RowDataBound"
                                                        CssClass="table border-0">
                                                        <HeaderStyle CssClass=" shadow-sm thead-dark" />
                                                        <EmptyDataTemplate>
                                                            <p class="text-center">No hay datos</p>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle CssClass="bg-primary text-white" />
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Codigo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelCodigo" CssClass="text-sm" Text='<%# Eval("Codigo") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Nombre Completo">
                                                                <ItemTemplate>
                                                                    <asp:Label CssClass="fw-bold" ID="labelNombre" Text='<%# Eval("Nombre") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Departamento">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelDepartamento" Text='<%# Eval("Departamento") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Municipio">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelMunicipio" Text='<%# Eval("Municipio") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Direccion">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelDireccion" Text='<%# Eval("Direccion") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Referencia">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelReferencia" Text='<%# Eval("Referencia") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Telefono">
                                                                <ItemTemplate>
                                                                    <i class="bi bi-telephone">
                                                                        <asp:Label ID="labelTelefono" Text='<%# Eval("Telefono") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <input type="button" name="previous" class="previous action-button-previous" value="Anterior" />
                                    <input type="button" name="next" class="next action-button" value="Siguiente" />
                                </fieldset>
                                <fieldset>
                                    <div class="form-card">
                                        <h2 class="fs-title text-center"><i class="bi bi-card-checklist"></i>Datos adicionales</h2>

                                        <div class="divider">
                                            <div class="divider-text">Paquete</div>
                                        </div>

                                        <div class="row row-cols-1 row-cols-lg-2">
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Descripcion: </span>
                                                    <asp:TextBox ID="TextBoxDescripcionPaquete" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Tipo: </span>
                                                    <asp:TextBox ID="TextBoxTipoPaquete" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row row-cols-1 row-cols-lg-2">
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Peso: </span>
                                                    <asp:TextBox ID="TextBoxPesoPaquete" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="button" name="previous" class="previous action-button-previous" value="Anterior" />
                                    <asp:Button ID="ButtonGuardar" OnClick="ButtonGuardar_Click" Text="Guardar"
                                        CssClass="btn btn-primary btn-lg ms-1" runat="server" />
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

