# -*- coding: utf-8 -*-
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

tb = TextBox.create(style: 'full-no-margins',
		    text_align: 'left',
		    text: %{
<h1 class="massive">"Well, the way they make shows is, they make one show.</h1>

<h1 class="huge blue">That show's called a pilot. Then they show that show to the people who make shows,</h1>

<h1 class="xlarge red left">and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs.</h1>

<h1 class="large orange right">Some don't, become nothing. She starred in one of the ones that became nothing.

Well, the way they make shows is, they make one show. That show's called a</h1>

<h1 class="medium justify">pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows.</h1>

<h1 class="small purple">Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</h1>

<h1 class="xsmall blue-dark">Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength</h1>

<h1 class="tiny pink">of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.</h1>

<p class="massive">"Well, the way they make shows is, they make one show.</p>

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


p = Post.create(title: "Is she dead, yes or no?",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 13, 24))

tb = TextBox.create(style: 'full-margins',
		    text: %{
Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Hold on to your butts",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 12, 24))

tb = TextBox.create(style: 'full-margins',
		    text: %{
Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "I'm serious as a heart attack",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 11, 24))

tb = TextBox.create(style: 'full-no-margins',
		    text: %{
Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "No man, I don't eat pork",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 10, 24))

tb = TextBox.create(style: 'single-column-text',
		    text: %{
My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?

My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?

My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "Uuummmm, this is a tasty burger!",
		published: true,
		show_header: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 9, 24))

tb = TextBox.create(style: 'two-column-text',
		    text: %{
Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.
}
)
PostElement.create(post: p, element: tb, sequence: 1)

p = Post.create(title: "I Want Brains",
		published: true,
		site: site,
		date_published: DateTime.new(2013, 1, 7, 9, 24))

tb = TextBox.create(style: 'single-line-text',
		    text: %{
Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.
}
)
PostElement.create(post: p, element: tb, sequence: 1)


p = Post.create(title: "Big Ol' Quote",
		published: true,
		site: site,
		show_header: false,
		date_published: DateTime.new(2012, 10, 31, 18, 6))

tb = TextBox.create(style: 'quote-big',
		    text: '"Imitation is the sincerest form of flattery" - Inspired by 2012.hd-live.co.uk')

PostElement.create(post: p, element: tb, sequence: 6)


p = Post.create(title: "Giants Win The World Series!!!",
		published: true,
		site: site,
		date_published: DateTime.new(2012, 11, 29, 14, 55))

v = Video.create(video_data: {id: "YKmgVJjk5PY"}, style: 'medium', host: 'youtube')
PostElement.create(post: p, element: v)



p = Post.create(title: 'Harvard Psychology 1504 - Premises of Positive Psychology Part 1',
		published: true,
		site: site,
		date_published: DateTime.new(2012, 10, 31, 10, 13))

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
