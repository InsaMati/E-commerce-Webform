<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductoSeleccionado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoSeleccionado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="Container">
        <div class="row">
            <div class="col-md-4">
                <h1 style="font-size:20px;font-family:'Agency FB';font-style:oblique;text-align:center"><b>Imagen</b></h1>
                <hr />
                <center>
                <img src="<% = MostrarArticulo.UrlImagen %>" width="250" height="280" alt="No se encontro la imagen" />
                </center>
            </div>
            <div class="col-md-4">
                <h1 style="font-size:20px;font-family:'Agency FB';font-style:oblique;text-align:center"><b>Ficha Tecnica</b></h1>
                <hr />
                <h5 style="font-size:15px"><% = MostrarArticulo.Nombre %> </h5>
                <p style="font-size:12px"><% = MostrarArticulo.Descripcion %> </p>
                <p style="font-size:12px">Precio: $<% = MostrarArticulo.Precio %> </p>
            </div>

            <div class="col-md-4">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <h1 style="font-size:20px;font-family:'Agency FB';font-style:oblique;text-align:center"><b>Acciones</b></h1>
                        <hr />
                        <asp:Label Text="Cantidad" Style="font-size:15px" runat="server"></asp:Label>
                        <asp:TextBox ID="TxtCantidad" Height="25px" Width="25px" runat="server"></asp:TextBox>
                        <asp:Button ID="BtnDisminuir" CssClass="btn btn-outline-danger" Style="font-size:22px" runat="server" Text="-" Height="40px" Width="44px" OnClick="BtnDisminuir_Click" />
                        <asp:Button ID="BtnAumentar" CssClass="btn btn-outline-danger" Style="font-size:22px" runat="server" Text="+" Height="40px" Width="44px" OnClick="BtnAumentar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />

                <asp:Button ID="BtnAgregar" Text="Agregar" Style="font-size:15px"  CssClass="btn btn-outline-success" runat="server" OnClick="BtnAgregar_Click" />

            </div>

        </div>
    </div>

    <br />
    <br />






</asp:Content>
