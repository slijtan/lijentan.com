# -*- coding: utf-8 -*-
Post.delete_all
TextBox.delete_all
PostElement.delete_all
Video.delete_all
Sprite.delete_all
Album.delete_all
AlbumElement.delete_all
Site.delete_all


s1 = Site.create(name: "lijentan.com", show_nav: true)
s2 = Site.create(name: "Smashing Magazine Parallax Scrolling", show_nav: false)

hp = Post.create(title: "Lijen's Blog",
                 published: false,
                 show_header: false,
                 site: s1,
                 date_published: DateTime.new(2013, 1, 7, 14, 24))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/header/header4.jpg', style: 'cover')
PostElement.create(post: hp, element: s, animation_type: 'fixed', sequence: 1)
tb = TextBox.create(style: 'full-no-margins',
                    text_color: '#FFFFFF',
                    text: %{
#Lijen's Blog
##A place on the<br />web for all my<br />stuff...
})
PostElement.create(post: hp, element: tb, sequence: 2)

s1.update_attribute(:header_post, hp)


p = Post.create(title: "CKs 30th Birthday",
                published: true,
                show_header: false,
                site: s1,
                date_published: DateTime.new(2013, 1, 7, 14, 24))

v = Video.create(video_id: "vwl56lz0JU0", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)

p = Post.create(title: 'Premises of Positive Psychology Part 2',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 12, 10, 19, 20))

tb = TextBox.create(style: 'full-margins',
                    text:
%{
Premises of PP:
1. Bridge building vs Division and separation - This class will go against a lot of traditional psych with demarkation and division, and instead will build bridges
2. Change is possible vs Change is illusive - Change is possible. Conventional wisdom believes that change isn't possible and that we're stuck with our early upbringing and genetic disposition (with minor deviations)
3. [Internal factors primarily determine happiness vs Happiness is primarily a function of external circumstances](#p-lec-1-3) - People believe that "only if I get x, y, or z, then I'll be happy", but research shows that this isn't true.  Happiness is much more about the internal.
4. [Human nature must be obeyed vs Human nature must be perfected](#p-lec-1-4)
5. [Happiness is and ought to be the ultimate end vs Happiness should be a secondary pursuit](#p-lec-1-5)

### <a name="p-lec-1-3"></a>Premise 3 - Internal factors primarily determine happiness VS happiness is primarily a function of external circumstances
In the past, there has been much research about "Subjective Well-Being" (aka "happiness") where they measure happiness through self reports and collect peoples' subjective evaluation about how they're feeling. Recently there have been more studies trying to study happiness in a more "objective" manner, but we’ll talk about this later.  Most of the research, however, has been done through questionnaires. They have found high correlation in both the subjective and the objective ones.

Dan Gilbert did research on how well people predict their levels of (un)happiness in the future at Northwestern University.  He went to psychology professors just before their tenure or non-tenure decision. He asked (1) how happy will you be if you get tenure? Most responded, extremely happy; they thought it would be the peak of their experience.  (2) How long will you be happy for? Most responded the rest of their lives. They were thinking "This is what I've been working on, it'll make or break my happiness".  (3) If you dont get tenure, how long will be distraught? Most responded for a very long time, probably until they get tenure from somewhere else.

Then he went back to them after they got their tenure decision.  For people who got it, they were ecstatic and felt like this feeling of happiness would last a long time. For people who didn’t get it, they were completely distraught and thought they would still be feeling this way for a while.

And then he went back to them a few months later. He found that both groups returned to their base level of happiness.  If they were down after they bounced back up, and if they were up after they came back down.

He did a similar experiment with people winning the state lottery and found the exact same thing.  Winning the lottery did not affect their long term happiness levels.

Think about when you got into Harvard.  When you got that big acceptance letter...  how happy were you? You were ecstatic! And then... classes begin... and then we usually go back to our base level of happiness.

This is how our happiness works.  Why do you think there are so many extremely successful people who are depressed? They get an idea that once they get "there", they will be happy.  Then they get there, but then what?  They aren't happy, so they feel disillusioned. So many people think "when I get … then Ill be happy", but it doesnt work that way.

There's more research by Ed Diener from the university of Illinois that shows similar results:

- Income matters little to national happiness (beyond a GDP of $8k outside of US)
- No change across generations
- Place of residence is irrelevant (except people with Seasonal Affected Disorder)
- Democracy and oppression DO show a significant difference

Generally speaking, external circumstances make very little difference. What will make a difference? Our readiness and potential to experience happiness is mostly dependent on our state of mind, not on our status or the state of our bank account.

So what can we do to raise the base level of happiness?  We'll talk about these more later, but some things that we can do are:

- Meditation - changes the internal pathways
- Learning to interpret events differently - ie: cognitive behavioral therapy
- Exercise - cultivates self-esteem


### <a name="p-lec-1-4"></a>Premise 4 - Human nature must be obeyed VS Human nature must be perfected
Is our nature fixed or can we actually change and modify them?

Thomas Sowell (Harvard class of 1958) wrote the book *A Conflict of Visions* (great political book). He says, you can divide political thinkers into 2 realms.  One side has the constrained vision; that human nature is fixed and we can't change it.  The other side has the view that we need to perfect human nature (utopianism).

Constrained Vision (ie: Adam Smith, Edmund Burke, Ayn Rand, Hayak, Alexander Hamilton)

- Human nature is immutable
- Flaws inevitable
- Acceptance
- Channel nature
"Nature to be commanded must be obeyed" - Francis Bacon

Unconstrained Vision (ie: Rousseau, George Bernard Shaw, Ronald Dworkin)

- Human nature can be improved
- Perfectible
- Solutions exist
- Change nature
"It is for self-perfectioning that destiny calls us" - Benjamin Constant

Sowell shows how having one vision as opposed to the other leads to radically different results. Constrained vision would be the capitalists. They would think that humans are going to compete and beat each other, so how can we channel this effectively?  In contrast, the unconstrained vision leads to communism and utopianism.  We can make people better, we can make our society better... It's not a hard line, for example people can be psychologically constrained, but politically unconstrained.

Most people can agree on the fact that we have a selfish gene and a benevolent gene.  The question is what can we do with those genes?

In Tal's mind a healthy psychology falls on the constrained side of human nature. We have certain instincts and wants, and that they are unchangeable.  Circumstances change, fashion changes, technology changes, but our human nature is immutable and doesn't change.  The role of psychology is to understand this nature.  Once we understand it, how can we make the best use of it? And this is what Tal believes will lead to ultimate happiness. If, on the other hand, we do try and change it, we will encounter a brick wall in a battle that we will never win and it will lead to unhappiness.

This is one of the central pillars of this class and of a fulfilling life, and has contributed a great deal to Tal's happiness.  It was when he gave himself the permission to be human (also the title of his next book). *Permission To Be Human*. Accepting things that are a part of who we are, that wont change, and giving ourselves the permission to experience them.  Giving ourselves unconditional acceptance to experience them.  There are 2 ways to go about these things.  One is to reject them, saying that "I will never be jealous", etc.  The other is to say "im human" and experience them, even if you don't like the feeling.  Other examples are feelings of stress, anger, anxiety, depression, or jealousy.  Give yourself the permission to experience these emotions.

It's not the same as resignation though.  Just because I feel envy toward my closest friend, that does not mean that I will act accordingly and put them down.  No.  You have a choice. When you accept that emotion, you have a choice of what to do with it. The main point is that we shouldnt reject our nature, it's impossible to avoid who we are.

The problem is that society, as a whole, doesnt give us the permission to be human.  Tal calls this *The Great Deception*.  Generally, in America, we dont give each other the permission to be human.  We dont give each other the permission to be sad. If we ask someone "how's it going?", we say "just fine" even if were stressed out; it's the automatic response. You don't have to go to the extreme and share with everyone, but you need people with whom you can be real and share these things.

This deception leads to the great depression.  If everyone else says that they feel great, even if I'm not feeling great, I'll still say that I'm feeling great.  This facade spreads, and each of us will pretend the same which leads to a social downward spiral.

Exercise: close your eyes and identify what you're feeling.  Tell yourself that it's ok, its natural, and embrace those feelings, good and bad.  Go with them, they might change or stay the same, but tell yourself that they are natural and embrace them. Do this for about 5 minutes and then open your eyes.

"God, grant me the serenity to accept the things I cannot change, the courage to change the things I can change, and the wisdom to know the difference." - Reinhold Niebuhr

### <a name="p-lec-1-5"></a>Premise 5 - Happiness is and ought to be our ultimate end VS Happiness should be a secondary pursuit

Tal will argue that happiness IS the ultimate end.

"Happiness is the meaning and purpose of life, the whole aim and end of human existence." - Aristotle

"If we were to ask the question: 'What is human life's chief concern?' one of the answers we should receive would be: 'It is happiness.' How to gain, how to keep, how to recover happiness, is in fact for most men at all times the secret motive of all they do, and of all they are willing to endure." - William James

We spend huge amounts of money to try and ensure our happiness whether it be our government or health systems.  This is true of the East and of the West.
"Whether one believes in religion or not, whether one believes in this religion or that religion, the very purpose of our life is happiness, the very motion of our life is towards happiness."

Some people say that this doesnt necessarily make happiness the highest goal, we need to pursue higher goals.  So it makes us feel good as an end in itself, but theres more to it

Whats good about positive emotions?

- It feels good to feel good - happiness as an end
- Broaden and Build - Research by Barbara Fredrickson @ University of Michigan shows that when we experience positive emotions rather than negative, the view of the world has a much broader perspective on reality and it affects everything.  Historically, this broaden and build has strengthened us evolutionarily speaking, theyve made us stronger and more effective today, and this is still true today

"We should work to cultivate positive emotions in ourselves and in those around us not just as end states in themselves, but also as a means to achieving psychological growth and improved psychological and physical health over time... I call this the broaden-and-build theory of positive emotions because positive emotions appear to broaden people’s momentary thought-action repertoires and build their enduring personal resources...

Through experiences of positive emotions people transform themselves, becoming more creative, knowledgeable, resilient, socially integrated, and healthy individuals." - Barbara Fredrickson

As opposed to Narrow and Constricted, in the wild when being attacked by lions, we want to feel anxiety and constrict out emotions to deal with this specific scenario.
-Overcoming negative emotions - Narrow & Constrict doesnt work well with depression, it makes us focus on negatives and puts us in a negative loop.  Broaden & Build helps to reverse the cycle because it makes us think of positive things and apply them to our world.  Not to take away from embracing the negative emotions, those are healthy as well.  The point is Broaden & Build helps us get out of those narrow mind states.
- Increased creativity - Experiments show this is true if all other things are equal. Proust would be more creative if he were happy! Research by Fredrickson on 3 groups of interns at a hospital trying to diagnose some type of liver disease.  Group 1 got candy, group 2 read an excerpt of the humanitarian importance of medicine, group 3 was the control.  Group 1 were much more likely to come up with a solution to the problem.  They didn't reach immediate closure on the problem because they had a broaden & build approach
- Increased motivation & energy - Just think about the last time you were down.  How motivated and how much energy did you have?
- Success - Comes with increase of creativity, motivation, and energy
- Physical health

But what about others? Happiness is not a zero sum game; its a positive sum game

"Thousands of candles can be lighted from a single candle, and the life of the candle will not be shortened. Happiness never decreases by being shared.” Buddha

We have better relationships, increased generosity, and has shown to make us help others more as well when were happy

"Be the change you want to see in the world." - Gandhi
})

PostElement.create(post_id: p.id, element: tb, position: 'inline')

p = Post.create(title: "Manga Camera",
                space: 'midground',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 11, 13, 11, 13))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/bg-textures/eggshell.jpg', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 1)

a = Album.create(style: 'comic')
(1..20).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/manga/manga-#{i}.jpg"), sequence: i) }
(1..20).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/manga/manga-#{i}.jpg"), sequence: (i + 20)) }
PostElement.create(post: p, element: a, sequence: 2)

p = Post.create(title: "Live in a Vision",
                space: 'midground',
                published: true,
                show_header: false,
                site: s1,
                date_published: DateTime.new(2012, 11, 10, 12, 57))

v = Video.create(video_id: "3I9UsfDZLyQ", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)


p = Post.create(title: 'Holstee Pt. 2',
                space: 'background',
                height: '600px',
                published: true,
                show_header: false,
                site: s1,
                date_published: DateTime.new(2012, 11, 9, 11, 15))

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/holstee/holstee-2.jpg')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   animation_type: 'scan',
                   animation_direction: 'up',
                   sequence: 1)

tb = TextBox.create(text: 'Life is short.',
                    style: 'single-line-text',
                    text_size: 60)

PostElement.create(post_id: p.id,
                   element: tb,
                   position: 'top:10%;left:10%;',
                   sequence: 2)

p = Post.create(title: "The Happy Secret to Better Work",
                published: true,
                show_header: false,
                site: s1,
                date_published: DateTime.new(2012, 11, 8, 12, 57))

v = Video.create(video_id: "fLJsdqxnZb0", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)

p = Post.create(title: "GoPro on CK's 30th",
                space: 'background',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 11, 5, 16, 23))

s = Sprite.create(style: 'tiling', url: 'http://dl.dropbox.com/u/4893047/posts/bg-textures/wood-1.png')
PostElement.create(post: p, element: s, sequence: 1)

a = Album.create(style: 'coffee-table')
(1..28).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/ck-bday-time-lapse/ck-bday-time-lapse-#{i}.jpg"), sequence: i)}
PostElement.create(post: p, element: a, sequence: 2)


p = Post.create(title: "How Will You Measure Your Life?",
                published: true,
                show_header: false,
                site: s1,
                date_published: DateTime.new(2012, 11, 5, 10, 56))

v = Video.create(video_id: "tvos4nORf_Y", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)


p = Post.create(title: 'Object In Nature - Session 1',
                published: true,
                site: s1,
                height: "550px",
                space: "foreground",
                date_published: DateTime.new(2012, 9, 25, 14, 43))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/oakdale.jpg', style: 'image')
PostElement.create(post:p, element: s, animation_type: 'scan', animation_direction: 'right', sequence: 1)

tb = TextBox.create(style: 'single-column-text',
                    text:
                    %{So, after over 4 years of not painting, I decided to sign up for a studio painting class with Larry Robinson (<a href="http://www.larryrobinson.net/" target=_blank>larryrobinson.net</a>). Larry's a super nice and really great teacher, I took a Fundamentals of Painting class with him several years ago at Berkeley Extension and loved it. It's a little weird painting again, and I forget most of the steps and fundamentals, but I'm slowly getting the hang of it again. Our first project is to paint an object in nature, so I dug out a photo that I took last week of my friend Audrey biking next to a Fjord in Norway. I switched the composition a little bit by pulling her closer into the foreground, and cropping off the right side and removing some houses, which you'll see in the next post. I'm going to post the evolution of the painting from week to week, stay tuned.})

PostElement.create(post: p, element: tb, position: "left:300px", sequence: 2)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1-bg.png', style: 'image')
PostElement.create(post:p, element: s, position: "left:700px", animation_type: 'scan', animation_direction: 'down', sequence: 3)


p = Post.create(title: 'Object In Nature - Session 2',
                published: true,
                site: s1,
                space: 'midground',
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 2, 14, 43))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{After doing the initial grey wash and sketching out the composition of the painting using vine charcoal, the first main step of the painting process is to use a technique called ROR. It stands for (R)unny (O)verlapping (R)andom. The idea is to randomly fill in the space with very diluted paints so that you get a very runny surface. It's very initial, and we will end up painting over the initial layer several times over, but this first layer is just to get us started.})

PostElement.create(post: p, element: tb, sequence: 1)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 2)
PostElement.create(post: p, element: a, sequence: 2)


p = Post.create(title: 'Object In Nature - Session 3',
                space: 'background',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 5, 14, 43))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg', style: 'image')
PostElement.create(post: p, element: s, animation_type: 'fixed', sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{The next layer we start using thicker paint with warm and cool colors to help define the space. You'll notice that I tried using warmer colors such as red, orange, and yellow for objects that I want to pull closer to the foreground, such as the biker, and cooler color such as blues and greens for objects that I want to push back. Black and white also help with giving objects texture and depth, where black pushes an object back and white pulls it forward. You can notice that I tried using white at the front edge of the roof of the house and black on the right edge of the biker's vest and helmet to give both of those objects some extra depth. Still got a ton of work to do, I forgot how long and tedious painting is!})
PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 2)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 3)
PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'Object In Nature - Session 4',
                space: 'midground',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 12, 13, 43))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-4.jpg', style: 'image')
PostElement.create(post: p, element: s, animation_type: 'fixed', sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{In this session I'm starting to use colors that I want the final painting to have. The sky is now blue, the sand is now brown, and the fence is now white. It's still a work in progress, and from here on out the process is pretty straight forward; I'm progressively using thicker and thicker paints and painting in more details and tones with darks and whites to give the painting space while making it look more realistic. I honestly really feel like I am fighting with the painting a lot, and I really didn't remember how hard it was to paint, but I also remember Larry teaching us that the process of painting is a curve, where at some point in the process we will hit a low where we don't like our painting and we feel lost. If we fight through that low, it's all uphill from there and we will eventually discover the painting and figure out a way to make it work, and we will grow to like our painting more and more. It's like problem solving, except instead of a math problem, it's a visual problem.})

PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-4.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg'), sequence: 2)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 3)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 4)
PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'Object In Nature - Session 5',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 10, 20, 15, 10))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{This week I focused on adding more details and final colors. I've generally been struggling with making the painting bright enough, so I tried lightening up the colors a bit and tried to get more contrast in there})

PostElement.create(post: p, element: tb, sequence: 1)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-5.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-4.jpg'), sequence: 2)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg'), sequence: 3)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 4)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 5)
PostElement.create(post: p, element: a, sequence: 2)

p = Post.create(title: 'Object In Nature - Session 6',
                space: 'midground',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 10, 25, 14, 43))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{We're getting closer. I worked on the mountains in the background, and finally did a grey wash over the street. I'm trying to sharpen the girl on the bike and make her brighter to bring her forward. I think I'll be done in one or two more sessions... finally!})

PostElement.create(post: p, element: tb, sequence: 1)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-6.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-5.jpg'), sequence: 2)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-4.jpg'), sequence: 3)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg'), sequence: 4)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 5)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 6)
PostElement.create(post: p, element: a, sequence: 2)

p = Post.create(title: 'Object In Nature - Session 7',
                space: 'midground',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 11, 1, 14, 43))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/bg-textures/eggshell.jpg', style: 'tiling')
PostElement.create(post: p, element: s, sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{Ok, this thing is as done as it's ever gonna be. There's still some things that I'd like to do to it, but I think I'm ready to move on to another painting...})
PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'coffee-table')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-7.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-6.jpg'), sequence: 2)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-5.jpg'), sequence: 3)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-4.jpg'), sequence: 4)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-3.jpg'), sequence: 5)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-2.jpg'), sequence: 6)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/painting/painting-1.png'), sequence: 7)
PostElement.create(post: p, element: a, sequence: 3)

p = Post.create(title: 'Playing With Backgrounds',
                space: 'auto',
                padding: 'medium',
                bg_color: "#0C4F59",
                published: true,
                site: s1,
                show_header: false,
                height: "750px",
                date_published: DateTime.new(2012, 10, 31, 18, 6))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/hex/BG-small-hex-2.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/hex/BG-small-hex-5.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'up', sequence: 2)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/hex/BG-small-hex-3.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 3)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/hex/BG-small-hex-1.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'up', sequence: 4)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/hex/BG-small-hex-3.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 5)

tb = TextBox.create(style: 'quote-big',
                    text: '"Imitation is the sincerest form of flattery" - Inspired by 2012.hd-live.co.uk',
                    text_color: "#D0531F")

PostElement.create(post: p, element: tb, sequence: 6)

p = Post.create(title: 'Holstee Pt. 1',
                space: 'background',
                height: '600px',
                published: true,
                site: s1,
                show_header: false,
                effect: 'fade-in',
                date_published: DateTime.new(2012, 10, 31, 11, 15))

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/holstee/holstee-1.jpg')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   animation_type: 'scan',
                   animation_direction: 'down',
                   sequence: 1)

tb = TextBox.create(text: 'Live your dream and share your passion.',
                    style: 'single-line-text',
                    text_size: 30)

PostElement.create(post_id: p.id,
                   element: tb,
                   position: 'right',
                   animation_type: 'scan',
                   animation_direction: 'up',
                   sequence: 2)


p = Post.create(title: 'Harvard Psychology 1504 - Premises of Positive Psychology Part 1',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 31, 10, 13))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{
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


p = Post.create(title: 'Burning Man 2012',
                published: true,
                site: s1,
                padding: 'medium',
                space: 'background',
                date_published: DateTime.new(2012, 10, 30, 12, 35))

s = Sprite.create(style: 'tiling',
                  url: 'http://dl.dropbox.com/u/4893047/posts/bg-textures/stormy-sky.jpg')

PostElement.create(post: p, element: s, sequence: 1)

a = Album.create(style: 'horizontal-scroll')

PostElement.create(post: p, element: a, sequence: 2)

(1..99).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/burning-man/burning-man-#{i}.jpg"), sequence: i) }

p = Post.create(title: "Messages In A Bottle",
                published: true,
                site: s1,
                space: 'background',
                height: "1200px",
                date_published: DateTime.new(2012, 10, 29, 22, 50))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/messages-in-a-bottle/messages-in-a-bottle.jpg', style: 'image')
PostElement.create(post: p, element: s, position: 'top;h-center;')


p = Post.create(title: "Giants Win The World Series!!!",
                published: true,
                site: s1,
                space: 'midground',
                show_header: false,
                date_published: DateTime.new(2012, 10, 29, 14, 55))

v = Video.create(video_id: "YKmgVJjk5PY", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)

p = Post.create(title: "Giants Sweep",
                published: true,
                site: s1,
                space: 'background',
                height: "2000px",
                show_header: false,
                date_published: DateTime.new(2012, 10, 29, 14, 54))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/giants-sweep/giants-sweep-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, position: "top;h-center")

p = Post.create(title: 'Ninja Assassin',
                space: 'background',
                published: true,
                site: s1,
                show_header: false,
                date_published: DateTime.new(2012, 10, 29, 2, 13))

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/ninja/ninja-bg.jpg')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   animation_type: 'scan',
                   animation_direction: 'right',
                   sequence: 1)

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/ninja/ninja-shade.png')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   sequence: 2)

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/ninja/ninja.png')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   animation_type: 'scan',
                   animation_direction: 'right',
                   sequence: 3)

tb = TextBox.create(text: 'Come, little brother. Let us play like old times.',
                    style: 'quote-big')

PostElement.create(post_id: p.id,
                   element: tb,
                   position: 'inline',
                   sequence: 4)


p = Post.create(title: 'Another Summer Weekend',
                space: 'midground',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 10, 29, 20, 13))


tb = TextBox.create(style: 'two-column-text',
                    text:
                    %{It was another memorable weekend in SF.
On Friday we celebrated my good friend Angela's birthday, and we celebrated it on a historic ship from WWII, the S.S. Jeremiah O'Brien.

![The S.S. Jeremiah O'Brien](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-2-th.jpg)
![Hammy The Gunner](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-3-th.jpg)

The top 5 Jeremiah O'Brien Facts:

5. The Engine room of the O’Brien was used in the filming of the movie Titanic
4. The WWII Liberty Ship build out was managed by industrialist Henry J. Kaiser, who founded Kaiser Permamente.
3. This class EC2-S-CI ship made four perilous round trip wartime crossings of the Atlantic and served on D-Day
2. SS Jeremiah O'Brien was designated a National Historic Landmark and hosts overnight stays
1. Polynesian fantasy: Two pinups were painted on her maiden voyage, just above the bow

It was a pirate-themed Halloween party; I dressed up as a message in a bottle and was walking around and collecting messages in my bottleneck. I got some good messages, I'll post those in another post though.

![Bud Light Costume](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-1-th.jpg)

James had a pretty sick costume where he was dressed up as a pizza.

![Bud Light Costume](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-4-th.jpg)

On Saturday, a few friends and I headed up to Mt. Tam for some hiking.

We got a lot of shade...

![Shade](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-6-th.jpg)

And we got a lot of sun...

![Sun](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-8-th.jpg)

But most importantly, we got to chill...

![Chill](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-5-th.jpg)

On Sunday, the Giants won the World Series! We went out to celebrate in the Lower Haight

![Party In The Streets](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-9-th.jpg)
![Popin' Champaign](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-10-th.jpg)
![Friends Celebrate](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-11-th.jpg)

There was a band playin' some celebratory music.

![The Band](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-12-th.jpg)

Today Jas and I drove over to Dublin and bought a Cajon, which is a percussion kinda like a bongo drop. Can't wait to play it!

![Cajon](http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-13-th.jpg)
})

PostElement.create(post_id: p.id,
                   element: tb,
                   position: 'inline',
                   sequence: 2)

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/oct26-weekend/oct26-weekend-bg.jpg')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'inline',
                   sequence: 1)


p = Post.create(title: "It's Time - Imagine Dragons",
                published: true,
                site: s1,
                space: 'background',
                show_header: false,
                date_published: DateTime.new(2012, 10, 26, 13, 5))

v = Video.create(video_id: "49-wNRvJwjk", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)

=begin
p = Post.create(title: '50 Ways to Say Goodbye',
                space: 'background',
                type: 'quote',
                show_header: false,
                published: false,
                site: s1,
                date_published: DateTime.new(2012, 10, 24, 14, 43))

BackgroundImage.create(url: 'http://dl.dropbox.com/u/4893047/posts/superman/superman-bg.jpg', type: 'scrolling', tile: false, post_id: p.id)

Quote.create(quote: "Some day I'll find a love like yours. She'll think I'm Superman. Not super minivan", source: "Patrick Monahan", type: 'quote-big', post_id: p.id)
=end

p = Post.create(title: 'Two Door Cinema Club',
                space: 'midground',
                published: true,
                site: s1,
                padding: 'medium',
                show_header: false,
                date_published: DateTime.new(2012, 10, 24, 2, 13))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/two-door-cinema/two-door-cinema-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, position: "top;h-center", sequence: 1)

tb = TextBox.create(text: "Cause if this is the life, this is the life, this is the life, this is the life, this is the life, then who'd argue?", style: 'quote-big')
PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'thumbnail-rows')

(1..9).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/two-door-cinema/two-door-cinema-#{i}.jpg"), sequence: 1) }
PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'Roll On You Bears',
                published: true,
                site: s1,
                space: 'background',
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 22, 10, 16))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/big-game/big-game-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 1)

a = Album.create(style: 'thumbnail-rows')
(1..11).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/big-game/big-game-#{i}.jpg"), sequence: i) }
PostElement.create(post: p, element: a, sequence: 2)


p = Post.create(title: '30th Anniversary of "The Play"',
                published: true,
                site: s1,
                space: 'background',
                show_header: false,
                date_published: DateTime.new(2012, 10, 22, 10, 10))

v = Video.create(video_id: "0fZCCAqoSwY", style: 'full-width', host: 'youtube')
PostElement.create(post: p, element: v)


p = Post.create(title: 'A Day Trip to the Russian River',
                published: true,
                site: s1,
                space: 'midground',
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 19, 17, 28))
s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/russian-river/russian-river-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{Jas and I were lucky enough to take a random Wednesday trip to the Russian River to do some canoeing and fishing. We caught a lot of things (most of which were inanimate) but we also managed to catch a foot long Steelhead Trout! We called it Ol' Greg; cooked 'em up real good for dinner. We also saw a family of seals swimming in the river, they caught themselves a big ass trout and were munchin' on it for lunch. Can't wait to go back! })
PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'thumbnail-rows')
(1..27).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/russian-river/russian-river-#{i}.jpg"), sequence: i) }
PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'EGO',
                bg_color: '#F0EACD',
                space: 'background',
                padding: 'medium',
                published: true,
                site: s1,
                show_header: false,
                date_published: DateTime.new(2012, 10, 17, 10, 25))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/ego/ego-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1)

tb = TextBox.create(text: '"There is nothing noble in being superior to your fellow man; true nobility is being superior to your former self" - Ernest Hemingway',
                    style: 'quote-big',
                    text_color: '#000000')
PostElement.create(post: p, element: tb, sequence: 2)

p = Post.create(title: 'My Resume',
                space: 'auto',
                padding: 'medium',
                published: true,
                site: s1,
                show_header: false,
                date_published: DateTime.new(2012, 10, 16, 0, 3))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{
<div style="text-align: center">
<h2 style="margin:0;">Lijen Tan</h2>
<span style="color:868585;">349 Divisadero St, San Francisco, CA 94117</span><br>
<span style="color:868585;">Phone: (510)410-1855 / Email: lijentan@gmail.com</span>
</div>

<hr style="border:dashed #868585 1px;">

### WORK EXPERIENCE
#### Crowdstar Inc (Burlingame, CA | <a href="http://www.facebook.com/wastelandempiresgame" target=_blank>www.facebook.com/wastelandempiresgame</a>)
*Sr. Backend Engineer (July 2010 - May 2012): Developed backend for popular Facebook game Wasteland Empires*
Selected Achievements:

- Developed core backend infrastructure and led backend development for Wasteland Empires (80K DAU, 620K MAU, 1.6M installs at peak) in a team of over 20 individuals
    - Collaborated closely with producer, game & economy designers, and art team to design, track, and optimize game features, monetization, engagement and performance
    - Designed, architected, and implemented re-usable systems for questing, achievements, content & progression locking, a/b testing, and multi-player ladder
    - Created first BDD process at company, with full unit testing suite
- Created full-featured Redis ORM in php used in all subsequent Redis deployments company-wide
    - Provided scalable, vertically and horizontally sharded infrastructure
    - Enabled rapid development via schemaless, key-value datastore
    - Supported indexing of data for rapid searches, and has many/belongs to relationships between model objects
    - Performance optimizations include request pipelining to reduce request latency and short key generation to increase memory efficiency
- Worked in codebase of 7 different games, including It Girl, Happy Island, Happy Aquarium, Happy Pets, and Pop Boom
    - Coded in php and Rails using MySQL, MongoDB, and Redis storage engines
    - Refactored code bases to support localization for 4 product launches in Japan

#### vDream Inc (Oakland, CA)
*Co-founder and CEO (March 2007 - December 2011):  Developed a social game and virtual marketplace for over 50,000 daily car enthusiasts. Responsibilities in both business and technology*
Technology:

- Coded in Rails at the model, view, and controller levels; database design; wrote client-side Javascript with AJAX support; wrote unit and functional tests; wrote deployment scripts; and server and source control (Subversion) administration
- Single-handedly managed a database of over 2M user accounts. Managed the migration of database through 3 different hosting companies, and a simultaneous primary and backup hard drive failure
- Developed applications on Facebook, Myspace, Bebo, and Tagged social networks with one single codebase RESTful web services
- Designed, implemented, and optimized a complex image rendering engine
- Developed a comprehensive back-end that was used to manage a large quantity of car-related data content

Business

- Created business development materials such as investor decks to engage potential funders
- Developed business strategies by conducting market and competitive analysis and building financial models
- Managed product priorities and delegating to both internal and outsourced engineering and artistic teams

####Sparkart LLC (Emeryville, CA | <a href="http://www.sparkart.com" target=_blank>www.sparkart.com</a>)
*Engineering Team Manager (October 2006 – March 2007): Managed a team of 8 engineers (3 international) with a high level of involvement in product design, development, and architecture. Interfaced with user experience, accounting, fulfillment, and project management teams to achieve product development and scheduling goals.*

Selected Achievements:

- Successfully delivered a web platform that currently supports over 20 various niche social networks and over a half million users on a 3-month timeline to meet business needs.
- Led the establishment of a customized, XP agile development process to relieve a chaotic, non-structured development working environment
- Designed and programmed an internal XP project management web-application using Rails.

*Software Development Engineer (July 2004 – Feb 2006): Worked in teams of 2 to 4 engineers. Coded in LAMP and utilized AJAX technology built on top of MVC frameworks to create dynamic applications. Built CMS web applications for high-profile celebrities and bands within a highly creative environment. Interfaced with third party development teams to design technical solutions to user and customer requirements.*

Selected Achievements:

- Created official websites for high profile clients such as Linkin Park, UFC, Green Day, and Criss Angel.
- Designed and implemented multi-tier, data-warehouse reporting application.

#### Man Made It LLC (San Francisco, CA | <a href="http://www.manmadeit.com/products" target=_blank>manmadeit.com</a>)
*Co-founder and CTO (May 2012 – Current): Sole engineer working in a team of 4 for an e-commerce site that offers high-quality, local, hand-made products to urbanites. Lead in product strategy, product development and product design. Involved in planning fulfillment strategy, branding, and marketing.*

#### Love For Design (San Francisco, CA)
*Co-founder and CTO (May 2010 – May 2011): Backend engineer for side-project that was focused on making great wedding websites for couples. Implemented and launched 3 wedding websites on a platform written in Rails 3 that sourced content from 3rd party APIs such as Facebook, Twitter, Google, and Flickr.*

#### IsACatch.com (San Francisco, CA)
*Co-founder and CTO (January 2007 – July 2009): Sole engineer working in a team of 4 for a social networking site that takes a novel approach to online dating. Involved at all levels of product development including feature development, user interface design, marketing, and programming. Technical responsibilities include coding in Rails, server administration, database design, and code optimization.*

### EDUCATION
**University of California, Berkeley**
B.S. in Electrical Engineering and Computer Science (May 2004), GPA: 3.5

### PERSONAL
I am a fluent speaker of Mandarin and knowledgeable in Spanish. In my free time I like to play sports including roller hockey, volleyball, basketball, boxing, running, biking, and swimming. I'm a huge Niners and Sharks fan. I also enjoy music, playing the guitar, and trying to do art. When I have vacation time I like to go backpacking.
})
PostElement.create(post: p, element: tb)


p = Post.create(title: 'Markdown Support',
                space: 'auto',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 10, 15, 15, 31))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{
I worked in some better formatting options for posts in the last few days. It was hard for me to decide at first what to use; my main consideration was between a text-to-HTML converter like markdown or textitle, or a WYSIWYG tool such as Mercury Editor. I decided to go with <a href="http://github.github.com/github-flavored-markdown/" target=_blank>Github Flavored Markdown</a> with <a href="https://github.com/vmg/redcarpet" target=_blank>Redcarpet</a> because it's the fastest to implement, and I can always move toward a heavier solution with a WYSIWYG later down the line. I would definitely consider using a WYSIWYG built on top of markdown, which would be fully extensible with my current setup, or one that saves raw HTML for the most flexibility. I also included <a href="http://coderay.rubychan.de/" target=_blank>CodeRay</a> support for nicely formatted code blocks. I know some of the styles look jenky... I have to work on styling a lot of elements still, I will progressively add styles as I use them in my posts. Here are some examples below of the types of tags that I can use in my Posts as of now:

# This is an H1
## This is an H2
### This is an H3
#### This is an H4
##### This is an H5
###### This is an H6

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
>
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

1. This
2. Is
3. A
4. Numbered
5. List

- This
- Is
- An
- Ordered
- List

```ruby
def this_is(how)
  ruby = code_blocks(look) if using?(coderay)
end
```

This is [an example](http://example.com/ "Title") inline link. You got me feeling *Harder*, _better_, **faster**, __stronger__
})
PostElement.create(post: p, element: tb)

p = Post.create(title: 'HTML5 and quotes with attribution',
                space: 'auto',
                padding: 'medium',
            published: true,
                site: s1,
            date_published: DateTime.new(2012, 10, 12, 1, 13))

tb = TextBox.create(style: 'full-margins',
            text:
            %{
So I did my first couple quote posts (see the Blue Angels post and the Superman post), but while I was doing them I had to research about what the proper semantic HTML is for displaying a quote with an author or source. Sounds pretty straight forward right? That's what I thought, but for some reason this was a little more complicated that I had anticipated... I thought I'd share what I found in case anyone else runs into this issue. I ended up using the following markup with the figure and figcaption tags to represent a quote with attribution. If you're curious why I chose this option, and what considerations there were for the other options, feel free to follow the links below to dive deeper.

```html
<figure>
<blockquot>Quote goes here</blockquote>
<figcaption>Author of quote goes here</figcaption>
</figure>
```
<small>source: <a href="http://html5doctor.com/the-figure-figcaption-elements/" target=_blank>html5doctor.com</a></small>


And here were some of the other options that other people suggested, but they felt hackish to me... The first is a solution that uses the footer tag within a blockquote. This doesn't make sense because technically, the source is not a part of the quote:

```html
<blockquote>
Quote goes here
<footer>Author of quote goes here</footer>
</blockquote>
```
<small>source: <a href="http://html5doctor.com/blockquote-q-cite/" target=_blank>html5doctor.com</a></small>


And another solution that uses the small tag. I didn't like this because the small tag seems a little too broad for such a specific reference:

```html
<blockquote>Quote goes here</blockquote>
<small>Author of quote goes here</small>
```
<small>source: <a href="http://blog.neilpie.co.uk/web-dev/html5-quote-attribution" target=_blank>blog.neilpie.co.uk</a></small>


I'm still not super happy with this solution, so if you know of a better way to do this semantically, let me know!
})
PostElement.create(post: p, element: tb)

p = Post.create(
            title: "The Blue Angels",
            bg_color: '#F0EACD',
            published: true,
                site: s1,
            padding: 'medium',
            space: 'background',
            show_header: false,
            date_published: DateTime.new(2012, 10, 8, 16, 9))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/blue-angels/blue-angels-bg.png', style: 'image')
PostElement.create(post: p, element: s, position: 'left', animation_type: 'scan', animation_direction: 'up', sequence: 1)

tb = TextBox.create(style: 'quote-big', text: '"Multiply the best roller coaster you can imagine by 100" - Navy Lt. C.J. Simonsen')
PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'thumbnail-rows')
(1..12).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/blue-angels/blue-angels-#{i}.jpg"), sequence: i) }
PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'Summatime in the SFC',
                space: 'background',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 10, 7, 15, 3))

tb = TextBox.create(style: 'two-column-text',
                    text:
                    %{Cheers to a fun and eventful weekend in SF! Friday was Steven's 30th birthday and we got to try out our new beer pong ladder system and web interface for the 1st time with everyone there. Credit to Steven and Tony for setting everything up and creating the website.![Steven's 30th Birthday Cake](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-2.jpg) Saturday was our good friends Michelle and Adam's wedding - It was amazing!![Mich's Wedding Dress](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-3.jpg) It was the most multi-cultural wedding that I've been to with Chinese, Jewish, Danish, and Turkish influences. We got to take part in the Jewish chair lifting tradition called the Hora, which was pretty dam fun.![Doing the Hora](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-4.jpg)And they had a super legit smoke and light setup going on the dance floor, with really great music selections going all night.![Dance Floor Lights](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-5.jpg) Sunday was a beautiful and eventful day in the city. We took the bus to the Palace of Fine Arts, and walked to the Marina to watch the Blue Angels.![Blue Angels](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-6.jpg) Afterwards we headed over to the 12th annual Hardly Strictly Blue Grass Festival, which is a completely free music festival in Golden Gate Park with a great story. The founder, Warren Hellman, passed away last year but has endowed the festival with funds to run for at least 15 years after his death. At the festival we listened to a great band called Civil Wars while being occasionally interrupted by the sonic booms of low flying fighter jets. Where else but in SF could you listen to a super chill concert in the park while seeing jets do fly-bys overhead?![Hardly Strictly Blue Grass Festival](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-7.jpg) We finished with a relaxing sunday dinner at Connie and Stephs place, where we watched a new-found favorite show called Secret Garden, a Korean drama with a twist worth watching. Our friend Bryan even came up from SoCal which made the weekend even better.![Bryan Takes a Picture](http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-1.jpg) *It was truly a weekend to remember!*})
PostElement.create(post: p, element: tb, sequence: 2)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/oct6-weekend/oct6-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1)


p = Post.create(title: 'Levitating Sheep',
                space: 'foreground',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 10, 5, 15, 3))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/parallax/parallax-bg.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 1)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/parallax/parallax-fg.png', style: 'tiling')
PostElement.create(post: p, element: s, animation_type: 'scan', animation_direction: 'down', sequence: 2)

tb = TextBox.create(style: 'two-column-text',
                    text:
                    %{One of my recent discoveries while styling out my site is that CSS3 lets us specify multiple background images and they get stacked on top of each other, kinda like photoshop layers. I wrote a quick script that pans my background images in order to create a simple parallax effect. To test this, I thought it would be cool to take a simple sheep, and make her levitate (or fall depending on which way you're scrolling...). ![A Poor Sheep](http://dl.dropbox.com/u/4893047/posts/parallax/sheep.jpg)

The basic premise is, as a user is scrolling through a post, a background image will also scroll from top to bottom within the post's background. I thought this looked pretty cool as a first run with only one background image, but then I had the idea to add an additional background image layer so that I can use 2 layers of scrolling backgrounds. If the top layer's image has a greater height, then it will scroll faster than the bottom layer's image, which esentially creates a simple parallax effect. That's the effect that I used to get these levitating sheep, with some being farther away and some being closer. Heres the simplified css:

```css
background-image: url(big-falling-sheep.png), url(small-falling-sheep.png);
background-position: 50% 0%;
```

To get it to work, I just simply adjust the background-position from "50% 0%" to "50% 100%" using javascript as the user scrolls along the page.})

PostElement.create(post: p, element: tb, sequence: 3)

p = Post.create(title: 'Iceland, Germany, and Amsterdam',
                space: 'background',
                padding: 'medium',
                published: true,
                site: s1,
                date_published: DateTime.new(2012, 7, 15, 14, 43))

s = Sprite.create(style: 'image',
                  url: 'http://dl.dropbox.com/u/4893047/posts/eu/eu-bg.jpg')

PostElement.create(post_id: p.id,
                   element: s,
                   position: 'v-center;h-center',
                   animation_type: 'fixed',
                   sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{I just wanted to post some pictures that Bryan took with his Diana on our 10 day trip through Europe. This was really the first time that I've had a chance to travel abroad with some of my best friends, and it was an amazing experience.  Ill let the pictures speak for themselves.})

PostElement.create(post_id: p.id,
                   element: tb,
                   position: 'inline',
                   sequence: 2)

a = Album.create(style: 'thumbnail-rows')

(1..28).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/eu/eu-#{i}.jpg"), sequence: i) }

PostElement.create(post_id: p.id,
                   element: a,
                   position: 'inline',
                   sequence: 3)


p = Post.create(title: 'Norway',
                published: true,
                site: s1,
                padding: 'medium',
                space: 'midground',
                date_published: DateTime.new(2012, 9, 24, 14, 43))

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/norway/norway-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1)

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{Norway was, plain and simply put, the most beautiful country that I have ever been to. Drive even 10 minutes out of Oslo, the capital, and you're surrounded in all directions by miles of green trees, open farms, glacier capped mountains, and fjords and lakes streaming with waterfalls and rivers abound. We were constantly surrounded by breathtaking sight after breathtaking sight as we drove through a barren plateau, ferried through grand fjords, hiked to the foot of a glacier, snaked our way though mountainous tunnels, ducked under a massive waterfall, and weaved through millions upon millions of yellow and green birch trees. Norwegians were exceptionally friendly, progressive, laid back, and helpful, and the food was great with fresh fish for nearly every meal, and gourmet meals of rain deer and moose meat. The only complaint was how expensive it is there (about $12 for a beer), but I guess every great thing has it's price, and Norway was well worth every penny.})

PostElement.create(post: p, element: tb, sequence: 2)

a = Album.create(style: 'thumbnail-rows')
(1..17).each { |i| a.album_elements.create(element: Photo.create(url: "http://dl.dropbox.com/u/4893047/posts/norway/norway-#{i}.jpg"), sequence: i )}

PostElement.create(post: p, element: a, sequence: 3)


p = Post.create(title: 'The Tac Cup',
                published: true,
                site: s1,
                padding: 'medium',
                space: 'midground',
                date_published: DateTime.new(2012, 10, 4, 14, 43))

tb = TextBox.create(style: 'full-margins',
                    text:
                    %{So recently Steven decided to start officially keeping track of our beer pong records and to set up a ladder ranking system to finally figure out who's the best of the best. We are using the Elo Ranking system, which is the system that is used for chess rankings as well as a whole bunch of different ladder systems (we used it on Wasteland Empires for our leaderboard). We also got a trophy that works kinda like a championship belt. Whoever is at the top of the ladder gets to hold onto it, and it will change hands as the top ranked player gets dethroned from season to season. We decided to call it the "Canuto Tacderan Cup" after our landlord, Tac, because we've played the majority of beer pong games in this apartment and the apartment downstairs. And why the pig you ask? Well, I'd like to answer your question with another question… why not?<br /><br />
Week 1 Results:

1. Eiki: 1246.3987116397748
2. Steven: 1243.8842794401128
3. Bert: 1235.1158369251668
4. Charles: 1231.3171983847715
5. Tony: 1222.8737570589594
6. Laurie: 1208.82164970538
7. Jenny: 1208.0354660629528
8. Steven's Left hand: 1206.1899734444848
9. Jason: 1204.7400846680832
10. Gloria: 1199.4454061091308
11. James: 1197.1143539352672
12. Lijen: 1196.7430199001321
13. Young: 1193.0281911373372
14. Janet: 1191.7178337812875
15. Steph: 1186.1870239613854
16. Bryan: 1184.2294898937203
17. CarolineKu: 1179.0680874597494
18. KevinLu: 1177.526129843166
19. Jeremy: 1173.3913168957872
20. KevinHuey: 1171.930483353671
21. amy: 1171.3777459196115
22. Norman: 1170.863960480068
23. Total Number of Games Recorded: 35
})
PostElement.create(post: p, element: tb, sequence: 2)

s = Sprite.create(url: 'http://dl.dropbox.com/u/4893047/posts/tac/tac-bg.jpg', style: 'image')
PostElement.create(post: p, element: s, sequence: 1)

a = Album.create(style: 'thumbnail-rows')
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/tac/tac-1.jpg'), sequence: 1)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/tac/tac-2.jpg'), sequence: 3)
a.album_elements.create(element: Photo.create(url: 'http://dl.dropbox.com/u/4893047/posts/tac/tac-3.jpg'), sequence: 2)
PostElement.create(post: p, element: a, sequence: 3)

p = Post.create(title: 'History and Introduction to Positive Psychology',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 7, 11, 14, 43))

tb = TextBox.create(style: 'full-margins',
                    text:
            %{
The first 3 lectures are to get a sense of what the class is about to see if it's something for you. It might not be for everybody.  This class is "applied" and "strength" psychology (aka "positive" psychology).

### I. History of Positive Psychology
Positive psychology took the world on in a storm, and many classes became offered very recently.  Humanistic psychology, which is a group of psychologists like Abraham Maslow, Rolo May, Carl Rogers, started it in the 50s.  They were considered the 3rd force of psychology, the 1st was behavioralism and the 2nd was psychoanalysis.

So what is behaviorism?  It's view is like we are a box, you put in a stimulus and you get out a response; similar to machines.  It was also a reaction to psychoanalysis, which focused on neurosis and our instincts.  Humanistic psychology is saying that we are more than just boxes; we are more than just boxes and stimuli, instincts and neurosis... We have the potential for greatness, "we" being everyone.  It was a fresh voice for psychology and it attracted a lot of attention.

The problem is that it didn't have the rigorous methodology of traditional psychology.  It evolved in the 60's, 70's, and 80's into the self-help movement.  It didn't have the scientific or empirical rigor to hold and gain traction.  It had impact in bookstores, but not in universities and academia.

Then came positive psychology

Positive psychology said "we'll take the approach of humanistic psychology and put rigor into it".  Humanistic psych is like the grandparent of Positive psychology.

Meet the grandparents:

- Abraham Maslow - In 1954 he published his seminal work with chapter called "Toward Positive Psychology"; he was way ahead of his time. He talked about psychology of kindness and optimism, of success and focusing on the positive instead of the negative.  He came from behavioral school of psychology.
- Karen Horney - She came from psychoanalysis (student of Frued), but thought it focused too much on the negative instead of the positive.

Meet the parents:

- Martin Seligman - He did a lot of work on learnt helplessness and learnt optimism.  1996 he became the APA president and his agenda was to make psychology more applied and to champion positive psychology.  He unified the field of positive psychology
- Ellen Langer - Professor at Harvard.  She did some of the most important studies in the field.  She took ideas from humanistic psychology like mindfulness and brought empirical rigor to them
- Philip Stone - In 1999, he taught the first positive psychology class in Harvard.  He is the reason that Tal is teaching today.

### II. What is Positive Psychology and this class?
This class isn't about information, research studies, etc.  It's about transformation.

It's not just about putting information into our minds (which it will do as well), but it's about changing the way we see the world and changing the shape of our minds.

For example, if you're in a swim meet and have a disappointing result, you can interpret it as "i suck", "im not good", and be depressed about it.  Or another way to respond is to think to yourself, "ok, this sucks, but what can I learn from it?".  **Learn to fail, or fail to learn**.  In other words, it's the same information (you lost the swim meet), but different interpretations by the mind.

There are people that seem to have everything; they are prominent, successful, and wealthy, but they're unhappy.  And on the other hand, you have people who barely have the minimum but they are always upbeat and happy.  What goes in isn't always what determines happiness. The way we look at the world is more that 50% of the equation of happiness.

In 1999 they showed that the structure of our brain changes until the day that we die.  Before, they thought it only changed 'till we were at younger ages.  One way is through meditation; it actually changes the neural pathways of the brain if we persist and do it over time.  We know this cause we have MRIs. In this example, "transformation" is meant also in a literal way.

Michelangelo was onced asked "how did you create David?". He said, "I went to the quarry, saw this huge piece of marble, and I saw David.  All I needed to do was chip away the excess stone".  You're going to learn very few new things in this class, but what you will learn is how to chip away the excess stone.  The potential is already in you, but has been limited by false beliefs, education, and other limitations.  We will chip away those limitations.

"The soul grows by subtraction, not addition" - Henry David Thoreau

"In pursuit of knowledge, every day something is acquired; in pursuit of wisdom, everyday something is dropped" - Lao Tzu

>Humanistic philosophy [offers] a new conception of learning, of teaching, and of education.  Stated simply, such a concept holds that the function of education, the goal of education—the human goal, the humanistic goal, the goal so far as human beings are concerned—is ultimately the ‘self-actualization' of a person, the becoming fully human, the development of the fullest height that the human species can stand up to or that the particular individual can come to.  In a less technical way, it is helping the person to become the best that he is able to become. - Abraham Maslow

It sounds naive and optimistic, but we'll also talk about those concepts in this course.

It is not about providing definitive answers concerning the good life. It is about identifying the right questions.  There isn't any "right" way to do it, you can only learn how to always ask the right questions.  Education is a quest, the best way to get through it is to ask the right questions.

As children was ask questions, we're always looking forward.  We lose that as we get older...

"The one real object of education is to leave a man in the condition of continually asking questions." - Bishop Creighton

The 1974 HBS class was followed and studied. 20 years after graduation, everyone from that class was successful, but some were even more successful than others. What was unique about them?  (1) They were driven and they believed they could do well and (2) they were always asking questions.

So what is the biggest question?  "How can we help ourselves and others - individuals, communities, and societies - become happier?".  Note that it's "happier" and not "happy".  Happiness is not binary and you can't measure it in an objective measure.  You can't gauge that, but you can gauge if you've become happier over time compared to your previous self.

The focus of this class will be Western Psychology.  Eastern psychology has been doing it for thousands of years, and it will be brought in, such as meditation and mindfulness, but this, although eclectic, is not cross-cultural.

We will be studying ourselves and others, which is a great way to learn.  It takes a different type of effort because you will be forced to be introspective, and change is hard.  We want you to change habits; to chip away that excess stone.  We will delve into learning how to change habits and chip away at the bad ones.

this course = rigor (academia) + fun/accessibility (self-help movement)

Topics for lectures will include: science of positive thinking, question of focus, external vs internal, how to change perspective and interpretations, can we change? yes we can change, the mind body connection, importance of sleep, perfectionism, humor, relationships})

PostElement.create(post: p, element: tb)


p = Post.create(title: 'Why is Positive Psychology So Important?',
                published: true,
                site: s1,
                padding: 'medium',
                date_published: DateTime.new(2012, 7, 24, 14, 43))

tb = TextBox.create(style: 'full-margins',
                    text:
            %{This past week the Tal was really sick and was sent to the ER.  In the process he asked himself "what do I want to do with my life".  Spend time with family, but more specifically, professionally?  What does he want to get out of this year?  He wants to leave a coherent document for others to understand his view of PP. Ultimately the reason he went to the ER was a false alarm.

So why is PP so important? Why did the grandparents and parents of positive psychology think this had to be it's own community of psychology instead of as part of the whole?

In 1967-2000, there was a ratio of 21:1 when Martin Seligman looked at negative vs positive keywords in psycology (ie: anger/anxiety/depression vs joy/happiness/life satisfaction).  Basically, theres been a ton of research on negative, violence, anger, and evil and very little on virtue, goodness, etc.

>"The aim of PP is to catalyze a change in psych from a preoccuopation only with repairing the worst things in life to also building the best qualities in life" - Martin Seligman

The research reflects the reality.  People are generally more depressed today than they were before. Some of the causes include easy access to information and the internet.  According to a recent article in The Harvard Crimson, 80% of students were depressed at least once last year. In a study of 13,500 stundents nation-wide, nearly 45% were depressed to the point of not being able to function, 94% were severely stressed.  So why use PP to address this?

1. [Psychology shouldn't react to the status quo, it should instead create a separate reality](#p-lec-2-1)
2. [Happiness is not the negation of unhappiness, we need to do more](#p-lec-2-2)
3. [Prevention through cultivating the positive](#p-lec-2-3)

### <a name="p-lec-2-1"></a>1. Psychology shouldn't react to the status quo, it should instead create a separate reality
Psychology today is creating a spiral of negative experience.  The existance of negative experiences also has the side effect of  making people want to research them more.  This negative research is also re-enforcing more negative experiences, creating more depression and anxiety.  It becomes a self fullfilling prophecy.  PP needs to break this cycle and reverse it. Positive research leads to positive experiences, which leads to more positive research.

The Heisenberg Principle - you cannot research something without affecting it

### <a name="p-lec-2-2"></a>2. Happiness is not the negation of unhappiness, we need to do more
Happiness is not the negation of unhappiness.  You can't just get rid of negativity, neurosis, psychosis, etc, and then people will just be happy.  Just like you can't just get rid of indigestion to enjoy soup

"Most men lead a life of quiet desperation" - Thoreau

PP strives to take the next step, current psychology tries to get from negative to zero, PP will take us from zero to positive

2 models of psychology:

* Disease model (Conventional Psych) - focuses on "what am I bad at" (not "what am i good at?"), overcoming deficiencies, avoiding pain, running from unhappiness, neutral state (0) as ceiling
* Health model (PP) - focuses on strengths, building competencies, seeking pleasure, pursuing happiness

### 3. <a name="p-lec-2-3"></a>Prevention through cultivating the positive
PP can even prevent us from going negative by cultivating things like virtue, self esteem, levels of happiness, so that we will be better ready to deal with anxiety and depression when we experience it because we've cultivated the correct trait's.

In PP illness is the absence of health, in traditional psych health is the absence of illness. PP is saying, if we take away of our striving toward self actualization and toward happiness, thats when we become unhappy.  We need to strive toward happiness to not be unhappy.  Maslow says that neurosis is the failure of personal growth. We go to the negative because we havent cultivated the positive enough.

PP strengthens our immune system.  People who practice PP still experience anxiety and depression, you can't avoid it.  It's natural, it's human nature to go through these ups and downs. A strong immune system means you get sick less often and you recover quicker. PP strengthens our emotional and physical immune systems.

A recent Crimson newspaper article says that we need more resources at Harvard to deal with student mental health. But it's not enough. Why not a center at Harvard to help people find their passions and personal strengths - a happiness center? This is the aim of PP.

In past case studies answering the question of why do so many people fail? Poverty, lack of resources, broken families, child abuse, poor education have been the answers.

In 1979 (long before PP) there was a book by Antonofski that said we shouldn't just look at the negative, we have to ask different questions. The question became, "what makes some individuals succeed in spite of all of these circumstances?". This question alone changed the entire framing of the problem, and yields different answers.  This question spawned future follow up questions about "resilience".

Initially they said that these kids must've been superkids, genetically or something about them made them more resilient and better than the rest.  As more research came out, they realized that these were just normal kids; there was nothing exceptional about them. They had some or all of these trait's:

1. Social support - they seeked this on a bad day, talked about bad and good things.  Women are better at this than men (men generally benefit from marriage more than women do because they gain more social support).  It's important to seek social support from the right person, be selective.
2. Cultivating optimism and self-esteem
3. Faith and a sense of meaning - for a lot of kids and older people, it's a religious faith, but it doesnt have to be. Just a sense of meaning or something that you wanna do with your life, purpose
4. Prosocial behavior/benevolence - helping others helps ourselves, moves us from helplessness to helpfulness
5. Focusing on strengths
6. Set goals

All of this was because of the framing of the different research question in terms of "Why do people succeed" instead of "why do people fail". A lot of these people had a role model who they emulated, parent, athlete, hero, etc.

Tal's role model is Marva Collins.  She was born in Alabama, in a place of great African American descrimination (she was African American). Her father sent her to what was then the glass ceiling for someone in her position, secretary school.  She went there, but then said, "I want more with my life"; she wanted to become a teacher. She went to night classes and got her teachers certification.  She got married and moved to Chicago, this was back in the 60s.  She joined the inner city public school system where there was lots of crime, drugs, and hopelessness.  Teachers just hoped that students would finish school and that would help to keep them off the streets, away from gangs, prostitues, and drug pushers. Marva Collins tried to change things. She started in 1st and 2nd grade, and then later beyond.  The first thing she said was "we are going to do a lot of believing in ourselves", and she repeated this message over and over again to her kids. She told them, "it's up to you to succeed, stop blaming other people, and you can succeed". These students excelled and were doing amazing things by the time they were in 4th grade. False, negative rumors started surfacing about her teaching style, so she left public schooling system and created a school in her own home.  She started with 4 students, 2 of which were her own children.  More students came in, mostly failures from the public school system. She eventually ran out of space in her home and moved to a shack in inner city chicago.  Miracles kept coming; all of her students made it to high school, and then all of them made it to college. Marva Collins wasnt wealthy by any means, so she also had to fight poverty, but at the same time she wouldnt turn any student away.  She succeeded somehow, driven by passion. In 1980 someone heard about Marva Collins and she went on 60 minutes. Over night she became famous. In Jan 1981, President Regan offers her to be the secretary of education, she turns him down because she loves to teach too much. In Jan 1989 President Bush Sr makes the same offer, she turns him down for the same reason. In 1995 a wealthy american donates $100M to her school and now there are Marva Collins schools all around the world. Her students today are extremely successful.  People come from all over the world and study what she does, and she will come up in many future lectures because she inspired a large part of this class.

So what is the message of Marva Collins to her students? It's basic. She provides them with role models. They study biographies of great people. She provides them optimism and faith in themselves, but tells them to not ignore difficult situations.  She shifts them from blaming others to taking responsibility of their own lives. Rather than focusing on weaknesses, she focuses on their strengths.  She accentuates their strengths.

Going back to the question, "why are these kids failing?", vs "why do some kids succeed?", the first depicts people as victims of their circumstance.  The Marva Collins question (PP question), puts them as active agents.  The question we ask influences reality and the actions that we take. The difference between these two questions is one is from the perspective of a Passive Victim (ie: something is making these kids fail, but what is it?) to the perspective of an Active Agent (ie: what is it about these kids that makes them succeed?).

As an example, in a rough relationship break up, a passive victim will very quickly go to blame (it's because of A.. B.. C..) when something bad happens. Then they will go to frustration, and ultimately anger. The active agent will take responsibility and the initiative to fix the situation (to meet more women, etc.). The active agent has a stronger immune system.

Passive Victim

- self pity
- blame
- frustration
- anger

Active Agent

- confidence
- responsibility
- hope & optimism
- forgive/forget

>The message of the positive psychology movement is to remind our field that it has been deformed. Psych is not just the study of disease, weakness, and damage.  It also is the study of strength and virtue.  Treatment is not just fixing what is wrong, it also is building what is right. Psychology is not just about illness or health, it is about work, education, insight, love, growth, and play. And in this quest for what is best, PP does not rely on wishful thinking, self-deception or hand-waving. Instead it tries to adapt what is best in the scientific method to the unique problems that human behavior presents in all it's complexity. - Martin Seligman})

PostElement.create(post: p, element: tb)
