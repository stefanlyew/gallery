# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#galleries drag and drop
jQuery ->
  $('#sortable').sortable(
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

  );

jQuery ->
  $('#featuredsort').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

# Lightbox
((window, PhotoSwipe) ->
  document.addEventListener "DOMContentLoaded", (->
    options = {}
    instance = PhotoSwipe.attach(window.document.querySelectorAll(".thumbnails a"), options)
  ), false
) window, window.Code.PhotoSwipe