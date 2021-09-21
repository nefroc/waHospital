<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="facturacion.aspx.cs" Inherits="waHospital.facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.css") %>" rel="stylesheet">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.css") %>" rel="stylesheet">
    <link href="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-datepicker/bootstrap-datepicker.css") %>" rel="stylesheet">
    <br />
    <br />
    <div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    </div>
    <div class="row">
        <div class="col-3">
            <h4>Facturacion</h4>
            <div class="form-group">
                <label>Fecha Inicial</label>
                <asp:TextBox ID="txtFechaInicial" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Fecha Final</label>
                <asp:TextBox ID="txtFechaFinal" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Periodicidad</label>
                <asp:DropDownList ID="ddlPeriodicidad" runat="server" CssClass="form-control">
                    <asp:ListItem Text="MENSUAL" Value="1"></asp:ListItem>
                    <asp:ListItem Text="BIMESTRAL" Value="2"></asp:ListItem>
                    <asp:ListItem Text="SEMESTRAL" Value="6"></asp:ListItem>
                    <asp:ListItem Text="ANUAL" Value="12"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Día Corte</label>
                <asp:TextBox ID="txtDiaCorte" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Día Impresión</label>
                <asp:TextBox ID="txtDiaImpresion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>FECHA INICIAL</th>
                            <th>FECHA FINAL</th>
                            <th>DIA IMPRESION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rFechas" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Convert.ToDateTime(Eval("fechaInicial")).ToString("dd/MM/yyyy") %></td>
                                    <td><%# Convert.ToDateTime(Eval("fechaFinal")).ToString("dd/MM/yyyy") %></td>
                                    <td><%# Convert.ToDateTime(Eval("diaImpresion")).ToString("dd/MM/yyyy") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<%= Page.ResolveUrl("~/dist/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js") %>"></script>
    <script type="text/javascript">
        jQuery('#<%= txtFechaInicial.ClientID %>').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: 'dd/mm/yyyy'
        });

        jQuery('#<%= txtFechaFinal.ClientID %>').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: 'dd/mm/yyyy'
        });
    </script>
</asp:Content>
