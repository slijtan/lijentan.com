# -*- coding: utf-8 -*-
site_name = "Eephus League"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false)
site.domains.create(domain: "eephus.localhost")
site.domains.create(domain: "eephus.lijentandotcom.herokuapp.com")

p = Post.create(title: "Cover",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                display_order: 1,
                depth: 50,
                height: "full-screen")

tb = TextBox.create(style: 'single-column-text',
                    text: %{
MAY <img src="http://dl.dropbox.com/u/4893047/eephus/bases.png" /> 2012

<h1 class="large">THERE IS BUT ONE GAME</h1>

<p class="gray">&amp; THAT GAME IS BASEBALL</p>

<p class="small"><span class="orange">{</span> PRESS THE ESC KEY FOR MORE INFORMATION <span class="orange">}</span></p>

<p class="gray">SCROLL DOWN TO BEGIN</p>

<img src="http://dl.dropbox.com/u/4893047/eephus/x.png" />

<img src="http://dl.dropbox.com/u/4893047/eephus/downarrow.png" />

},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")


p = Post.create(title: "Cover Cont",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                display_order: 2,
                depth: 49,
                height: "full-screen")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/eephus/1_1.jpg', style: 'cover', width: 1684, height: 1230)
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-left:0px;fixed-bottom:0px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")

tb = TextBox.create(style: 'skinny-column-text',
                    background_image_url: 'http://dl.dropbox.com/u/4893047/eephus/coverbar.png',
                    text: %{
1WHAT IS EEPHUS?
Learn the colorful origins of the Eephus League’s namesake and who gave the infamous pitch its unique name.

2CURVES & BROKEN GLASS
A device to help pitchers throw curveballs and a softer baseball for kids are this issue’s patent highlights.

3JOHHNY EVERS
Johnny “The Crab” Evers was a small, scrappy second baseman who became a legend throughout his colorful Hall of Fame career.

4BEADLE’S BASE-BALL
The go-to resource for 19th century baseball, Beadle’s Dime Base-Ball player is a time capsule of the state of the game in 1867.

5BASES LOADED
Brian Lindstrom’s Bases Loaded series is a personal, nostalgia-filled look back on some of the most important moments in baseball’s history.

6MAY 1ST
The longest game ever, Mickey Mantle’s first home run, and some memorable no hitters are some of the highlights on this day in baseball.

7IT BREAKS YOUR HEART
Baseball is most definied by stories of failure, and in honor of the epic failures of the 2011 season, fans share their lowest points as fans.

8BASEBALL NICKNAMES
James K. Skipper’s massive anthology of baseball nicknames is a brilliant look at the legends and obscure lore of America’s greatest pastime.

9COLORFUL LANGUAGE
Designer Jeremy Reiss has created a beautiful letterpress print honoring the colorful language of the sport.
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-grid-left:3col;fixed-top:0px", animation_type: "three-phase", animation_direction: "fixed-roll-roll")
