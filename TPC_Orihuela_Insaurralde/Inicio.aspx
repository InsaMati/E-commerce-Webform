<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>

    <div class="container" id="ContainerProductos">
        <div class="col-md-12">
            <h1 class="text-center">Productos</h1>
            <hr />
        </div>
   
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <p style="font-size: 18px">Marca</p>
                    <asp:DropDownList ID="DdMarca" Style="font-size: 15px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p style="font-size: 18px">Categoria</p>
                    <asp:DropDownList ID="DdCategoria" Style="font-size: 15px" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <p style="font-size: 18px">Precio Minimo</p>
                    <asp:TextBox ID="txtPrecioMin" Style="font-size: 15px" CssClass="form-control" runat="server" />

                </div>
                <div class="col-lg-4">
                    <p style="font-size: 18px">Precio Maximo</p>
                    <asp:TextBox ID="txtPrecioMax" Style="font-size: 15px" CssClass="form-control" runat="server" />

                </div>
                <br />
                <div class="col-lg-4">
                    <asp:Button Text="Filtrar" ID="btnFiltrar" Style="font-size: 15px;" CssClass="btn btn-outline-secondary" runat="server" OnClick="btnFiltrar_Click" />
                </div>

            </div>
            <hr />
        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <p style="font-size: 18px">Buscador</p>
                    <asp:TextBox runat="server" ID="TxtFiltro" Style="font-size: 15px" CssClass="form-control" OnKeyPress="return disableEnterKey(event);" type="search" />
                    <br />
                    <asp:Button ID="BtnBuscar" Text="Buscar" Style="font-size: 15px;" CssClass="btn btn-outline-secondary" runat="server" OnClick="BtnBuscar_Click" />


                    <hr />
                </div>
                <asp:Repeater runat="server" ID="RepetidorArticulos">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <%if (Logueado != null)
                                { %>
                            <%if (Logueado.TipoUsuario.Id >= 1 && Logueado.TipoUsuario.Id <= 2)
                                { %>
                            <div style="text-align: right">
                                <a href="ProductoAModificar.aspx?Pro=<%#Eval("Id")%>"><i class="fas fa-edit" style="font-size: 22.5px; color: blueviolet; text-decoration: none"></i></a>
                                <a href="ABMLProducto.aspx?Pro=<%#Eval("Id") %>"><i class="fas fa-trash-alt" style="font-size: 22.5px; color: red; text-decoration: none"></i></a>
                                <br />
                                <br />
                            </div>
                            <%} %>
                            <%} %>
                            <div class="card">
                                <img src="<%#Eval("UrlImagen") %>" class="card-img-top" height="300" width="100" alt="Error Producto" />
                                <br />
                                <div class="card-body cards">
                                    <h5 class="card-title" style="font-size: 15px"><%#Eval("Nombre") %></h5>
                                    <p class="card-text" style="font-size: 15px"><%#Eval("Descripcion") %></p>
                                    <p class="card-text" style="font-size: 12px">$ <%#Eval("Precio") %></p>
                                </div>
                            </div>
                            <a class="btn btn-secondary" style="font-family: 'Titillium Web', sans-serif; font-weight: 600; font-size: 15px; background-color: #8FCA00; border: none; justify-content: center; display: flex; height: 35px; color: #ffffff" href="ProductoSeleccionado.aspx?id=<%#Eval("Id")%>">Ver</a>
                            <br />
                            <hr />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>

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
