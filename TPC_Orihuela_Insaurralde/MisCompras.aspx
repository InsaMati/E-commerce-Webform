<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MisCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Mis Compras</h1>
    <hr />
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark text-center" style="font-size: 14px">
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
                        <a href="#" class="btn btn-primary badge-pill" style="font-size: 15px; color: white; text-decoration: none;width:100px">Ver</a>
                    </td>
                </tr>


                <% } %>
                <% } %>
            </tbody>
        </table>
</asp:Content>
