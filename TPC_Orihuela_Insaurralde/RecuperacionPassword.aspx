<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="RecuperacionPassword.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.RecuperacionPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Recuperar contraseña</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <% if (Alert == 1)
                    { %>
                <div class="alert alert-danger" style="font-size:15px" role="alert">
                    Email incorrecto, verificar.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>              
                <%} %>

                <% if (Alert == 2)
                    { %>
                <div class="alert alert-warning" style="font-size:15px" role="alert">
                    Campos vacios.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>              
                <%} %>

                <% if (Alert == 3)
                    { %>
                <div class="alert alert-success" style="font-size:15px" role="alert">
                    Email enviado.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>              
                <%} %>
                
                <asp:Label Text="Ingresá el e-mail con el que te registraste" OnKeyPress="return validarEmail(event);" Style="font-size: 15px; color: black; font-weight: 700" runat="server" />
                <br />
                <br />
                <asp:TextBox ID="txtEmail" runat="server" Style="font-size: 15px;" CssClass="form-control" />
                <br />
                <asp:Button Text="Continuar" ID="btnContinuar" Style="font-size: 15px;" CssClass="btn btn-outline-dark" runat="server" OnClick="btnContinuar_Click" />
            </div>
    </div>
    </div>
    <hr />


</asp:Content>
