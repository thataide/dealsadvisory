<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="First.aspx.cs" Inherits="AnalyticsRDP.First" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        function hover(x) {
            $(x).css("background-color", "grey");
        }

        function out(x) {
            $(x).css("background-color", "navy");
        }
    </script>

</head>
<body style="color: white; font-family:Arial">
    <form id="form1" runat="server">
        <table style="width: 1280px; height: 720px; background-color: navy">
            <tr>
                <td style="width: 2.5%; height: 100%">
                </td>
                <td style="width: 65%; height: 100%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 20%">
                            <td style="font-size: 48px">
                                <strong>Welcome</strong> to the [brand]<br />
                                desktop environment
                            </td>
                        </tr>
                        <tr style="height: 20%">
                            <td style="font-size: 28px">
                                <strong>Learn and engage with analytics</strong>
                                <table style="border: solid; border-width: 1px; width:100%; height: 60%">
                                    <tr>
                                        <td style="font-size:22px" colspan="5">
                                            <em>Combining people, data, and tech to deliver leading insights at deal speed</em>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="align-content:center">
                                            <table style="width: 100%; text-align:center">
                                                <tr>
                                                    <td>
                                                        <strong>Questions</strong>
                                                        <br />
                                                        <span style="font-size: 14px">
                                                            Top issues clients<br />
                                                            face in the market
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align:center">
                                            &rarr;
                                        </td>
                                        <td style="align-content:center">
                                            <table style="width: 100%; text-align:center">
                                                <tr>
                                                    <td>
                                                        <strong>Tiles</strong>
                                                        <br />
                                                        <span style="font-size: 14px">
                                                            Industry-specific<br />
                                                            analytics use cases
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align:center">
                                            &rarr;
                                        </td>
                                        <td style="align-content:center">
                                            <table style="width: 100%; text-align:center">
                                                <tr>
                                                    <td>
                                                        <strong>Insights</strong>
                                                        <br />
                                                        <span style="font-size: 14px">
                                                            Intelligence that<br />
                                                            drives decisions
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 60%">
                            <td>
                                <table>
                                    <tr>
                                         <td style="font-size: 28px">
                                            <strong>View industry tiles</strong>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="dtlSector" runat="server" DataKeyField="SectorId" DataSourceID="dtsSector" RepeatColumns="5">
                                                <ItemTemplate>
                                                    
                                                    <asp:Label ID="SectorIdLabel" runat="server" Text='<%# Eval("SectorId") %>' Visible="false" />
                                                    <asp:Label ID="SectorCodeLabel" runat="server" Text='<%# Eval("SectorCode")%>' Visible="false" />
                                                    <asp:LinkButton ID="SectorNameLinkButton" runat="server" Text='<%# Eval("SectorName") %>' PostBackUrl='<%# "Second.aspx?SectorId=" + Eval("SectorId") %>' BorderWidth="1px" BorderStyle="Solid" Height="40px" Width="160px" Font-Underline="false" style="text-align:center; color: white" onmouseover="hover(this)" onmouseout="out(this)"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="dtsSector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [Sector] ORDER BY [SectorName]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 2.5%; height: 100%">
                </td>
                <td style="width: 30%; height: 100%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 20%">
                            <td>
                            </td>
                        </tr>
                        <tr style="height:60%">
                            <td style="font-size:28px; width: 100%">
                                <asp:DataList ID="dtlAppType" runat="server" DataKeyField="AppTypeId" DataSourceID="dtsAppType">
                                    <ItemTemplate>
                                        <!- FORCED WIDTH BECAUSE DATALIST PREVENTS INHERITANCE FROM OUTER TABLE ->
                                        <table style="border-left:solid; border-width: 1px; width:360px"> 
                                            <tr>
                                                <td style="width:5%">

                                                </td>
                                                <td style="width:95%">
                                                    <asp:Label ID="AppTypeIdLabel" runat="server" Text='<%# Eval("AppTypeId") %>' Visible="False" />
                                                    <strong><asp:Label ID="AppTypeNameLabel" runat="server" Text='<%# Eval("AppTypeName") %>' ToolTip='<%# Eval("Description") %>' /></strong>
                                                    <asp:DataList ID="dtlApp" runat="server" DataKeyField="AppId" DataSourceID="dtsApp">
                                                        <ItemTemplate>
                                                            <table style="font-size:22px; width:100%">
                                                                <tr>
                                                                    <td style="width:25%">
                                                                        <asp:Image ID="imgLogoImageFilePath" runat="server" ImageUrl='<%# Eval("LogoImageFilePath") %>' BorderColor="White" BorderStyle="Solid" BorderWidth="1px" Height="60px" Width="60px" />
                                                                    </td>
                                                                    <td style="width:75%">
                                                                        <asp:Label ID="AppIdLabel" runat="server" Text='<%# Eval("AppId") %>' Visible="False" />
                                                                        <asp:Label ID="AppCodeLabel" runat="server" Text='<%# Eval("AppCode") %>' Visible="False" />
                                                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Description") %>'/>
                                                                        <br />
                                                                        <span style="font-size:14px">
                                                                            <asp:LinkButton ID="lkbAbout" runat="server" ForeColor="White" Text='<%# Eval("AboutLinkText") %>' PostBackUrl='<%# Eval("AboutLinkURL") %>'></asp:LinkButton>&nbsp;|
                                                                            <asp:LinkButton ID="lkbTraining" runat="server" ForeColor="White" Text='<%# Eval("TrainingLinkText") %>' PostBackUrl='<%# Eval("TrainingLinkURL") %>'></asp:LinkButton>&nbsp;|
                                                                            <asp:LinkButton ID="lkbVideos" runat="server" ForeColor="White" Text='<%# Eval("VideosLinkText") %>' PostBackUrl='<%# Eval("VideosLinkURL") %>'></asp:LinkButton>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <asp:SqlDataSource ID="dtsApp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [App] WHERE ([AppTypeId] = @AppTypeId) ORDER BY [Name]">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="AppTypeIdLabel" Name="AppTypeId" PropertyName="Text" Type="Int16" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="dtsAppType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [AppType] ORDER BY [AppTypeName]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr style="height: 20%; vertical-align: top">
                            <td style="font-size: 28px">
                                <table style="border-left:solid; border-width: 1px; width:100%"> 
                                    <tr>
                                        <td style="width:5%">
                                        </td>
                                        <td style="width:95%">
                                           <strong>Quick links</strong>
                                           <br />
                                           <span style="font-size: 14px">
                                               <asp:DataList ID="dtlQuickLinks" runat="server" DataKeyField="QuickLinkId" DataSourceID="dtsQuickLinks">
                                                   <ItemTemplate>
                                                       <asp:LinkButton ID="lkbQuickLinkItem" runat="server" ForeColor="White" Text='<%# Eval("QuickLinkText") %>' PostBackUrl='<%# Eval("QuickLinkURL") %>'></asp:LinkButton>
                                                       <br />
                                                   </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="dtsQuickLinks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [QuickLink]"></asp:SqlDataSource>
                                           </span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
