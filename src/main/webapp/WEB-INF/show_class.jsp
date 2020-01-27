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
      <h1>${student.name}</h1>
      <c:if test="${success.length() > 0}">
        <div class="card-panel green lighten-2 left-align">
          <c:out value="${success}" />
        </div>
      </c:if>
      <div class="col s6">
        <form action="/class/add" method="POST">
          <div class="row">
            <div class="input-field col s12">
              <select name="dorm_id">
                <option value="" disabled selected>Select other dorms to view</option>
                <c:forEach var="class" items="${classes}">
                  <option value="${class.id}">${class.name}</option>
                </c:forEach>
              </select>
              <label>Your Classes</label>
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
            <c:forEach var="class" items="${student.classes}">
              <tr>
                <td>${class.name}</td>
                <td>
                  <a href="/class/drop/${class.id}" class="waves-effect waves-light btn">drop</a>
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