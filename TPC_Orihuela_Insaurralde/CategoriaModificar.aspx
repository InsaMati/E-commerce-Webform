<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="CategoriaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.CategoriaModificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <h1 style="font-size:20px">Modificacion de Categoria</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <asp:Label Text="Categoria a Modificar" Style="font-size: 13.5px; color: black; font-weight: 700" runat="server" />
                <asp:TextBox ID="txtCategoria" CssClass="form-control" style="font-size:13.5px" runat="server" ReadOnly="True" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Categoria Nueva" Style="font-size: 13.5px; color: black; font-weight: 700" runat="server" />
                <asp:TextBox ID="txtModificar" CssClass="form-control" style="font-size:13.5px" runat="server" />
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="col-md-12">
                <center>
                <asp:Button ID="btnModificar" Text="Modificar" style="font-size:15px" class="btn btn-outline-success" runat="server" OnClick="btnModificar_Click" /></center>
            </div>
        </div>
    </div>
    <hr />

 

</asp:Content>
