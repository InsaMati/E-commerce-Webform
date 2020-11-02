<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="http://www.prodirectsoccer.com/it/siteimages/responsive/desktop/puma/tricks/framework/billboards/evoSPEED/evoSPEED-Banner-1.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.denimandcloth.com.au/content/uploads/2014/11/20133541/adidas-banner.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://images.sportsdirect.com/images/marketing/nike_football_landing_page_banner_fast.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <br />
    <hr />
    <br />
    <div class="container">
        <asp:Repeater runat="server" ID="RepetidorArticulos">
            <ItemTemplate>
                <div class="col-md-3">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="Error Producto" />
                        <br />
                        <div class="card-body cards">
                            <h5 class="card-title" style="font-size: 15px"><%#Eval("Nombre") %></h5>
                            <p class="card-text" style="font-size: 12px">$ <%#Eval("Precio") %></p>
                        </div>
                    </div>
                    <a class="btn btn-secondary" style="font-size: 15px; background-color: orangered" href="ProductoSeleccionado.aspx?id=<%#Eval("Id")%>">Detalle</a>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <br />
    <hr />
    <br />
    <div class="container">
        <h1>3 Columnas</h1>

    </div>
    <br />
    <hr />
    <br />

    <div class="container">
        <h1>Formulario de contacto</h1>
        <br />



    </div>

</asp:Content>
