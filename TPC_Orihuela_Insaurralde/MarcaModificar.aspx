<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MarcaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MarcaModificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <center>
                <asp:label text="MARCA ANTERIOR" Style="font-size: 15px; color:black; font-weight:700" runat="server" />
                <asp:textbox ID="txtMarca" runat="server" />
                <br />
                <asp:label text="MARCA NUEVA" Style="font-size: 15px; color:black;font-weight:700" runat="server" />
                <asp:textbox ID="txtModificar" runat="server" />
                <br />
                <asp:button ID="btnModificar" text="MODIFICAR" class="btn btn-primary" runat="server" OnClick="btnModificar_Click" />
            </center>
        </div>
    </div>


</asp:Content>
