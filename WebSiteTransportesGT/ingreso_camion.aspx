<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDashboard.master" AutoEventWireup="true" CodeFile="ingreso_camion.aspx.cs" Inherits="ingreso_camion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-heading">
        <div class="page-title">
            <h3><i class="bi bi-truck"></i>Camiones</h3>
        </div>
    </div>
    <div class="page-content">
        <section class="row">
            <div class="card ">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="myTab">
                        <li class="nav-item">
                            <a href="#home" class="nav-link active" data-bs-toggle="tab">Listado</a>
                        </li>
                        <li class="nav-item">
                            <a href="#nuevo" class="nav-link" data-bs-toggle="tab">Nuevo</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body mt-3">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="home">
                            <div class="table-responsive-xxl">
                                <asp:GridView ID="GridViewCamion" runat="server"
                                    EnableTheming="True" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False"
                                    OnRowEditing="GridViewCamion_RowEditing"
                                    OnRowCancelingEdit="GridViewCamion_RowCancelingEdit"
                                    OnRowUpdating="GridViewCamion_RowUpdating"
                                    CssClass="table border-0">
                                    <HeaderStyle CssClass=" shadow-sm thead-dark" />
                                    <EmptyDataTemplate>
                                        <p class="text-center">No hay datos</p>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField ControlStyle-CssClass="font-bold">
                                            <ItemTemplate>
                                                <asp:LinkButton CommandName="Edit" CssClass="btn btn-sm p-0 m-0 " data-bs-toggle="tooltip" ToolTip="Editar" Text='<i class="bi bi-pencil "></i>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton CommandName="Update" CssClass="btn btn-sm" data-bs-toggle="tooltip" ToolTip="Guardar" Text='<i class="bi bi-save"></i>' runat="server" />
                                                <asp:LinkButton CommandName="Cancel" CssClass="btn btn-sm" data-bs-toggle="tooltip" ToolTip="Cancelar" Text='<i class="bi bi-x-circle"></i>' runat="server" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Matricula">
                                            <ItemTemplate>
                                                <asp:Label ID="labelMatricula" CssClass="text-sm" Text='<%# Eval("Matricula") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Modelo">
                                            <ItemTemplate>
                                                <asp:Label ID="labelModelo" Text='<%# Eval("Modelo") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="labelCodModelo" Visible="false" Text='<%# Eval("CodModelo") %>' runat="server" />
                                                <asp:DropDownList ID="DropDownMod" CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Tipo">
                                            <ItemTemplate>
                                                <asp:Label ID="labelTipo" Text='<%# Eval("Tipo") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="labelCodTipo" Visible="false" Text='<%# Eval("CodTipo") %>' runat="server" />
                                                <asp:DropDownList ID="DropDownTip" CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Potencia">
                                            <ItemTemplate>
                                                <asp:Label ID="labelPotencia" Text='<%# Eval("Potencia") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Marca">
                                            <ItemTemplate>
                                                <asp:Label ID="labelMarca" Text='<%# Eval("Marca") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="labelCodMarca" Visible="false" Text='<%# Eval("CodMarca") %>' runat="server" />
                                                <asp:DropDownList ID="DropDownMarc" OnSelectedIndexChanged="DropDownMarc_SelectedIndexChanged"
                                                    AutoPostBack="true" CssClass="form-select form-select-sm w-auto" runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Linea">
                                            <ItemTemplate>
                                                <asp:Label ID="labelLinea" Text='<%# Eval("Linea") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="labelCodLinea" Visible="false" Text='<%# Eval("CodLinea") %>' runat="server" />
                                                <asp:DropDownList ID="DropDownLin" CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Estado">
                                            <ItemTemplate>
                                                <asp:Label ID="labelEstado" Text='<%# Eval("Estado") %>' runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="labelCodEstado" Visible="false" Text='<%# Eval("CodEstado") %>' runat="server" />
                                                <asp:DropDownList ID="DropDownEst" CssClass="form-select form-select-sm w-auto" runat="server"></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nuevo">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <h5 class="card-title">Ingreso de nuevo camion</h5>
                            <div class="row ">
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Matricula:</span>
                                        <asp:TextBox ID="TextBoxMatricula" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text">Marca/Linea:</span>
                                                <asp:DropDownList ID="DropDownListMarca" OnSelectedIndexChanged="DropDownListMarca_SelectedIndexChanged"
                                                    AutoPostBack="true" CssClass="form-select" runat="server">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="DropDownListLinea" CssClass="form-select" runat="server"></asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Modelo:</span>
                                        <asp:DropDownList ID="DropDownListModelo" CssClass="form-select" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Tipo:</span>
                                        <asp:DropDownList ID="DropDownListTipo" CssClass="form-select" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">Estado:</span>
                                        <asp:DropDownList ID="DropDownListEstado" CssClass="form-select" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="ButtonGuardar" OnClick="ButtonGuardar_Click" Text="Guardar" CssClass="btn btn-primary ms-1" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

