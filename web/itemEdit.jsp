<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>BJM Auctions</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <%-- <%@ include file="header.html" %> --%>

	<div class="container card">
		<div>
			<h2>Create/Edit - Item listing</h2>
		</div>

		<form id="form">
			<div class="custom-file form-group">
				<label for="imgURL" id="files-label" class="custom-file-label">Please attach an IMG file</label>
				<input type="file" name="imgURL" id="imgURL" class="custom-file-input form-control">
			</div>

			<div class="form-group">
				<label for="iName">Product Name:</label>
				<input type="text" name="iName" id="iName" class="form-control" placeholder="Kambrook Toaster" required>
			</div>

			<div class="form-group">
				<label for="lPrice">Enter the listing price</label>
				<input type="number" name="lPrice" id="lPrice" class="form-control" placeholder="0.00" min="0.00"
					max="10000.00" step="0.01" required>
			</div>

			<div class="form-group">
				<label for="cDate">Select closing date:</label>
				<input type="date" name="cDate" id="cDate" class="form-control" value="2018-01-01" min="2018-01-01"
					max="2018-01-01" required>
			</div>

			<div>
				<label for="iCat">Select a product category:</label>
				<select name="iCat" id="iCat" class="custom-select form-control">
					<option selected disabled>Please Select</option>
					<option value="1">Computer</option>
					<option value="2">Kitchen</option>
					<option value="3">Vehicle</option>
				</select>
			</div>

			<div class="form-group">
				<label for="iDesc">Include a product description:</label>
				<textarea class="form-control" name="iDesc" id="iDesc" rows="3"
					style="margin-top: 0px; margin-bottom: 0px; height: 98px;"></textarea>
			</div>

			<br>
			<div>
				<input type="submit" name="confirm" value="confirm" class="btn btn-success btn-lg btn-block">
			</div>
			<%-- <%
				String name = request.getParameter("name");
				String lPrice = request.getParameter("lPrice");
				String cDate = request.getParameter("cDate");
				
				String connectionURL = "jdbc:sqlite://localhost:8080/student_1";
				Connection connection = null;
				PreparedStatement pstatement = null;
				int updateQuery = 0;
				if(name!=null && lPrice!=null && cDate!=null){
					if(name!="" && lPrice!="" && cDate!=""){
						try {
							Class.forName("com.sqlite.jdbc.Driver");
							connection = DriverManager.getConnection(connectionURL,"root","");
							String queryString = "insert into itemDB(Name,lPrice,cDate) values(?,?,?)";
							pstatement = connection.prepareStatement(queryString);
							pstatement.setString(1, name);
							pstatement.setString(2, lPrice);
							pstatement.setString(3, cDate);
							updateQuery = pstatement.executeUpdate();
							if (updateQuery != 0) {
							%>
								<br>
								<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
									<tr>
										<th>Data is inserted successfully in database.</th>
									</tr>
								</table>

							<%
							}
						} 
						catch (Exception ex){
							out.println("Unable to connect to batabase.");
						}finally {
							// close all the connections.
							pstatement.close();
							connection.close();
						}
					}
				}
			%> --%>
		</form>
	</div>

    <%-- <%@ include file="footer.html" %> --%>

</body>

</html>