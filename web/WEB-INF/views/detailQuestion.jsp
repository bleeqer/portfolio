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
        <div class="d-flex justify-content-center mx-auto" style="width: 1002px; padding-top: 30px; padding-left: 24px; padding-right: 24px;">

            <%--Main content container--%>
            <div style="width: 572px;">

                <%--Question--%>
                <div class="border-bottom-gray">
                    <div>

                        <%--Question--%>
                        <div>
                            <div>
                                <div class="font-bold" style="font-size: 21px;">This is the question</div>
                            </div>
                        </div>

                        <%--Footer--%>
                        <div>
                            <div style="padding-top: 1px; padding-bottom: 1px;">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex">
                                        <%--Answer button--%>
                                        <button class="px-2 rounded-pill bg-hover-whiten-light" style="margin-left: -0.5rem; height: 38px; min-width: 38px; outline: none; border: none; transition: background-color 125ms;" data-bs-toggle="modal" data-bs-target="#answer-modal">
                                            <div class="d-flex justify-content-center align-items-center">
                                                <%--Answer icon--%>
                                                <div>
                                                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <g stroke-width="1.5" fill="none" fill-rule="evenodd">
                                                            <path d="M18.571 5.429h0a2 2 0 0 1 0 2.828l-9.9 9.9-4.24 1.416 1.412-4.245 9.9-9.9h0a2 2 0 0 1 2.828 0Z" stroke="rgb(72, 148, 253)" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            <path fill="#666" d="m4.429 19.571 2.652-.884-1.768-1.768z"></path>
                                                            <path d="M14.5 19.5h5v-5m-10-10h-5v5"  stroke="rgb(72, 148, 253)" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        </g>
                                                    </svg>
                                                </div>
                                                <%--Answer text--%>
                                                <div class="color-gray ms-1" style="font-size: 14px;">
                                                    <div>Answer</div>
                                                </div>
                                            </div>
                                        </button>

                                        <%--Comment 버튼--%>
                                        <%--                                                                            <div role="button">--%>

                                        <%--                                                                                &lt;%&ndash;Container&ndash;%&gt;--%>
                                        <%--                                                                                <div class="d-inline">--%>

                                        <%--                                                                                    &lt;%&ndash;Comment button&ndash;%&gt;--%>
                                        <%--                                                                                    <div class="d-flex rounded-pill px-2 bg-hover-whiten-light">--%>

                                        <%--                                                                                        &lt;%&ndash;Comment icon&ndash;%&gt;--%>
                                        <%--                                                                                        <span class="d-inline-block d-flex align-items-center justify-content-center" style="height: 38px;">--%>
                                        <%--                                                                                          <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">--%>
                                        <%--                                                                                            <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z" class="icon_svg-stroke icon_svg-fill" stroke="#666" stroke-width="1.5" fill="none"></path>--%>
                                        <%--                                                                                          </svg>--%>
                                        <%--                                                                                        </span>--%>

                                        <%--                                                                                        &lt;%&ndash;Comment count&ndash;%&gt;--%>
                                        <%--                                                                                        <div class="d-flex align-items-center justify-content-center">--%>
                                        <%--                                                                                            100--%>
                                        <%--                                                                                        </div>--%>
                                        <%--                                                                                    </div>--%>
                                        <%--                                                                                </div>--%>
                                        <%--                                                                            </div>--%>

                                        <%--Pass button--%>
                                        <%--                                                                            <button class="px-2 rounded-pill bg-hover-whiten-light" style="height: 38px; min-width: 38px; outline: none; border: none; transition: background-color 125ms;">--%>
                                        <%--                                                                                <div class="d-flex justify-content-center align-items-center">--%>
                                        <%--                                                                                    &lt;%&ndash;Answer icon&ndash;%&gt;--%>
                                        <%--                                                                                    <div>--%>
                                        <%--                                                                                        <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">--%>
                                        <%--                                                                                            <g fill="none" fill-rule="evenodd">--%>
                                        <%--                                                                                                <path d="m11.828 9.314 3.9-3.9a2 2 0 1 1 2.828 2.829l-3.9 3.9m-3.535 3.535-2.464 2.464-4.241 1.416 1.412-4.244 2.465-2.465" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" stroke-linecap="square" stroke-linejoin="round"></path>--%>
                                        <%--                                                                                                <path class="icon_svg-fill_as_stroke" fill="#666" d="m4.414 19.556 2.652-.884-1.768-1.767z"></path>--%>
                                        <%--                                                                                                <path d="M4.636 5.636 18.5 19.5" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" stroke-linecap="round"></path>--%>
                                        <%--                                                                                            </g>--%>
                                        <%--                                                                                        </svg>--%>
                                        <%--                                                                                    </div>--%>
                                        <%--                                                                                    &lt;%&ndash;Answer text&ndash;%&gt;--%>
                                        <%--                                                                                    <div class="color-gray ms-1" style="font-size: 14px;">--%>
                                        <%--                                                                                        <div>Pass</div>--%>
                                        <%--                                                                                    </div>--%>
                                        <%--                                                                                </div>--%>
                                        <%--                                                                            </button>--%>
                                    </div>

                                    <%--right side of footer--%>
                                    <div class="d-flex">

                                        <%--Share button--%>
                                        <div>
                                            <div>
                                              <span class="bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                  <path d="m21 12-9.778-8v5.333c-1.926.45-3.5 1.172-4.722 2.167-1.222.995-2.389 2.495-3.5 4.5 1.333-.659 2.833-1.157 4.5-1.496 1.667-.34 2.908-.285 3.722.163V20L21 12Z" class="icon_svg-stroke" stroke="#666" fill="none" stroke-width="1.5" stroke-linejoin="round"></path>
                                                </svg>
                                              </span>
                                            </div>
                                        </div>

                                        <%--Three dots--%>
                                        <div>
                                            <span class="bg-hover-whiten-light rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                              <svg class="d-block" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Z"
                                                      class="icon_svg-stroke" stroke-width="1.5" stroke="#666" fill="none">
                                                </path>
                                              </svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <%--Answers--%>
                <div>

                    <%--Answer list header--%>
                    <div>
                        <div class="py-2 d-flex align-items-center justify-content-between border-bottom-gray">

                            <%--Answer count--%>
                            <div>
                                <div class="d-flex">

                                    <%--List icon--%>
                                    <div class="d-flex justify-content-center align-items-center p-1 me-2 rounded-circle bg-blue-2">
                                        <div>
                                            <span class="d-flex" style="width: 16px; height: 16px;">
                                                <svg style="width: 16px; height: 16px;" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M8.5 5.75h11a.5.5 0 0 1 .5.5v.5a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-.5a.5.5 0 0 1 .5-.5zm0 5.5h11a.5.5 0 0 1 .5.5v.5a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-.5a.5.5 0 0 1 .5-.5zm0 5.5h11a.5.5 0 0 1 .5.5v.5a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-.5a.5.5 0 0 1 .5-.5zM4.5 5.5h1A.5.5 0 0 1 6 6v1a.5.5 0 0 1-.5.5h-1A.5.5 0 0 1 4 7V6a.5.5 0 0 1 .5-.5zm0 5.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zm0 5.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1A.5.5 0 0 1 4 18v-1a.5.5 0 0 1 .5-.5z" class="icon_svg-fill_as_stroke" fill="#fff" fill-rule="evenodd"></path>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div style="font-size: 15px; line-height: 26px;">
                                        0 Answers
                                    </div>
                                </div>
                            </div>

                            <%--Sorting option--%>
                            <div class="d-flex cursor-pointer rounded-pill bg-hover-whiten-light px-3 py-1 position-relative">
                                <div class="d-flex me-1" style="font-size: 15px;">
                                    Sort
                                </div>
                                <div class="d-flex align-items-center">
                                    <svg width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path d="m5 8.5 7 7 7.005-7" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" fill="none" stroke-linecap="round"></path>
                                    </svg>
                                </div>

                                <div id="sort-button" class="position-absolute" data-bs-toggle="popover" style="inset: 0; height: 100%; width: 100%; z-index: 2;"></div>
                            </div>
                        </div>
                    </div>

                    <%--Answer--%>
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Popover--%>
<div id="popover-content" style="display: none;">

    <div class="d-flex popover-item">
        <div class="py-1 px-3">Most recent</div>
        <div class="position-relative">
            <div class="mini-checker"></div>
        </div>
    </div>
    <div class="d-flex popover-item">
        <div class="py-1 px-3">Most Liked</div>
        <div class="position-relative">
            <div class="mini-checker"></div>
        </div>
    </div>
</div>

<%--    <div class="container-fluid m-0" style="padding-top: 50px;">--%>
<%--        <div class="d-flex mx-auto pt-3 px-2" style="max-width: 1002px;">--%>

<%--        </div>--%>
<%--    </div>--%>
<script src="/static/js/main.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/questions.js"></script>

<script>




</script>
</body>
</html>
