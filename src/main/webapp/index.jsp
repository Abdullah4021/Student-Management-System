<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.entity.Student"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-light">
	<%@include file="navbar.jsp"%>
	
	<%-- <%
	Connection conn=DbConnect.getConn();
	out.println(conn);
	%> --%>
	
	<div class="contaiiner p-3">
		<div class="card">
			<div class="caard-body">
				<p class="text-center fs-1">All Student Details</p>
				
				<c:if test="${not empty SuccMsg }">
						<p class="text-center text-success">${SuccMsg}</p>
						<c:remove var="SuccMsg"/>
						</c:if>
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-success">${errorMsg}</p>
						<c:remove var="errorMsg"/>
						</c:if>
				
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
					<% 
					StudentDao dao=new StudentDao(DbConnect.getConn());
					List<Student>list=dao.getAllStudents();
					for(Student s:list){
				    %>
						<tr>
							<th scope="row"><%=s.getFullName() %></th>
							<td><%=s.getDob() %></td>
							<td><%=s.getAddress() %></td>
							<td><%=s.getQualification()%></td>
							<td><%=s.getEmail() %></td>
							<td><a href="edit_student.jsp?id=<%=s.getId() %>"
								class="btn btn-sm btn-primary">Edit</a> 
								<a href="delete?id=<%=s.getId() %>"
								class="btn btn-sm btn-danger ms-1">Delete</a></td>
						</tr> 
						 
				    <%
					}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>