<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="VerRechazo.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.VerRechazo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Pedido Rechazado</h1>
    <hr />
    <div class="container">
        <div class="col-md-12">
            <center>
            <asp:label text="Motivo" Style="font-size:15px" runat="server" /><br /><br />
            <asp:TextBox ID="TxtMotivo" CssClass="form-control" Style="font-size:15px" runat="server" ReadOnly="True" /><br />
            <asp:label text="Mensaje" Style="font-size:15px" runat="server" /><br /><br />
            <asp:TextBox ID="TxtMensaje" CssClass="form-control" Style="font-size:15px" TextMode="MultiLine" runat="server" ReadOnly="True" /><br />
            <asp:Button class="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" ID="BtnVolver" OnClick="BtnVolver_Click" />
            </center>
        </div>
    </div>
    <hr />
</asp:Content>
