<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="UsuarioaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.UsuarioaModificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Modificacion de Usuario</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Email" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtEmail" CssClass="form-control" Style="font-size: 15px" runat="server" ReadOnly="True" />

            </div>
            <div class="col-md-4">
                <asp:Label Text="Contraseña" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtContraseña" CssClass="form-control" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" Style="font-size: 15px" runat="server" />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Tipo Usuario" Style="font-size: 15px" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDTipoUsuario" />
            </div>
        </div>

    </div>
    <br />
    <div class="col-md-12" style="text-align: center">
        <asp:Button ID="BtnModificar" CssClass="btn btn-outline-primary" Style="font-size: 15px" Text="Modificar" runat="server" OnClick="BtnModificar_Click" />
        &nbsp;&nbsp;
    <asp:Button ID="BtnVolver" CssClass="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" OnClick="BtnVolver_Click" />
    </div>

</asp:Content>
