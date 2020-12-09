<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MisCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Mis Compras</h1>
    <hr />
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead class="thead-light text-center" style="font-size: 14px">
                <tr>
                    <th>Nro Remito</th>
                    <th>Estado</th>
                    <th>Fecha</th>
                    <th>Forma de Pago</th>
                    <th>Importe</th>
                    <th class="text-right" style="width: 250px">Acciones</th>

                </tr>
            </thead>
            <tbody>
                <% if (ListaF != null)
                    { %>
                <%foreach (var Item in ListaF)
                    {
                %>

                <tr class="table-light text-center">
                    <td style="font-size: 12px"><% = Item.IDPedido %></td>
                    <td style="font-size: 12px"><% = Item.EstadoPedidos.Descripcion %></td>
                    <td style="font-size: 12px"><% = Item.FechaFactura.Day + "/" + Item.FechaFactura.Month + "/" + Item.FechaFactura.Year %></td>
                    <td style="font-size: 12px"><% = Item.TipoDePago.Descripcion %></td>
                    <td style="font-size: 12px">$<% = Item.Importe %></td>
                    <td class="text-right">
                        <a href="VerPedido.aspx?IdPedido=<% = Item.IDPedido %>" class="btn btn-outline-primary badge-pill" style="font-size: 15px; text-decoration: none; width: 100px">Ver</a>

                        <% if (Item.EstadoPedidos.Id ==  ) {%>
                        <%} %>
                    </td>
                </tr>


                <% } %>
                <% } %>
            </tbody>
        </table>
        <div class="col-md-12" style="text-align:center">
            <asp:Button class="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click" />
        </div>
    </div>
</asp:Content>
