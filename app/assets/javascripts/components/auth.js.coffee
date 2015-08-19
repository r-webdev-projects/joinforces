jQuery ->

  # Assign .focus class when user begins typing
  form = $('#new_user')
  formFields = form.find("input[type='text'], input[type='email'], input[type='password']")

  formFields.focus ->
    container = $(this).parent('.field')
    container.addClass('focus')

  formFields.blur ->
    container = $(this).parent('.field')
    container.removeClass('focus')

    # If input has a value (user entered something), retain the field label
    if $(this).val()
      container.addClass('valid')
    # If user deletes what they entered, return to default placeholder
    else if container.hasClass('valid')
      container.removeClass('valid')


  # Autofill username based on email address
  emailField = form.find("#user_email")
  usernameField = form.find("#user_username")
  usernameField.pristine = true;

  greeting = $('.figure blockquote span')

  emailField.keyup ->
    # Only update username if user hasn't changed it
    if usernameField.pristine & $(this).val().length > 0
      usernameField.val( emailToUsername(emailField.val()) )

      container = usernameField.parent('.field')
      unless container.hasClass('valid')
        container.addClass('valid')

    else if $(this).val().length == 0
      usernameField.val("")
      usernameField.pristine = true

  emailField.blur ->
    # If email and username field is blank, restore username field to original
    # state once user clicks out
    if !emailField.val() && !usernameField.val()
      usernameField.pristine = true
      if usernameField.parent('.field').hasClass('valid')
        usernameField.parent('.field').removeClass('valid')
    else if usernameField.val()
      # Once user finishes typing, add a little greeting in the blockquote
      greeting.html("Hey " + usernameField.val() + "! ")

  usernameField.change ->
    # If user manually changes the username, don't let it be updated via the email field

    if $(this).val()
      usernameField.pristine = false
      greeting.html("Hey " + $(this).val() + "! ")
    else
      greeting.html("")


  emailToUsername = (email) ->
    local = email.match(/^[^@]+/).toString()
    username = local.replace(/[^0-9a-zA-Z\_-]/g, '')
    return username


