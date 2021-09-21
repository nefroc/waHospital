<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="nuevoMedico.aspx.cs" Inherits="waHospital.nuevoMedico" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.css") %>" rel="stylesheet">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.css") %>" rel="stylesheet">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-datepicker/bootstrap-datepicker.css") %>" rel="stylesheet">
    <br /><br />
    <div class="row">
        <div class="col-2">
        </div>
        <div class="col-8">
            <h3>Nuevo Médico</h3>
            <p class="text-center text-danger">
                <asp:Label ID="lblMensaje" runat="server" Font-Bold="true"></asp:Label>
            </p>
            <div class="form-group">
                <label>Nombre</label><asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Apellidos</label><asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txtApellidos" ErrorMessage="*" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Fecha de Nacimiento</label><asp:RequiredFieldValidator ID="rfvFechaNac" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Especialidad</label><asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="txtEspecialidad" ErrorMessage="*" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <p class="text-center">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-danger" OnClick="btnSalir_Click" CausesValidation="false" />
            </p>
        </div>
        <div class="col-2">
        </div>
    </div>

    <script src="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js") %>"></script>
    <script type="text/javascript">
        jQuery('#<%= txtFechaNacimiento.ClientID %>').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: 'dd/mm/yyyy'
        });
    </script>
</asp:Content>
