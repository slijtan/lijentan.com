# -*- coding: utf-8 -*-
site_name = "SVMG"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false)
site.domains.create(domain: "svmg.localhost")
site.domains.create(domain: "svmg.lijentan.com")

#site.site_style.update_attributes(body_font_data: {
#                                    font_code: "<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>",
#                                    font_family: "'Lato', sans-serif"
#                                  })


############# SPLASH PAGE #############
p = Post.create(title: "SVMG",
                published: true,
                show_header: false,
                site: site,
                space: "background",
                height: "100%",
                display_order: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:50%;fixed-top:250px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="large">Brand Representation - Consulting - Social Media</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:450px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="grayLighter xlarge">&#8595;</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:10px;fluid-h:50%", effects: 'fade_out-fade_out-fade_out', media_flag: 1)


############# Brand Rep #############
p = Post.create(title: "About SVMG",
                published: true,
                show_header: false,
                site: site,
                space: 'foreground',
                height: "300px",
                depth: 25,
                display_order: 2)


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg-large.png', style: 'image')
#PostElement.create(post: p, element: s, sequence: 1, position: "fluid-v:90%;fluid-h:80%")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:3px #999999 solid',
                    text: '<h1 class="xlarge right" style="margin-top:-27px;height:228px">SVMG</h2>')

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:40px;fixed-grid-right:-1col")

tb = TextBox.create(style: 'single-column-text',
                    css: 'padding-left:0px',
                    text: %{<p class="grayLight">Everyday more and more companies are facing the challenges of growing and adapting their business for new market entry and expansion plans.</p>
<p class="grayLight">Whether it’s leveraging our unique experiences and resources, advising on cultural issues and business protocols, or crafting a customized strategy, SVMG is committed to providing our clients with the tools they need in order to thrive in an ever-evolving globalized marketplace.</p>
<p class="grayLight"><em>SVMG works with amazing brands to take them to even greater heights.</em></p>})
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-top:40px;fixed-grid-left:0col") #, animation_type: 'scan', animation_direction: 'up')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="gray large center"><em>SVMG works with amazing brands to take them to even greater heights.</em></p>
})
#PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-top:220px;fluid-h:50%") #, animation_type: 'scan', animation_direction: 'up')


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/divider-foreground-top.png', style: 'repeat-x', width: 1, height: 190)
#PostElement.create(post: p, element: s, sequence: 4, position: "fixed-top:0px")

=begin
p = Post.create(title: "About SVMG",
                published: true,
                show_header: false,
                site: site,
                space: 'foreground',
                height: "100%",
                depth: 26,
                display_order: 3)

tb = TextBox.create(style: 'full-no-margins',
                    text_align: "center",
                    text: %{
<h1 class="gray" style="font-size:30px">SVMG works with amazing brands to take them to even greater heights.</h1>
})

PostElement.create(post: p, element: tb, sequence: 4, position: "fluid-v:50%;fluid-h:50%", effects: 'scroll_fade_in-show-show', animation_type: 'three-phase', animation_direction: 'fixed-fixed-roll')

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/divider-foreground-bottom.png', style: 'repeat-x', width: 1, height: 190)
#PostElement.create(post: p, element: s, sequence: 5, position: "fixed-bottom:0px")
=end


############# Brand Rep Brands #############
p = Post.create(title: "MLBAM",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#003263',
                space: "background",
                depth: 3,
                display_order: 4)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-mlb.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-right:0px;fluid-v:50%", animation_type: "fixed-scan", animation_direction: "right")

tb = TextBox.create(style: 'full-margins',
                    text: "<h1 class='massive'>&#149;</h1>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-bottom:0px", animation_type: "fixed-scan", animation_direction: "right")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:3px white solid',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px">MLBAM</h1>

<h2 class="large grayLighter right">Major League Baseball Advanced Media</h2>

<p class="grayLighter">
MLBAM is the digital and interactive media arm of Major League Baseball. Considered the gold standard of online sports operations, it is the greatest Internet company that you&rsquo;ve never heard of.
</p>

<p class="grayLighter">
There&rsquo;s a reason why ESPN asked MLBAM to stream all of their content and why CBS needed them to handle all the online broadcasts of March Madness. Quite simply, nobody handles online content better than MLBAM.
</p>

<p class="grayLighter" style="margin-bottom:26px">
That&rsquo;s why when MLBAM reached out to SVMG to ask for help in growing their business, we couldn’t say yes fast enough.
</p>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-grid-right:-1col;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")



p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "300px",
                display_order: 5)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>&ldquo;With Taiwan having such a rich history of baseball, it only made sense for MLBAM to find a great partner to advise us on the ground. From deal sourcing to strategic planning, SVMG has exceeded our loftiest expectations.&rdquo;</em></h2>
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px", animation_type: 'scan', animation_direction: 'right')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h3 class="gray right">- Alex Pigeon, Vice President International</h3>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px", animation_type: 'scan', animation_direction: 'left')


tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>&ldquo;With Taiwan having such a rich history of baseball, it only made sense for MLBAM to find a great partner to advise us on the ground. From deal sourcing to strategic planning, SVMG has exceeded our loftiest expectations.&rdquo;</em></h2>
<h3 class="gray right">- Alex Pigeon, Vice President International</h3>
})
#PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:35px;fluid-h:50%")

p = Post.create(title: "UFC",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#000',
                space: 'background',
                depth: 2,
                display_order: 9)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fighter1.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-v:50%", animation_type: "fixed-scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fighter2.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-v:50%", animation_type: "fixed-scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence-front.png', style: 'cover')
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-top:0px;fixed-left:0px", animation_type: "scan", animation_direction: "up")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:3px white solid',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px"><img src='http://dl.dropbox.com/u/4893047/svmg/ufc-logo.png' style='height:82px;margin-right:7px' />UFC</h1>

<h2 class="large grayLighter right">Ultimate Fighting Championship</h2>

<p class="grayLighter">
One year before signing its landmark deal with FOX in 2011 which catapulted the world&rsquo;s fastest growing sports organization into the mainstream, the UFC announced the launch of operations in Asia with the opening of its Beijing office.
</p>

<p class="grayLighter" style="margin-bottom:26px">
Because of its dedication and commitment to growing the UFC brand across Asia, SVMG and the UFC were able to find each other quickly, creating one of the greatest one-two punch combinations in Mixed Martial Arts history.
</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-grid-left:-1col;fixed-bottom:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")

p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "300px",
                display_order: 10)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>&ldquo;Bacon ipsum dolor sit amet pork loin ham hock tenderloin, pig chuck shoulder biltong ribeye short loin flank pancetta tongue ball tip. Turducken tongue tail
capicola ribeye. Short loin spare ribs venison&rdquo;</em></h2>
<h3 class="gray right">- Mark Fischer, Managing Director UFC Asia</h3>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px;fluid-h:50%")



############# Taiwan Mobile #############

p = Post.create(title: "Taiwan Mobile",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#ff6f00',
                space: 'background',
                depth: 1,
                display_order: 11)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-sky.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons0.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 2, animation_type: "fixed-scan", animation_direction: "up", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons1.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 3, animation_type: "fixed-scan", animation_direction: "up", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons2.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 4, animation_type: "fixed-scan", animation_direction: "down", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons3.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 5, position: "fluid-h:75%;fluid-v:15%")


=begin
s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloon-red.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-h:10%", animation_type: "fixed-scan", animation_direction: "up")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloon-orange.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 4, position: "fluid-h:30%", animation_type: "fixed-scan", animation_direction: "up")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloon-yellow.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 5, position: "fluid-h:50%", animation_type: "fixed-scan", animation_direction: "up")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloon-green.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-h:80%", animation_type: "fixed-scan", animation_direction: "up")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloon-blue.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 6, position: "fluid-h:95%", animation_type: "fixed-scan", animation_direction: "up")
=end

=begin
s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/tm-background.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/tm-ball1.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 2, animation_type: "fixed-scan", animation_direction: "down", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/tm-ball2.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 3, animation_type: "fixed-scan", animation_direction: "down", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/tm-ball3.png', style: 'image')
#PostElement.create(post: p, element: s, sequence: 4, position: "fluid-v:75%;fluid-h:85%")
=end

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:3px white solid',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px"><img src='http://dl.dropbox.com/u/4893047/svmg/twm-logo.png' style='height:82px;margin-right:7px' />TWM</h1>
<h2 class="large grayLighter right">Taiwan Mobile</h2>
<p class="grayLighter">
MLBAM is the digital and interactive media arm of Major League Baseball. Considered the gold standard of online sports operations, it is the greatest Internet company that you&rsquo;ve never heard of.
</p>
<p class="grayLighter">
There&rsquo;s a reason why ESPN asked MLBAM to stream all of their content and why CBS needed them to handle all the online broadcasts of March Madness. Quite simply, nobody handles online content better than MLBAM.
</p>
})
PostElement.create(post: p, element: tb, sequence: 7, position: "fixed-grid-right:-1col;fixed-bottom:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "300px",
                display_order: 12)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>&ldquo;Bacon ipsum dolor sit amet pork loin ham hock tenderloin, pig chuck shoulder biltong ribeye short loin flank pancetta tongue ball tip. Turducken tongue tail
capicola ribeye. Short loin spare ribs venison&rdquo;</em></h2>
<h3 class="gray right">- Mark Fischer, Managing Director UFC Asia</h3>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px;fluid-h:50%")

############# CONTACT  #############
p = Post.create(title: "Contact",
                published: true,
                show_header: false,
                site: site,
                space: "background",
                height: "100%",
                display_order: 13)

tb = TextBox.create(style: 'full-margins',
                    text_align: "center",
                    text: "<h2>We'd love to hear from you.</h2>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:100px;", animation_type: "fixed", effects: 'scroll_fade_in-show-show')


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:50%;fixed-top:250px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text_align: "center",
                    text: %{
<p class="large">Press: <a href="mailto:press@svmg.tw" style="color:#FFF">press@svmg.com</a><br />Business: <a href="mailto:business@svmg.tw" style="color:#FFF">business@svmg.com</a></p>
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:450px;", animation_type: "fixed")
