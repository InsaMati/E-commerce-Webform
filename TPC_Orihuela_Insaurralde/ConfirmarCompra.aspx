<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ConfirmarCompra.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ConfirmarCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Confirmacion</h1>
    <hr />

    <div class="container">
        <div class="row">
            <p style="font-size: 15px">Detalle</p>
            <div class="col-md-12">
                <table class="table table-hover table-bordered">
                    <thead class="thead-dark text-center" style="font-size: 17px">
                        <tr>
                            <th>Nombre</th>
                            <th>Cantidad</th>
                            <th>Precio</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% if (ElementosCarrito != null)
                            { %>
                        <%foreach (var Item in ElementosCarrito)
                            {
                        %>

                        <tr class="table-light text-center">
                            <td style="font-size: 14px"><% = Item.articulo.Nombre%></td>
                            <td style="font-size: 14px"><% = Item.Cantidad %></td>
                            <td style="font-size: 14px">$ <% = Item.articulo.Precio %> c/u</td>

                        </tr>
                        <% } %>
                        <% } %>
                    </tbody>
                </table>


            </div>
        </div>

        <div class="row">
            <p style="font-size: 15px">Envio</p>
            <div class="col-md-12">
                <% if (InfoEnvio != null)
                    { %>

                <p><% = InfoEnvio.Correo %></p>
                <p><% = InfoEnvio.Localidad %></p>
                <p><% = InfoEnvio.Calle + " " + InfoEnvio.EntreCalles %></p>
                <p><% = InfoEnvio.CodigoPostal %></p>

                <%} %>
            </div>
        </div>

        <div class="row">
            <p style="font-size: 15px">Medio de Pago</p>
            <div class="col-md-12">

                <%switch (MedioPago)
                    { %>

                <%case 1:  %>
                <%break; %>

                <%case 2: %>
                <p>Tarjeta Credito/Debito</p>
                <p>Cuotas <% = Cuotas %></p>
                <p>Total <% = Total / Cuotas %></p>
                <% break; %>
                <%} %>
            </div>
        </div>
    </div>

    <center>
 <asp:Button ID="BtnConfirmarCompra" Text="Confirmar" CssClass="btn btn-outline-success" Style="font-size: 18px;" runat="server" />
    </center>
</asp:Content>
