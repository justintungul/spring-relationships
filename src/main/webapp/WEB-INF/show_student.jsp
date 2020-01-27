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
      <h1>${student.fullName}</h1>
      <div class="col s6">
        <form action="/class/add" method="POST">
          <div class="row">
            <div class="input-field col s12">
              <select name="class_id">
                <option value="" disabled selected>Select a class</option>
                <c:forEach var="classs" items="${classes}">
                	<option value="${classs.id}">${classs.name}</option>
                </c:forEach>
              </select>
              <label>Classes</label>
              <input type="hidden" name="student_id" value="${student.id}" />
              <button type="submit" class="waves-effect waves-light btn">Add</button>
            </div>
          </div>
        </form>
      </div>
      <div class="col s12">
        <table>
          <thead>
            <tr>
              <th>Class Name</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="classs" items="${student.classes}">
            <tr>
              <td>${classs.name}</td>
              <td>
              	<a href="/class/drop/${classs.id}" class="waves-effect waves-light btn">Drop</a>
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