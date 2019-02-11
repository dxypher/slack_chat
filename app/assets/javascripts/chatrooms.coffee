$(document).on "turbolinks:load", ->
  $("#new_message").on 'keypress', (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      this.dispatchEvent(new Event('submit', {bubbles: true}));