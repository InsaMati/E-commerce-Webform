﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductoA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Codigo" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtCodigo" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Nombre" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtNombre" runat="server" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Descripcion" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtDescripcion" runat="server" />
                <br />
                <br />
            </div>



            <div class="col-md-4">
                <asp:Label Text="Marca" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDMarca" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Categoria" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDCategoria" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Imagen" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtImagen" runat="server" />
                <br />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Precio" Style="font-size: 15px; color: orangered" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtPrecio" />
                <br />
            </div>

        </div>
    </div>
    <center>
    <asp:Button Text="Agregar" ID="BtnAgregar" class="btn btn-primary" Style="font-size:15px;background-color:orangered" runat="server"/>
        <asp:Button Text="Volver" ID="BtnVolver" class="btn btn-primary" Style="font-size:15px;background-color:orangered" runat="server"/>
  </center>
</asp:Content>
