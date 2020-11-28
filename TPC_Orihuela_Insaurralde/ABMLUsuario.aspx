<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ABMLUsuario.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Administracion de Usuarios</h1>
    <hr />
    <div class="container">

        <table class="table table-hover table-bordered">
            <thead class="thead-light text-center" style="font-size: 14px">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Contraseña</th>
                    <th>Tipo Usuario</th>
                    <th>Acciones</th>

                </tr>
            </thead>
            <tbody>
                <% if (Lista != null)
                    { %>
                <%foreach (var Item in Lista)
                    {
                %>

                <tr class="table-light text-center">
                    <td style="font-size: 12px"><% = Item.Id %></td>
                    <td style="font-size: 12px"><% = Item.Email %></td>
                    <td style="font-size: 12px"><% = Item.Contraseña %></td>
                    <td style="font-size: 12px"><% = Item.TipoUsuario.Nombre %></td>
                    <td class="text-right">
                        <a href="UsuarioaModificar.aspx?Pro=<% = Item.Id %>" class="btn btn-outline-primary badge-pill" style="font-size: 15px; text-decoration: none">Editar</a>
                        <a href="ABMLUsuario.aspx?User=<% = Item.Id %>" class="btn btn-outline-danger badge-pill" style="font-size: 15px; text-decoration: none">Eliminar</a>
                    </td>
                </tr>

                <% } %>
                <% } %>
            </tbody>
        </table>
        <div class="col-md-12" style="text-align: center">
            <asp:Button class="btn btn-outline-primary" Style="font-size: 15px" Text="Agregar" runat="server" ID="BtnAgregar" OnClick="BtnAgregar_Click" />
            <asp:Button class="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click" />
        </div>
    </div>
    <hr />
</asp:Content>
