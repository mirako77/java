<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentallela Alela! | </title>

    <!--     Load CSS and scripts common to all pages -->
    <%@ include file="../shared/imports_head.jspf" %>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">403</h1>
              <h2>Access denied</h2>
              <p>Full authentication is required to access this resource. <a href="#">Report this?</a>
              </p>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

    <!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>
    <!--     /Load common scripts -->
  </body>
</html>