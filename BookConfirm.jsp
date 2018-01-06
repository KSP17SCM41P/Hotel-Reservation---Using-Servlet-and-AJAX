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
<script>
    function foodPrice1()
    {
        var foodPrice=0;
        var theForm = document.forms["OrderInfo"];
        var includeFood = theForm.elements["bfast"];
        if(includeFood.checked==true)
        {
            foodPrice = 10 * (parseInt(document.getElementById('ORoom').value));
        }else{
            foodPrice = 0 - 10 * (parseInt(document.getElementById('ORoom').value));
        }
        var totalAmount = (parseInt(document.getElementById('totalPrice1').innerHTML)) + foodPrice;
        document.getElementById('totalPrice1').innerHTML = totalAmount;
    }
    function foodPrice2()
    {
        var foodPrice = 0;
        var theForm = document.forms["OrderInfo"];
        var includeFood = theForm.elements["lunch"];
        if(includeFood.checked==true)
        {
            foodPrice = 20 * (parseInt(document.getElementById('ORoom').value));
        }else{
            foodPrice = 0 - 20 * (parseInt(document.getElementById('ORoom').value));
        }
        var totalAmount = (parseInt(document.getElementById('totalPrice1').innerHTML)) + foodPrice;
        document.getElementById('totalPrice1').innerHTML = totalAmount;
    }
    function foodPrice3()
    {
        var foodPrice = 0;
        var theForm = document.forms["OrderInfo"];
        var includeFood = theForm.elements["dinner"];
        if(includeFood.checked==true)
        {
            foodPrice = 30 * (parseInt(document.getElementById('ORoom').value));
        }else{
            foodPrice = 0 - 30 * (parseInt(document.getElementById('ORoom').value));
        }
        var totalAmount = (parseInt(document.getElementById('totalPrice1').innerHTML)) + foodPrice;
        document.getElementById('totalPrice1').innerHTML = totalAmount;
    }
</script>
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">XYZ.com</a></h1>
    <!-- Cart -->
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="#">Hi <%= session.getAttribute("userName")%></a></li>
        <li><a href="index.html">Home</a></li>
        <li><a href="index.html">Logout</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <form id="OrderInfo" action="OrderServlet" method="post">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
      <h1>Booking Details</h1><br>
      <form action="#" method="post">
        <h3><label>Hotel Name :</label>
        <label><%=request.getParameter("bName")%></label></h3><br>
        <input type="hidden" id="OHName" name="OHName" value="<%=request.getParameter("bName")%>"/>
        <h3><label>Location :</label>
        <label><%=request.getParameter("bLoc")%></label></h3><br>
        <input type="hidden" id="OHLoc" name="OHLoc" value="<%=request.getParameter("bLoc")%>"/>
        <h3><b><label>Date : </b></label>
        <label><%=request.getParameter("bDate")%></label></h3><br>
        <input type="hidden" id="OHDate" name="OHDate" value="<%=request.getParameter("bDate")%>"/>
        <h3><label>No. of Rooms :</label>
        <label><%=request.getParameter("bRoom")%></label></h3><br>
        <input type="hidden" id="ORoom" name="ORoom" value="<%=request.getParameter("bRoom")%>"/>
        <h3><label>Food :
          <input type="checkbox" id="bfast" name="bfast" value="10" onclick="foodPrice1()"> Breakfast
          <input type="checkbox" id="lunch" name="lunch" value="20" onclick="foodPrice2()"> Lunch
          <input type="checkbox" id="dinner" name="dinner" value="30" onclick="foodPrice3()"> Dinner
        </label></h3><br>
        <h3><label>Total Price : </h3></label>
        <div style="color: Red; font-size: 20px" name="totalPrice1" id="totalPrice1" value="<%= Integer.parseInt(request.getParameter("bCost"))*Integer.parseInt(request.getParameter("bRoom")) %>"> <%= Integer.parseInt(request.getParameter("bCost"))*Integer.parseInt(request.getParameter("bRoom")) %>
        <input type="hidden" id="totalPrice" name="totalPrice" value="<%=Integer.parseInt(request.getParameter("bCost"))*Integer.parseInt(request.getParameter("bRoom"))%>"/>
      </div>

      <br>
      <br>
	<h1>Payment Details</h1>
  <br>

				<table border="2">

				<tr>
					<td><label>Payment Type</label></td>
				<td><select name="payType"  id="payType">
				<option value = "card">Credit/Debit card</option>
				<option value = "paypal">Paypal</option>
				<option value = "gift">Gift Card</option>

				</select></td>

				</tr>
				<tr>
				<td><label>Cardholder's full name</label></td>
				<td><input type="text" name="name"  id="name" required /></td>
				</tr>
				<tr>
					<td><label>Card Type</label></td>
				<td><select name="cardType"  id="cardType">
				<option value = "american">American Express</option>
				<option value = "discover">Discover</option>
				<option value = "visa">VISA</option>
				<option value = "masterCard">Master Card</option>
				</select></td>

				</tr>

				<tr>
				<td><label>Card Number :</label></td>
				<td><input type = "text" name="cardNum"  id="cardNum" required /></td>
				</tr>

				<tr>
				<td><label>Security Code :</label></td>
				<td><input type="password" name="code"  id="code" required /></td>
				</tr>
				<tr>
				<td><label>Expiry Date</label></td>
				<td><select name="month"  id="month">
				<option value = "">Month</option>
				<option value = "01">01</option>
				<option value = "02">02</option>
				<option value = "03">03</option>
				<option value = "04">04</option>
				<option value = "05">05</option>
				<option value = "06">06</option>
				<option value = "07">07</option>
				<option value = "08">08</option>
				<option value = "09">09</option>
				<option value = "10">10</option>
				<option value = "11">11</option>
				<option value = "12">12</option>

				</select>
				<select name="year"  id="year">
				<option value = "">Year</option>
				<option value = "2017">2017</option>
				<option value = "2017">2018</option>
				<option value = "2019">2019</option>
				<option value = "2020">2020</option>
				<option value = "2021">2021</option>
				<option value = "2022">2022</option>
				<option value = "2023">2023</option>


				</select>
				</td>
				</tr>
				</table>
        <br>
				<input type = "submit" value="Book" class="center" />
        <br>
          <br>
			</form>

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

          </li>
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
