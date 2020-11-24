<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="CategoriaA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.CategoriaA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Registro de Categoria</h1>
    <hr />
    <div class="container">
        <div class="row">   
            <div>
                <center>
                    <asp:Label Text="Categoria" runat="server" />
                    <br />
                    <asp:TextBox ID="txtCategoria" runat="server" />
                    <asp:Button Text="Agregar" ID="btnAgregar"  class="btn btn-primary" runat="server" OnClick="btnAgregar_Click" />
                </center>
            </div>
        </div>
    </div>
    <hr />
</asp:Content>
