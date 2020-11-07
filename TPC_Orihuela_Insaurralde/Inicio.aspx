<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="carouselexamplecontrols" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="http://www.prodirectsoccer.com/it/siteimages/responsive/desktop/puma/tricks/framework/billboards/evospeed/evospeed-banner-1.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.denimandcloth.com.au/content/uploads/2014/11/20133541/adidas-banner.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://images.sportsdirect.com/images/marketing/nike_football_landing_page_banner_fast.jpg" width="150" height="380" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselexamplecontrols" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselexamplecontrols" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">next</span>
        </a>
    </div>

    <hr />
    <div class="container" id="ContainerProductos">
        <div class="col-md-12">
            <h1>Productos</h1>
            <hr />
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <p>Marca</p>
                    <asp:DropDownList ID="DdMarca" Style="font-size: 12px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p>Categoria</p>
                    <asp:DropDownList ID="DdCategoria" Style="font-size: 12px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p>Precios</p>
                    <asp:DropDownList ID="DdPrecios" Style="font-size: 12px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <hr />
        <asp:Repeater runat="server" ID="RepetidorArticulos">
            <ItemTemplate>
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" height="300" width="100" alt="Error Producto" />
                        <br />
                        <div class="card-body cards">
                            <h5 class="card-title" style="font-size: 15px"><%#Eval("Nombre") %></h5>
                            <p class="card-text" style="font-size: 15px"><%#Eval("Descripcion") %></p>
                            <p class="card-text" style="font-size: 12px">$ <%#Eval("Precio") %></p>
                        </div>
                    </div>
                    <a class="btn btn-secondary" style="font-size: 18px; background-color: orangered; justify-content: center; display: flex; height: 35px" href="ProductoSeleccionado.aspx?id=<%#Eval("Id")%>"><span class="glyphicon glyphicon-eye-open" style="font-size: 20px"></span>&nbsp;&nbsp;Detalle</a>

                    <br />
                    <hr />
                    <br />
                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>
    <hr />
    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-4" style="background-color: orangered">
                <h1>Columna 1</h1>
                <img src="https://www.whats-on-netflix.com/wp-content/uploads/2018/09/naruto-on-netflix.jpg" width="300" height="200" alt="Alternate Text" /><br />
                <br />
            </div>
            <div class="col-lg-4" style="background-color: orange">
                <h1>Columna 2</h1>
                <img src="https://www.whats-on-netflix.com/wp-content/uploads/2018/09/naruto-on-netflix.jpg" width="300" height="200" alt="Alternate Text" /><br />
                <br />
            </div>
            <div class="col-lg-4" style="background-color: orangered">
                <h1>Columna 3</h1>
                <img src="https://www.whats-on-netflix.com/wp-content/uploads/2018/09/naruto-on-netflix.jpg" width="300" height="200" alt="Alternate Text" /><br />
                <br />
            </div>
        </div>

    </div>

    <br />
    <hr />
    <br />

    <div class="container" id="ContainerContacto">
        <h1>Formulario de contacto</h1>
        <center>
        <asp:Label Text="Email" runat="server" />
        <asp:TextBox runat="server" CssClass="form-control" /><br />
            <asp:Label Text="Nombre" runat="server" />
        <asp:TextBox runat="server" CssClass="form-control"/><br />
        <asp:Label Text="Motivo" runat="server" />
        <asp:TextBox runat="server" CssClass="form-control"/><br />
            <asp:textbox CssClass="form-control" runat="server" TextMode="MultiLine" />
            <br />
            <asp:button class="btn btn-success" Style="font-size:15px;background-color:orangered" text="Enviar" runat="server" />
        </center>
        <br />



    </div>

</asp:Content>
