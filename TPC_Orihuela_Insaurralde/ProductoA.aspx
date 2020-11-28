<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ProductoA.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ProductoA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Registro de producto</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Codigo" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" ID="TxtCodigo" MaxLength="4" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Nombre" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtNombre" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" MaxLength="70" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Descripcion" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtDescripcion" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" MaxLength="70" />
                <br />
                <br />
            </div>



            <div class="col-md-4">
                <asp:Label Text="Marca" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDMarca" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Categoria" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDCategoria" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Imagen" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtImagen" runat="server" />
                <br />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Precio" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" CssClass="form-control" ID="TxtPrecio" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Stock" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" ID="TxtStock" MaxLength="4" />
                <br />
            </div>
        </div>
    </div>
    <div class="col-md-12" style="text-align: center">
        <asp:Button Text="Agregar" ID="BtnAgregar" class="btn btn-outline-primary" Style="font-size: 15px;" runat="server" OnClick="BtnAgregar_Click" />&nbsp;&nbsp;
       
        <asp:Button Text="Volver" ID="BtnVolver" class="btn btn-outline-danger" Style="font-size: 15px;" runat="server" />
    </div>
</asp:Content>
