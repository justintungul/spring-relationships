<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <title>Student Roster</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>

<body>

  <div class="container">
    <a href="/class/new" class="waves-effect waves-light btn right" style="margin-right:5px;">New Class</a>
    <a href="/dorm/new" class="waves-effect waves-light btn right" style="margin-right:5px;">New Dorm</a>
    <a href="/contact/new" class="waves-effect waves-light btn right" style="margin-right:5px;">New Contact</a>
    <a href="/student/new" class="waves-effect waves-light btn right" style="margin-right:5px;">New Student</a>
    <h1>All Students</h1>
    
    <table class="highlight">
      <thead>
        <tr>
          <th>Name</th>
          <th>Age</th>
          <th>Address</th>
          <th>City</th>
          <th>State</th>
        </tr>
      </thead>

      <tbody>
      	<c:forEach var="student" items="${students}">
        <tr>
          <td><a href="/student/${student.id}">${student.firstName} ${student.lastName}</a></td>
          <td>${student.age}</td>
          <td>${student.contact.address}</td>
          <td>${student.contact.city}</td>
          <td>${student.contact.state}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>

</html>