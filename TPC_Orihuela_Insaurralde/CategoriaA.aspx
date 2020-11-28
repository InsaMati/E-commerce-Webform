<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="CategoriaA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.CategoriaA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Registro de Categoria</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:TextBox ID="txtCategoria" Style="font-size:15px" placeholder="Ingresar categoria" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" CssClass="form-control" runat="server" />
                <div class="Col-md-12" style="text-align: center">
                    <asp:Button Text="Agregar" Style="font-size:15px" ID="btnAgregar" class="btn btn-outline-primary" runat="server" OnClick="btnAgregar_Click" />
                    <asp:Button Text="Volver" Style="font-size:15px" ID="BtnVolver"  class="btn btn-outline-danger" runat="server" OnClick="BtnVolver_Click" />
                </div>
            </div>
        </div>
    </div>
    <hr />
</asp:Content>
