focused_article = null
total_articles_on_page = null
loading_more_posts = null
eof = null

delay = (ms, func) -> setTimeout func, ms

articles_position_on_page = (article) ->
        div_height = article.innerHeight()
        screen_height = $(window).height()
        top_height = article.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        (bottom_position - top_height) * 100 / (div_height + screen_height)

adjust_floating_content = (element) ->
        article = element.parent()
        div_height = article.innerHeight()
        screen_height = $(window).height()
        top_height = article.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height
        floating_quote_class = /quote-(left|center|right)-float-(up|down)/.exec(element.attr("class"))

        if floating_quote_class && top_position <= bottom_height && bottom_position >= top_height
                bg_type = floating_quote_class[2] #(up|down)
                article_y = articles_position_on_page(article)

                switch bg_type
                        when "down"
                                new_top = article_y * screen_height / 100.0
                        when "up"
                                new_top = (100.0 - article_y) * screen_height / 100.0

                element.css("top", "#{new_top}px")



adjust_shifting_background = (element) ->
        div_height = element.innerHeight()
        screen_height = $(window).height()
        top_height = element.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        if top_position <= bottom_height && bottom_position >= top_height
                bg_types = element.attr("class").match(/bg-[^ ]*/)[0].split("-")[1..]
                bg_positions = element.css("background-position").split(",")
                bg_repeats = element.css("background-repeat").split(",")

                for bg_position, index in bg_positions
                        if index < 2
                                continue
                        else
                                article_y = articles_position_on_page(element)
                                bg_type = bg_types[index-2]
                                bg_repeat = $.trim(bg_repeats[index])

                                switch bg_type
                                        when "shift_down"
                                                x_offset = 50
                                                y_offset = 100.0 - article_y
                                        when "shift_up"
                                                x_offset = 50
                                                y_offset = article_y
                                        when "shift_left"
                                                x_offset = 100.0 - article_y
                                                y_offset = 0
                                        when "shift_right"
                                                x_offset = article_y
                                                y_offset = 0
                                        when "fixed"
                                                x_offset = 0
                                                y_offset = 0

                                #make it more random and more extreme for tiled elements
                                if bg_repeat == "repeat"
                                        #multiplier = bg_positions.length - index
                                        multiplier = index
                                        x_offset *= multiplier
                                        y_offset *= multiplier

                                bg_positions[index] = x_offset + "% " + y_offset + "%"

                element.css("background-position", bg_positions.toString())


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
        $.ajax '/posts.js',
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

        setup_nav()
        setup_images()
        setup_videos()

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
        total_articles_on_page = $('article').length

setup_nav = ->
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

                hide_nav_items()

setup_images = ->
        #MAKE IMAGES CLICKABLE
        $('div.images a').click -> modal.open_image($(this))

rate = 0
max_position = 0
maxspeed = 100
images_div = null

setup_strip_albums = ->
        $('article.album-strip div.images').mousemove (element) ->
                page_width = $(window).width()
                page_center = page_width / 2
                rate = (element.pageX - page_center) / page_width

        $('article.album-strip div.images').hover(
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


move_strip_album = ->
        new_left = Math.max(Math.min(images_div.position().left - rate * maxspeed, 0), -1 * max_position)
        images_div.css('left', new_left)


setup_videos = ->
        #Replace video tags with iframes
        $('video').each ->
                url = $(this).attr('src')
                $(this).replaceWith('<iframe id="ytplayer" type="text/html" src="' + url + '" frameborder="0" />')

        #Video headers fade out on rollover
        $('article.video').hover(
                ->
                        $(this).find('header').fadeOut(1300)
                ->
                        $(this).find('header').fadeIn(1300)
                )

        set_video_sizes()

set_video_sizes = ->
        ratio = 600/400
        width = $(window).width()
        height = Math.min(width / ratio, $(window).height()) * 0.80 #leaves some margins on top & bottom
        $('article.video iframe').attr('width', width)
        $('article.video iframe').attr('height', height)


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

                @overlay.click ->
                        event.preventDefault()
                        modal_obj.close()

                @modal.hide()
                @overlay.hide()

                $('body').append(@overlay, @modal)


        center: ->
                top = Math.max($(window).height() - @modal.outerHeight(), 0) / 2
                left = Math.max($(window).width() - @modal.outerWidth(), 0) / 2

                @modal.css(top:top + $(window).scrollTop(), left:left + $(window).scrollLeft())

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


$ ->
        modal.setup()
        loading.setup()

        #INITIALIZERS
        calculate_total_articles_on_page()
        setup_nav()
        setup_videos()
        setup_images()
        setup_strip_albums()

        $(window).resize ->
                set_video_sizes()

        $(window).scroll ->
                $('article[class*=shift]').each -> adjust_shifting_background($(this))
                $('figure[class*=float]').each -> adjust_floating_content($(this))
                update_nav_with_focused_article()
                load_more_posts() if Math.random() > 0.8 && should_load_more_posts() #only run this 20% of the time
