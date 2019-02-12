App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_channel = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_channel.length > 0
      active_channel.append(data.message)
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")

  send_message: (chatroom_id, message) ->
    @perform "send_message", { chatroom_id: chatroom_id, body: message }

