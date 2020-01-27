<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <title>Student Roster</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>

<body>
  <div class="container valign-wrapper" style="height:100vh;">
    <div style="width:100vw;">
      <div class="row">
        <div class="col s6 offset-s3">
          <h2>New Class</h2>
          <div class="row">
            <form:form action="/class/submit" modelAttribute="classs" method="POST" class="col s12">
	          <form:errors element="div" path="name" cssClass="card-panel red lighten-2" style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;" />
              <div class="row">
                <div class="input-field col s12">
                  <form:input id="name" class="validate" path="name" />
                  <label for="name">Name</label>
                </div>
                <div class="input-field col s12">
                  <button type="submit" class="waves-effect waves-light btn">Create</button>
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>

</html>