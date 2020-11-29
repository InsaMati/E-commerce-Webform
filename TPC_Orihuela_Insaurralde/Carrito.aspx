<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Carrito</h1>
    <hr />
    <table class="table table-hover table-bordered">
        <thead class="thead-dark text-center" style="font-size: 17px">
            <tr>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Imagen</th>
                <th>Precio</th>
                <th>Subtotal</th>
                <th>Eliminar</th>

            </tr>
        </thead>
        <tbody>
            <% if (ElementoC != null)
                { %>
            <%foreach (var Item in ElementoC)
                {
            %>

            <tr class="table-light text-center">
                <td style="font-size: 14px"><% = Item.articulo.Nombre%></td>
                <td style="font-size: 14px"><% = Item.Cantidad %></td>
                <td style="font-size: 14px">
                    <img src="<% = Item.articulo.UrlImagen %>" width="90" height="80" alt="ImagenProducto" /></td>
                <td style="font-size: 14px">$ <% = Item.articulo.Precio %> c/u</td>
                <td style="font-size: 14px">$ <% = Item.SubTotal %></td>
                <td><a href="Carrito.aspx?id=<% = Item.articulo.Id %>"><span class="glyphicon glyphicon-trash" style="font-size: 20px; color: red" aria-hidden="true"></span></a></td>
            </tr>


            <% } %>
            <% } %>
        </tbody>
    </table>
    <br />

    <asp:Button Text="Vaciar" ID="btnVaciar" runat="server" Style="font-size: 15px" class="btn btn-outline-danger" OnClick="btnVaciar_Click" />
    &nbsp
   
    <asp:Button Text="Volver" ID="btnVolver" Style="font-size: 15px" class="btn btn-outline-primary" runat="server" OnClick="btnVolver_Click" />
    &nbsp
   
    <asp:Button Text="Comprar" ID="BtnComprar" runat="server" Style="font-size: 15px" class="btn btn-outline-success" OnClick="BtnComprar_Click" />
    <hr />

     <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" style="font-size: 15px;">
            <div class="toast-header">
                <svg class="bg-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"></svg>
                <strong class="mr-auto">Bootstrap</strong>
                <small>11 mins ago</small>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                Probando
            </div>
        </div>

</asp:Content>
