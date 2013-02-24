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
