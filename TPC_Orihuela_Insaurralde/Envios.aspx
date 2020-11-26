<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Envios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Metodo de envio</h1>
    <hr />

    <div class="Container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px" Text="Correo" runat="server" />
                <asp:DropDownList ID="DDcorreo" Style="font-size: 15px" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Oca" />
                    <asp:ListItem Text="Correo Argentino" />
                </asp:DropDownList>
            </div>

            <div class="col-md-4">
                <asp:Label Style="font-size: 15px" Text="Localidad" runat="server" />
                <asp:TextBox runat="server" Style="font-size: 15px" OnKeyPress="return soloLetras(event);" CssClass="form-control" ID="TxtLocalidad" />
            </div>

            <div class="col-md-4">
                <asp:Label Style="font-size: 15px" Text="Calle" runat="server" />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtCalle" />
            </div>
        </div>
        <br />
        <div class="row">

            <div class="col-md-4">
                <asp:Label Style="font-size: 15px" Text="Entre Calles" runat="server" />
                <asp:TextBox runat="server" Style="font-size: 15px" CssClass="form-control" ID="TxtEntreCalles" />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Codigo Postal" Style="font-size: 15px" runat="server" />
                <asp:TextBox runat="server" OnKeyPress="return SoloNumeros(event);" Style="font-size: 15px" CssClass="form-control" ID="TxtCodigoPostal" />
            </div>
        </div>
    </div>
    <br />
    <hr />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <center>
            <p style="color:red;font-size:12.5px">LEER CON ATENCION</p>
            <p style="font-size:12px">El costo del envio corre a cargo del comprador, este puede variar dependiendo del destino.</p>
            <asp:CheckBox Text="Aceptar Terminos" AutoPostBack="true" ID="ChkAceptar" runat="server" /></center>
                </div>
            </div>
            <hr />

            <%if (ChkAceptar.Checked == true)
                { %>

            <center>
    <asp:Button ID="BtnContinuar" CssClass="btn btn-outline-success" Style="font-size: 15px" Text="Continuar" runat="server" OnClick="BtnContinuar_Click"  />
        &nbsp;&nbsp;
    <asp:Button ID="BtnVolver" CssClass="btn btn-outline-danger" Style="font-size: 15px" Text="Volver" runat="server" />
</center>

            <%} %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <hr />

</asp:Content>
