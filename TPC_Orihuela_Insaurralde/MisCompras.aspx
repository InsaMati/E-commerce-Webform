<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Mis Compras</h1>
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
                            <a class="btn btn-secondary" style="font-family: 'Titillium Web', sans-serif; font-weight: 600; font-size: 15px; background-color: #8FCA00; border: none; justify-content: center; display: flex; height: 35px; color: #ffffff" href="ProductoSeleccionado.aspx?id=<%#Eval("Id")%>">Ver</a>
                            <br />
                            <hr />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

</asp:Content>
