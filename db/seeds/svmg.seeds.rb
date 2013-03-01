# -*- coding: utf-8 -*-
site_name = "SVMG"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false)
site.domains.create(domain: "svmg.localhost")
site.domains.create(domain: "svmg.lijentandotcom.herokuapp.com")
site.domains.create(domain: "lijentandotcom.herokuapp.com")

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
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:10px;fluid-h:50%", effects: 'fade_out-fade_out-fade_out')




############# Brand Rep #############
p = Post.create(title: "Brand Representation",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "180%",
                display_order: 2)

tb = TextBox.create(style: 'full-no-margins',
                    text_align: "center",
                    text: %{
<h1 class="huge orange">Stay Hungry.</h1>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fluid-h:50%", effects: 'hide-scroll_fade_in-show', animation_type: 'three-phase', animation_direction: 'fixed-fixed-roll')


tb = TextBox.create(style: 'full-no-margins',
                    text_align: "center",
                    text: %{
<h2 class="xlarge">Brand Representation</h2>

<p class="grayLight large">SVMG works with amazing brands to take them to even greater heights</p>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-v:25%;fluid-h:50%")


############# Brand Rep Brands #############
p = Post.create(title: "MLBAM",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#003263',
                space: "background",
                depth: 3,
                display_order: 3)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-mlb.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-right:0px;fluid-v:50%", animation_type: "fixed-scan", animation_direction: "right")

tb = TextBox.create(style: 'full-margins',
                    text: "<h1 class='massive'>&#149;</h1>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-bottom:0px", animation_type: "fixed-scan", animation_direction: "right")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-left:3px white solid',
                    text: %{
<p class="right"><img src='http://dl.dropbox.com/u/4893047/svmg/mlb-logo.png' /></p>

<h1 class="huge right" style="margin-top:0px;line-height:90px">MLBAM</h1>

<h2 class="large grayLight right">Major League Baseball Advanced Media</h2>

<p class="grayLighter" style="margin-bottom:0px">MLBAM is the digital and interactive media arm of Major League Baseball.  They are frickin awesome blah blah blah oh and they’re also so awesome that blah blah blah blah</p>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-grid-right:-1col;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")



p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "200px",
                display_order: 4)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>“I fucking love SVMG because they made me a ton of fucking money that I couldn’t before.”</em></h2>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px", animation_type: 'scan', animation_direction: 'right')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h3 class="gray right">- Alex Pigeon, Vice President International</h3>
})

PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px", animation_type: 'scan', animation_direction: 'left')


p = Post.create(title: "MLBAM 2",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#003263',
                space: "background",
                depth: 3,
                display_order: 5)


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-pitcher.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed-scan", animation_direction: "left")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-baseball.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-v:55%", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-batter.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-v:50%", animation_type: "fixed-scan", animation_direction: "left")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-ump.png', style: 'image')
#PostElement.create(post: p, element: s, sequence: 4, position: "fluid-h:100%;fluid-v:100%", animation_type: "fixed")




tb = TextBox.create(style: 'single-column-text',
                    css: 'border-left:3px white solid',
                    text: %{
<p class="right"><img src='http://dl.dropbox.com/u/4893047/svmg/mlb-logo.png' /></p>

<h1 class="huge right" style="margin-top:0px;line-height:90px">MLBAM</h1>

<h2 class="large grayLight right">Major League Baseball Advanced Media</h2>

<p class="grayLighter" style="margin-bottom:0px">MLBAM is the digital and interactive media arm of Major League Baseball.  They are frickin awesome blah blah blah oh and they’re also so awesome that blah blah blah blah</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-grid-right:-1col;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


tb = TextBox.create(style: 'single-column-text',
                    text: %{
<h1 class="large grayLight right">Major League Baseball Advanced Media</h1>
})
#PostElement.create(post: p, element: tb, sequence: 4, position: "fixed-grid-right:-1col;fixed-top:233px", animation_type: "three-phase", animation_direction: "roll-fixed-roll")

p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "200px",
                display_order: 6)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>“I fucking love SVMG because they made me a ton of fucking money that I couldn’t before.”</em></h2>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px", animation_type: 'scan', animation_direction: 'right')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h3 class="gray right">- Alex Pigeon, Vice President International</h3>
})

PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px", animation_type: 'scan', animation_direction: 'left')




p = Post.create(title: "MLBAM 3",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#003263',
                space: "background",
                depth: 3,
                display_order: 7)


s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-set1.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-set3.png', style: 'cover')
PostElement.create(post: p, element: s, sequence: 2, position: "fixed-top:0px;fluid-h:100%", animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/mlb-set2.png', style: 'cover')
PostElement.create(post: p, element: s, sequence: 3, position: "fixed-top:0px", animation_type: "fixed-scan", animation_direction: "left")



tb = TextBox.create(style: 'single-column-text',
                    css: 'border-left:3px white solid',
                    text: %{
<p class="right"><img src='http://dl.dropbox.com/u/4893047/svmg/mlb-logo.png' /></p>

<h1 class="huge right" style="margin-top:0px;line-height:90px">MLBAM</h1>

<h2 class="large grayLight right">Major League Baseball Advanced Media</h2>

<p class="grayLighter" style="margin-bottom:0px">MLBAM is the digital and interactive media arm of Major League Baseball.  They are frickin awesome blah blah blah oh and they’re also so awesome that blah blah blah blah</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-grid-right:-1col;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


tb = TextBox.create(style: 'single-column-text',
                    text: %{
<h1 class="large grayLight right">Major League Baseball Advanced Media</h1>
})
#PostElement.create(post: p, element: tb, sequence: 4, position: "fixed-grid-right:-1col;fixed-top:233px", animation_type: "three-phase", animation_direction: "roll-fixed-roll")

p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "200px",
                display_order: 8)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>“I fucking love SVMG because they made me a ton of fucking money that I couldn’t before.”</em></h2>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px", animation_type: 'scan', animation_direction: 'right')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h3 class="gray right">- Alex Pigeon, Vice President International</h3>
})

PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px", animation_type: 'scan', animation_direction: 'left')




p = Post.create(title: "UFC",
                published: true,
                show_header: false,
                site: site,
                height: "150%",
                bg_color: '#000',
                space: 'background',
                display_order: 9)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px", animation_type: "fixed") #animation_type: "three-phase", animation_direction: "roll-fixed-fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-kick.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-v:50%", animation_type: "fixed-scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-block.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-v:50%", animation_type: "fixed-scan", animation_direction: "left")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/ufc-fence-front.png', style: 'cover')
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-top:0px;fixed-left:0px", animation_type: "scan", animation_direction: "up")

tb = TextBox.create(style: 'single-column-text',
                    css: 'border-right:3px white solid',
                    text: %{
<p class="right"><img src='http://dl.dropbox.com/u/4893047/svmg/ufc-logo.png' /></p>
<h1 class="huge right" style="margin-top:0px;line-height:90px">UFC</h1>

<h2 class="large grayLight right">Ultimate Fighting Championship</h2>

<p class="grayLighter" style="margin-bottom:0px">UFC is the digital and interactive media arm of Major League Baseball.  They are frickin awesome blah blah blah oh and they’re also so awesome that blah blah blah blah</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-grid-left:-1col;fixed-bottom:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


tb = TextBox.create(style: 'single-column-text',
                    text: %{
<h1 class="large grayLight right">Ultimate Fighting Championship</h1>
})
#PostElement.create(post: p, element: tb, sequence: 6, position: "fixed-grid-left:-1col;fixed-bottom:202px", animation_type: "three-phase", animation_direction: "roll-fixed-roll")


p = Post.create(title: "Divider",
                published: true,
                show_header: false,
                site: site,
                space: "foreground",
                height: "200px",
                display_order: 10)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
<h2 class="center"><em>“I fucking love SVMG because they made me a ton of fucking money that I couldn’t before.”</em></h2>
})

PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-top:30px", animation_type: 'scan', animation_direction: 'left')

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h3 class="gray right">- Mark Fischer, Managing Director UFC Asia</h3>
})

PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-bottom:30px", animation_type: 'scan', animation_direction: 'right')


############# CONTACT  #############
p = Post.create(title: "Contact",
                published: true,
                show_header: false,
                site: site,
                height: "100%",
                space: 'background',
                depth: 2,
                display_order: 11)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/eggshell.jpg', style: 'tiling')
#PostElement.create(post: p, element: s, sequence: 1, animation_type: "fixed")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/divider-background-top.png', style: 'repeat-x')
#PostElement.create(post: p, element: s, sequence: 2, position: "fixed-top:0px")


tb = TextBox.create(style: 'full-no-margins',
                    text_align: "center",
                    text: %{
<h1 class="huge orange">Get In Touch.</h1>
})
#PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-v:50%;fluid-h:50%", effects: 'scroll_fade_out-hide-hide', animation_type: 'fixed')

=begin
p = Post.create(title: "Contact Info",
                published: true,
                show_header: false,
                site: site,
                height: "100%",
                space: nil,
                depth: 1,
                display_order: 8)
=end

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/eggshell.jpg', style: 'tiling')
#PostElement.create(post: p, element: s, sequence: 1, animation_type: "fixed")

tb = TextBox.create(style: 'full-no-margins',
                    css: 'padding-right:0px',
                    text: %{
<p class="xlarge right">SVMG</p>
})
PostElement.create(post: p, element: tb, sequence: 4, position: "fluid-v:50%;fixed-grid-right:-1col", animation_type: "fixed")

tb = TextBox.create(style: 'full-no-margins',
                    css: 'padding-left:0px',
                    text: %{

<p class="grayLight left">
Brand Representation. Consulting. Social Media.<br />
Press: <a href="mailto:press@svmg.tw">press@svmg.com</a><br />
Business: <a href="mailto:business@svmg.tw">business@svmg.com</a>
</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fluid-v:50%;fixed-grid-left:0col", animation_type: "fixed")
