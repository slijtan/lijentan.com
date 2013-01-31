site_name = "Blog Template"
if site = Site.find_by_name(site_name)
  site.destroy
end

site = Site.create(name: site_name, show_nav: true)
site.domains.create(domain: "blog-template.localhost")
site.domains.create(domain: "blog-template.lijentandotcom.herokuapp.com")

p = Post.create(title: "We happy?",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 14, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing."
)
PostElement.create(post: p, element: tb, sequence: 1)


p = Post.create(title: "Is she dead, yes or no?",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 13, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass."
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Hold on to your butts",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 12, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?"
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "I'm serious as a heart attack",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 11, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?"
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "No man, I don't eat pork",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 10, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?"
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Uuummmm, this is a tasty burger!",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 9, 24))

tb = TextBox.create(style: 'full-margins',
		    text: "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."
)
PostElement.create(post: p, element: tb, sequence: 1)
