<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>

    <h1>Registro</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Nombre/s" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtNombre" OnKeyPress="return soloLetras(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Apellidos/s" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtApellido" OnKeyPress="return soloLetras(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Email" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtEmail" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Contraseña" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtPassword" TextMode="Password" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" MaxLength="20" />
                <br />
            </div>


            <div class="col-md-4">
                <asp:Label Text="Dni" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtDni" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Genero" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDGenero" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Provincia" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDProvincia" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Direccion" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" OnKeyPress="return LetrasYNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" ID="TxtDireccion" runat="server" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Fecha Nacimiento" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" TextMode="Date" ID="TxtFecha" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Telefono" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" ID="TxtTelefono" />
                <br />
            </div>
        </div>
    </div>


    <hr />
    <div class="col-md-12" style="text-align: center">
        <asp:Button Text="Continuar" ID="BtnContinuar" class="btn btn-outline-success" Style="font-size: 18px;" runat="server" OnClick="btnContinuar_Click" />
        <asp:Button Text="Cancelar" ID="btnCancelar" Style="font-size: 18px" class="btn btn-outline-secondary" runat="server" OnClick="btnCancelar_Click" />
    </div>

</asp:Content>
