<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductoSeleccionado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoSeleccionado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <img src="<% = MostrarArticulo.UrlImagen %>" width="250" height="300" alt="No se encontro la imagen" />
    <h5><% = MostrarArticulo.Nombre %> </h5>
    <p><% = MostrarArticulo.Descripcion %> </p>
    <p>Precio: <% = MostrarArticulo.Precio %> </p>

    <asp:Label Text="Cantidad" runat="server"></asp:Label>
    <asp:TextBox ID="TxtCantidad" Height="25px" Width="25px" runat="server" ></asp:TextBox>
    <asp:Button ID="BtnDisminuir" CssClass="btn btn-primary" runat="server" Text="-" Height="40px" Width="44px" OnClick="BtnDisminuir_Click"  />
    <asp:Button ID="BtnAumentar" CssClass="btn btn-primary" runat="server" Text="+" Height="40px" Width="44px" OnClick="BtnAumentar_Click" />

    <br />
    <br />

    <asp:Button ID="BtnAgregar" Text="Agregar" CssClass="btn btn-success" runat="server" OnClick="BtnAgregar_Click" />


</asp:Content>
