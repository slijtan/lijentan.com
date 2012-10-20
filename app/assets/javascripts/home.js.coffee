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
                if $(this).hasClass('current') || $(this).hasClass('hover')
                        $(this).find('a.title').fadeIn(200)
                else
                        $(this).find('a.title').fadeOut(200)

###scroll_to_post = (event) ->
        event.preventDefault()
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500)
        $(this).closest('ul').find('li.current').removeClass('current')
        $(this).parent().addClass('current')
        hide_nav_items()
###

scroll_to_post = (post) ->
        $('html,body').animate({scrollTop:post.offset().top}, 500)
        make_post_current(post)

make_post_current = (post) ->
        $('nav ul').find('li.current').removeClass('current')
        $('#nav-' + post.attr('id')).addClass('current')
        hide_nav_items()

find_focused_article = ->
        screen_height = $(window).height()
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        preferred_area_top = top_position + (screen_height / 2)
        preferred_area_bottom = bottom_position
        secondary_area_top = top_position
        secondary_area_bottom = preferred_area_top
        secondary_article = null

        $('article').each ->
                my_position = $(this).offset().top
                return $(this) if my_position >= preferred_area_top && my_position <= preferred_area_bottom
                secondary_article = $(this) if my_position < bottom_position

        return secondary_article

update_nav_with_focused_article = ->
        article = find_focused_article()
#        alert(article.attr('id')) if Math.random() > 0.99
        make_post_current(article)



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
