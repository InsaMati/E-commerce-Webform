<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ConfirmarCompra.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ConfirmarCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="font-size: 25px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Confirmacion</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 style="font-size: 18.5px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Detalle</h1>
                <hr />
                <table class="table table-hover table-bordered">
                    <thead class="thead-light text-center" style="font-size: 12px">
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
                            <td style="font-size: 14px">$<% = Item.articulo.Precio %> c/u</td>

                        </tr>
                        <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
                <h1 style="font-size: 18.5px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Datos Envio</h1>
                <hr />
                <table class="table table-hover table-bordered">
                    <thead class="thead-light text-center" style="font-size: 12px">
                        <tr>
                            <th>Correo</th>
                            <th>Localidad</th>
                            <th>Direccion</th>
                            <th>Codigo Postal</th>

                        </tr>
                    </thead>
                    <tbody>

                        <%if (InfoEnvio != null)
                            { %>

                        <tr class="table-light text-center">
                            <td style="font-size: 14px"><% = InfoEnvio.Correo %></td>
                            <td style="font-size: 14px"><% = InfoEnvio.Localidad %></td>
                            <td style="font-size: 14px"><% = InfoEnvio.Calle + " " + InfoEnvio.EntreCalles %></td>
                            <td style="font-size: 14px"><% = InfoEnvio.CodigoPostal %></td>

                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>

            <div class="col-md-12">
                <h1 style="font-size: 18.5px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Medio de Pago</h1>
                <hr />
                <table class="table table-hover table-bordered">
                    <thead class="thead-light text-center" style="font-size: 12px">
                        <tr>
                            <th>Medio Pago</th>
                            <%if (MedioPago == 2)
                                { %>
                            <th>Cuotas</th>
                            <th>Pagos de</th>
                            <%} %>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%switch (MedioPago)
                            { %>


                        <%case 2: %>
                        <tr class="table-light text-center">
                            <td style="font-size: 14px">Tarjeta Credito/Debito</td>
                            <td style="font-size: 14px"><% = Cuotas %></td>
                            <td style="font-size: 14px">$<% = Total / Cuotas %></td>
                            <td style="font-size: 14px">$<% = Total%></td>
                        </tr>
                        <% break; %>

                        <%case 5:%>
                        <tr class="table-light text-center">
                            <td style="font-size: 14px">MercadoPago</td>
                            <td style="font-size: 14px">$<% = Total%></td>
                        </tr>
                        <% break; %>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-12" style="text-align: center">
        <asp:Button ID="BtnConfirmarCompra" Text="Confirmar" CssClass="btn btn-outline-success" Style="font-size: 18px;" runat="server" OnClick="BtnConfirmarCompra_Click" />
    </div>
</asp:Content>
