
$(window).scroll(function() {

    if ($(window).scrollTop() + 0.4 >= $(document).height() - $(window).height()) {

        const lastQuesNo = $('.question').last().data('ques-no')
        const categoryCode = $('.category-item.selected').data('category-code')

        $.ajax({
            url: '/answer',
            type: 'GET',
            contentType: 'application/json',
            data : {'quesNo': lastQuesNo, categoryCode: categoryCode},
            success: function (questions) {

                $('#question-list').append(questions)
                // initAnswerPopover()

            },
            error: function () {
                console.log('error occurred')
            }
        })
    }
})