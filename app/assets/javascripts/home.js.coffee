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


adjust_scanning_background = (element) ->
        div_height = element.innerHeight()
        screen_height = $(window).height()
        top_height = element.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        if top_position <= bottom_height && bottom_position >= top_height
                animation_direction = element.data("animation-direction")
                article_y = articles_position_on_page(element)
                background_pos = element.css('background-position').split(" ");
                x_offset = background_pos[0]
                y_offset = background_pos[1]

                switch animation_direction
                        when "up"
                                y_offset = article_y + "%"
                        when "down"
                                y_offset = 100.0 - article_y + "%"
                        when "left"
                                x_offset = 100.0 - article_y + "%"
                        when "right"
                                x_offset = article_y + "%"

                element.css("background-position", x_offset + " " + y_offset)


adjust_scanning_div = (element) ->
        article = element.parent()
        div_height = article.innerHeight()
        screen_height = $(window).height()
        top_height = article.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        if top_position <= bottom_height && bottom_position >= top_height
                animation_direction = element.data("animation-direction")
                article_y = articles_position_on_page(article)

                new_top = new_left = 0

                switch animation_direction
                        when "down"
                                new_top = article_y * screen_height / 100.0
                        when "up"
                                new_top = (100.0 - article_y) * screen_height / 100.0
                        when "left"
                                new_left = (100.0 - article_y) * screen_height / 100.0
                        when "right"
                                new_left = article_y * screen_height / 100.0

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
        space_of_last_post = $('article').last().attr("class").match(/[^ ]*ground/)[0]
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

setup_full_screen_posts = ->
        $(".full-screen").css("height", $(window).height())

setup_videos = ->
        #Replace video tags with iframes
        $('video').each ->
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

reposition_elements = ->
        $('.h-center').each ->
                $(this).css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px")

setup_posts = ->
        setup_nav()
        setup_videos()
        setup_images()
        setup_strip_albums()
        setup_fade_in()
        setup_coffee_table_album()
        setup_full_screen_posts()
        reposition_elements()


$ ->
        modal.setup()
        loading.setup()

        #INITIALIZERS
        calculate_total_articles_on_page()
        setup_posts()

        $(window).resize ->
                set_video_sizes()

        $(window).scroll ->
                $('div.scan:in-viewport').each ->
                        if $(this).hasClass('sprite')
                                adjust_scanning_background($(this))
                        else
                                adjust_scanning_div($(this))

                $('article[class*=fade-in]').each -> adjust_fade_in($(this))

                if $('nav').length > 0 #only do nav functions if nav exists
                        update_nav_with_focused_article()
                        load_more_posts() if Math.random() > 0.8 && should_load_more_posts() #only run this 20% of the time