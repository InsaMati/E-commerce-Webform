<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLProducto.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr class="bg-whitesmoke" style="color: orangered; font-size: 15px;font-style:italic">
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Categoria</td>
                        <td>Marca</td>
                        <td>Precio</td>
                        <td>Imagen</td>
                        <td>Eliminar</td>
                        <td>Modificar</td>
                        <td>Ver</td>
                    </tr>

                    <tr style="font-style:italic">
                        <td><p>1</p></td>
                        <td><p>Assassin's Creed</p></td>
                        <td><p>Accion-Aventura</p></td>
                        <td><p>Ubisoft</p></td>
                        <td><p>$ 6000</p></td>
                        <td><img src="https://th.bing.com/th/id/OIP.U3C30hjN3h5z_lyl6yz7TAHaJZ?pid=Api&rs=1" alt="Bugisoft" width="80" height="100" /></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-remove"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-pencil"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-eye-open"></span></td>
                    </tr>

                    <tr style="font-style:italic">
                        <td><p>1</p></td>
                        <td><p>Assassin's Creed</p></td>
                        <td><p>Accion-Aventura</p></td>
                        <td><p>Ubisoft</p></td>
                        <td><p>$ 6000</p></td>
                        <td><img src="https://th.bing.com/th/id/OIP.U3C30hjN3h5z_lyl6yz7TAHaJZ?pid=Api&rs=1" alt="Bugisoft" width="80" height="100" /></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-remove"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-pencil"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-eye-open"></span></td>
                    </tr>
                    <tr style="font-style:italic">
                        <td><p>1</p></td>
                        <td><p>Assassin's Creed</p></td>
                        <td><p>Accion-Aventura</p></td>
                        <td><p>Ubisoft</p></td>
                        <td><p>$ 6000</p></td>
                        <td><img src="https://th.bing.com/th/id/OIP.U3C30hjN3h5z_lyl6yz7TAHaJZ?pid=Api&rs=1" alt="Bugisoft" width="80" height="100" /></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-remove"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-pencil"></span></td>
                        <td><span style="font-size:20px;color:orangered" class="glyphicon glyphicon-eye-open"></span></td>
                    </tr>


                </table>
                <br />
                <br />
                <center>
                    <asp:button text="Volver" ID="BtnVolver" cssclass="btn btn-primary" Style="font-size:15px;background-color:orangered" runat="server" OnClick="BtnVolver_Click" />

                </center>

            </div>

        </div>
    </div>

</asp:Content>
