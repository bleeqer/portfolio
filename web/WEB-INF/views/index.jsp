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

    <%--  Boostrap  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>

    </style>

</head>
<body>
    <div class="container-fluid bg-dark">
        <nav class="navbar navbar-dark py-0">
            <a href="#" class="navbar-brand">LOGO</a>
            <div class="dropdown">
                <span class="btn btn-secondary my-0" id="user-dropdown" data-bs-toggle="dropdown">User</span>
                <ul class="dropdown-menu" aria-labelledby="book-dropdown">
                    <li><a class="dropdown-item" href="#">My Profile</a></li>
                    <li><a class="dropdown-item" href="#">My Questions</a></li>
                    <li><a class="dropdown-item" href="#">My Answers</a></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div>
<%--            <div class="input-group">--%>
<%--                <div class="form-outline">--%>
<%--                    <input type="search" id="form1" class="form-control" />--%>
<%--                    <label class="form-label" for="form1">Search</label>--%>
<%--                </div>--%>
<%--                <button type="button" class="btn btn-primary">--%>
<%--                    <i class="fas fa-search"></i>--%>
<%--                </button>--%>
<%--            </div>--%>
            <a class="btn btn-danger rounded-pill my-0">ASK QUESTION</a>
        </nav>
    </div>
    <style>

        .btn {
            font-size: 16px;
        }

        .dropdown-menu {
            left: 50% !important;
            right: auto !important;
            transform: translateX(-50%) !important;
        }
    </style>


    <h2>게시판</h2>
<%--    <sec:authorize access="!isAuthenticated()"><span id="login-button">Login</span></sec:authorize>--%>
<%--    <span id="login-button">Login</span>--%>
<%--    <span id="register-button">Register</span>--%>
<%--    <sec:authorize access="isAuthenticated()">Logout</sec:authorize>--%>
<%--    <sec:authorize access="hasRole('ADMIN')"><a href="#">Manage Users</a></sec:authorize>--%>
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
<%--    <%@ include file="/WEB-INF/views/modals/userLoginForm.jsp" %>--%>

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
                //     editor.on('change', function () {
                //         editor.save()
                //     })
                // },
                relative_urls: false,
                // remove_script_host: false

                // setup: function(editor) {
                //
                //     editor.on('init', function(e) {
                //         console.log("editor initialized")
                //     })
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



    </script>
</body>
</html>
