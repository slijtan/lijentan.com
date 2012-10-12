adjust_shifting_background = (element) ->
        console.log("%o", element);
        div_height = element.innerHeight()
        screen_height = $(window).height()
        top_height = element.offset().top
        bottom_height = top_height + div_height
        top_position = $(window).scrollTop()
        bottom_position = top_position + screen_height

        if top_position <= bottom_height && bottom_position >= top_height
                position_offset = (bottom_position - top_height) * 100 / (div_height + screen_height)
                element.css("background-position", "50% " + position_offset + "%")

$(window).scroll ->
        $('.bg-shifting').each ->
                adjust_shifting_background $(this)
