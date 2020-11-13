<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarcaA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MarcaA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">   
            <div>
                <center>
                    <asp:Label Text="Marca" Style="font-size: 15px; color:black;font-weight:700" runat="server" />
                    <br />
                    <asp:TextBox ID="txtMarca" runat="server" />
                    <asp:Button Text="Agregar" ID="btnAgregar"  class="btn btn-primary" runat="server" OnClick="btnAgregar_Click" />
                </center>
            </div>
        </div>
    </div>
    


</asp:Content>
