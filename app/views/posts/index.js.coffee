$('<%= escape_javascript(render(@posts)) %>')
  .appendTo('#posts')
  .hide()
  .fadeIn(200)

$('<%= escape_javascript(render(partial: 'post_nav', collection: @posts, as: :post )) %>')
  .appendTo('#posts-nav')
  .hide()
  .fadeIn(200)