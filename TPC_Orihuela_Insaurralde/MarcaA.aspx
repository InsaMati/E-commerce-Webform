<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MarcaA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MarcaA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Registro de Marca</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:TextBox ID="txtMarca" placeholder="Ingresar Marca" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" CssClass="form-control" Style="font-size: 15px" runat="server" />
                <div class="col-md-12" style="text-align:center">
                    <br />
                    <asp:Button Text="Agregar" ID="btnAgregar" Style="font-size: 15px" class="btn btn-outline-primary" runat="server" OnClick="btnAgregar_Click" />
                    <asp:Button Text="volver" ID="btnvolver" Style="font-size: 15px" class="btn btn-outline-danger" runat="server" OnClick="btnvolver_Click" />
                </div>
            </div>
        </div>
    </div>
    <hr />


</asp:Content>
