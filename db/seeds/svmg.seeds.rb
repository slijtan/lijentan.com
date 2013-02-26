# -*- coding: utf-8 -*-
site_name = "SVMG"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false)
site.domains.create(domain: "svmg.localhost")
site.domains.create(domain: "svmg.lijentandotcom.herokuapp.com")

############# SPLASH PAGE #############
p = Post.create(title: "SVMG",
                published: true,
                show_header: false,
                site: site,
                space: "background",
                height: "85%",
                display_order: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-svmg.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:50%;fixed-top:250px;", animation_type: "fixed")

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="large">Brand Representation - Consulting - Social Media</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fixed-top:450px;", animation_type: "fixed")



############# Brand Rep #############
p = Post.create(title: "Brand Representation",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 2)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<p class="grayLight xlarge">&#8595;</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fixed-top:10px;fluid-h:50%")


tb = TextBox.create(style: 'full-no-margins',
                    text: %{
<h1 class="massive orange">Stay Hungry.</h1>

<h2 class="xlarge">Brand Representation</h2>

<p class="grayLight large">SVMG works with amazing brands to take them to even greater heights</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-v:50%;fluid-h:50%")


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
                    text: %{
<h1 class="huge">MLBAM</h1>

<p class="grayLighter">MLBAM is the digital and interactive media arm of Major League Baseball.  They are frickin awesome blah blah blah oh and they’re also so awesome that blah blah blah blah</p>
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-grid-right:-1col;fixed-bottom:250px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


tb = TextBox.create(style: 'single-column-text',
                    text: %{
<h1 class="large grayLight right">Major League Baseball Advanced Media</h1>
})
PostElement.create(post: p, element: tb, sequence: 4, position: "fixed-grid-right:-1col;fixed-bottom:317px", animation_type: "three-phase", animation_direction: "roll-fixed-roll")

=begin
tb = TextBox.create(style: 'single-column-text',
                    text: %{
<p class="gray">Alex Pigeon, Vice President International – “I fucking love SVMG because they made me a ton of fucking money that I couldn’t before.”</p>
})
PostElement.create(post: p, element: tb, sequence: 5, position: "fluid-h:85%;fixed-bottom:350px", animation_type: "three-phase", animation_direction: "roll-fixed-fixed")
=end

p = Post.create(title: "UFC",
                published: true,
                show_header: false,
                site: site,
                height: "500px",
                bg_color: '#000',
                space: 'background',
                display_order: 4)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logotype-ufc.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-left:0px;fluid-v:50%", animation_type: "scan", animation_direction: "right")


############# CONSULTING  #############
p = Post.create(title: "Consulting",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                depth: 2,
                display_order: 5)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">CONSULTING</h1>

Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-v:50%;fluid-h:50%", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


############# SOCIAL MEDIA  #############
p = Post.create(title: "Consulting",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                depth: 1,
                display_order: 6)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">SOCIAL MEDIA</h1>

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-v:50%;fluid-h:50%", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")
