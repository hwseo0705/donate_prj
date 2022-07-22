<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- RESET CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- animate css v3.7.0 || https://animate.style -->
    <link rel="stylesheet" href="/css/animate.min.css">

    <!-- slick css || https://kenwheeler.github.io/slick/  -->
    <link rel="stylesheet" href="/css/slick.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- libraries -->
    <!-- scrolla js -->
    <script src="/js/scrolla.jquery.min.js" defer></script>
    <!-- slick js -->
    <script src="/js/slick.min.js" defer></script>

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- jQuery cdn -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>나중에 jsp로 옮겨야 함~~</title>

    <style>
        header {
            background: rgb(233, 203, 203) !important;
        }

        .container2 {
            display: flex;
            justify-content: space-between;
            margin: 0;
        }

        .container2 .logo {
            flex: 1;
            width: 130px;
            /* height: 40px; */
            /* background: red; */
        }

        .container2 .logo #logo {
            height: 80px;
        }
        .container2 .nav {
            flex: 3;
            /* background: blue; */
            align-items: center;
            justify-content: center;
        }

        .container2 .nav li {
            margin-right: 80px;
        }

        .container2 .search-join {
            flex: 2;
            /* background: green; */
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .container2 .search-join form {
            margin-right: 20px;
        }

        .body {
            height: 1000px;
        }

        .foot-left {
            margin-left: 10px;
        }

        .foot-right {
            margin-right: 10px;
        }

        .foot-logo #foot-logo {
            height: 80px;
        }

    </style>