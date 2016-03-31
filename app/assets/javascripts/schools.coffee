# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#window.graphDrawed = false
$(document).on "page:change", ->

  el = document.getElementById('graph')
  # get canvas
  options =
    percent: el.getAttribute('data-percent') or 25
    size: el.getAttribute('data-size') or 220
    lineWidth: el.getAttribute('data-line') or 18
    rotate: el.getAttribute('data-rotate') or 0
  canvas = document.createElement('canvas')
  span = document.createElement('span')
  span.textContent = options.percent + '%'
  if typeof G_vmlCanvasManager != 'undefined'
    G_vmlCanvasManager.initElement canvas
  ctx = canvas.getContext('2d')
  canvas.width = canvas.height = options.size
  #if !window.graphDrawed
  if el.childNodes.length == 0
    el.appendChild span
    el.appendChild canvas
  ctx.translate options.size / 2, options.size / 2
  ctx.rotate (-1 / 2 + options.rotate / 180) * Math.PI
  radius = (options.size - (options.lineWidth)) / 2

  drawCircle = (color, lineWidth, percent) ->
    percent = Math.min(Math.max(0, percent or 1), 1)
    ctx.beginPath()
    ctx.arc 0, 0, radius, 0, Math.PI * 2 * percent, false
    ctx.strokeStyle = color
    ctx.lineCap = 'round'
    # butt, round or square
    ctx.lineWidth = lineWidth
    ctx.stroke()
    return

  drawCircle '#efefef', options.lineWidth, 100 / 100
  drawCircle '#555555', options.lineWidth, options.percent / 100
  #window.graphDrawed = true