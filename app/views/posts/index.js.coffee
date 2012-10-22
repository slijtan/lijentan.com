$('<%= escape_javascript(render(@posts)) %>')
  .appendTo('#posts')
  .hide()
  .fadeIn(200)