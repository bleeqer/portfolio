<%--
  Created by IntelliJ IDEA.
  User: linux-king
  Date: 2/13/22
  Time: 8:16 PM
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
  <script src="/js/tinymce/tinymce.min.js"></script>
  <script src="/js/tinymce/jquery.tinymce.min.js"></script>

  <sec:csrfMetaTags/>

  <!-- jQuery Modal -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

  <%--  Bootstrap  --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  <%-- Bootstrap Icon --%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <style>

    .fade-post {
      max-height: 200px;
      overflow: hidden;
      text-overflow: ellipsis;
      position: relative;
    }

    input, textarea, button, a {
      color: rgb(213, 214, 214);
      background-color: transparent;
    }

    a:hover {
      color: rgb(213, 214, 214);
    }

    .overflow-fade {
      width: 100%;
      height: 100%;
      position: absolute;
      inset: 0;
      background: linear-gradient(to bottom, transparent 60%, rgb(38, 38, 38) 100%);
      display: block;
    }

    .readMore-button {
      position: absolute;
      bottom: 50%;
      right: 50%;
      transform: translate(50%, 50%);
      opacity: 0.9;
    }

    .search-overlay {
      top: 50px;
      right: 0;
      left: 0;
      bottom: 0;
      opacity: 0;
      z-index: 2;
      visibility: hidden;
      transition: opacity 250ms, visibility 250ms;
    }


    input.search-input:focus + .search-overlay {
      opacity: 1;
      visibility: visible;
    }

    .show-search-overlay {
      opacity: 1;
      visibility: visible;
    }

    .link-default-color {
      color: rgb(213, 214, 214);
    }

    .link-default-color:hover {
      color: rgb(213, 214, 214);
    }

    .hover-underline:hover {
      text-decoration: underline!important;
    }

    .btn {
      font-size: 16px;
    }

    .bg-dark {
      background-color: rgb(38, 38, 38)!important;
    }

    .bg-black {
      background-color: rgb(18, 18, 18)!important;
    }

    .bg-transparent-dark {
      background-color: rgba(36, 36, 36, 0.9);
    }

    .border-color-dark {
        border-color: rgb(26, 26, 26)!important;
    }

    .border-color-grey {
      border-color: rgb(57, 56, 57)!important;
    }

    .hover-border-color-blue:hover {
      border-color: rgb(46, 105, 255)!important;
      /*border-color: white!important;*/
    }

    .border-color-whiten {
        border-color: rgba(255, 255, 255, 0.06)!important;
    }

    .bg-hover-whiten:hover {
      background-color: rgba(255, 255, 255, 0.09)!important;
    }

    .bg-hover-whiten-light:hover {
      background-color: rgba(255, 255, 255, 0.04)!important;
    }

    .bg-hover-whiten:hover .overflow-fade {
      background: linear-gradient(to bottom, transparent 60%, rgb(46, 46, 46) 100%);
    }

    .bg-hover-darken:hover {
      background-color: rgba(0, 0, 0, 0.09)!important;
    }

    .rounded-left-top-pill {
      border-top-left-radius: 1000px;
    }

    .rounded-left-bottom-pill {
      border-bottom-left-radius: 1000px;
    }

    .rounded-right-top-pill {
      border-top-right-radius: 1000px;
    }

    .rounded-right-bottom-pill {
      border-bottom-right-radius: 1000px;
    }

    .rounded-7 {
      border-radius: 0.7rem!important;
    }

    html, body {
      box-sizing: border-box;
      padding: 0;
      margin: 0;
      font-size: 16px;
      background-color: #181818;
      color: rgb(213, 214, 214);
    }

    .dropdown-menu {
      left: 50% !important;
      right: auto !important;
      transform: translateX(-50%) !important;
    }

    .icon_svg-stroke {
      stroke: rgb(177, 179, 182);
    }

    .color-grey {
      color: #b1b3b6;
    }

    .font-size-1 {
      font-size: 13px;
    }

    .cursor-pointer {
      cursor: pointer;
    }

    .hidden {
      display: none!important;
    }

    a {
      text-decoration: none;
    }

    .best-title:hover div {
      overflow: visible!important;
      white-space: normal!important;
    }

    .border-bottom-grey {
      border-bottom-style: solid;
      border-width: 1px;
      border-color: #393839;
    }

  </style>

</head>
<body>
  <div class="position-fixed container-fluid bg-dark border-bottom border-color-dark shadow" style="z-index: 3;">
    <div class="bg-dark"></div>
    <nav class="navbar navbar-dark py-0 mx-auto" style="max-width: 1002px; height: 50px;">

      <%--Logo--%>
      <a href="#" class="navbar-brand px-2">LOGO</a>

      <%--Home button--%>
      <a href="#" class="d-flex align-items-center justify-content-center rounded-1 position-relative" style="height: 50px; width: 60px;">
        <div>
          <span class="d-inline-block">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M14.5 17.5a2.5 2.5 0 1 0-5 0v5a.625.625 0 0 1-.533.618l-.092.007H4.5a.625.625 0 0 1-.618-.533l-.007-.092v-9.375H.75a.625.625 0 0 1-.505-.995l.063-.072L11.558.808a.625.625 0 0 1 .797-.072l.087.072 11.25 11.25c.37.37.145.989-.347 1.06l-.095.007h-3.125V22.5a.625.625 0 0 1-.533.618l-.092.007h-4.375a.625.625 0 0 1-.625-.625v-5Z" class="icon_svg-fill_as_stroke" fill="rgb(220, 53, 69)"></path>
            </svg>
          </span>
        </div>
        <div class="bg-hover-whiten position-absolute rounded-2" style="height: 45px; min-width: 60px; transition: background-color 250ms;"></div>
        <div class="rounded-left-top-pill rounded-right-top-pill bg-danger position-absolute" style="height: 3px; width: 44px; left: 50%; bottom: 0; transform: translateX(-50%);"></div>
      </a>

      <%--Answer button--%>
      <a href="#" class="d-flex align-items-center justify-content-center rounded-1 position-relative" style="height: 50px; width: 60px;">
        <div>
          <span class="d-inline-block">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <path class="icon_svg-fill_as_stroke" d="M20.582 1.469a2.757 2.757 0 0 1 1.369 4.468l-.134.143L7.594 20.299a.615.615 0 0 1-.129.099l-.073.036-1.238.514.006.006-.1.033-3.82 1.59a.615.615 0 0 1-.662-.116l-.058.019.019-.058a.615.615 0 0 1-.147-.569l.031-.093 1.592-3.831.031-.089.005.005.515-1.237a.637.637 0 0 1 .081-.141l.054-.061L17.92 2.182a2.756 2.756 0 0 1 2.662-.713zm.918 8.406c.314 0 .574.231.618.533l.007.092v11a.624.624 0 0 1-.533.618l-.092.007h-11a.625.625 0 0 1-.092-1.243l.092-.007h10.375V10.5c0-.314.231-.574.533-.618l.092-.007zm-2.577-6.916-.119.107L4.673 17.201l-.666 1.6 1.19 1.19 1.601-.665 14.136-14.13c.304-.304.46-.72.439-1.14l-.016-.158-.033-.157a1.504 1.504 0 0 0-2.4-.782zM13.5 1.875a.625.625 0 0 1 .092 1.243l-.092.007H3.124L3.125 13.5a.624.624 0 0 1-.533.618l-.092.007a.624.624 0 0 1-.618-.533l-.007-.092v-11c0-.314.231-.574.533-.618l.092-.007h11z" fill="#B1B3B6"></path>
            </svg>
          </span>
        </div>
        <div class="bg-hover-whiten position-absolute rounded-2" style="height: 45px; min-width: 60px; transition: background-color 250ms;"></div>
      </a>

      <%--Notif button--%>
      <a href="#" class="d-flex align-items-center justify-content-center rounded-1 position-relative" style="height: 50px; width: 60px;">
        <div>
        <span class="d-inline-block">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
            <path class="icon_svg-fill_as_stroke" d="M7.526 20.785H2.79a.625.625 0 0 1-.625-.625v-2.87c0-.283.19-.53.463-.604a3.359 3.359 0 0 0 2.093-1.655c.207-.456.349-1.126.426-1.944a18.81 18.81 0 0 0 .044-2.578l-.025-.44a6.84 6.84 0 0 1 4.402-6.386 2.54 2.54 0 0 1 4.133-2.658 2.54 2.54 0 0 1 .692 2.678 6.866 6.866 0 0 1 4.346 6.415l-.022.381a19.11 19.11 0 0 0 .046 2.585c.076.811.214 1.476.415 1.932a3.376 3.376 0 0 0 2.079 1.657.625.625 0 0 1 .459.603v2.885c0 .345-.28.625-.625.625h-4.616a4.93 4.93 0 0 1-8.948 0zm1.432 0a3.68 3.68 0 0 0 6.084 0H8.958zm-1.155-1.25a.62.62 0 0 1 .273 0h7.847a.62.62 0 0 1 .273 0h4.269v-1.81a4.62 4.62 0 0 1-2.402-2.143l-.018-.037c-.272-.605-.439-1.399-.527-2.346a20.211 20.211 0 0 1-.05-2.758l.022-.371a5.594 5.594 0 0 0-4.219-5.418A6.03 6.03 0 0 0 12 4.485h-.089a6.048 6.048 0 0 0-1.291.186.713.713 0 0 1-.12.019c-2.358.657-4.083 2.813-4.087 5.331l.026.43c.042.89.037 1.847-.048 2.754-.089.945-.257 1.738-.548 2.377a4.623 4.623 0 0 1-2.428 2.161v1.793h4.389zm2.969-16.189a6.907 6.907 0 0 1 1.104-.111h.133c.402.006.796.048 1.178.121a1.29 1.29 0 0 0-2.078-1.409 1.29 1.29 0 0 0-.337 1.4z" fill="#B1B3B6"></path>
          </svg>
        </span>
        </div>
        <div class="bg-hover-whiten position-absolute rounded-2" style="height: 45px; min-width: 60px; transition: background-color 250ms;"></div>
      </a>

      <%--Spacer--%>
      <div style="min-width: 200px; height: 1px;">

      </div>
      <%--Search box--%>
      <div class="ms-3 me-2 bg-black rounded-pill border border-color-grey hover-border-color-blue position-relative">
        <form id="search-form" action="/search" method="get">
          <div class="d-flex py-1 px-2" style="transition: background-color 250ms; height: 40px;">

            <div class="d-flex justify-content-center">
              <%--Search bar--%>
              <div class="d-flex ms-1">
                <input class="search-input justify-content-center" type="text" value="" name="keyword" id="keyword" style="background-color: transparent; border: none; min-height: 26px; font-size:13px; outline: none; transition: visibility 250ms, opacity 250ms;" placeholder="Search..." autocomplete="off">

                <%--Search focus overlay--%>
                <div class="position-fixed bg-transparent-dark search-overlay hidden"></div>
              </div>
            </div>
            <div class="d-flex">
              <%--Magnifying glass--%>
              <span class="d-flex justify-content-center">
                <svg class="my-auto me-1 search-button cursor-pointer" width="20" height="20" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path d="M10.5 18a7.5 7.5 0 1 1 0-15 7.5 7.5 0 0 1 0 15Zm10.45 2.95L16 16l4.95 4.95Z" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" fill="none" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
              </span>
            </div>
          </div>
        </form>
          <%--keyword display--%>
<%--          <div class="position-absolute bg-dark px-3 d-flex align-items-center search-display border border-color-grey hidden" style="top: 100%; right: 0; height: 100%; width: 100%; overflow: hidden; cursor: pointer;">--%>
<%--            &lt;%&ndash;Magnifying glass&ndash;%&gt;--%>
<%--            <div class="me-2">--%>
<%--              <span>--%>
<%--                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">--%>
<%--                  <path d="M10.5 18a7.5 7.5 0 1 1 0-15 7.5 7.5 0 0 1 0 15Zm10.45 2.95L16 16l4.95 4.95Z" class="icon_svg-stroke" stroke="#666" stroke-width="1.5" fill="none" stroke-linecap="round" stroke-linejoin="round"></path>--%>
<%--                </svg>--%>
<%--              </span>--%>
<%--            </div>--%>

<%--            &lt;%&ndash;keyword&ndash;%&gt;--%>
<%--            <div style="width: 100%;">--%>
<%--              <div class="d-flex align-items-center">--%>
<%--                <p class="my-auto">Search:&nbsp;</p><b><p class="display-keyword my-auto"></p></b>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
        </form>
      </div>

      <div class="dropdown px-2 position-relative d-flex justify-content-center align-items-center user-profile" style="height: 50px; width: 60px;">
        <img class="cursor-pointer" id="user-dropdown" data-bs-toggle="dropdown" src="/static/img/user.png" style="width: 30px; height: 30px;"/>
        <ul class="dropdown-menu" aria-labelledby="book-dropdown">
          <li><a class="dropdown-item" href="#">My Profile</a></li>
          <li><a class="dropdown-item" href="#">My Questions</a></li>
          <li><a class="dropdown-item" href="#">My Answers</a></li>
          <div class="dropdown-divider"></div>
          <li><a class="dropdown-item" href="#">Logout</a></li>
        </ul>
        <div class="bg-hover-whiten position-absolute rounded-2" style="height: 45px; min-width: 60px; transition-property: background-color; transition-duration: 250ms;"></div>
      </div>
      <div class="px-2">
      <a class="btn btn-danger rounded-pill py-1">Ask question</a>
      </div>
    </nav>
  </div>

  <%--Search focus overlay--%>
  <div class="position-fixed bg-transparent-dark search-overlay"></div>

  <div class="container-fluid m-0" style="padding-top: 50px;">
    <div class="d-flex mx-auto pt-3 px-2" style="max-width: 1002px;">

      <%--카테고리 리스트--%>
        <div class="pb-5 position-fixed" style="width: 166px;">
          <div>

            <%--개별 카테고리 컨테이너--%>
            <div class="mb-1 rounded-1 bg-hover-whiten-light">
              <a class="text-decoration-none" href="">
                <div class="p-2 d-flex" style="height: auto;">
                  <%--카테고리 아이콘--%>
                  <div class="me-2">
                    <div class="d-flex rounded-1 overflow-hidden">
                      <img width="18" height="18" src="/static/img/python.jpeg" alt="IMG">
                    </div>
                  </div>

                  <%--카테고리 이름--%>
                  <div class="d-flex">
                    <div class="d-flex font-size-1">
                      <div class="text-center d-flex align-items-center">Python</div>
                    </div>
                  </div>
                </div>
              </a>
            </div>

          </div>
        </div>

        <%--질문글 리스트--%>
        <div style="width: 572px; margin-left:172px;">
          <div>
            <div>

              <%--질문글--%>
              <div class="mb-3 mx-1" style="">

                <%--배경색--%>
                <div class="rounded-3 shadow-sm border border-color-dark bg-dark position-relative bg-hover-whiten">
                  <div class="px-4 pt-3" style="height: 100%;">
                    <div>

                      <%--질문글--%>
                      <div>

                        <%--질문글 body--%>
                        <div>

                          <%--질문자 프로필--%>
                          <div>
                            <div class="mb-2 d-flex">
                              <%--프로필 사진--%>
                              <div class="me-3 position-relative">
                                <div>
                                  <img class="rounded-7 border border-color-whiten" src="/static/img/flower.jpeg" alt="" width="50" height="50">
                                </div>
                                <div class="bg-hover-darken position-absolute" style="inset: 0;">
                                </div>
                              </div>

                              <%--프로필 정보--%>
                              <div class="d-flex flex-column">

                                <%--이름--%>
                                <div class="my-auto font-size-1"><a class="text-decoration-none link-default-color hover-underline h6" href=""><b>홍길동</b></a></div>

                                <%--상세--%>
                                <div class="my-auto color-grey font-size-1">프로그래머</div>

                              </div>
                            </div>
                            <%--질문글 제목--%>
                            <div>
                              <div>
                                <h3><a class="text-decoration-none link-default-color hover-underline" href="#"><b>This is the title of the question!</b></a></h3>
                              </div>
                            </div>

                            <%--질문글 내용--%>
                            <div class="position-relative">
                              <div class="fade-post">
                                <div class="" style="line-height: 1.5rem;">
                                  Suspendisse nisi lorem, pellentesque tempor consequat a, viverra vitae velit. Phasellus non est tincidunt felis dictum viverra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ornare, massa et efficitur dignissim, ligula mauris rutrum lectus, at elementum justo ex in dui. Mauris ut mattis libero, et iaculis magna. Maecenas in malesuada nisi, a scelerisque lectus. Suspendisse leo lacus, ornare eu felis non, hendrerit suscipit risus. Etiam elementum risus nec nisi blandit, non bibendum velit vulputate. Donec felis nunc, tempor eget placerat a, fringilla quis sapien. In vel bibendum erat. Maecenas egestas finibus ex, eu vulputate eros condimentum non. Donec eu sodales neque. Nullam lobortis, dolor non dapibus interdum, purus dui efficitur eros, quis aliquam neque lacus sed ex.

                                  Nulla vel imperdiet justo, eget aliquet ex. Etiam pharetra ex tristique tortor interdum, nec pellentesque elit pharetra. Integer et est elementum, blandit leo et, accumsan magna. Cras cursus mi vitae lacus convallis ultricies. Nulla sollicitudin risus eget erat suscipit, sit amet pellentesque massa condimentum. Duis viverra non arcu id feugiat. Pellentesque vitae molestie diam, id laoreet dui. Sed ut rhoncus magna. Mauris luctus egestas nunc, eu lacinia dolor hendrerit vel. Donec eros magna, accumsan non ante quis.
                                  <img src="/static/img/flower.jpeg" alt="" width="100%">
                                </div>
                                <div class="overflow-fade"></div>
                              </div>
                              <span class="readMore-button btn btn-primary rounded-pill">More</span>
                            </div>
                          </div>
                        </div>

                        <%--질문글 footer--%>
                        <div>

                        </div>
                      </div>

  <%--                    <div class="my-3"></div>--%>



                      <%--Views, Upvotes 표시--%>
  <%--                    <div class="mt-3 d-flex">--%>
  <%--                      <div>Views</div>--%>
  <%--                      <div>Upvotes</div>--%>
  <%--                    </div>--%>

                      <%--Upvote/Downvote, Comment, Share, Option 버튼--%>
                      <div class="px-1">

                        <%--Container--%>
                        <div class="d-flex justify-content-center align-items-center my-1" style="height: 46px;">

                          <%--div.Upvote/Downvote, Comment 버튼--%>
                          <div class="d-flex justify-content-center align-items-center">

                            <%--Upvote/Downvote 버튼--%>
                            <div class="me-1 d-flex justify-content-center align-items-center">

                              <%--Container--%>
                              <div class="d-flex rounded-pill" role="button" style="background-color: rgba(255, 255, 255, 0.05); height: 30px;">
                                <%--Upvote 버튼--%>
                                <div class="d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill" >
                                  <div class="d-flex">
                                    <div>
                                      <span class="d-inline-block d-flex align-items-center justify-content-center">
                                        <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                          <path d="M12 4 3 15h6v5h6v-5h6z" class="icon_svg-stroke icon_svg-fill" stroke-width="1.5" stroke="#666" fill="none" stroke-linejoin="round"></path>
                                        </svg>
                                      </span>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center">
                                      Upvote Count
                                    </div>
                                  </div>
                                </div>
                                  <%--Upvote 버튼--%>
                                <div class="d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill" >
                                  <div class="d-flex">
                                    <div>
                                    <span class="d-inline-block d-flex align-items-center justify-content-center">
                                      <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path d="m12 20 9-11h-6V4H9v5H3z" class="icon_svg-stroke icon_svg-fill" stroke="#666" fill="none" stroke-width="1.5" stroke-linejoin="round"></path>
                                      </svg>
                                    </span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <%--Comment 버튼--%>
                            <div role="button">

                              <%--Container--%>
                              <div>

                                <%--Comment button--%>
                                <div class="d-flex rounded-pill px-2 bg-hover-whiten">

                                  <%--Comment icon--%>
                                  <span class="d-inline-block d-flex align-items-center justify-content-center" style="height: 30px;">
                                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                      <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z" class="icon_svg-stroke icon_svg-fill" stroke="#666" stroke-width="1.5" fill="none"></path>
                                    </svg>
                                  </span>

                                  <%--Comment count--%>
                                  <div class="d-flex align-items-center justify-content-center">
                                      100
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <%--Option 버튼--%>
                          <div class="ms-auto">

                            <%--Container--%>
                            <div>
                              <span class="bg-hover-whiten rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;s">
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
                </div>
              </div>

            <%--질문글--%>
            <div class="mb-3 mx-1" style="">

              <%--배경색--%>
              <div class="rounded-3 shadow-sm border border-color-dark bg-dark position-relative bg-hover-whiten">
                <div class="px-4 pt-3" style="height: 100%;">
                  <div>

                    <%--질문글--%>
                    <div>
                      <%--질문글 body--%>
                      <div>

                        <%--프로필--%>
                        <div>
                          <div class="mb-3 d-flex">
                            <%--프로필 사진--%>
                            <div class="me-3 position-relative">
                              <div>
                                <img class="rounded-7 border border-color-whiten" src="/static/img/flower.jpeg" alt="" width="50" height="50">
                              </div>
                              <div class="bg-hover-darken position-absolute" style="inset: 0;">

                              </div>
                            </div>

                            <%--프로필 정보--%>
                            <div>
                              <%--이름--%>
                              <div class=""><a href=""><b>홍길동</b></a></div>

                              <%--상세--%>
                              <div class="text-center">프로그래머</div>
                            </div>
                          </div>
                          <%--질문글 제목--%>
                          <div>
                            <div>
                              <h3><b>This is the title of the question!</b></h3>
                            </div>
                          </div>

                          <%--질문글 내용--%>
                          <div>
                            <div class="fade-post">
                              <div class="">
                                Suspendisse nisi lorem, pellentesque tempor consequat a, viverra vitae velit. Phasellus non est tincidunt felis dictum viverra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ornare, massa et efficitur dignissim, ligula mauris rutrum lectus, at elementum justo ex in dui. Mauris ut mattis libero, et iaculis magna. Maecenas in malesuada nisi, a scelerisque lectus. Suspendisse leo lacus, ornare eu felis non, hendrerit suscipit risus. Etiam elementum risus nec nisi blandit, non bibendum velit vulputate. Donec felis nunc, tempor eget placerat a, fringilla quis sapien. In vel bibendum erat. Maecenas egestas finibus ex, eu vulputate eros condimentum non. Donec eu sodales neque. Nullam lobortis, dolor non dapibus interdum, purus dui efficitur eros, quis aliquam neque lacus sed ex.

                                Nulla vel imperdiet justo, eget aliquet ex. Etiam pharetra ex tristique tortor interdum, nec pellentesque elit pharetra. Integer et est elementum, blandit leo et, accumsan magna. Cras cursus mi vitae lacus convallis ultricies. Nulla sollicitudin risus eget erat suscipit, sit amet pellentesque massa condimentum. Duis viverra non arcu id feugiat. Pellentesque vitae molestie diam, id laoreet dui. Sed ut rhoncus magna. Mauris luctus egestas nunc, eu lacinia dolor hendrerit vel. Donec eros magna, accumsan non ante quis.
                                <img src="/static/img/flower.jpeg" alt="" width="100%" height="100%">
                              </div>
                              <div class="overflow-fade"></div>
                              <span class="readMore-button">More</span>
                            </div>
                          </div>
                        </div>
                      </div>

                      <%--질문글 footer--%>
                      <div>

                      </div>
                    </div>


                    <%--답변글--%>
                    <div>
                      <%--답변글 body--%>
                      <div>

                      </div>

                      <%--답변글 footer--%>
                      <div>

                      </div>
                    </div>


                    <%--Views, Upvotes 표시--%>
                    <div class="mt-3 d-flex">
                      <div>Views</div>
                      <div>Upvotes</div>
                    </div>

                    <%--Upvote/Downvote, Comment, Share, Option 버튼--%>
                    <div class="px-1">

                      <%--Container--%>
                      <div class="d-flex justify-content-center align-items-center py-1" style="height: 46px;">

                        <%--div.Upvote/Downvote, Comment 버튼--%>
                        <div class="d-flex justify-content-center align-items-center">

                          <%--Upvote/Downvote 버튼--%>
                          <div class="me-1 d-flex justify-content-center align-items-center">

                            <%--Container--%>
                            <div class="d-flex rounded-pill" role="button" style="background-color: rgba(255, 255, 255, 0.05);">
                              <%--Upvote 버튼--%>
                              <div class="d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-left-top-pill rounded-left-bottom-pill" style="height: 38px">
                                <div class="d-flex">
                                  <div>
                                      <span class="d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                          <path d="M12 4 3 15h6v5h6v-5h6z" class="icon_svg-stroke icon_svg-fill" stroke-width="1.5" stroke="#666" fill="none" stroke-linejoin="round"></path>
                                        </svg>
                                      </span>
                                  </div>
                                  <div class="d-flex align-items-center justify-content-center">
                                    Upvote Count
                                  </div>
                                </div>
                              </div>
                              <%--Divider--%>
                              <%--Downvote 버튼--%>
                              <div class=" d-flex justify-content-center align-items-center bg-hover-whiten px-2 rounded-right-top-pill rounded-right-bottom-pill" style="height: 38px">
                                <div>
                                    <span class="d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;s">
                                      <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path d="m12 20 9-11h-6V4H9v5H3z" class="icon_svg-stroke icon_svg-fill" stroke="#666" fill="none" stroke-width="1.5" stroke-linejoin="round"></path>
                                      </svg>
                                    </span>
                                </div>
                              </div>
                            </div>

                          </div>

                          <%--Comment 버튼--%>
                          <div role="button">

                            <%--Container--%>
                            <div>

                              <%--Comment button--%>
                              <div class="d-flex rounded-pill px-2 bg-hover-whiten">

                                <%--Comment icon--%>
                                <span class="d-inline-block d-flex align-items-center justify-content-center" style="height: 38px;">
                                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                      <path d="M12.071 18.86c4.103 0 7.429-3.102 7.429-6.93C19.5 8.103 16.174 5 12.071 5s-7.429 3.103-7.429 6.93c0 1.291.379 2.5 1.037 3.534.32.501-1.551 3.058-1.112 3.467.46.429 3.236-1.295 3.803-.99 1.09.585 2.354.92 3.701.92Z" class="icon_svg-stroke icon_svg-fill" stroke="#666" stroke-width="1.5" fill="none"></path>
                                    </svg>
                                  </span>

                                <%--Comment count--%>
                                <div class="d-flex align-items-center justify-content-center">
                                  100
                                </div>
                              </div>


                            </div>
                          </div>
                        </div>

                        <%--Option 버튼--%>
                        <div class="ms-auto">

                          <%--Container--%>
                          <div>
                              <span class="bg-hover-whiten rounded-circle d-inline-block d-flex align-items-center justify-content-center" style="width: 38px; height: 38px;s">
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
            </div>
          </div>
            </div>

        <%--주간 조회, 좋아요 베스트--%>
        <div style="width: 238px; margin-left: 20px;">

          <%--주간 조회수 베스트--%>
          <div class="bg-dark rounded-3 mb-2">
            <div class="px-4 py-2 border-bottom-grey">
              <div class="text-center">
                <b>Most viewed</b>
              </div>
            </div>

            <div class="best-title px-3 bg-hover-whiten-light py-1 dark border-bottom-grey">
              <div>
                <div>
                  <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 206px;">hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기</div>
                </div>
              </div>
            </div>

          </div>

          <%--주간 좋아요 베스트--%>
          <div class="bg-dark rounded-3">
            <div class="px-4 py-2 border-bottom-grey">
              <div class="text-center">
                <b>Most liked</b>
              </div>
            </div>

            <div class="best-title px-3 bg-hover-whiten-light py-1 dark border-bottom-grey">
              <div>
                <div>
                  <div style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 206px;">hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기 hover 시 끝까지 다 보여주기</div>
                </div>
              </div>
            </div>

          </div>
        </div>
        </div>
      </div>
    </div>
  </div>

  <button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
  <h2>게시판</h2>
<%--  <sec:authorize access="!isAuthenticated()"><span id="login-button">Login</span></sec:authorize>--%>
<%--  <span id="login-button">Login</span>--%>
<%--  <span id="register-button">Register</span>--%>
<%--  <sec:authorize access="isAuthenticated()">Logout</sec:authorize>--%>
<%--  <sec:authorize access="hasRole('ADMIN')"><a href="#">Manage Users</a></sec:authorize>--%>
  <table id="question-table">
    <c:forEach var="category" items="${categories}">
      <a href="/topic/${category.categoryName}">${category.categoryName}</a>
    </c:forEach>
    <span id="ask-button">ASK QUESTION</span>
    <div id="question-list">
      <c:forEach var="question" items="${questions}">
        <tr class="question-row" data-ques_no="${question.quesNo}">
          <td>${question.quesNo}</td>
          <td><a href="/question/${question.quesNo}">${question.title}</a></td>
          <td>${question.writer}</td>
          <td>${question.regDate}</td>
          <td>${question.viewCnt}</td>
          <td><span id="answer-button">ANSWER</span></td>
        </tr>
      </c:forEach>
    </div><br/>
    <span id="more-button">More</span>

  </table>

  <%@ include file="/WEB-INF/views/modals/questionForm.jsp" %>

  <div id="topic" data-selected-topic="${selectedTopic}" style="display: none;"></div>
<%--  <%@ include file="/WEB-INF/views/modals/userLoginForm.jsp" %>--%>

  <form id="logout-form" action="/user/logout" method="POST" style="display: none;">
    <input id="input-csrf" type="text" name="_csrf">
  </form>
  <span id="logout-button"><a href="/user/logout">LOG OUT</a></span>
  <script>
    async function initEditor () {

      await tinymce.init({
        selector: "#content",
        menubar: false,
        statusbar: false,
        toolbar: false,
        height: $("#modal-question").height() - $("title").height(),
        // setup: function (editor) {
        //   editor.on('change', function () {
        //     editor.save()
        //   })
        // },
        relative_urls: false,
        // remove_script_host: false

        // setup: function(editor) {
        //
        //   editor.on('init', function(e) {
        //     console.log("editor initialized")
        //   })
        // }
      })
    }

    const observer = new MutationObserver(function() {

      if ($(".modal").css("display") === "none") {

        // 텍스트 에디터에 저장된 값 지우기
        tinymce.activeEditor.setContent("")

        // 기존 텍스트 에디터 객체 지우기
        tinymce.remove()

        // 인풋 태그에 저장된 값 지우기
        $("input").val("")


      }
    })

    // 변경 감시 대상
    const target = document.getElementById('modal-question');

    // style 속성 감시
    observer.observe(target, { attributes : true, attributeFilter : ['style'] });

  </script>

  <script>

    const name = $("meta[name='_csrf_parameter']").attr("content")
    const header = $("meta[name='_csrf_header']").attr("content")
    const token = $("meta[name='_csrf']").attr("content")

    $(".edit-button").click(async function (e) {

      e.preventDefault()

      const quesNo = $(this).data('id')

        $("#question-form").attr("action", "/question/edit/")

            await $("#modal-question").modal("show")

            await initEditor()

            $.getJSON('/question/edit/' + quesNo, function (question) {

                $("#quesNo").val(question.quesNo)
                $("#title").val(question.title)
                tinymce.activeEditor.setContent(question.content)
                $("#writer").val(question.writer)

            })
        })

        $("#ask-button").click(async function (e) {

            e.preventDefault()

            // 새로운 글 생성 시 quesNo 비활성화
            $("#quesNo").attr('disabled', true)

            $("#question-form").attr("action", "/question/create/")

            await $("#modal-question").modal("show")

            await initEditor()

        })

        $("#answer-button").on('click', function() {

            $(this).parent().parent().append("<div>질문칸 삽입</div>")

        })
    </script>

    <script>

        $("#question-submit").on('click', function(e) {

            e.preventDefault()

            // tinymce 내용 textarea에 저장
            tinymce.activeEditor.save()

            // 작성자란에 현재 로그인 유저 아이디 입력
            $('#writer').val('<sec:authentication property="principal.username"/>')

            let actionURL = $('#question-form').attr('action')

            let imgTags = $("#content_ifr").contents().find(".inserted-image")

            for (let i=0; i<Object.keys(imgTags).length - 2; i++) {

                const src = $(imgTags[i]).attr("src")

                const tag = '<input type="hidden" name="imageList[' + i + ']" value="' + src + '">'
                $("#question-form").append(tag)
            }

            const form = $("#question-form")

            // console.log(form.serialize())

            //ajax form submit
            $.ajax({
                type: "POST",
                url: actionURL,
                data: form.serialize(),
                beforeSend : function(xhr)
                {
                    xhr.setRequestHeader(header, token)
                },
                success: function(question) {

                    // modal window 닫기
                    $('.close-modal').trigger('click')

                    $('#question-table').prepend(
                    '<tr class="question-row" data-ques_no="' + question.quesNo + '">' +
                    '<td>' + question.quesNo + '</td>' +
                    '<td><a href="/question/' + question.quesNo + '" >' + question.title + '</a></td>' +
                    '<td>' + question.writer + '</td>' +
                    '<td>' + question.regDate + '</td>' +
                    '<td>' + question.viewCnt + '</td>' +
                    '<td><span id="answer-button">ANSWER</span></td></tr>'
                    )
                },
                error: function() {
                    alert("등록 실패했습니다.")
                }
            })

        })
    </script>

    <script>
            $('#more-button').on('click', function () {
                // alert($(location).attr('pathname'))
                const topic = $('#topic').data('selected-topic')
                const requestURL = '/topic/more/' + topic
                const lastQuesNo = $('.question-row').last().data('ques_no')
                const param = {quesNo: lastQuesNo}

                $.ajax({
                    type: 'POST',

                    url: requestURL,

                    // contentType: 'application/json; charset=utf-8',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8;',

                    data: param,

                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token)
                    },

                    dataType: 'json',

                    success: function (questions) {
                        for (const question of questions) {
                            $('#question-table').append(
                                '<tr class="question-row" data-ques_no="' + question.quesNo + '">' +
                                '<td>' + question.quesNo + '</td>' +
                                '<td><a href="/question/' + question.quesNo + '" >' + question.title + '</a></td>' +
                                '<td>' + question.writer + '</td>' +
                                '<td>' + question.regDate + '</td>' +
                                '<td>' + question.viewCnt + '</td>' +
                                '<td><span id="answer-button">ANSWER</span></td></tr>'
                            )
                        }
                    },

                    error: function () {
                    }

                })
            })

            $('#logout-button').on('click', function(e) {

                e.preventDefault()

                let logoutForm = $('#logout-form')

                logoutForm.find('#input-csrf').val(token)

                logoutForm.submit()

            })

    $('.readMore-button').on('click', function() {
      $(this).parent().find('.fade-post').css('overflow', 'visible')
      $(this).parent().find('.fade-post').css('max-height', '100%')
      $(this).hide()
      $(this).parent().find('.overflow-fade').css('display', 'none')

    })

    </script>
  <script>
  function isOverflown(element) {
    return element.prop('scrollHeight') > element.height()
  }

  $(document).ready(function() {

      $('.fade-post').each(function() {
        if (isOverflown($('.fade-post'))) {
          $(this).find('.overflow-fade').css('display', 'block')
        }
      })

      // $('.search-overlay').on('click', function() {
      //   $(this).css('visibility', 'hidden')
      // })

    $('.search-input').on('keyup', (function () {
      const keyword = $(this).val()
      console.log($(this).val())
      const keywordDisplay = $('.display-keyword')

      keywordDisplay.html(keyword)

      if (keyword.length > 0) {
        $('.search-display').removeClass('hidden')

      } else {
        $('.search-display').addClass('hidden')
      }
    }))

    $('.search-input').focus(function () {
      $('.search-overlay').addClass('show-search-overlay')

    })

    $('.search-input').focusout(function () {
      $('.search-overlay').removeClass('show-search-overlay')
    })

    $('.search-button').click(function () {
      $('#search-form').submit()
    })

    $(function () {
      $('[data-toggle="popover"]').popover({trigger: "hover"})
    })

    $('.best-title:last-child').removeClass('border-bottom-grey')

  })
  </script>
</body>
</html>
