App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
# Called when the subscription is ready for use on the server
    console.log('Connected to AppearanceChannel')

  disconnected: ->
# Called when the subscription has been terminated by the server
    console.log('Disconnected from AppearanceChannel')

  received: (data) ->
# Called when there's incoming data on the websocket for this channel
    console.log('Received data online: ' + data.users)
    $('#online').html data.users.map((user) -> "<li>#{user}</li>").join("\n")
