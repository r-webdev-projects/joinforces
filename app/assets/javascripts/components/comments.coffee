jQuery ->
  $('.reply-to-comment').click (e) ->
    e.preventDefault()
    parentComment = $(this).attr('data-comment')
    target = $('div[data-parent-comment="' + parentComment + '"]')

    target.slideDown()

  $('.cancel-reply').click (e) ->
    e.preventDefault()
    parentComment = $(this).attr('data-parent-comment')
    target = $('div[data-parent-comment="' + parentComment + '"]')

    target.slideUp()
