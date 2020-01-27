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
    <div class="row">
      <h1>${dorm.name}</h1>
      <div class="col s6">
        <form action="/dorm/show" method="POST">
          <div class="row">
            <div class="input-field col s12">
              <select name="dorm_id">
                <option value="" disabled selected>Select other dorms to view</option>
                <c:forEach var="dorm" items="${dorms}">
                	<option value="${dorm.id}">${dorm.name}</option>
                </c:forEach>
              </select>
              <label>Dorms</label>
              <button type="submit" class="waves-effect waves-light btn">Show</button>
            </div>
          </div>
        </form>
      </div>
      <div class="col s6">
        <form action="/dorm/student/add" method="POST">
          <div class="row">
            <div class="input-field col s12">
              <select name="student_id">
                <option value="" disabled selected>Choose your option</option>
				<c:forEach var="student" items="${students}">              
                	<option value="${student.id}">${student.firstName} ${student.lastName}</option>
                </c:forEach>
              </select>
              <label>Students</label>
              <input type="hidden" name="dorm_id" value="${dorm.id}" />
              <button type="submit" class="waves-effect waves-light btn">Add</button>
            </div>
          </div>
        </form>
      </div>
      <div class="col s12">
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
          </thead>

          <tbody>
          	<c:forEach var="tenant" items="${dorm.students}">
            <tr>
              <td>${tenant.firstName} ${tenant.lastName}</td>
              <td>
              	<a href="/student/remove/${tenant.id}/${dorm.id}" class="waves-effect waves-light btn">Remove</a>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script>
    $(document).ready(function () {
      $('select').formSelect();
    });
  </script>
</body>

</html>