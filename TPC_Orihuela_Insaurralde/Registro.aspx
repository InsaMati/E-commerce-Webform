<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Registro</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Email" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtEmail" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Contraseña" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtPassword" TextMode="Password" runat="server" />
                <br />
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <br />
                <asp:CheckBox Text="Visualizar Clave" runat="server" ID="ChkPassword" />
                <br />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Nombre/s" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtNombre" runat="server" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Apellidos/s" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtApellido" runat="server" />
                <br />
            </div>
            <div class="col-md-4">
                <asp:Label Text="Dni" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtDni" runat="server" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Genero" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDGenero" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Direccion" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox Style="font-size: 15px" CssClass="form-control" ID="TxtDireccion" runat="server" />
                <br />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Fecha Nacimiento" Style="font-size: 15px; color: black; font-weight: 700" runat="server" /><br />
                <br />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" TextMode="Date" ID="TxtFecha" />
                <br />
            </div>
        </div>
    </div>

    
    <hr />
    <center>
    <asp:Button Text="Guardar" ID="BtnAgregar" class="btn btn-success" Style="font-size:18px;" runat="server" /><br />
        <a href="inicio.aspx" style="font-size:15px">Cancelar</a>
  </center>

</asp:Content>
