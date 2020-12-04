<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Login</h1>
    <hr />
    <%if (alert == true)
        { %>
    <div class="alert alert-danger" style="font-size: 15px" role="alert">
        Email o contraseña incorrectos.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
    </div>
    <%} %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <center>
                        <asp:Label Text="E-mail" Style="font-size: 15px; color: black; font-weight: 700" runat="server" />
                        <asp:TextBox ID="TxtEmail" runat="server" Style="font-size: 15px" CssClass="form-control" />
                    
                        <br />  
                   
                        <asp:Label Text="Contraseña" Style="font-size: 15px; color: black; font-weight: 700" runat="server" />
                        <asp:TextBox ID="TxtPassword" runat="server" Style="font-size: 15px" TextMode="Password" CssClass="form-control" />
                   
                                <br />                                       
                        <asp:Button ID="BtnIngresar" Text="Ingresar" CssClass="btn btn-success" Style="font-size: 18px;" runat="server" OnClick="BtnIngresar_Click" />
                           <br />
                        <a href="RecuperacionPassword.aspx" style="font-size: 15px">¿Olvidaste tu contraseña?</a>
                       </center>
            </div>
        </div>
    </div>

    <hr />
    <center>

        <asp:Label Text="¿Todavia no estas registrado?" runat="server" Style="font-size: 15px" />
        <br />
        <asp:Button ID="BtnRegistrate" Text="Registrate" CssClass="btn btn-outline-success" Style="font-size: 18px;" runat="server" OnClick="BtnRegistrate_Click" />
    </center>

    <br />


</asp:Content>
