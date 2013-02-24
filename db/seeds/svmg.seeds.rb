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
                height: "full-screen",
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
<h1 class="xlarge">Brand Representation</h1>

Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.
},
                    text_align: "center")
PostElement.create(post: p, element: tb, sequence: 1, position: "fluid-v:50%;fluid-h:50%")


############# Brand Rep Brands #############
p = Post.create(title: "UFC",
                published: true,
                show_header: false,
                site: site,
                height: "500px",
                bg_color: '#000',
                space: 'background',
                display_order: 3)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logotype-ufc.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-left:0px;fluid-v:50%", animation_type: "scan", animation_direction: "right")


p = Post.create(title: "MLBAM",
                published: true,
                show_header: false,
                site: site,
                height: "500px",
                bg_color: '#003263',
                space: "background",
                depth: 3,
                display_order: 4)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/svmg/logo-mlb.jpg', style: 'cover')
PostElement.create(post: p, element: s, sequence: 1, position: "fixed-right:0px;fluid-v:50%", animation_type: "scan", animation_direction: "right")

tb = TextBox.create(style: 'full-margins',
                    text: "<h1 class='massive'>&#149;</h1>")
PostElement.create(post: p, element: tb, sequence: 2, position: "fixed-bottom:0px", animation_type: "scan", animation_direction: "right")

tb = TextBox.create(style: 'single-column-text',
                    text: %{
#MLBAM

Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.
})
PostElement.create(post: p, element: tb, sequence: 3, position: "fluid-h:15%;fixed-top:150px", animation_type: "three-phase", animation_direction: "fixed-fixed-roll")


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
