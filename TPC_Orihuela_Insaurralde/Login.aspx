<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Login</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="E-mail" Style="font-size: 15px; color: black; font-weight: 700" runat="server" />
                <asp:TextBox ID="TxtEmail" runat="server" Style="font-size: 15px" CssClass="form-control" />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Contraseña" Style="font-size: 15px; color: black; font-weight: 700" runat="server" />
                <asp:TextBox ID="TxtPassword" runat="server" Style="font-size: 15px" TextMode="Password" CssClass="form-control" />
            </div>

            <div class="col-md-4">
                <br />
                <asp:Button ID="BtnIngresar" Text="Ingresar" CssClass="btn btn-danger" Style="font-size: 18px;" runat="server" />
                <a href="#" style="font-size: 15px">¿Olvidaste tu contraseña?</a>
            </div>

        </div>
    </div>

    <hr />
    <center>

        <asp:Label Text="¿Todavia no estas registrado?" runat="server" Style="font-size: 15px" />
                <asp:Button ID="BtnRegistrate" Text="Registrate" CssClass="btn btn-danger" Style="font-size: 18px;" runat="server" OnClick="BtnRegistrate_Click" />
    </center>

    <br />


</asp:Content>
