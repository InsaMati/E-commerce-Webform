<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <table class="table">
        <tr>
            <td>
                <h3>NOMBRE   </h3>
            </td>
            <td>
                <h3>CANTIDAD </h3>
            </td>
            <td>
                <h3>PRECIO </h3>
            </td>
            <td>
                <h3>SUBTOTAL </h3>
            </td>
            <td>
                <h3 style="color: red">ELIMINAR </h3>
            </td>
        </tr>
        <% if (ElementoC != null)
            {%>
        <% foreach (var item in ElementoC)
            {%>
        <tr>
            <td>
                <% = item.articulo.Nombre%>
            </td>
            <td>
                <% = item.Cantidad %>
            </td>
            <td>
                <% = item.articulo.Precio %>
            </td>
            <td>
                <% = item.SubTotal %>
            </td>
            <td>
                <a href="Carrito.aspx?id=<% = item.articulo.Id %>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            </td>

        </tr>

        <%} %>
        <%} %>
    </table>

    <asp:Button Text="Vaciar" ID="btnVaciar" runat="server" class="btn btn-primary" OnClick="btnVaciar_Click" />
    &nbsp
    <asp:Button Text="Volver" ID="btnVolver" class="btn btn-primary" runat="server" OnClick="btnVolver_Click" />
    &nbsp
    <asp:Button Text="Comprar" runat="server" class="btn btn-success" />




</asp:Content>
