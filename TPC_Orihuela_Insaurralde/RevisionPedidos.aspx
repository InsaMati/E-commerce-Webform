<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="RevisionPedidos.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.RevisionPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Revision de pedidos</h1>
    <hr />
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark text-center" style="font-size: 14px">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                    <th>Correo</th>
                    <th>Localidad</th>
                    <th>Calle y Entre Calles</th>
                    <th>Codigo Postal</th>
                </tr>
            </thead>
            <tbody>

                <% if (Lista != null)
                    { %>
                <%foreach (var Item in Lista)
                    {
                %>

                <tr class="table-light text-center">
                    <td style="font-size: 12px"><% = Item.Articulo.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.ElementoCarrito.Cantidad %></td>
                    <td style="font-size: 12px">$<% = Item.ElementoCarrito.SubTotal %></td>
                    <td style="font-size: 12px"><% = Item.DatosEnvio.Correo %></td>
                    <td style="font-size: 12px"><% = Item.DatosEnvio.Localidad %></td>
                    <td style="font-size: 12px"><% = Item.DatosEnvio.Calle %> <%= Item.DatosEnvio.EntreCalles %></td>
                    <td style="font-size: 12px"><% = Item.DatosEnvio.CodigoPostal %></td>

                </tr>

                <% } %>
                <% } %>
            </tbody>
        </table>

        <center>
       
        <asp:Button class="btn btn-outline-danger" Style="font-size:15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click" />
                </center>

    </div>
</asp:Content>
