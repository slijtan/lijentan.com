site_name = "Smashing Magazine Parallax Scrolling Tutorial"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: false)
site.domains.create(domain: "smashing.localhost")
site.domains.create(domain: "smashing.lijentan.com")

site.site_style.update_attributes(font_color_data: {
                                    font_color: "#fff",
                                    link_color: "#fff",
                                    link_hover_color: "#fff"},
                                  header_font_data: {
                                    font_code: '<link href="http://fonts.googleapis.com/css?family=Lobster+Two" rel="stylesheet" type="text/css">',
                                    font_family: "'Lobster Two', cursive"
                                  }
                                  )

## BEGIN SMASHING MAGAZINE PARALLAX TUTORIAL CLONE
p = Post.create(title: "Intro",
                published: true,
                show_header: false,
                site: site,
                space: nil,
                height: "full-screen",
                display_order: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/puckered.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-v:0%;fluid-h:50%", animation_type: 'fixed')

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/smashing-logo.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, animation_type: 'fixed', position: "fluid-h:50%;fixed-top:100px;")

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/tutorial-title.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 3, position: "fluid-h:50%;fixed-top:300px;")

tb = TextBox.create(style: 'full-margins',
                    text: "<span class='grayLight small'>Words and pictures by Richard Shepherd / Twitter: [@richardshepherd](https://twitter.com/richardshepherd) / Web: [richardshepherd.com](http://richardshepherd.com/)<br />GitHub: [Fork it here!](https://github.com/richardshepherd/Parallax-Scrolling/)</span>",
                    text_color: "#FFFFFF",
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 4, position: "fluid-h:50%;fixed-top:550px;")


p = Post.create(title: "First Story",
                published: true,
                show_header: false,
                site: site,
                space: nil,
                height: "full-screen",
                display_order: 2)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/slide2.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px;fluid-h:50%", animation_type: 'scan', animation_direction: 'down')

tb = TextBox.create(style: 'single-column-text',
                    background_image_url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/grain.png',
                    text: %{
#Background Only
In this section we are sliding the background at a different speed to the rest of the page.

As this text box is scrolling at the same speed as the page, and faster than the background, it creates this lovely parallax effect.

You can find all the HTML, CSS and the all important JavaScript files over at [GitHub](https://github.com/richardshepherd/Parallax-Scrolling) - so why don't you drop by for some hardcore forking action?

Backgrounds for this article were taken from the May/June 2011 Smashing Magazine Desktop backgrounds.

Head back to [Smashing Magazine](http://coding.smashingmagazine.com/2011/07/12/behind-the-scenes-of-nike-better-world/), or hop on over to [RichardShepherd.com](http://richardshepherd.com/).
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-left:100px;fixed-top:60px")


p = Post.create(title: "Second Story",
                published: true,
                show_header: false,
                site: site,
                space: nil,
                height: "full-screen",
                display_order: 3)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/slide4.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px;fluid-h:50%", animation_type: 'scan', animation_direction: 'down')

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/photo.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fluid-h:25%", animation_type: 'scan', animation_direction: 'down')

tb = TextBox.create(style: 'single-column-text',
                    background_image_url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/grain.png',
                    text: %{
#Scrolling Sprites
The next step in your parallax scrolling adventure is to create some sprites!

I have cut out one of the photos in this background and use it as a sprite. It scrolls at a different speed to the background and the window, and it's this effect that's used so well on Nike Better World and other parallax sites..

Using too many sprites can slow down older computers, and you need to use some clever maths (and trial & error!) to work out their placement on the page.
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:90%;fixed-top:100px")

p = Post.create(title: "Third Story",
                published: true,
                show_header: false,
                site: site,
                space: nil,
                height: "full-screen",
                display_order: 4)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/slide3.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px;fluid-h:50%", animation_type: 'scan', animation_direction: 'down')

tb = TextBox.create(style: 'single-column-text',
                    text: %{
#HTML5 Video
Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.

Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. o.
})
PostElement.create(post: p, element: tb, sequence: 2, position: "fluid-h:10%;fixed-top:50px")

video_data = [{type: "video/ogg", url: "http://www.richardshepherd.com/smashing/parallax/video/parallelparking.theora.ogv"},
              {type: "video/mp4", url: "http://www.richardshepherd.com/smashing/parallax/video/parallelparking.mp4"},
              {type: "video/webm", url: "http://www.richardshepherd.com/smashing/parallax/video/parallelparking.webm"}
             ]
v = Video.create(video_data: video_data, style: 'medium', host: 'html5')
PostElement.create(post: p, element: v, sequence: 3, position: "fluid-h:90%", animation_type: "scan", animation_direction: "up")

p = Post.create(title: "The End",
                published: true,
                show_header: false,
                site: site,
                space: nil,
                height: "full-screen",
                display_order: 5)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/puckered.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-top:0px;fluid-h:50%", animation_type: 'fixed')

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/smashing-parallax/theend.png', style: 'image')
PostElement.create(post: p, element: s, sequence: 2, animation_type: 'scan', animation_direction: 'up', position: "fluid-h:50%")
