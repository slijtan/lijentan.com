focused_article = null
total_articles_on_page = null
loading_more_posts = null
eof = null

delay = (ms, func) -> setTimeout func, ms

get_background_position_x = (element) ->
	background_pos = element.css('background-position').split(" ")
	background_pos[0]

get_background_position_y = (element) ->
	background_pos = element.css('background-position').split(" ")
	if background_pos.length > 1
		background_pos[1]
	else
		background_pos[0] #ie10

set_background_position_x = (element, x) ->
	if $.browser.msie && $.browser.version.substring(0, 2) == "9."
		element.css("background-position-x", x)
	else
		element.css("background-position", x + " " + get_background_position_y(element))

set_background_position_y = (element, y) ->
	if $.browser.msie && $.browser.version.substring(0, 2) == "9."
		element.css("background-position-y", y)
	else
		element.css("background-position", get_background_position_x(element) + " " + y)

articles_position_on_page = (article) ->
	div_height = article.innerHeight()
	screen_height = $(window).height()
	top_height = article.offset().top
	bottom_height = top_height + div_height
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height

	(bottom_position - top_height) * 100 / (div_height + screen_height)


handle_reverse_background_position = (element, animation_direction) ->
	if (animation_direction == "up" || animation_direction == "down") && height = element.data('height')
		if height > $(window).height()
			return if animation_direction == "up" then "down" else "up"
		else
			return animation_direction

	else if (animation_direction == "left" || animation_direction == "right") && width = element.data('width')
		if width > $(window).width()
			return if animation_direction == "left" then "right" else "left"
		else
			return animation_direction

	else
		return animation_direction

adjust_scanning_background = (element) ->
	div_height = element.innerHeight()
	screen_height = $(window).height()
	top_height = element.offset().top
	bottom_height = top_height + div_height
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height

	if top_position <= bottom_height && bottom_position >= top_height
		animation_direction = element.data("animation-direction")
		animation_direction = handle_reverse_background_position(element, animation_direction)

		article_y = articles_position_on_page(element)

		switch animation_direction
			when "up"
				set_background_position_y(element, 100.0 - article_y + "%")
			when "down"
				set_background_position_y(element, article_y + "%")
			when "left"
				set_background_position_x(element, 100.0 - article_y + "%")
			when "right"
				set_background_position_x(element, article_y + "%")

adjust_scanning_div = (element) ->
	article = element.parent()
	div_height = article.innerHeight()
	screen_height = $(window).height()
	top_height = article.offset().top
	bottom_height = top_height + div_height
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height

	width = $(element).outerWidth()
	full_width = $(element).parent('div.post').outerWidth()
	height = $(element).outerHeight()
	full_height = $(element).parent('div.post').outerHeight()

	if top_position <= bottom_height && bottom_position >= top_height
		animation_direction = element.data("animation-direction")
		animation_direction = handle_reverse_background_position(element, animation_direction)
		article_y = articles_position_on_page(article)

		new_top = new_left = 0

		switch animation_direction
			when "down"
				new_top = fluid_to_cartesian(article_y, height, full_height)
			when "up"
				new_top = fluid_to_cartesian(100 - article_y, height, full_height)
			when "left"
				new_left = fluid_to_cartesian(100.0 - article_y, width, full_width)
			when "right"
				new_left = fluid_to_cartesian(article_y, width, full_width)

		element.css("top", "#{new_top}px") if new_top
		element.css("left", "#{new_left}px") if new_left


adjust_fade_in = (element) ->
	div_height = element.innerHeight()
	screen_height = $(window).height()
	top_height = element.offset().top
	bottom_height = top_height + div_height
	top_position = $(window).scrollTop()
	bottom_position = top_position + screen_height

	if top_position <= bottom_height && bottom_position >= top_height
		article_y = articles_position_on_page(element)
		opacity = Math.abs(50 - article_y) / 50
		element.find("div.fader").css("opacity", opacity)


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

	current_article_index >= total_articles_on_page - trigger_at

load_more_posts = (count = 5) ->
	loading_more_posts = true
	$('#nav-post-loading').fadeIn(200)
	animate_nav_post_loading()
	if matches = $('article').last().attr("class").match(/[^ ]*ground/)
		space_of_last_post = matches[0]

	site_id = $('body').data("site-id")

	$.ajax "/sites/#{site_id}/posts.js",
		type: 'GET'
		dataType: 'script'
		data:
			items_per_page: count
			offset: total_articles_on_page
			space_of_last_post: space_of_last_post
		success: completed_loading_more_posts

completed_loading_more_posts = ->
	previous_total_articles = total_articles_on_page
	calculate_total_articles_on_page()
	eof = true if previous_total_articles == total_articles_on_page

	setup_posts()

	loader = $('#nav-post-loading').fadeOut(200).detach()
	loader.appendTo('#posts-nav')
	loading_more_posts = false

animate_nav_post_loading = ->
	loading_tag = $('#nav-post-loading a.bullet')
	if(loading_tag.html() == "•")
		loading_tag.html("&bull;&bull;")
	else if(loading_tag.html() == "••")
		loading_tag.html("&bull;&bull;&bull;")
	else if(loading_tag.html() == "•••")
		loading_tag.html("&bull;")

	setTimeout(animate_nav_post_loading, 1000) if loading_more_posts

calculate_total_articles_on_page = ->
	total_articles_on_page = $('div.post').length

setup_nav = ->
	$('nav a.bullet').hover(
		->
			$(this).parent().addClass('hover')
			hide_nav_items()
		->
			$(this).parent().removeClass('hover')
			hide_nav_items()
		)

	$('nav a.bullet').click (event) ->
		event.preventDefault()
		scroll_to_post($(this.hash))

		hide_nav_items()

setup_images = ->
	#MAKE IMAGES CLICKABLE
	$('.album a').click -> modal.open_image($(this))

rate = 0
max_position = 0
maxspeed = 75
images_div = null

setup_strip_albums = ->
	$('.horizontal-scroll').mousemove (element) ->
		page_width = $(window).width()
		page_center = page_width / 2
		rate = (element.pageX - page_center) / page_width

	$('.horizontal-scroll').hover(
		->
			images_div = $(this)
			total_width = 0

			images_div.find('a').each ->
				total_width += $(this).outerWidth()

			images_div.css('width', "#{total_width}px")

			max_position = total_width - $(window).width()

			scroller = setInterval( move_strip_album, 30 )
			$(this).data('scroller', scroller);
		->
			scroller = $(this).data('scroller')
			clearInterval( scroller )
		)

setup_fade_in = ->
	$('.fade-in').each ->
		$(this).append('<div class="fader"></div>') unless $(this).find('.fader').length

move_strip_album = ->
	new_left = Math.max(Math.min(images_div.position().left - rate * maxspeed, 0), -1 * max_position)
	images_div.css('left', new_left)


setup_coffee_table_album = ->
	distance_between_images = 35

	$('.coffee-table').each ->
		images = $(this).find('img')
		count = images.length
		container_width = distance_between_images * count + parseFloat(images.first().css("max-width"))
		$(this).css("width", "#{container_width}px")

		images.each (index) ->
			rot_direction = if index % 2 == 0 then "-" else ""
			rot_value = Math.random() * 7 + 5
			pos_direction = if index % 10 < 5 then "" else "-"
			rotation = if $(this).is(images.first()) then "0deg" else "#{rot_direction}#{rot_value}deg"
			top = "#{pos_direction}#{(index % 5) * 9}px"
			zindex = count - index + count #we offset the zindex by the count to keep it positive
			$(this).css("right", "#{distance_between_images * (count - index)}px")
			$(this).css("z-index", zindex)
			$(this).css("-webkit-transform", "rotate(#{rotation})") #TODO: support other browsers...
			$(this).css("top", "#{top}")
			$(this).data("rotation", rotation)
			$(this).data("top", top)
			$(this).data("zindex", zindex)

		images.hover ->
			image_to_show = $(this)
			image_to_show_found = false

			images.each (index) ->
				if $(this).is(image_to_show)
					$(this).css("z-index", $(this).data("zindex")).stop().transition({marginRight: "0px", rotate: $(this).data("rotation"), top: $(this).data("top")},
						700,
						"snap")
						.removeClass('flipped')
					image_to_show_found = true

				else if image_to_show_found #after found image
					if $(this).hasClass("flipped") #that needs to be flipped back
						$(this).stop().css("z-index", $(this).data("zindex")).transition({marginRight: "0px", rotate: $(this).data("rotation"), top: $(this).data("top")},
							700,
							"snap")
							.removeClass('flipped')

				else #before found image
					unless $(this).hasClass("flipped") #that needs to be flipped
						rotation = Math.random() * 180 + 90 #80-110 degrees
						$(this).stop().transition({marginRight: "300px", rotate: "-=#{rotation}deg", top: "+100px"},
							700,
							"snap",
							-> $(this).css("z-index", "#{2 * count - parseInt($(this).data('zindex'))}"))
							.addClass("flipped")

setup_post_heights = ->
#	$("article[data-height]").each ->
#	$("article").each ->
	$("div.post").each ->
		if $(this).data('height')
			height = $(this).data('height')
			height = "100%" if height == 'full-screen'
			height = (Number(height.replace('%', '')) * $(window).height() / 100) + "px" if height.search(/%/) > 0
			$(this).css("height", height)

setup_videos = ->
	#Replace video tags with iframes
	$('div.youtube video').each ->
		url = $(this).attr('src')
		$(this).replaceWith('<iframe id="ytplayer" type="text/html" src="' + url + '" frameborder="0" />')

	set_video_sizes()

set_video_sizes = ->
	ratio = 600/400
	width = $(window).width()
	height = Math.min(width / ratio, $(window).height()) * 0.80 #leaves some margins on top & bottom
	$('.video.full-width iframe').attr('width', width)
	$('.video.full-width iframe').attr('height', height)
	$('.video.full-width').css('height', height + "px")


loading =
	setup: ->
		@loading = $('<div id="loading"><div id="bowl_ringG"><div class="ball_holderG"><div class="ballG"></div></div></div></div>')
		@loading.hide()
		$('body').append(@loading)

	start: ->
		@loading.fadeIn(200)

	stop: ->
		@loading.fadeOut(200)

modal =
	setup: ->
		@overlay = $('<div id="modal-overlay"></div>')
		@modal = $('<div id="modal"></div>')

		modal_obj = this

		@overlay.click (event) ->
			event.preventDefault()
			modal_obj.close()

		@modal.hide()
		@overlay.hide()

		$('body').append(@overlay, @modal)


	center: ->
		top = Math.max($(window).height() - @modal.outerHeight(), 0) / 2
		left = Math.max($(window).width() - @modal.outerWidth(), 0) / 2

		@modal.css(top:top + $(window).scrollTop(), left:left + $(window).scrollLeft())

	open_content: (content) ->
		loading.start()

		@modal.empty().append(content)

		@center()

		@modal.fadeIn(600)
		@overlay.fadeIn(300)

		$(window).bind('resize.modal', @center)
		$('body').css({ overflow: 'hidden' })

		loading.stop()

	open_image: (event_obj) ->
		loading.start()

		content = $("<img src=\"#{event_obj.data('full-size-url')}\" />")
		@modal.empty().append(content)

		modal_obj = this
		content.load ->
			modal_obj.show_image()
			loading.stop()

		false

	show_image: ->
		@center()

		@modal.fadeIn(600)
		@overlay.fadeIn(300)

		$(window).bind('resize.modal', @center)
		$('body').css({ overflow: 'hidden' })


	close: ->
		@modal.fadeOut(300)
		@overlay.fadeOut(600)
		@modal.empty()
		$(window).unbind('resize.modal');

		$('body').css({ overflow: 'visible' })
		false

reposition_elements = ->
	$('.h-center').each ->
		$(this).css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px")

set_fluid_positions = ->
	$('.text-box.fluid-h, .video.fluid-h').each ->
		width = $(this).outerWidth()
		full_width = $(this).parent('div.post').outerWidth()
		coordinate = $(this).data('fluid-h')
		$(this).css("left", fluid_to_cartesian(coordinate, width, full_width))

	$('.text-box.fluid-v, .video.fluid-h').each ->
		if $(this).hasClass('fixed')
			full_height = $(window).height()
		else
			full_height = $(this).parent('div.post').outerHeight()


		height = $(this).outerHeight()
		coordinate = $(this).data('fluid-v')
		$(this).css("top", fluid_to_cartesian(coordinate, height, full_height))

set_fixed_grid_positions = ->
	column_width = $('body').data("col-width")
	gutter_width = $('body').data("gutter-width")

	$('.text-box.fixed-grid-left').each ->
		fixed_grid = $(this).data('fixed-grid-left')
		$(this).css("left", fixed_grid_to_cartesian(fixed_grid, column_width, gutter_width, "left"))
	$('.text-box.fixed-grid-right').each ->
		fixed_grid = $(this).data('fixed-grid-right')
		$(this).css("right", fixed_grid_to_cartesian(fixed_grid, column_width, gutter_width, "right"))
	$('.sprite.fixed-grid-left').each ->
		fixed_grid = $(this).data('fixed-grid-left')
		set_background_position_x($(this), fixed_grid_to_cartesian(fixed_grid, column_width, gutter_width, "left") + "px")
	$('.sprite.fixed-grid-right').each ->
		fixed_grid = $(this).data('fixed-grid-right')
		sprite_width = $(this).data('width')
		cartesian = fixed_grid_to_cartesian(fixed_grid, column_width, gutter_width, "left") + column_width
		set_background_position_x($(this),  (cartesian - sprite_width) + "px")

set_fixed_positions = ->
	$('.text-box.fixed-top').each -> $(this).css('top', $(this).data('fixed-top'))
	$('.text-box.fixed-bottom').each -> $(this).css('bottom', $(this).data('fixed-bottom'))
	$('.text-box.fixed-left').each -> $(this).css('left', $(this).data('fixed-left'))
	$('.text-box.fixed-right').each -> $(this).css('right', $(this).data('fixed-right'))

	$('.sprite.fixed-right').each ->
		full_width = $(this).outerWidth()
		sprite_width = $(this).data('width')
		coordinate = $(this).data('fixed-right')
		x = (full_width - coordinate - sprite_width) + "px"
		set_background_position_x($(this), x)

	$('.sprite.fixed-bottom').each ->
		if $(this).hasClass('fixed')
			full_height = $(window).height()
		else
			full_height = $(this).outerHeight()

		sprite_height = $(this).data('height')
		coordinate = $(this).data('fixed-bottom')
		y = (full_height - coordinate - sprite_height) + "px"
		set_background_position_y($(this), y)

initialize_three_phase_positions = ->
	$('.three-phase').each ->
		$(this).addClass($(this).data('animation-direction').split("-").shift())


fluid_to_cartesian = (coordinate, length, full_length) ->
	(coordinate / 100) * (full_length - length)

fixed_grid_to_cartesian = (coordinate, column_width, gutter_width, edge = "left") ->
	center = $(window).width() / 2
	if edge == "left"
		center + (gutter_width / 2) + coordinate * (column_width + gutter_width)
	else
		center - ((gutter_width / 2) + coordinate * (column_width + gutter_width) + column_width)

#returns number between 0 and 1
phase_position = (phase, article) ->
	switch phase
		when 1
			element_top = article.offset().top
			screen_height = $(window).height()
			screen_top = $(window).scrollTop()

			return 1 - (element_top - screen_top) / screen_height
		when 2
			element_top = article.offset().top
			element_height = article.outerHeight()
			screen_height = $(window).height()
			screen_top = $(window).scrollTop()

			return (screen_top - element_top)/(element_height - screen_height)
		when 3
			element_top = article.offset().top
			element_height = article.outerHeight()
			element_bottom = element_top + element_height
			screen_height = $(window).height()
			screen_top = $(window).scrollTop()

			return 1 - ((element_bottom - screen_top) / Math.min(element_height, screen_height))

#TODO refactor 3 phase functions
update_three_phase_effects = (element) ->
	previous_phase = if element.data('phase') then Number(element.data('phase')) else null
	phase = detect_phase(element)
	article = element.parent()

	effect_types = element.data('effects').split("-")
	effect_durations = []

	#TODO move this to a separate function when im not as lazy and have more time...
	for effect_type, i in effect_types
		continue if effect_durations[i]
		count = 1
		offset = i + 1

		while effect_types[offset] == effect_type
			offset++
			count++

		for j in [0...(count)]
			effect_durations[i+j] = count

	effect_type = effect_types[phase-1]
	effect_duration = effect_durations[phase-1]

	switch effect_type
		when 'scroll_fade_in'
			opacity = phase_position(phase, element.parent('div.post'))
			element.css({opacity: opacity})
		when 'scroll_fade_out'
			opacity = 1 - phase_position(phase, element.parent('div.post'))
			element.css({opacity: opacity})
		when 'hide'
			element.css({opacity: 0})
		when 'show'
			element.css({opacity: 1})
		when 'fade_in'
			element.stop().animate({opacity:1})
		when 'fade_out'
			element.stop().animate({opacity:0})

	element.data('phase', phase)




update_three_phase_animation = (element) ->
	previous_phase = if element.data('phase') then Number(element.data('phase')) else null
	phase = detect_phase(element)

	#detect phase change and do it stepwise in case we skip a phase from scrolling too fast
	if previous_phase < phase
		transition_to_phase(element, previous_phase, ++previous_phase) while previous_phase < phase
	else
		transition_to_phase(element, previous_phase, --previous_phase) while previous_phase > phase

transition_to_phase = (element, previous_phase, phase) ->
	animation_types = element.data('animation-direction').split("-")
	previous_animation_type = if previous_phase then animation_types[previous_phase-1] else null
	animation_type = animation_types[phase-1]
	valid_animation_types = ["fixed", "roll"]
	element.data('phase', phase)

	#changing animation types
	if previous_animation_type != animation_type
		phase_shift = previous_phase * 10 + phase #phase 2 -> 3 is 23, etc
		if previous_animation_type == "fixed" #fixed to roll transition
			fixed_to_absolute(element, phase_shift)
		else if previous_animation_type == "roll" #roll to fixed transition
			absolute_to_fixed(element, phase_shift)

		element.removeClass(type) for type in valid_animation_types
		element.addClass(animation_type)


# TRANSFORM PLANES
# TODO: unhack this hackfest of a function...
fixed_to_absolute = (element, phase_shift) ->
	if element.hasClass('text-box')
		top_css = element.css('top')
		bottom_css = element.css('bottom')

		if top_css.match(/px/) && (phase_shift == 23 || phase_shift == 32)
			element_top = Number(top_css.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_top = (element_top + article_height - window_height) + "px"
			element.css("top", new_top)

		else if bottom_css.match(/px/) && (phase_shift == 12 || phase_shift == 21)
			element_bottom = Number(bottom_css.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_bottom = (element_bottom + article_height - window_height) + "px"
			element.css("bottom", new_bottom)

	else if element.hasClass('sprite')
		y = get_background_position_y(element)

		if phase_shift == 23 || phase_shift == 32
			element_top = Number(y.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_top = (element_top + article_height - window_height) + "px"
			set_background_position_y(element, new_top)




absolute_to_fixed = (element, phase_shift) ->
	if element.hasClass('text-box')
		top_css = element.css('top')
		bottom_css = element.css('bottom')

		if top_css.match(/px/) && (phase_shift == 32 || phase_shift == 23)
			element_top = Number(top_css.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_top = (element_top - article_height + window_height) + "px"
			element.css("top", new_top)

		if bottom_css.match(/px/) && (phase_shift == 21 || phase_shift == 12)
			element_bottom = Number(bottom_css.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_bottom = (element_bottom - article_height + window_height) + "px"
			element.css("bottom", new_bottom)

	else if element.hasClass('sprite')
		y = get_background_position_y(element)

		if phase_shift == 32 || phase_shift == 23
			element_top = Number(y.replace('px', ''))
			window_height = $(window).height()
			article_height = element.parent('div.post').outerHeight()
			new_top = (element_top - article_height + window_height) + "px"
			set_background_position_y(element, new_top)


detect_phase = (element) ->
	article = element.parent('div.post')

	article_height = article.innerHeight()
	article_top = article.offset().top
	article_bottom = article_top + article_height
	window_top = $(window).scrollTop()
	window_bottom = window_top + $(window).height()

	if article_top > window_top
		return 1
	else if article_bottom > window_bottom
		return 2
	else
		return 3

ie7_8_cover_fix = ->
	if $.browser.msie && parseInt($.browser.version) < 9
		$('.sprite.cover').each ->
			bg_url = $(this).css('background-image')
			bg_url = bg_url.replace(/"/g,"").replace(/url\(|\)$/ig, "")
			$(this).css('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\"#{bg_url}\", sizingMethod='scale')")
			$(this).css('-ms-filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\"#{bg_url}\", sizingMethod='scale')")

update_full_height_data = ->
	$('.full-height').each ->
		old_height = $(this).data('height')
		old_width = $(this).data('width')

		if old_height && old_width
			new_height  = $(window).height()
			new_width = new_height * (old_width / old_height)
			$(this).data('height', new_height)
			$(this).data('width', new_width)

hide_fixed_text_boxes = ->
	$('.text-box.fixed, .text-box.fixed-scan').each ->
		if $(this).parent('div.post').overlaps($(this))
			$(this).css('visibility', 'visible')
		else
			$(this).css('visibility', 'hidden')

display_nonoptimal_browser_message = ->
	content = $("<div class='modal-message'><p class='center'>For best experience, please view on a larger window on a modern browser.</p><p class='center'>Click Anywhere To Continue</p></div>")
	modal.open_content(content)

is_mobile_version = ->
	if (document.documentElement.clientWidth <= 915) || (document.documentElement.clientHeight <= 400) then true else false #kinda arbitrary, but where the svmg page breaks down...

is_unsupported_browser = ->
	$.browser.msie && parseInt($.browser.version) <= 8

setup_posts = ->
	setup_nav()
	setup_videos()
	setup_images()
	setup_strip_albums()
	setup_fade_in()
	setup_coffee_table_album()
	setup_positions()


setup_positions = ->
	setup_post_heights()
	initialize_three_phase_positions()
	set_fluid_positions()
	set_fixed_grid_positions()
	set_fixed_positions()
	reposition_elements() #LEGACY
	set_video_sizes()
	ie7_8_cover_fix()
	update_full_height_data()
	hide_fixed_text_boxes()

#reposition for divs that contain images
$(window).load ->
	return if is_mobile_version()
	setup_positions()

$ ->
	modal.setup()
	loading.setup()

	if is_mobile_version()
		display_nonoptimal_browser_message()
		return

	if is_unsupported_browser()
		display_nonoptimal_browser_message()

	#INITIALIZERS
	calculate_total_articles_on_page()
	setup_posts()

	$(window).resize ->
		setup_positions()

	$(window).scroll ->
		$('div.post:in-viewport').each ->
			$(this).find('div.scan, div.fixed-scan').each ->
				if $(this).hasClass('sprite')
					adjust_scanning_background($(this))
				else
					adjust_scanning_div($(this))

		$('div.three-phase:in-viewport').each -> update_three_phase_animation($(this))

		$('div.three-phase-effects:in-viewport').each -> update_three_phase_effects($(this))

		hide_fixed_text_boxes()

		$('div.post[class*=fade-in]').each -> adjust_fade_in($(this))

		if $('nav').length > 0 #only do nav functions if nav exists
			update_nav_with_focused_article()
			load_more_posts() if Math.random() > 0.8 && should_load_more_posts() #only run this 20% of the time