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
          <h2>Contact Info</h2>
          <div class="row">
            <form:form action="/contact/submit" modelAttribute="contact" method="POST" class="col s12">
	          <form:errors element="div" path="student" cssClass="card-panel red lighten-2" style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;" />
	          <form:errors element="div" path="address" cssClass="card-panel red lighten-2" style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;" />
	          <form:errors element="div" path="city" cssClass="card-panel red lighten-2" style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;" />
	          <form:errors element="div" path="state" cssClass="card-panel red lighten-2" style="margin-bottom:8px; padding-top:5px; padding-bottom:5px;" />
              <div class="row">
                <div class="input-field col s12">
					<form:select path="student">
                   	 	<form:option value=""></form:option>
					    <form:options items="${students}" itemLabel="fullName" />
					</form:select>
                  <label>Student</label>
                </div>
                <div class="input-field col s12">
                  <form:input id="address" class="validate" path="address" />
                  <label for="address">Address</label>
                </div>
                <div class="input-field col s12">
                  <form:input id="city" class="validate" path="city"/>
                  <label for="city">City</label>
                </div>
                <div class="input-field col s12">
                  <form:select class="form-control" path="state">
                    <form:option value=""></form:option>
                    <form:option value="CA">CA</form:option>
                    <form:option value="AT">AT</form:option>
                    <form:option value="NY">NY</form:option>
                  </form:select>
                  <label>State</label>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script>
    $(document).ready(function () {
      $('select').formSelect();
    });
  </script>
</body>

</html>