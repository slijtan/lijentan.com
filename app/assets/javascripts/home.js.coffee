focused_article = null
total_articles_on_page = null
loading_more_posts = null
eof = null

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

	focused_article = primary_article || secondary_article


update_nav_with_focused_article = ->
	make_post_current(find_focused_article())

should_load_more_posts = (trigger_at = 5) ->
	return false if loading_more_posts || eof

	current_article_index = 0
	current_article_found = false
	$('article').each ->
		if $(this).attr('id') == focused_article.attr('id')
			current_article_found = true
		else if !current_article_found
			current_article_index++

	console.log("should load more posts? " + current_article_index + " , " + total_articles_on_page)
	current_article_index >= total_articles_on_page - trigger_at

load_more_posts = (count = 5) ->
	console.log("Loading " + count + " more posts")
	loading_more_posts = true
	$('#nav-post-loading').fadeIn(200)
	animate_nav_post_loading()
	$.ajax '/',
		type: 'GET'
		dataType: 'script'
		data:
			items_per_page: count
			offset: total_articles_on_page
		success: completed_loading_more_posts

completed_loading_more_posts = ->
	previous_total_articles = total_articles_on_page
	calculate_total_articles_on_page()
	eof = true if previous_total_articles == total_articles_on_page

	load_video_iframes()
	loader = $('#nav-post-loading').fadeOut(200).detach()
	loader.appendTo('#posts-nav')
	loading_more_posts = false

animate_nav_post_loading = ->
	console.log("animate_nav_post_loading")
	loading_tag = $('#nav-post-loading a.bullet')
	if(loading_tag.html() == "•")
		loading_tag.html("&bull;&bull;")
	else if(loading_tag.html() == "••")
		loading_tag.html("&bull;&bull;&bull;")
	else if(loading_tag.html() == "•••")
		loading_tag.html("&bull;")

	setTimeout(animate_nav_post_loading, 1000) if loading_more_posts

calculate_total_articles_on_page = ->
	total_articles_on_page = $('article').length

load_video_iframes = ->
	$('video').each ->
		url = $(this).attr('src')
		$(this).replaceWith('<iframe id="ytplayer" type="text/html" src="' + url + '" frameborder="0" />')

set_video_sizes = ->
	ratio = 600/400
	width = $(window).width()
	height = width / ratio
	$('article.video iframe').attr('width', width)
	$('article.video iframe').attr('height', height)

$ ->
	calculate_total_articles_on_page()
	hide_nav_items()
	load_video_iframes()
	set_video_sizes()

	$('nav a.bullet').hover(
		->
			$(this).parent().addClass('hover')
			hide_nav_items()
		->
			$(this).parent().removeClass('hover')
			hide_nav_items()
		)

	$('nav a.bullet').click ->
		event.preventDefault()
		scroll_to_post($(this.hash))

	$(window).resize ->
		set_video_sizes()

	$('article.video').hover(
		->
			$(this).find('header').fadeOut(1300)
		->
			$(this).find('header').fadeIn(1300)
		)

	$(window).scroll ->
		$('.bg-shifting').each -> adjust_shifting_background($(this))
		update_nav_with_focused_article()
		load_more_posts() if Math.random() > 0.8 && should_load_more_posts() #only run this 20% of the time
