# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
container = $('#translation_messages')
if container.length
  client = new Faye.Client('/faye')

  client.subscribe '/translation', (data) ->
    return unless data.translation == container.data('translationId')
    container.prepend "<li>[#{data.user}]: #{data.body}</li>"
