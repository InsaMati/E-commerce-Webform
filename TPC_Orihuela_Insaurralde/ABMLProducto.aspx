<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLProducto.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <table class="table table-hover table-bordered">
            <thead class="thead-dark text-center" style="font-size: 14px">
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Marca</th>
                    <th>Precio</th>
                    <th>Imagen</th>
                    <th class="text-right" style="width:200px">Acciones</th>

                </tr>
            </thead>
            <tbody>
                <% if (Lista != null)
                    { %>
                <%foreach (var Item in Lista)
                    {
                %>

                <tr class="table-light text-center">
                    <td style="font-size: 12px"><% = Item.Codigo %></td>
                    <td style="font-size: 12px"><% = Item.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.Categoria.Nombre %></td>
                    <td style="font-size: 12px"><% = Item.Marca.Nombre %></td>
                    <td style="font-size: 12px">$<% = Item.Precio %></td>
                    <td>
                        <img src="<% =Item.UrlImagen %>" alt="Alternate Text" width="80" height="80" /></td>
                    <td class="text-right">
                        <a href="ProductoA.aspx?Pro=<% = Item.Id %>" class="btn btn-primary badge-pill" style="font-size: 15px; color: white; text-decoration: none">Editar</a>
                        <a href="ABMLProducto.aspx?Pro=<% = Item.Id %>" class="btn btn-danger badge-pill" style="font-size: 15px; color: white; text-decoration: none">Eliminar</a>
                    </td>
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
