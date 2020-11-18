<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="UsuarioaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.UsuarioaModificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Modificacion de Usuario</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Email" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtEmail" CssClass="form-control" Style="font-size: 15px" runat="server" />

            </div>
            <div class="col-md-4">
                <asp:Label Text="Contraseña" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtContraseña" CssClass="form-control" Style="font-size: 15px" runat="server" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Tipo Usuario" Style="font-size: 15px" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDTipoUsuario" />
            </div>
        </div>

    </div>
    <br />
    <center>
    <asp:Button ID="BtnModificar" CssClass="btn btn-outline-primary" Style="font-size: 15px" Text="Modificar" runat="server" />
        &nbsp;&nbsp;
    <asp:Button ID="BtnVolver" CssClass="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" />
</center>

</asp:Content>
