<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLCategoria.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
       <table class="table table-hover table-bordered">
            <thead class="thead-dark text-center" style="font-size: 14px">
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
                        <a href="AMBLCategoria.aspx?ID=<% = Item.Id %>" class="btn btn-primary badge-pill" style="font-size: 15px; color: white; text-decoration: none">Editar</a>
                        <a href="AMBLCategoria.aspx?ID=<% = Item.Id %>" class="btn btn-danger badge-pill" style="font-size: 15px; color: white; text-decoration: none">Eliminar</a>
                    </td>
                </tr>


                <% } %>
                <% } %>
            </tbody>
        </table>

        <center>
        <asp:Button ID="BtnAgregar" class="btn btn-primary" Style="font-size:15px" Text="Agregar" runat="server" />
        <asp:Button ID="BtnVolver" class="btn btn-danger" Style="font-size:15px" Text="Volver" runat="server" />
        </center>
    </div>

</asp:Content>
