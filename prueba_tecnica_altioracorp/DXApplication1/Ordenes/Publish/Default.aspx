<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="Ordenes._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">
        function onFocusedRowChanged(s, e) {
            $("#Content_hfIdCliente").val(s.keys[s.GetFocusedRowIndex()]);

            gridClientes.GetRowValues(gridClientes.GetFocusedRowIndex(), 'Nombres', OnGetSelectedFieldValuesNombres);
            gridClientes.GetRowValues(gridClientes.GetFocusedRowIndex(), 'Apellidos', OnGetSelectedFieldValuesApellidos);
        }
        function OnGetSelectedFieldValuesNombres(selectedValues) {
            if (selectedValues.length == 0)
                return;
            txbNombres.SetText(selectedValues);
        }

        function OnGetSelectedFieldValuesApellidos(selectedValues) {
            if (selectedValues.length == 0)
                return;
            txbApellidos.SetText(selectedValues);
        }

    </script>
    <div class="jumbotron">
        <div class="container">
            <h1>Ejercicio de Desarrollo de Software - Clientes, Ódenes, Artículos.</h1>
            <p>
                <dx:BootstrapHyperLink ID="link_ejercicio_practico" runat="server" NavigateUrl="~/Documents/EjercicioPractico.pdf" Text="Descargar EjercicioPractico.pdf" Target="_blank"></dx:BootstrapHyperLink>
            </p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-lg-4">
                <h3>Datos del cliente</h3>
                <p>
                    <dx:BootstrapTextBox ID="txbNombres" runat="server" NullText="Ingrese los nombres del cliente" ClientInstanceName="txbNombres"></dx:BootstrapTextBox>
                </p>
                <p>
                    <dx:BootstrapTextBox ID="txbApellidos" runat="server" NullText="Ingrese los apellidos del cliente" ClientInstanceName="txbApellidos"></dx:BootstrapTextBox>
                </p>
                <div class="row float-lg-right">
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnInsertar" runat="server" Text="Insertar" AutoPostBack="false" OnClick="btnInsertar_Click">
                            <SettingsBootstrap RenderOption="Primary" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnModificar" runat="server" Text="Modificar" AutoPostBack="false" OnClick="btnModificar_Click">
                            <SettingsBootstrap RenderOption="Default" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnEliminar" runat="server" Text="Eliminar" AutoPostBack="false" OnClick="btnEliminar_Click">
                            <SettingsBootstrap RenderOption="Danger" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                </div>
                <asp:HiddenField ID="hfIdCliente" runat="server" />
            </div>
            <div class="col-lg-8">
                <h3>Clientes almacenados</h3>
                <p>
                    <dx:BootstrapGridView ID="GridViewClientes" runat="server" KeyFieldName="IdCliente" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ClientInstanceName="gridClientes">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <ClientSideEvents FocusedRowChanged="onFocusedRowChanged" />
                        <Columns>
                            <dx:BootstrapGridViewTextColumn FieldName="IdCliente" ReadOnly="True" VisibleIndex="0" Visible="false">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Nombres" VisibleIndex="1"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Apellidos" VisibleIndex="2"></dx:BootstrapGridViewTextColumn>
                        </Columns>
                    </dx:BootstrapGridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [IdCliente], [Nombres], [Apellidos] FROM [tClientes]"></asp:SqlDataSource>
                </p>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <h3>Gestionar artículos</h3>
                <p>
                    <dx:BootstrapGridView ID="GridViewArticulos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="IdArticulo">
                        <SettingsDataSecurity AllowEdit="True" AllowInsert="True" AllowDelete="True"></SettingsDataSecurity>
                        <Columns>
                            <dx:BootstrapGridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:BootstrapGridViewCommandColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="IdArticulo" ReadOnly="True" VisibleIndex="1" Visible="false">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Codigo" VisibleIndex="2" Caption="C&#243;digo"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Nombre" VisibleIndex="3"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="PrecioUnitario" VisibleIndex="4" Caption="Precio"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="CreadoPor" VisibleIndex="5" Caption="Creado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="FechaCreacion" VisibleIndex="6" Caption="Fecha creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionCreacion" VisibleIndex="7" Caption="Estaci&#243;n creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="ModificadoPor" VisibleIndex="8" Caption="Modificado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="UltimaModificacion" VisibleIndex="9" Caption="&#218;ltima modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionModificacion" VisibleIndex="10" Caption="Estaci&#243;n modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                        </Columns>
                    </dx:BootstrapGridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tArticulos.* FROM tArticulos" InsertCommand="sp_InsertarArticulos" InsertCommandType="StoredProcedure" UpdateCommand="sp_ActualizarArticulos" UpdateCommandType="StoredProcedure" DeleteCommand="sp_EliminarArticulos" DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="IdArticulo" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Codigo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PrecioUnitario" Type="Decimal"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="IdArticulo" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Codigo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PrecioUnitario" Type="Decimal"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <h3>Gestionar órdenes</h3>
                <p>
                    <dx:BootstrapGridView ID="GridViewOrdenes" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="IdOrden">
                        <SettingsDataSecurity AllowEdit="True" AllowInsert="True" AllowDelete="True"></SettingsDataSecurity>
                        <Columns>
                            <dx:BootstrapGridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowEditButton="True"></dx:BootstrapGridViewCommandColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="IdOrden" ReadOnly="True" VisibleIndex="1" Visible="false">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="CreadoPor" VisibleIndex="4" Caption="Creado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="FechaCreacion" VisibleIndex="5" Caption="Fecha creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionCreacion" VisibleIndex="6" Caption="Estaci&#243;n creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="ModificadoPor" VisibleIndex="7" Caption="Modificado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="UltimaModificacion" VisibleIndex="8" Caption="&#218;ltima modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionModificacion" VisibleIndex="9" Caption="Estaci&#243;n modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>

                            <dx:BootstrapGridViewComboBoxColumn FieldName="IdCliente" Caption="Cliente" VisibleIndex="2" PropertiesComboBox-DataSourceID="">
                                <PropertiesComboBox TextField="NombresApellidos" DataSourceID="SqlDataSourceClientes" ValueField="IdCliente"></PropertiesComboBox>
                            </dx:BootstrapGridViewComboBoxColumn>
                            <dx:BootstrapGridViewComboBoxColumn FieldName="IdArticulo" Caption="Art&#237;culo" VisibleIndex="3">
                                <PropertiesComboBox TextField="CodigoNombre" DataSourceID="SqlDataSourceArticulo" ValueField="IdArticulo"></PropertiesComboBox>
                            </dx:BootstrapGridViewComboBoxColumn>
                        </Columns>
                    </dx:BootstrapGridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tOrdenes.* FROM tOrdenes" InsertCommand="sp_InsertarOrdenes" InsertCommandType="StoredProcedure" UpdateCommand="sp_ActualizarOrdenes" UpdateCommandType="StoredProcedure" DeleteCommand="sp_EliminarOrdenes" DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="IdOrden" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IdCliente" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="IdArticulo" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="IdOrden" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="IdCliente" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IdArticulo" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceClientes" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [IdCliente], [NombresApellidos] FROM [tClientes]"></asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceArticulo" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT IdArticulo, CONCAT(Codigo,' - ', Nombre) AS CodigoNombre FROM tArticulos"></asp:SqlDataSource>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
