<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductoSeleccionado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoSeleccionado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <img src="<% = MostrarArticulo.UrlImagen %>" width="250" height="300" alt="No se encontro la imagen" />
                <h5><% = MostrarArticulo.Nombre %> </h5>
                <p><% = MostrarArticulo.Descripcion %> </p>
                
            </div>

            <div class="col-md-6">
                <p>$<% = MostrarArticulo.Precio %> </p>
            </div>

        </div>
    </div>




</asp:Content>
