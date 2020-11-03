<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductoSeleccionado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoSeleccionado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <img src="<% = MostrarArticulo.UrlImagen %>" width="250"  height="300" alt="No se encontro la imagen" />
    <h5> <% = MostrarArticulo.Nombre %> </h5>
    <p> <% = MostrarArticulo.Descripcion %> </p>
    <p> Precio: <% = MostrarArticulo.Precio %> </p>


</asp:Content>
