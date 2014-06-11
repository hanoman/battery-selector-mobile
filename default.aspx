<%@ Page Title="Sam's Club - In Clubs Now - Find Your Battery" Language="C#" MasterPageFile="~/Library/MasterPages/GlobalMobileHeader.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SCMemberServices.templateFolder.Mobile._default" %>

<%@ MasterType VirtualPath="~/Library/MasterPages/GlobalMobileHeader.Master" %>
<%@ Register Src="/Library/Controls/OASSetupScript.ascx" TagName="OASSetupScript" TagPrefix="ucOAS" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContentHolder" runat="server">
	<%--Meta Information--%>
	<meta name="viewport" content="width=100%, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no," />
     <meta name="keywords" content="" />
    <meta name="description" content="" />
	<%--CSS--%>
    <link rel="stylesheet" href="media/css/jquery.mobile-1.3.1.css" />
    <link href="Media/css/styles.css" rel="stylesheet" type="text/css" />

    <%--Javascript--%>
    <script src="http://code.jquery.com/mobile/1.3.0-beta.1/jquery.mobile-1.3.0-beta.1.min.js"></script>
    <script type="text/javascript" src="Media/script/lookup-mobile.js"></script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="OASScriptHolder" runat="server">
</asp:Content>


<asp:Content ID="MainContent" ContentPlaceHolderID="MasterContentHolder" runat="server">

	<asp:ScriptManager ID="smScriptManager" runat="server" />
	<!-- start of content-->

	        <div class='TRM_Content-Wrap'> <!-- this is centered and at 100% with max-width:640px-->
                <div class="grid_100 floatLeft">

                    <!-- Start of first page -->
                    <div data-role="page" id="homePage">

                        <div data-role="content">
                            <div class="pov">
                                <img src="media/images/header-automotive.jpg" alt="">
                                <div class="pov-info">
                                    <h2>Another powerful membership perk</h2>
                                    <p>Find the right battery for your vehicle and have it installed for FREE. Fill in your vehicle’s information below to get started. </p>
                                </div>
                            </div>

                            <form>
                            <fieldset data-role="controlgroup" class="battery-selector">
                                <label for="TRM_dd_AUTO_MAKE">Select Make</label>
                                <select name="TRM_dd_AUTO_MAKE" id="TRM_dd_AUTO_MAKE" onchange="selectYear()">
                                    <option value="null">Make</option>
                                </select>

                                <label for="TRM_dd_AUTO_YEAR">Select Year</label>
                                <select name="TRM_dd_AUTO_YEAR" id="TRM_dd_AUTO_YEAR" onchange="selectModel()" >
                                    <option value="null">Year</option>
                                </select>

                                <label for="TRM_dd_AUTO_MODEL">Select Model</label>
                                <select name="TRM_dd_AUTO_MODEL" id="TRM_dd_AUTO_MODEL" onchange="selectEngine()">
                                    <option value="null">Model</option>
                                </select>

                                <label for="TRM_dd_AUTO_ENGINE">Select Engine</label>
                                <select name="TRM_dd_AUTO_ENGINE" id="TRM_dd_AUTO_ENGINE" onchange="getBatteries()">
                                    <option value="null">Engine</option>
                                </select>
                            </fieldset>
                            </form>



                        </div><!-- /content -->

                    </div><!-- /page -->


                    <!-- Start of second page -->
                    <div data-role="page" id="resultPage">

                        <div data-role="content">
                            <div class="pov">
                                <img src="media/images/header-automotive.jpg" alt="">
                                <div class="pov-info">
                                    <h2>Your battery is waiting</h2>
                                    <p><strong>Bring the model number into Sam’s Club<sup>&reg;</sup>.</strong> Get professional installation while you shop, or do it yourself if you’re up for it — remember the <strong>Sam’s Club Automotive department team</strong> offers free battery testing and installation!*</p>
                                </div>
                            </div>
                            <div class="black-bar resultTitle">
                                <h3>Your battery match is:</h3>
                            </div>

                            <div id="TRM_Battery_Details"></div>

                            <div id="TRM_Seleted_Details" class="battery-selected">
                                <p>Your current selection is:</p>
                            </div>

                            <a href="#homePage" data-role="button" class="resetBattery" onclick='javascript:hrefModify();'  track="modifySelection">Modify Selection</a>

                            <h3><a href="http://m.samsclub.com/locator"  track="findSamsClub"><img src="media/images/header-locator.jpg" alt="Find Sam&acute;s Club"></a></h3>
                            <h3><a href="#"  class="headingToggle" track="SamsClubRecycles"><img src="media/images/header-recycle.jpg" alt="Sam&acute;s Club Recycles"></a></h3>
                            <div class="toggleContent">
                                <img src="media/images/mod-recycle.jpg" alt="">
                            </div>
                            <h3><a href="#"  class="headingToggle" track="TestingInstallation"><img src="media/images/header-testing.jpg" alt="Testing &amp; Installation"></a></h3>
                            <div class="toggleContent">
                                <img src="media/images/mod-free-test.jpg" alt="">
                            </div>



                        </div><!-- /content -->


                         <div class="" id="battery-spec">
                            <!-- Automotive AGM-->
                            <ul class="TRM_detail-list" id="24F-AGM" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 885
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 710
                                </li>

                            </ul>
                            <ul class="TRM_detail-list" id="34-AGM" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 925
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 740
                                </li>

                            </ul>
                            <ul class="detail-list" id="65-AGM" style="display: none;">
                                <li class="warranty">Replacement Warranty: 36 months</li>
                                <li class="cranking-amps">
                                    Cranking Amps: 940
                                </li>
                                <li class="cold-cranking-amps">
                                    Cold Cranking Amps: 750
                                </li>

                            </ul>
                            <ul class="TRM_detail-list" id="78-AGM" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 925
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 740
                                </li>

                            </ul>
                            <ul class="TRM_detail-list" id="H6-LN3-AGM" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 950
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 760
                                </li>

                            </ul>
                            <ul class="TRM_detail-list" id="H7-LN4-AGM">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 850
                                </li>

                            </ul>
                            <ul class="TRM_detail-list" id="H8-LN5-AGM">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="cTRM_old-cranking-amps">
                                    Cold Cranking Amps: 900
                                </li>

                            </ul>

                            <!-- Automotive -->

                            <ul class="TRM_detail-list" id="E4D" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                            </ul>

                            <ul class="TRM_detail-list" id="E24F">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 875
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 700
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E25-N" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 800
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 640
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E25-S
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E26R">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 675
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 540
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E27" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 940
                                </li>
                                <li class="TRM_old-cranking-amps">
                                    Cold Cranking Amps: 810
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E27F" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 885
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 710
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E31A" >
                                <li class="TRM_warranty">Replacement Warranty: 12 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 950
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E34-N" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 995
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 795
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E34-S
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E35-N">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 800
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 640
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E35-S
                                </li>
                            </ul>
                            <ul class="TRM_detail-list" id="E36R" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 810
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 650
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E51">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 625
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 500
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E51R" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 625
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 500
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E58-N" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 760
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 610
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E58-S
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E58R" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 760
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 610
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E59" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 738
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 590
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E65-N" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 850
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E65-S
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E75-N" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 875
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 700
                                </li>
                                <li class="TRM_southern-equivalent">
                                    *Southern Equivalent: E75-S
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="75DT" >
                                <li class="TRM_warranty">Replacement Warranty: 12 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 810
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 650
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="78DT" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 800
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E79" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 840
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="86FT" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 800
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 640
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="96R" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 735
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 590
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E121R" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 750
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 600
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="E24DC" >
                                <li class="TRM_warranty">Replacement Warranty: 12 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 675
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 550
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="H5-LN2" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 810
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 650
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="H6_LN3" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 910
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 730
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="H7-LN4" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 985
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 790
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="H8-LN5" >
                                <li class="warranty">Replacement Warranty: 36 months</li>
                                <li class="cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 900
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="RED-3478" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 1000
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 800
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="T5-LBN2" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 810
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 650
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="YEL-3478DT" >
                                <li class="TRM_warranty">Replacement Warranty: 6 months</li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 165
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="YEL-D35" >
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 770
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 620
                                </li>
                            </ul>

                            <ul class="TRM_detail-list" id="YEL-D75-25">
                                <li class="TRM_warranty">Replacement Warranty: 36 months</li>
                                <li class="TRM_cranking-amps">
                                    Cranking Amps: 770
                                </li>
                                <li class="TRM_cold-cranking-amps">
                                    Cold Cranking Amps: 620
                                </li>
                            </ul>
                        </div>

                    </div><!-- /page -->

                </div>

</asp:Content>
