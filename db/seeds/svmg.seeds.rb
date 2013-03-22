# -*- coding: utf-8 -*-
site_name = "SVMG"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false, ga: %{
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2311903-18']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
})
site.domains.create(domain: "svmg.localhost")
site.domains.create(domain: "svmg.lijentan.com")

site.site_style.update_attributes(body_font_data: {
                                    font_code: "<link href='http://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>",
                                    font_family: "'Muli', sans-serif"
                                  })


############# SPLASH PAGE #############
p = Post.create(title: "SVMG",
                published: true,
                show_header: false,
                site: site,
                space: "background",
                height: "100%",
                display_order: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png', style: 'image', width: 172, height: 171)
#PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:50%;fixed-top:250px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    css: 'text-shadow:none',
                    text: %{
<p style="margin-bottom:25px;"><img src="http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png" /></p>
<p class="large">Brand Representation - Consulting - Social Media</p>
},
                    text_align: "center")
#PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:450px;", animation_type: "fixed")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fluid-v:50%;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="grayLighter xlarge">&#8595;</p>
},
                    text_align: "center")
#PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:10px;fluid-h:50%", effects: 'fade_out-fade_out-fade_out', media_flag: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/svmg-arrow.png', style: 'image', width: 21, height: 70)
PostElement.create(post: p, element: s, sequence: 3, position: "fixed-bottom:15px;fluid-h:50%", effects: 'fade_out-fade_out-fade_out', media_flag: 1)

############# Brand Rep #############
p = Post.create(title: "About SVMG",
                published: true,
                show_header: false,
                site: site,
                space: 'foreground',
                height: "100%",
                depth: 25,
                display_order: 2)


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg-outline-large.png', style: 'image', width: 350, height: 350)
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-v:50%;fixed-grid-right:-1col")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:2px #999999 solid',
                    text: '<h1 class="xlarge right" style="margin-top:-27px;height:228px">SVMG</h2>')
#PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fixed-grid-right:-1col")

tb = TextBox.create(style: 'single-column-text',
                    css: 'padding-left:0px;text-shadow:none',
                    text: %{<p class="grayLight">Everyday more and more companies are facing the challenges of growing and adapting their business for new market entry and expansion plans.</p>
<p class="grayLight">Whether it’s leveraging our unique experiences and resources, advising on cultural issues and business protocols, or crafting a customized strategy, SVMG is committed to providing our clients with the tools they need in order to thrive in an ever-evolving globalized marketplace.</p>
<em class="grayLight">Here are some of the amazing brands that we've worked with.</em>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-v:50%;fixed-grid-left:0col") #, animation_type: 'scan', animation_direction: 'up')

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

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-mlb.jpg', style: 'cover', width: 1784, height: 500)
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-right:0px;fluid-v:50%", animation_type: "fixed-scan", animation_direction: "left")

tb = TextBox.create(style: 'full-margins',
                    text: "<h1 class='massive'>&#149;</h1>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-bottom:0px", animation_type: "fixed-scan", animation_direction: "right")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:2px white solid;text-shadow:none',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px">MLBAM</h1>
<p class="large grayLight right">Major League Baseball Advanced Media</p>
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
#PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-grid-right:-1col;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")
PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-h:20%;fluid-v:15%", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg-small.png', style: 'image', width: 75, height: 75)
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-left:50px;fixed-bottom:50px;", animation_type: "fixed")



p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "182px",
                display_order: 5)

tb = TextBox.create(style: 'single-line-text',
                    css: 'text-shadow:none',
                    text: %{
<p class="right grayDark" style="font-size:22px;line-height:28px"><em>&ldquo;With such a passionate following for baseball in Taiwan, it was extremely important that MLBAM find the right partner to advise us on the ground. From deal sourcing to strategic planning, SVMG has exceeded our loftiest expectations.&rdquo;</em></p>
<p class="grayLight right" style="font-size:20px">- Alex Pigeon, Vice President International</p>
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fluid-h:50%") #, animation_type: 'scan', animation_direction: 'right')

tb = TextBox.create(style: 'full-margins',
                    css: 'text-shadow:none',
                    text: %{
<p class="grayLight right" style="font-size:20px">- Alex Pigeon, Vice President International</p>
})
#PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px;fluid-h:50%") #, animation_type: 'scan', animation_direction: 'left')


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

#s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence.jpg', style: 'cover')
#PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence2.jpg', style: 'cover', width: 700, height: 467)
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fighter1.png', style: 'full-height', width: 750, height: 490)
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-v:100%;", animation_type: "fixed-scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fighter2.png', style: 'full-height', width: 605, height: 568)
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-v:100%", animation_type: "fixed-scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence-front.png', style: 'cover', width:400 , height: 319)
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-top:0px;fixed-left:0px")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:2px white solid;text-shadow:none',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px"><img src='http://dl.dropbox.com/u/4893047/svmg/ufc-logo.png' style='height:82px;margin-right:7px' />UFC</h1>

<p class="large grayLight right">Ultimate Fighting Championship&reg;</p>

<p class="grayLighter">
Universally recognized for its action-packed, can’t-miss events that have sold out some of the biggest arenas and stadiums across the globe, the UFC&reg; is the world’s premier mixed martial arts (MMA) organization. Owned and operated by Zuffa, LLC, UFC produces more than 30 live events annually and is the largest pay-per-view event provider in the world. In 2012, the UFC burst into the mainstream with a landmark seven-year broadcast agreement with FOX Sports Media Group.
</p>
<p class="grayLighter" style="margin-bottom:26px">
With both UFC and SVMG recognizing the tremendous growth potential of the UFC in Taiwan, the two organizations recently culminated a multi-year representation agreement.
</p>
})
#PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-grid-left:-1col;fixed-bottom:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")
PostElement.create(post: p, element: tb, sequence: 5, position: "fluid-h:80%;fluid-v:80%", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")

tb = TextBox.create(
style: 'single-column-text',
                    text: %{
<p class="small grayLight right">Photo courtesy of Getty Images</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-right:5px;fixed-bottom:5px", animation_type: "fixed", media_flag: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg-small.png', style: 'image', width: 75, height: 75)
PostElement.create(post: p, element: s, sequence: 6, position: "fixed-left:50px;fixed-bottom:50px;", animation_type: "fixed")


p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "182px",
                display_order: 10)

tb = TextBox.create(style: 'single-line-text',
                    css: 'text-shadow:none',
                    text: %{
<p class="right grayDark" style="font-size:22px;line-height:28px"><em>&ldquo;SVMG ticked all the boxes for us in terms of understanding our brand, programming, and Taiwan market. We look forward to growing together with them here.&rdquo;</em></p>
<p class="grayLight right" style="font-size:20px">- Mark Fischer, MD / EVP, UFC Asia</p>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fluid-h:50%")



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

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-sky.jpg', style: 'cover', width: 700, height: 382)
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons0.png', style: 'tiling', width: 476, height: 700)
PostElement.create(post: p, element: s, sequence: 2, animation_type: "fixed-scan", animation_direction: "up", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons1.png', style: 'tiling', width: 800, height: 600)
PostElement.create(post: p, element: s, sequence: 3, animation_type: "fixed-scan", animation_direction: "up", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons2.png', style: 'tiling', width: 1000, height: 1424)
PostElement.create(post: p, element: s, sequence: 4, animation_type: "fixed-scan", animation_direction: "up", position: "fixed-left:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/twm-balloons3.png', style: 'image', width: 400, height: 520)
PostElement.create(post: p, element: s, sequence: 5, position: "fluid-h:80%;fluid-v:15%")


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
                    css: 'border-right:2px white solid;text-shadow:none',
                    text: %{
<h1 class="huge right" style="margin-top:20px;line-height:90px"><img src='http://dl.dropbox.com/u/4893047/svmg/twm-logo.png' style='height:82px;margin-right:7px' />TWM</h1>
<p class="large grayLight right">Taiwan Mobile</p>
<p class="grayLighter">Taiwan Mobile has long been one of the most respected companies not only in the telecom industry, but across all of Taiwan. In every field they’ve entered, they’ve been innovators as well as disruptors. This is no different for their most recent undertaking, the myVideo service.</p>
<p class="grayLighter">It gives us distinct pride to work along side Taiwan Mobile advising on key elements of this market defining service. From content acquisition to technical implementation, SVMG is honored to be a part of this team.</p>
})
#PostElement.create(post: p, element: tb, sequence: 7, position: "fixed-grid-right:-1col;fixed-bottom:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")
PostElement.create(post: p, element: tb, sequence: 6, position: "fluid-h:20%;fluid-v:80%", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg-small.png', style: 'image', width: 75, height: 75)
PostElement.create(post: p, element: s, sequence: 7, position: "fixed-left:50px;fixed-bottom:50px;", animation_type: "fixed")



p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "182px",
                display_order: 12)

tb = TextBox.create(style: 'single-line-text',
                    css: 'text-shadow:none',
                    text: %{
<p class="grayDark center" style="font-size:26px;line-height:28px"><em>SVMG works with amazing brands to take them to even greater heights.</em></p>
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fluid-h:50%")

############# CONTACT  #############
p = Post.create(title: "Contact",
                published: true,
                show_header: false,
                site: site,
                space: "background",
                height: "100%",
                depth: 0,
                display_order: 13)

tb = TextBox.create(style: 'full-margins',
                    text_align: "center",
                    css: 'text-shadow:none',
                    text: "<p class='large'>We'd love to hear from you.</p>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fluid-v:18%;", animation_type: "fixed", effects: 'scroll_fade_in-show-show')


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png', style: 'image')
#PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:50%;fixed-top:250px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text_align: "center",
                    css: 'text-shadow:none',
                    text: %{
<p style="margin-bottom:25px;"><img src="http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png" /></p>
<p class="large" style="line-height:22px">Press Inqueries: <a href="mailto:press@svmg.tw" style="color:#FFF">press@svmg.tw</a><br />Business Inqueries: <a href="mailto:business@svmg.tw" style="color:#FFF">business@svmg.tw</a></p>
})
#PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:450px;", animation_type: "fixed")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fluid-v:50%;", animation_type: "fixed")
