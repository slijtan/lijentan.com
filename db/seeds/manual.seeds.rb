# -*- coding: utf-8 -*-
site_name = "Instruction Manual"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: true)
site.domains.create(domain: "manual.localhost")
site.domains.create(domain: "manual.lijentandotcom.herokuapp.com")

######################################## SPLASH
p = Post.create(title: "Instruction Manual",
                published: false,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Instruction Manual</h1>

<p class="grayLight">In the case of "RTFM", please refer to this</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")

site.update_attribute(:header_post, p)

######################################## TEXT BOX FORMATS
p = Post.create(title: "Text Boxes",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 1)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Text Boxes</h1>

<p class="grayLight">Words are the strongest known bridges between our minds and hearts</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")



p = Post.create(title: "Full No-Margins",
                published: true,
                show_header: true,
                site: site,
                display_order: 2)

tb = TextBox.create(style: 'full-no-margins',
                    text: %{
Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Single Column Text",
                published: true,
                show_header: true,
                site: site,
                display_order: 3)

tb = TextBox.create(style: 'single-column-text',
                    text: %{
My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?

My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?

My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Two-Column Text",
                published: true,
                show_header: true,
                site: site,
                display_order: 4)

tb = TextBox.create(style: 'two-column-text',
                    text: %{
Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Single-line text",
                published: true,
                site: site,
                display_order: 5)

tb = TextBox.create(style: 'single-line-text',
                    text: %{
Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.
}
)
PostElement.create(post: p, element: tb, sequence: 1)


p = Post.create(title: "Big Ol' Quote",
                published: true,
                site: site,
                show_header: true,
                display_order: 6)

tb = TextBox.create(style: 'quote-big',
                    text: '"Imitation is the sincerest form of flattery" - Inspired by 2012.hd-live.co.uk')

PostElement.create(post: p, element: tb, sequence: 6)


######################################## TYPOGRAPHY

p = Post.create(title: "Typography",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 10)


tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Typography</h1>

<p class="grayLight">Fonts baby... and colors</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")


p = Post.create(title: "Font sizes and colors",
                published: true,
                show_header: true,
                site: site,
                display_order: 11)

tb = TextBox.create(style: 'full-no-margins',
                    text_align: 'left',
                    text: %{
<h1 class="massive">Well, the way they make shows is, they make one show.</h1>

<h1 class="huge blue">That show's called a pilot. Then they show that show to the people who make shows,</h1>

<h1 class="xlarge red left">and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs.</h1>

<h1 class="large orange right">Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a</h1>

<h1 class="medium justify">pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows.</h1>

<h1 class="small purple">Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</h1>

<h1 class="xsmall blue-dark">Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength</h1>

<h1 class="tiny pink">of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</h1>

<p class="massive">Well, the way they make shows is, they make one show.</p>

<p class="huge blue">That show's called a pilot. Then they show that show to the people who make shows,</p>

<p class="xlarge red">and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs.</p>

<p class="large orange right">Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a</p>

<p class="medium justify">pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows.</p>

<p class="small purple">Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</p>

<p class="xsmall blue-dark">Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength</p>

<p class="tiny pink">of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</p>
}
)
PostElement.create(post: p, element: tb, sequence: 1)


######################################## SPRITES
p = Post.create(title: "Sprites",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 20)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Sprites</h1>

<p class="grayLight">Obey your thirst</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")


p = Post.create(title: "Image",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 21)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1)

p = Post.create(title: "Tiling",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 22)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 1)

p = Post.create(title: "Cover",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 23)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1)

p = Post.create(title: "Full Height",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 24)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'full-height')
PostElement.create(post: p, element: s, sequence: 1)




######################################## COMPONENT POSITIONING
p = Post.create(title: "Component Positioning",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 30)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Component Positioning</h1>

<p class="grayLight">I put my hand up on your hip, when I dip you dip we dip</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")


p = Post.create(title: "Fixed grid text",
                published: true,
                show_header: true,
                site: site,
                height: "700px",
                display_order: 31)

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-6col;top:20px')
PostElement.create(post: p, element: tb, sequence: 1, position: "fixed-left:-6col;top:0px")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-3col;top:150px')
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-left:-3col;top:150px")

tb = TextBox.create(style: 'two-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:2col;bottom:350px')
PostElement.create(post: p, element: tb, sequence: 3, position: "fixed-left:2col;bottom:350px")

tb = TextBox.create(style: 'two-column-text',
                    bg_color: '#555',
                    text: 'fixed-right:6col;bottom:0px')
PostElement.create(post: p, element: tb, sequence: 4, position: "fixed-right:5col;bottom:0px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-6col; top:400px')
PostElement.create(post: p, element: tb, sequence: 5, position: "fixed-left:-6col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-5col; top:400px')
PostElement.create(post: p, element: tb, sequence: 6, position: "fixed-left:-5col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-4col; top:400px')
PostElement.create(post: p, element: tb, sequence: 7, position: "fixed-left:-4col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-3col; top:400px')
PostElement.create(post: p, element: tb, sequence: 8, position: "fixed-left:-3col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-2col; top:400px')
PostElement.create(post: p, element: tb, sequence: 9, position: "fixed-left:-2col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:-1col; top:400px')
PostElement.create(post: p, element: tb, sequence: 10, position: "fixed-left:-1col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:0col; top:400px')
PostElement.create(post: p, element: tb, sequence: 11, position: "fixed-left:0col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:1col; top:400px')
PostElement.create(post: p, element: tb, sequence: 12, position: "fixed-left:1col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:2col; top:400px')
PostElement.create(post: p, element: tb, sequence: 13, position: "fixed-left:2col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:3col; top:400px')
PostElement.create(post: p, element: tb, sequence: 14, position: "fixed-left:3col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:4col; top:400px')
PostElement.create(post: p, element: tb, sequence: 15, position: "fixed-left:4col;top:400px")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#555',
                    text: 'fixed-left:5col; top:400px')
PostElement.create(post: p, element: tb, sequence: 16, position: "fixed-left:5col;top:400px")


p = Post.create(title: "Fixed grid sprite (requires implementation)",
                published: true,
                show_header: true,
                site: site,
                height: "700px",
                display_order: 32)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-left:-6col;top:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, position: "fixed-left:-3col;top:150px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 3, position: "fixed-left:2col;bottom:350px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-right:5col;bottom:0px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 5, position: "fixed-left:-6col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 6, position: "fixed-left:-5col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 7, position: "fixed-left:-4col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 8, position: "fixed-left:-3col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 9, position: "fixed-left:-2col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 10, position: "fixed-left:-1col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 11, position: "fixed-left:0col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 12, position: "fixed-left:1col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 13, position: "fixed-left:2col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 14, position: "fixed-left:3col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 15, position: "fixed-left:4col;top:400px")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 16, position: "fixed-left:5col;top:400px")



p = Post.create(title: "Fluid grid text with background-position system",
                published: true,
                show_header: true,
                site: site,
                height: "700px",
                display_order: 33)

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'This is fluid text thats about 20% to the left of the screen, and 35% from the top. (position: fluid-h:20%;fluid-v:35%;)')
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:20%;fluid-v:35%;")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'This is fluid text thats about 10% to the right of the screen, and 35% from the bottom. (fluid-h:90%;fluid-v:65%;)')
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:90%;fluid-v:65%;")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'This is fluid text thats dead center. (fluid-h:50%;fluid-v:50%;)')
PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-h:50%;fluid-v:50%;")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'TOP LEFT (fluid-h:0%;fluid-v:0%;)')
PostElement.create(post: p, element: tb, sequence: 4, position: "fluid-h:0%;fluid-v:0%;")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'BOTTOM RIGHT (fluid-h:100%;fluid-v:100%;)')
PostElement.create(post: p, element: tb, sequence: 5, position: "fluid-h:100%;fluid-v:100%;")

p = Post.create(title: "Fluid grid images with background-position system (Same positionings as previous post)",
                published: true,
                show_header: true,
                site: site,
                height: "700px",
                display_order: 34)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:20%;fluid-v:35%;")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-h:90%;fluid-v:65%;")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-h:50%;fluid-v:50%;")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 4, position: "fluid-h:0%;fluid-v:0%;")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 5, position: "fluid-h:100%;fluid-v:100%;")


######################################## ANIMATION
p = Post.create(title: "Animation",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 40)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Animation</h1>

<p class="grayLight">All change is not growth, as all movement is not forward</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")

p = Post.create(title: "Scan",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 41)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "top:100px", animation_type: "scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, position: "fluid-h:60%", animation_type: "scan", animation_direction: "down")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-v:100%", animation_type: "scan", animation_direction: "left")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/large-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 4, position: "fixed-right:6col", animation_type: "scan", animation_direction: "up")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 5, position: "top:50px", animation_type: "scan", animation_direction: "right")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 6, position: "fluid-h:40%", animation_type: "scan", animation_direction: "down")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 7, position: "fluid-v:90%", animation_type: "scan", animation_direction: "left")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 8, position: "fixed-right:3col", animation_type: "scan", animation_direction: "up")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'position: "top:0px", animation_type: "scan", animation_direction: "right"')
PostElement.create(post: p, element: tb, sequence: 9, position: "top:0px", animation_type: "scan", animation_direction: "right")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'position: "fluid-h:20%", animation_type: "scan", animation_direction: "down"')
PostElement.create(post: p, element: tb, sequence: 10, position: "fluid-h:20%", animation_type: "scan", animation_direction: "down")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'position: "fluid-v:80%", animation_type: "scan", animation_direction: "left"')
PostElement.create(post: p, element: tb, sequence: 11, position: "fluid-v:80%", animation_type: "scan", animation_direction: "left")

tb = TextBox.create(style: 'single-column-text',
                    bg_color: '#555',
                    text: 'position: "fixed-right:6col", animation_type: "scan", animation_direction: "up"')
PostElement.create(post: p, element: tb, sequence: 12, position: "fixed-right:6col", animation_type: "scan", animation_direction: "up")


tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#444',
                    text: 'position: "top:0px", animation_type: "scan", animation_direction: "right"')
PostElement.create(post: p, element: tb, sequence: 13, position: "top:0px", animation_type: "scan", animation_direction: "right")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#444',
                    text: 'position: "fluid-h:20%", animation_type: "scan", animation_direction: "down"')
PostElement.create(post: p, element: tb, sequence: 14, position: "fluid-h:20%", animation_type: "scan", animation_direction: "down")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#444',
                    text: 'position: "fluid-v:80%", animation_type: "scan", animation_direction: "left"')
PostElement.create(post: p, element: tb, sequence: 15, position: "fluid-v:80%", animation_type: "scan", animation_direction: "left")

tb = TextBox.create(style: 'skinny-column-text',
                    bg_color: '#444',
                    text: 'position: "fixed-right:6col", animation_type: "scan", animation_direction: "up"')
PostElement.create(post: p, element: tb, sequence: 16, position: "fixed-right:6col", animation_type: "scan", animation_direction: "up")


p = Post.create(title: "Fixed",
                published: true,
                show_header: true,
                site: site,
                height: "full-screen",
                display_order: 42)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/blog_template/small-square.png', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 1, animation_type: "fixed", position: "top:0px;v-center;")

tb = TextBox.create(style: 'two-column-text',
                    bg_color: '#444',
                    text: %{
position: &quot;fluid-h:50%;fluid-v:70%&quot;, animation_type: &quot;fixed&quot;
Well, the way they make shows is, they make one show. That show&#39;s called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they&#39;re going to make more shows. Some pilots get picked and become television programs. Some don&#39;t, become nothing. She starred in one of the ones that became nothing.

Look, just because I don&#39;t be givin&#39; no man a foot massage don&#39;t make it right for Marsellus to throw Antwone into a glass motherfuckin&#39; house, fuckin&#39; up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, &#39;cause I&#39;ll kill the motherfucker, know what I&#39;m sayin&#39;?

Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I&#39;m in a transitional period so I don&#39;t wanna kill you, I wanna help you. But I can&#39;t give you this case, it don&#39;t belong to me. Besides, I&#39;ve already been through too much shit this morning over this case to hand it over to your dumb ass.

Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they&#39;re actually proud of that shit.

Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I&#39;m in a transitional period so I don&#39;t wanna kill you, I wanna help you. But I can&#39;t give you this case, it don&#39;t belong to me. Besides, I&#39;ve already been through too much shit this morning over this case to hand it over to your dumb ass.
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:50%;fluid-v:50%", animation_type: "fixed")


######################################## Space

p = Post.create(title: "Space",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 50)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Space</h1>

<p class="grayLight">The final frontier</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")


p = Post.create(title: "Background",
                published: true,
                show_header: true,
                site: site,
                space: "background",
                display_order: 51)

tb = TextBox.create(style: 'full-margins',
                    text: %{
Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Foreground",
                published: true,
                show_header: true,
                site: site,
                space: "foreground",
                display_order: 52)

tb = TextBox.create(style: 'full-margins',
                    text: %{
Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Midground",
                published: true,
                show_header: true,
                site: site,
                space: "midground",
                display_order: 53)

tb = TextBox.create(style: 'full-margins',
                    text: %{
You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
}
)
PostElement.create(post: p, element: tb, sequence: 1)


p = Post.create(title: "Mid-To-Foreground",
                published: true,
                show_header: true,
                site: site,
                space: "mid-to-foreground",
                display_order: 54)

tb = TextBox.create(style: 'full-margins',
                    text: %{
You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
}
)
PostElement.create(post: p, element: tb, sequence: 1)


p = Post.create(title: "Back-To-Midground",
                published: true,
                show_header: true,
                site: site,
                space: "back-to-midground",
                display_order: 55)

tb = TextBox.create(style: 'full-margins',
                    text: %{
You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
}
)
PostElement.create(post: p, element: tb, sequence: 1)


######################################## MISC

p = Post.create(title: "Miscellaneous",
                published: true,
                show_header: false,
                site: site,
                space: "mid-to-foreground",
                height: "full-screen",
                display_order: 60)

tb = TextBox.create(style: 'full-margins',
                    text: %{
<h1 class="xlarge">Miscellaneous</h1>

<p class="grayLight">The corner where we shove everything we dont want</p>
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-h:50%;fluid-v:50%")

p = Post.create(title: "Giants Win The World Series!!!",
                published: true,
                site: site,
                display_order: 61)

v = Video.create(video_data: {id: "YKmgVJjk5PY"}, style: 'medium', host: 'youtube')
PostElement.create(post: p, element: v)



p = Post.create(title: 'Harvard Psychology 1504 - Premises of Positive Psychology Part 1',
                published: true,
                site: site,
                display_order: 62)

tb = TextBox.create(style: 'full-margins',
                    text: %{
Think of education as a spiral.  You revisit points and ideas at different points in time, but higher up in the spiral.  This class is the bottom of the spiral.

Premises of PP:
1. [Bridge building vs Division and separation](#p-lec-1-1) - This class will go against a lot of traditional psych with demarkation and division, and instead will build bridges
2. [Change is possible vs Change is illusive](#p-lec-1-2) - Change is possible. Conventional wisdom believes that change isn't possible and that we're stuck with our early upbringing and genetic disposition (with minor deviations)
3. Internal factors primarily determine happiness vs Happiness is primarily a function of external circumstances - People believe that "only if I get x, y, or z, then I'll be happy", but research shows that this isn't true.  Happiness is much more about the internal.
4. Human nature must be obeyed vs Human nature must be perfected
5. Happiness is and ought to be the ultimate end vs Happiness should be a secondary pursuit

### <a name="p-lec-1-1"></a>Premise 1 - Bridge building vs Division & separation
The world has moved so fast that the only way to understand it has been to categorize it.  Very little researchers can bring their work to the main stream, it's difficult to bridge the gap between the Ivory Tower & Main Street.

"The careful shielding of a university from the activities of the world around us is the best way to chill interest and to defeat progress. Celibacy does not suit a university. It must mate it'self with action." - Alfred North Whitehead

Why does this matter, especially if you don't go into academia? Because it's important to develop the desire to make a difference and to do good, and to actually do it.  There are false stereotypes that we have about ourselves. Psychology shows us that we dont properly evaluate ourselves adequately. Many Harvard students go on to do great things.  57% of graduates from HBS were on not-for-profit or social enterprise boards contributing on their own time.  That stat is even higher if you ignore the younger generation who's still in the rat race. Many of them contribute money to charity.

There are also false stereotypes of Americans; that they're too individualistic and selfish.  The reality is that Americans give, by far, more than any other people in the world.  This is because they're wealther and they want to do good.  Research from Phillip Moan shows that Americans, on average, volunteer 4 hours a week; more by far, than any other people in the world.

Many of you will have a lot of influence in the future, as a CEO, board member, donor, etc. Many people still feel frustrated because they arent fulfilling their potential. They have the intentions, but they dont have the know how to put their idealism to practice.  Good will and idealism are necessary, but not sufficient, and we fall short of our potential.

The role of this class and academia is to bridge the good will with the know how.

How many teachers know that there's research that shows that you can increase a students IQ by showing that you believe in them? How many people know about the work done about increasing self-esteem by people like Albert Bendura from Stanford or Nathaniel Brandon?  How many people know how to increase self-esteem?  Not enough teachers and individuals know enough about this. Positive praise is important, but it's not enough... this will be one of the central topics this semester.  How about the mind/body realm?  Overcoming depression?  How many people know that meditation and yoga can help overcome depression, and that we can re-wire the way the brain works by meditating. Prisoners doing yoga in jail have been shown to have a lower rate of becoming repeat offenders. Or how many people know that the Contact Hypothesis for conflict resolution is not enough; it's not enough to just have people meet each other to work out a conflict.  Research (by Sharife?) has shown that you need a super-ordinate goal; a common goal that you can work toward together interdependently. Then over time, prejudice and animosity will reduce and you will like each other much more.  These things need to be applied more in our country!

This class will be interdisciplinary.  Great ideas come from outside their fields in the sciences, physics, cultures, and other disciplines. Also, reality isn't demarcated.  Reality is interdisciplinary, so is general personality and social psychology, as well as will and grace. It's also more interesting to learn this way. One challenge for this class is to keep the interest that comes from being interdisciplinary, but not losing the rigor of specialization.

### <a name="p-lec-1-2"></a>Premise 2 - Change is possible vs Change is illusive
Most psychologists think that change is not possible. Most think that there is a base level of happiness that we possess that's based on experiences that we have before the age of 3 or genetic endowment.  This is true, genes do make a lot of difference, but they do not make all of the difference.  Most of the variants are up for grabs.  There are studies that would argue otherwise, the most famous being done on human twins.

The Minnesota Twins Studies (1996) took identical twins that were reared apart and brought up in different circumstances or places. They had the same genes, but a different upbringing. The results of this study are summed up in the following quote.

"It may be that trying to be happier is as futile as trying to be taller and is therefore counterproductive." - Lykken and Tellegan

Fortunately, these studies are misleading because there is counter-evidence. There's evidence that people change through therapy. There's evidence that people change after reading an influential book or a powerful experience.  There will be 2 lectures on change; we will be revisiting this. There's evidence that a powerful sentence causes change.  But thats a problem, how do we explain the contradiction in the Twins Studies research? The research makes an error; this error is called the Error of the Average.  They took the average of some sample size and they found that, on average, there was no significan't change. Does that mean that no twins had a significan't change of happiness?  No, of course not, just the average. They treated the twins with change as outliers, as statistical noise, and thus they were ignored. The average says that people dont change, but the fact that people *do* change proves the rule: **people can change**.

The problem of this research is that it hurts people. People read about this, especially people who are already depressed, and feel like shit.  This research becomes a self-fulfilling prophecy; people start believing that their misery is scrolling.  If it were true this would be no problem, but it's not true. Just because change is difficult, doesnt mean it's impossible.  The question is *how*?

We're going to figure this out by studying the best.  We're going to study the exceptions to "the rule". Study the best in people instead of just the average. Maslow said the research we need to focus on is not just the average, but the elite and exceptional.

"What this kind of research design means is a change in our conception of statistics, and especially of sampling theory. What I am frankly espousing here is what I have been calling ‘growing-tip statistics,' taking my title from the fact that it is at the growing tip of a plant that the greatest genetic action takes place..." - Abraham Maslow

>If we want to know how fast a human being can run, then it is no use to average out the speed of a ‘good sample' the population; it is far better to collect Olympic gold medal winners and see how well they can do. If we want to know the possibilities for spiritual growth, value growth or moral development in human beings, then I maintain that we can learn most by studying our most moral, ethical, or saintly people. On the whole I think it is fair to say that human history is a record of the ways in which human nature has been sold short. The highest possibilities of human nature have practically always been underrated.... Certainly it seems more and more clear that what we call ‘normal' in psychology is really a psychopathology of the average, so undramatic and so widely spread that we don't even notice it ordinarily. - Abraham Maslow (1950s)

This does, however, sound elitist.  Shouldn't we want to study the common people and the masses?  Well... (1) we're not only going to study the best.  We should study both, and find a happy medium. (2) ultimately everyone benefit's from studying the best.  The average person, the bottom, and the best all benefit. Imagine if we only studied average students in the inner cities and didn't ask about how the exceptional students excelled? Studying the best and then applying it to everyone else helps everyone. What if we only studied average relationships between men and women, where women were subjugated?  We would never evolve.  John Stewart Mills did this, and now we have a new norm.

Internally, we will try and learn from ourselves. Why can't we reflect on when we have great personal experiences and apply those?  What can you learn about when you were really happy and at your best? From that sample, let's apply it to the present.

"Few in number though they be, we can learn a great deal about values from the direct study of these highly evolved, most mature, psychologically healthiest individuals, and from the study of the peak moments of average individuals, moments in which they become transiently self-actualized." - Abraham Maslow

What about changing the world? There was a huge study done in the 30's, 40's, 50's that had a ton of funding. They gave students a 5 year intervention with a 40 year follow up. 250 kids were given a case worker that would visit their house and give them help with anything that they wanted. The best doctors from harvard participated. This was a dream study for every psychologist.  The kids also received academic tutoring and psychiatric attention and were encouraged to join the boy scouts and YMCA.

The results were shocking:

- No difference in juvenile offenses
- No differences in adult offenses
- No difference on health, mortality, well being
- Significan't difference on alcoholism and job status, but it was in the wrong direction, they got worse!

From this study, it seemed like interventions can do more harm than good. Why didn't the study work?  It's probably because the kids got a sense of entitlement, as opposed to Marva Collins-style tough love. Idealism and good intentions are not enough to affect change.

"What I am suggesting is Manhattan-Project-type attacks upon what I consider to be the truly Big Problem of our time, not only for psychology but for all human beings with any sense of historical urgency..." - Abraham Maslow

What if I don't want to join a project of this size?  One can make a difference.

"All history is a record of the power of minorities, and of minorities of one." - Ralph Waldo Emerson

"Never doubt that a small group of thoughtful, committed citizens can change the world. Indeed, it is the only thing that ever has." - Margaret Mead

The problem is that most people dont understand how change occurs. Take, for example, smiles. Assume that one person smiles, and each person that sees it smiles at 3 other people.  It's only 20 degrees of separation to affect every person in the world. Or how about giving a general compliment to someone else? We underestimate our capacity to effect change because we underestimate the growth of an exponential function. This becomes a self-fulfilling prophecy, "who am I to change the world?"})

PostElement.create(post: p, element: tb)
