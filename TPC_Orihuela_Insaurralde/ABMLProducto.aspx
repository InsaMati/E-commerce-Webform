<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLProducto.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <table class="table table-hover table-bordered">
            <thead class="thead-dark" style="font-size: 14px">
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Marca</th>
                    <th>Precio</th>
                    <th>Imagen</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                    <th>Ver</th>

                </tr>
            </thead>
            <tbody>
                <% if (Lista != null)
                    { %>
                <%foreach (var Item in Lista)
                    {
                %>

                <tr class="table-light">
                    <td style="font-size: 12px"><% = Item.Codigo %></td>
                    <td style="font-size: 12px"><% = Item.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.Categoria.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.Marca.Nombre %></td>
                    <td style="font-size: 12px">$<% = Item.Precio %></td>
                    <td>
                    <img src="<% =Item.UrlImagen %>" alt="Alternate Text" width="80" height="80" /></td>
                    <td><a href="ABMLProducto.aspx?Pro=<% = Item.Id %>" class="glyphicon glyphicon-remove" style="font-size: 19px; color: red; text-decoration: none"></a></td>
                    <td><a href="#" class="glyphicon glyphicon-pencil" style="font-size: 19px; color: darkgreen; text-decoration: none"></a></td>
                    <td><a href="#" class="glyphicon glyphicon-eye-open" style="font-size: 19px; color: orangered; text-decoration: none"></a></td>
                </tr>


                <% } %>
                <% } %>
            </tbody>
        </table>
        <br />
        <br />
        <center>
        <asp:Button class="btn btn-primary" Style="font-size:15px" Text="Agregar" runat="server" ID="BtnAgregar" OnClick="BtnAgregar_Click" />
        <asp:Button class="btn btn-danger" Style="font-size:15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click1" />
                </center>
    </div>

</asp:Content>
