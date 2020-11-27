<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="VerPedido.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.VerPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Mis Compras</h1>
    <hr />
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead class="thead-light text-center" style="font-size: 14px">
                <tr>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <% if (Lista != null)
                    { %>
                <%foreach (var Item in Lista)
                    {
                %>

                <tr class="table-light text-center">
                    <td style="font-size: 12px"><% = Item.elementoCarrito.articulo.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.elementoCarrito.articulo.Descripcion %></td>
                    <td style="font-size: 12px"><% = Item.elementoCarrito.Cantidad %></td>
                    <td style="font-size: 12px"><% = Item.elementoCarrito.SubTotal %></td>
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
