<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDashboard.master" AutoEventWireup="true" CodeFile="historial_conduccion.aspx.cs" Inherits="historial_conduccion" EnableEventValidation="false" %>

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
            <h3><i class="bi bi-clipboard"></i> Historial conduccion</h3>
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
                        <asp:GridView ID="GridViewHistorial" runat="server"
                            EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            OnRowEditing="GridViewHistorial_RowEditing"
                            OnRowCancelingEdit="GridViewHistorial_RowCancelingEdit"
                            OnRowUpdating="GridViewHistorial_RowUpdating"
                            OnRowDeleting="GridViewHistorial_RowDeleting"
                            OnRowDataBound="GridViewHistorial_RowDataBound"
                            CssClass="table  border-0">
                            <HeaderStyle CssClass=" shadow-sm thead-dark" />
                            <EmptyDataTemplate>
                                <p class="text-center">No hay datos</p>
                            </EmptyDataTemplate>
                            <Columns>

                                <asp:TemplateField HeaderText="Codigo">
                                    <ItemTemplate>
                                        <asp:Label ID="labelCodigoControl" CssClass="text-sm" Text='<%# Eval("CodigoControl") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Datos Conductor">
                                    <ItemTemplate>
                                        <div class="row flex-nowrap ">
                                            Dpi:<asp:Label ID="labelDpiConductor" CssClass="fw-bold text-break" Text='<%# Eval("Dpi") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Nombre:<asp:Label ID="labelNombreConductor" CssClass="text-break" Text='<%# Eval("NombreConductor") %>' runat="server" />
                                        </div>

                                        <div class="row flex-nowrap">
                                            Telefono:
                                            <asp:Label ID="labelTelefonoConductor" CssClass="text-break" Text='<%# Eval("TelefonoConductor") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Direccion:<asp:Label ID="labelDireccionConductor" CssClass="text-break" Text='<%# Eval("DireccionConductor") %>' runat="server" />
                                        </div>

                                        <div class="row flex-nowrap">
                                            Municipio:<asp:Label ID="labelMunicipioConductor" CssClass="text-break" Text='<%# Eval("MunicipioConductor") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Departamento:<asp:Label ID="labelDepartamentoConductor" CssClass="text-break" Text='<%# Eval("DepartamentoConductor") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNombre" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Nombre") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Datos camion">
                                    <ItemTemplate>
                                        <div class="row flex-nowrap">
                                            Matricula:
                                                <asp:Label CssClass="fw-bold text-break" ID="labelMatricula" Text='<%# Eval("Matricula") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Linea:
                                                <asp:Label ID="labelLineaCamion" CssClass="text-break" Text='<%# Eval("LineaCamion") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Marca:
                                                <asp:Label ID="labelMarcaCamion" CssClass="text-break" Text='<%# Eval("MarcaCamion") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Tipo:
                                                <asp:Label ID="labelTipoCamion" CssClass="text-break" Text='<%# Eval("TipoCamion") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Potencia:
                                                <asp:Label ID="labelPotenciaCamion" CssClass="text-break" Text='<%# Eval("PotenciaCamion") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Modelo:
                                                <asp:Label ID="labelModeloCamion" CssClass="text-break" Text='<%# Eval("ModeloCamion") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNombre" CssClass="form-control form-control-sm w-auto" Text='<%# Eval("Nombre") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Control">
                                    <ItemTemplate>
                                        <div class="divider">
                                            <div class="divider-text">Fecha programada</div>
                                        </div>
                                        <div class="row flex-nowrap">
                                            Salida:
                                            <asp:Label ID="labelFechaSalida" CssClass="text-break" Text='<%# Eval("FechaSalida") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Retorno:
                                            <asp:Label ID="labelFechaRetorno" CssClass="text-break" Text='<%# Eval("FechaRetorno") %>' runat="server" />
                                        </div>
                                        <div class="divider">
                                            <div class="divider-text">Estado camion</div>
                                        </div>
                                        <div class="row flex-nowrap">
                                            Inicial:
                                                <asp:Label ID="labelEstadoInicial" CssClass="text-break" Text='<%# Eval("EstadoInicial") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Final:
                                                <asp:Label ID="labelEstadoFinal" CssClass="text-break" Text='<%# Eval("EstadoFinal") %>' runat="server" />
                                        </div>
                                        <div class="divider">
                                            <div class="divider-text">Kilometraje</div>
                                        </div>
                                        <div class="row flex-nowrap">
                                            Inicial:
                                                <asp:Label ID="labelKmInicial" CssClass="text-break" Text='<%# Eval("KmInicial") %>' runat="server" />
                                        </div>
                                        <div class="row flex-nowrap">
                                            Final:<asp:Label ID="labelKmFinal" CssClass="text-break" Text='<%# Eval("KmFinal") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="labelCodDep" Visible="false" Text='<%# Eval("CodDep") %>' runat="server" />

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
                    <h5 class="modal-title text-white" id="myModalLabel1">Ingreso de historial conduccion</h5>
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
                                    <li class="active" id="account"><strong>Conductor</strong></li>
                                    <li id="personal"><strong>Camion</strong></li>
                                    <li id="confirm"><strong>Adicional</strong></li>
                                </ul>
                                <!-- fieldsets -->
                                <fieldset>
                                    <div class="form-card">
                                        <h2 class="fs-title text-center"><i class="bi bi-person-lines-fill"></i>Seleccione conductor</h2>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="table-responsive-xxl">
                                                    <asp:GridView ID="GridViewConductor" runat="server"
                                                        EnableTheming="True" ShowHeaderWhenEmpty="True"
                                                        AutoGenerateColumns="False"
                                                        CssClass="table border-0 cursor-pointer"
                                                        OnRowDataBound="GridViewConductor_RowDataBound">
                                                        <HeaderStyle CssClass=" shadow-sm thead-dark" />
                                                        <EmptyDataTemplate>
                                                            <p class="text-center">No hay datos</p>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle CssClass="bg-primary text-white" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Dpi">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelDpi" CssClass="text-sm" Text='<%# Eval("Dpi") %>' runat="server" />
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

                                                            <asp:TemplateField HeaderText="Telefono">
                                                                <ItemTemplate>
                                                                    <i class="bi bi-telephone">
                                                                        <asp:Label ID="labelTelefono" Text='<%# Eval("Telefono") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Salario">
                                                                <ItemTemplate>
                                                                    Q.<asp:Label ID="labelSalario" Text='<%# Eval("Salario") %>' runat="server" />
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
                                        <h2 class="fs-title text-center"><i class="bi bi-truck"></i>Seleccione camion</h2>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="table-responsive-xxl">
                                                    <asp:GridView ID="GridViewCamion" runat="server"
                                                        EnableTheming="True" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False"
                                                        CssClass="table border-0 cursor-pointer"
                                                        OnRowDataBound="GridViewCamion_RowDataBound">
                                                        <HeaderStyle CssClass="shadow-sm thead-dark" />
                                                        <EmptyDataTemplate>
                                                            <p class="text-center">No hay datos</p>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle CssClass="bg-primary text-white" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Matricula">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelMatricula" CssClass="text-sm" Text='<%# Eval("Matricula") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Modelo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelModelo" Text='<%# Eval("Modelo") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Tipo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelTipo" Text='<%# Eval("Tipo") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Potencia">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelPotencia" Text='<%# Eval("Potencia") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Marca">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelMarca" Text='<%# Eval("Marca") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Linea">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelLinea" Text='<%# Eval("Linea") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Estado">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="labelEstado" Text='<%# Eval("Estado") %>' runat="server" />
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
                                            <div class="divider-text">Fecha programada</div>
                                        </div>

                                        <div class="row row-cols-1 row-cols-lg-2">
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Fecha de salida: </span>
                                                    <asp:TextBox ID="TextBoxFSalida" CssClass="form-control" TextMode="Date" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Fecha de retorno: </span>
                                                    <asp:TextBox ID="TextBoxFRetorno" CssClass="form-control" TextMode="Date" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="divider">
                                            <div class="divider-text">Estado del camión</div>
                                        </div>

                                        <div class="row row-cols-1 row-cols-lg-2">
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Inicial: </span>
                                                    <asp:TextBox ID="TextBoxEstadoInicial" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Final </span>
                                                    <asp:TextBox ID="TextBoxEstadoFinal" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="divider">
                                            <div class="divider-text">Kilometraje del camión</div>
                                        </div>

                                        <div class="row row-cols-1 row-cols-lg-2">
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Inicial: </span>
                                                    <asp:TextBox ID="TextBoxKmInicial" TextMode="Number" CssClass="form-control" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">Final </span>
                                                    <asp:TextBox ID="TextBoxKmFinal" TextMode="Number" CssClass="form-control" runat="server" />
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

