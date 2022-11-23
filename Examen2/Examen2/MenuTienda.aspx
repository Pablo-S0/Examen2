<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuTienda.aspx.cs" Inherits="Examen2.MenuTienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Tienda
            <br />
            <br />
            Cajero:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenConnectionString %>" SelectCommand="SELECT * FROM [Cajeros]"></asp:SqlDataSource>
            <br />
            Producto:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="Codigo">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenConnectionString %>" SelectCommand="SELECT * FROM [Productos]"></asp:SqlDataSource>
            <br />
            Maquina Registradora:&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Piso" DataValueField="Codigo" Height="16px" Width="80px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenConnectionString %>" SelectCommand="SELECT * FROM [Maquinas_Registradora]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:Button ID="BRegistrar" runat="server" Text="Registrar" />
        </div>
    </form>
</body>
</html>
