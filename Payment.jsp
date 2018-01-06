<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Getaway</title>
</head>
<body>
<h1>Payment Details</h1>
<form action="#" method="post">
				<header align="center">Payment Information</header>
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
				
				<tr>
				<td><input type = "submit" value="Make Payment" class="center" /></td>
				</tr>
				

			
				</table>				
			</form>
</body>
</html>