<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="catalogoMedicos.aspx.cs" Inherits="waHospital.catalogoMedicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-2">
            <div>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
                <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
            </div>
        </div>
        <div class="col-md-8">
            <h4>Catálogo Médicos</h4>
            <div class="row">
                <div class="col-md-12">
                    <p class="text-right">
                        <asp:Button ID="btnNuevo" Text="Nuevo Médico" runat="server" CssClass="btn btn-success" OnClick="btnNuevo_Click" />
                    </p>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>APELLIDOS</th>
                            <th>EDAD</th>
                            <th>FECHA NACIMIENTO</th>
                            <th>ESPECIALIDAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rMedicos" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lnkEliminar" runat="server" Text="Eliminar" OnClick="lnkEliminar_Click" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Estás seguro de eliminar al médico seleccionado?');"></asp:LinkButton>
                                    </td>
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("Nombre") %></td>
                                    <td><%# Eval("Apellidos") %></td>
                                    <td><%# Eval("Edad") %></td>
                                    <td><%# Convert.ToDateTime(Eval("FechaNacimiento")).ToString("dd/MM/yyyy") %></td>
                                    <td><%# Eval("Especialidad") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</asp:Content>
