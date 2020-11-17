<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Encriptado" runat="server" />
                <asp:TextBox ID="TxtEncriptado" CssClass="form-control" runat="server" />  
            </div>
         


        </div>
    </div>

    <asp:Button ID="BtnEnviar" Text="Enviar" CssClass="btn btn-danger" runat="server" OnClick="BtnEnviar_Click" />




</asp:Content>
