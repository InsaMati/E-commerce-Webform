<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLProducto.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr class="bg-whitesmoke" style="color: orangered; font-size: 15px; font-style: italic">
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Categoria</td>
                        <td>Marca</td>
                        <td>Precio</td>
                        <td>Imagen</td>
                        <td>Eliminar</td>
                        <td>Modificar</td>
                        <td>Ver</td>
                    </tr>

                    <% if (Lista != null)
                        { %>
                    <%foreach (var Item in Lista)
                        {
                    %>

                    <tr>
                        <td style="font-size: 12px"><% = Item.Codigo %></td>
                        <td style="font-size: 12px"><% = Item.Nombre %></td>
                        <td style="font-size: 12px"><% = Item.Categoria.Nombre %></td>
                        <td style="font-size: 12px"><% = Item.Marca.Nombre %></td>
                        <td style="font-size: 12px"><% = Item.Precio %></td>
                        <td><img src="<% =Item.UrlImagen %>" alt="Alternate Text" width="100" height="80" /></td>
                        <td><span style="font-size: 15px; color: orangered" class="glyphicon glyphicon-remove"></span></td>
                        <td><span style="font-size: 15px; color: orangered" class="glyphicon glyphicon-pencil"></span></td>
                        <td><span style="font-size: 15px; color: orangered" class="glyphicon glyphicon-eye-open"></span></td>
                    </tr>


                    <% } %>
                    <% } %>
                </table>
                <br />
                <br />
                <center>
        <asp:Button class="btn btn-primary" Style="font-size:15px" Text="Agregar" runat="server" ID="BtnAgregar" OnClick="BtnAgregar_Click" />
        <asp:Button class="btn btn-danger" Style="font-size:15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click1" />
                </center>

            </div>

        </div>
    </div>

</asp:Content>
