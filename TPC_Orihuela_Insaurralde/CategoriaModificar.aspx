<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="CategoriaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.CategoriaModificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1 style="font-size: 20px">Modificacion de Categoria</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <br />
                <asp:TextBox ID="txtCategoria" CssClass="form-control" Style="font-size: 13.5px" runat="server" ReadOnly="True" />
            </div>
            <div class="col-md-4">
                <br />
                <asp:TextBox ID="txtModificar" CssClass="form-control" placeholder="Ingresar nueva categoria" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" Style="font-size: 13.5px" runat="server" />
            </div>

            <div class="col-md-12" style="text-align: center">
              
                <br />
                <asp:Button ID="btnModificar" Text="Modificar" Style="font-size: 15px" class="btn btn-outline-success" runat="server" OnClick="btnModificar_Click" />
                <asp:Button ID="btnvolver" Text="Volver" Style="font-size: 15px" class="btn btn-outline-danger" runat="server" OnClick="btnvolver_Click"  />
            </div>
        </div>
    </div>
    <hr />



</asp:Content>
