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

$(window).scroll -> $('.bg-shifting').each -> adjust_shifting_background $(this)

#hide nav items that arent current
hide_nav_items = ->
        $('nav li').each ->
                if $(this).hasClass('current') || $(this).hasClass('hover')
                        $(this).find('a.title').fadeIn(200)
                else
                        $(this).find('a.title').fadeOut(200)

scroll_to_post = (event) ->
        event.preventDefault()
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500)
        $(this).closest('ul').find('li.current').removeClass('current')
        $(this).parent().addClass('current')
        hide_nav_items()


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
        $('nav a.bullet').click(scroll_to_post)
