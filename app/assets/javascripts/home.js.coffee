#handle shifting backgrounds
adjust_shifting_background = (element) ->
	div_height = element.innerHeight()
	screen_height = $(window).height()
	top_height = element.offset().top
	bottom_height = top_height + div_height
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height

	if top_position <= bottom_height && bottom_position >= top_height
		position_offset = (bottom_position - top_height) * 100 / (div_height + screen_height)
		element.css("background-position", "50% " + position_offset + "%")


#hide nav items that arent current
hide_nav_items = ->
	$('nav li').each ->
		if $(this).hasClass('hover') || $(this).hasClass('current')
			$(this).find('a.title').fadeIn(200)
		else
			$(this).find('a.title').fadeOut(200)

scroll_to_post = (post) ->
	$('html,body').animate({scrollTop:post.offset().top}, 500)
	make_post_current(post)

make_post_current = (post) ->
	$('nav ul').find('li.current').removeClass('current')
	$('#nav-' + post.attr('id')).addClass('current') if post
	hide_nav_items()

find_focused_article = ->
	screen_height = $(window).height()
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height
	hit_area_top = top_position
	hit_area_bottom = top_position + (screen_height / 2)
	primary_article = null
	secondary_article = null

	$('article').each ->
		my_position = $(this).offset().top
		primary_article = $(this) if my_position >= hit_area_top && my_position <= hit_area_bottom
		secondary_article = $(this) if my_position <= hit_area_bottom

	if primary_article
		return primary_article
	else
		return secondary_article

update_nav_with_focused_article = ->
	make_post_current(find_focused_article())


$ ->
	hide_nav_items()
	$('nav a.bullet').hover(
		->
			$(this).parent().addClass('hover')
			hide_nav_items()
		->
			$(this).parent().removeClass('hover')
			hide_nav_items()
		)
	$('nav a.bullet').click -> #(scroll_to_post)
		event.preventDefault()
		scroll_to_post($(this.hash))

	$(window).scroll -> $('.bg-shifting').each -> adjust_shifting_background($(this))
	$(window).scroll -> update_nav_with_focused_article()