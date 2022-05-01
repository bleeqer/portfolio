<%--
  Created by IntelliJ IDEA.
  User: linux-king
  Date: 4/21/22
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <sec:csrfMetaTags/>

    <%--  Bootstrap  --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- Bootstrap Icon --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <%--CSS--%>
    <link rel="stylesheet" type="text/css" href="/static/css/utils.css">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/static/css/popover.css">

    <style>
        input, textarea, button, a {
            color: rgb(213, 214, 214);
            background-color: transparent;
        }

        html, body {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            font-size: 16px;
            border: none;
            background-color: #181818;
            color: rgb(213, 214, 214);
        }

        .icon_svg-stroke {
            stroke: rgb(177, 179, 182);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            color: inherit;
        }

        select:focus {
            outline: none;
        }
    </style>
</head>
<body>
<div>

    <div style="height: 50px;"></div>

    <%--Navbar--%>
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

    <%--Search focus overlay--%>
    <div class="position-fixed bg-transparent-dark search-overlay"></div>

    <%--Main content--%>
    <div>
        <div class="d-flex justify-content-center align-items-center mx-auto" style="height: calc(100vh - 100px); width: 1002px; padding-left: 24px; padding-right: 24px;">

            <%--Main content container--%>
            <div class="d-flex justify-content-center align-items-center" style="width: 636px;">

                <%--Error--%>
                <div>
                    <div style="width: 300px;">

                        <%--Error header--%>
                        <div class="font-bold color-gray" style="line-height: 1.4; font-size: 18px;">Page Not Found</div>

                        <%--Error message--%>
                        <div class="color-gray-light" style="font-size: 13px; line-height: 1.4;">We searched everywhere but couldn't find the page you were looking for.</div>

                        <%--Links--%>
                        <div class="d-flex" style="padding-top: 20px; font-size: 15px; color: rgb(72, 148, 253) !important;">

                            <%--Go back to prev page--%>
                            <div class="hover-underline"><a href="">Go Back</a></div>

                            <%--Separator--%>
                            <span>&nbsp;·&nbsp;</span>

                            <%--Go to home page--%>
                            <div class="hover-underline"><a href="">Quora Home</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/static/js/main.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/questions.js"></script>
<script src="/static/js/question.js"></script>

</body>
</html>
