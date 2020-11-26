<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="RecuperacionPassword.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.RecuperacionPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recuperar contraseña</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:Label Text="Ingresá el e-mail con el que te registraste" Style="font-size: 15px; color:black;font-weight:700" runat="server" />
                <br />
                <br />
                <asp:TextBox ID="txtEmail" runat="server"  Style="font-size: 15px;" CssClass="form-control" />
                <br />
                <asp:Button Text="Continuar" Style="font-size: 15px;" CssClass="btn btn-dark" runat="server" />
            </div>
        </div>
    </div>
    <hr />


</asp:Content>
