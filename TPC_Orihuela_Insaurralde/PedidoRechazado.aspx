<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="PedidoRechazado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.PedidoRechazado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Rechazo de pedido</h1>
    <hr />
    <div class="container">
        <div class="col-md-12">
            <center>

                <% if (Alert == true)
                    {  %>

            <div class="alert alert-warning" style="font-size: 15px" role="alert">
                Campos vacios.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
<% }%>
           
            <asp:textbox runat="server" ID="TxtMotivo" placeholder="Motivo del rechazo" OnKeyPress="return soloLetras(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" CssClass="form-control" Style="font-size:15px" />
            <br />
            <asp:TextBox runat="server" ID="TxtMensaje" CssClass="form-control" Style="font-size:15px" OnKeyPress="return soloLetras(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" TextMode="MultiLine" />
                <br />
            <asp:Button Text="Enviar" ID="btnenviar" Style="font-size: 15px" class="btn btn-outline-success" runat="server" OnClick="btnenviar_Click"/>
            <asp:Button Text="Volver" ID="btnvolver" Style="font-size: 15px" class="btn btn-outline-danger" runat="server" OnClick="btnvolver_Click"  /></center>
        </div>
    </div>
    <hr />
</asp:Content>
