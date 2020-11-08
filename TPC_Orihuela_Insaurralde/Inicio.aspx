<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="ContainerProductos">
        <div class="col-md-12">
            <h1 class="text-center">Productos</h1>
            <hr />
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <p style="font-size:18px">Marca</p>
                    <asp:DropDownList ID="DdMarca" Style="font-size: 15px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p style="font-size:18px">Categoria</p>
                    <asp:DropDownList ID="DdCategoria" Style="font-size: 15px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p style="font-size:18px">Precios</p>
                    <asp:DropDownList ID="DdPrecios" Style="font-size: 15px" CssClass="form-control" runat="server">
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
                    <a class="btn btn-secondary" style="font-family: 'Titillium Web', sans-serif;font-weight:600;font-size: 15px; background-color: #8FCA00;border:none; justify-content: center; display: flex; height: 35px;color:#ffffff" href="ProductoSeleccionado.aspx?id=<%#Eval("Id")%>">Ver</a>
                    <br />
                    <hr />
                    <br />
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="container-fluid mb-5">
        <div class="text-center">
            <h1>Servicios</h1>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box">
                    <div class="our-services settings">
                        <h4>Settings</h4>
                        <br />
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        <span><i class="fab fa-cc-visa"></i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box">
                    <div class="our-services speedup">
                        <h4>Speedup</h4>
                        <br />
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        <span><i class="fab fa-cc-visa"></i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box">
                    <div class="our-services privacy">
                        <h4>Privacy</h4>
                        <br />
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit </p>
                        <span><i class="fab fa-cc-visa"></i></span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
