jQuery ->

  viewport_height = $(window).height()
  viewport_width = $('.room-bk').width()

  gif_height = (viewport_height * 450) / 2325;
  gif_width = (viewport_width * 727) / 3331;
  vertical_offset = (viewport_height * 1287) / 2325;

  keywords = [
    'oops'
    '404'
    'fail'
    'derp'
    'programming'
    'error'
    'lol'
    'riff raff'
  ]

  messages = [
    "We made a mistake.  We'll get it fixed."
    "Page Not Found"
    "I have not failed. I've just found a way that won't work."
    "herp derp derp heeee deee hooo"
    "Programming is tough.  We're learning.  Give us a break."
    "Any man can make mistakes, but only an idiot persists in his error"
    "You typed the wrong URL.  That's funny."
    "Lil mama I'm sorry I never meant to ball like this"
  ]

  index = Math.floor(Math.random()*keywords.length)
  keyword = keywords[index]
  message = messages[index]

  $('.sign h1').html(keyword)
  $('.sign h2').html(message)

  jsonURL = "//api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" + encodeURIComponent(keyword)

  $.getJSON jsonURL, (data) ->
    url = data.data.image_url
    img = document.createElement("img");
    img.src = url.replace("http:", "");
    img.height = gif_height;

    $(img).appendTo('.display')

    $('.desk').css('top', vertical_offset + 'px')
    $('.display').css('width', gif_width + 'px')
