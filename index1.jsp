<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>XYZ.com: Save big on your hotel Bookings!</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="style1.css" type="text/css" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<style>
.button {
    background-color: #8B0000; /* Dark Red */
    border: none;
    color: white;
    padding:5px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">XYZ.com</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="#" class="cart-link">Check Out</a>
      <div class="cl">&nbsp;</div>
      <span></span> &nbsp;&nbsp; <span>Cost: <strong>$0.00</strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Logout</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <form action="FilterServlet" method="post">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="disp1.jpg" width="100%" height="100%" alt="" /></a></li>
            <li><a href="#"><img src="disp2.jpg" width="100%" height="100%" alt="" /></a></li>
            <li><a href="#"><img src="disp3.jpg" width="100%" height="100%" alt="" /></a></li>
            <li><a href="#"><img src="disp4.jpg" width="100%" height="100%" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
      <!-- Products -->
      <div  class="products">
        <div class="cl">&nbsp;</div>
        <ul>
        <%@ page import="java.util.*"%>
        <% Map<Integer, List<String>> allHotels = (HashMap<Integer, List<String>>)request.getAttribute("listHotel");%>
        <% List<String> oneHotel = new ArrayList<String>();
        String city = request.getAttribute("cityBean").toString();
        if(allHotels.size() == 0){%>
        <h1>Try Other Options.</h1>
        <%}
        for(int i = 0; i< allHotels.size();i++){
          oneHotel = new ArrayList<String>();
          oneHotel = allHotels.get(i);%>
          <li> <a href="#"><% out.println("<img src ='"+ oneHotel.get(4) +"' height='100%' width='100%'");%></a>
            <div class="product-info">
              <h3><% out.println(oneHotel.get(1)); %></h3>
              <div class="product-desc">
                <h4><% out.println(oneHotel.get(2));
                city = oneHotel.get(2);%></h4>
                <p><% out.println(oneHotel.get(3)); %></p>
                <strong class="price">$<% out.println(oneHotel.get(10)); %></strong> </div>
                <a href="BookConfirm.jsp?bDate=${hotelDate}&bRoom=${totalRooms}&bName=<%=oneHotel.get(1)%>&bLoc=<%=oneHotel.get(2)+","+oneHotel.get(3)%>&bCost=<%=oneHotel.get(10)%>" class="button">Book Now</a>
                <a href ="content.html" class="button button5"> View More </a>
            </div>
          </li>
        <% } %>
      </ul>
    </div>
  </div>

      <!-- End Products -->
    <!-- End Content -->
    <!-- Sidebar -->
    <div id="sidebar">
      <!-- Search -->
      <div class="box search">
        <h2>Filters <span></span></h2>
        <div class="box-content">
            <label>City: <% out.println(city); %></label>
            <input type="hidden" name="city" value="<%=city%>" />
            <label>AC</label>
            <select name="ac" class="field">
              <option value="-">SELECT</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
            <label>Swimming Pool</label>
            <select name="swim" class="field">
              <option value="-">SELECT</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
            <label>Gym</label>
            <select name="gym" class="field">
              <option value="-">SELECT</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
            <div class="inline-field">
              <label>Price</label>
              <select name="priceLow" class="field small-field">
                <option value="10">$10</option>
                <option value="20">$20</option>
                <option value="30">$30</option>
              </select>
              <label>to:</label>
              <select name="priceHigh" class="field small-field">
                <option value="75">$75</option>
                <option value="100">$100</option>
                <option value="150">$150</option>
              </select>
            </div>
            <input type="hidden" id="hotelDate" name="hotelDate" value="${hotelDate}" />
            <input type="hidden" id="totalRooms" name="totalRooms" value="${totalRooms}" />
            <input type="submit" class="search-submit" value="Search" />
            <p>
              <a href="#" class="bul">Contact Customer Support</a> </p>
        </div>
      </div>
    </div>
      <!-- End Search -->
      <!-- Categories -->
      <!-- End Categories -->

    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
    </form>
  </div>
  <!-- End Main -->
  <!-- Side Full -->
  <div class="side-full">
    </div>
    <!-- End More Products -->
    <!-- Text Cols -->
    <!-- End Text Cols -->
  </div>
  <!-- End Side Full -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="#">Home</a> <span>|</span> <a href="#">Services</a> <span>|</span> <a href="#">Logout</a> <span>|</span> <a href="#">Contact</a> </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>

</html>
