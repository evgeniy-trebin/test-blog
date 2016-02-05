class App.ProfileAvatar
  constructor: (@form) ->
  set_listener: ->
    @form.dropzone
      maxFilesize: 3
      maxFiles: 1
      paramName: 'profile[avatar]'
      addRemoveLinks: true
      success: (file, response) ->
        if response['result'] == 'success'
          @disable()
          window.location.href = response['location']
        else
          alert 'Error!'
          @removeAllFiles()
        return

$(document).on "page:change", ->
  avatar_form = new App.ProfileAvatar $("#profile_avatar_form")
  avatar_form.set_listener()

