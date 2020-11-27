<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ABMLMarca.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Administracion de Marcas</h1>
    <hr />
    <div class="container">
        <table class="table table-hover table-bordered">
            <thead class="thead-light text-center" style="font-size: 14px">
                <tr>
                    <th style="width:200px">Codigo</th>
                    <th style="width:200px" >Nombre</th>
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
                    <td style="font-size: 12px"><% = Item.Id %></td>
                    <td style="font-size: 12px"><% = Item.Nombre %></td>
                    <td class="text-right">
                        <a href="MarcaModificar.aspx?ID=<% = Item.Id %>" class="btn btn-outline-primary badge-pill" style="font-size: 15px; text-decoration: none">Editar</a>
                        <a href="ABMLMarca.aspx?ID=<% = Item.Id %>" class="btn btn-outline-danger badge-pill" style="font-size: 15px;text-decoration: none">Eliminar</a>
                    </td>
                </tr>


                <% } %>
                <% } %>
            </tbody>
        </table>

        <center>
        <asp:Button ID="BtnAgregar" class="btn btn-outline-primary" Style="font-size:15px" Text="Agregar" runat="server" OnClick="BtnAgregar_Click" />
        <asp:Button ID="BtnVolver" class="btn btn-outline-danger" Style="font-size:15px" Text="Volver" runat="server" OnClick="BtnVolver_Click" />
        </center>
    </div>
    <hr />
</asp:Content>
