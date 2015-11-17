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

  $(".new_comment").on 'ajax:success', (e, data, status, xhr) ->
    # console.log data[0]
    # TODO: show comments inline after successful submission
    comment = data[0]
    console.log 'comment submitted successfully'

