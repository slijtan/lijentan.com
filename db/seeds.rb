# -*- coding: utf-8 -*-
Post.delete_all

p = Post.create(title: 'Summatime in the SFC',
	    body:
	    %{Cheers to a fun and eventful weekend in SF! Friday was Steven's 30th birthday and we got to try out our new beer pong ladder system and web interface for the 1st time with everyone there. Credit to Steven and Tony for setting everything up and creating the website.<img src="/assets/posts/oct6-weekend/oct6-2.jpg" /> Saturday was our good friends Michelle and Adam's wedding - It was amazing!<img src="/assets/posts/oct6-weekend/oct6-3.jpg" /> It was the most multi-cultural wedding that I've been to with Chinese, Jewish, Danish, and Turkish influences. We got to take part in the Jewish chair lifting tradition called the Hora, which was pretty dam fun.<img src="/assets/posts/oct6-weekend/oct6-4.jpg" />And they had a super legit smoke and light setup going on the dance floor, with really great music selections going all night.<img src="/assets/posts/oct6-weekend/oct6-5.jpg" /> Sunday was a beautiful and eventful day in the city. We took the bus to the Palace of Fine Arts, and walked to the Marina to watch the Blue Angels.<img src="/assets/posts/oct6-weekend/oct6-6.jpg" /> Afterwards we headed over to the 12th annual Hardly Strictly Blue Grass Festival, which is a completely free music festival in Golden Gate Park with a great story. The founder named Warren Hellman passed away last year but has endowed the festival with funds to run for at least 15 years after his death. At the festival we listened to a great band called Civil Wars while being occasionally interrupted by the sonic booms of low flying fighter jets. Where else but in SF could you listen to a beautiful concert in the park while seeing jets do flybys overhead?<img src="/assets/posts/oct6-weekend/oct6-7.jpg" /> We finished with a super chill sunday dinner at Connie and Stephs place, where we watched a new-found favorite show called Secret Garden, a Korean drama with a twist worth watching. Our friend Bryan even came up from social which made the weekend even better.<img src="/assets/posts/oct6-weekend/oct6-1.jpg" /> <b>It was truly a weekend to remember!</b>},
	    background_url: 'posts/oct6-weekend/oct6-bg.jpg',
	    space: 'background',
	    published: true,
	    type: 'two-column-text',
	    date_published: DateTime.new(2012, 10, 7, 15, 3))


p = Post.create(title: 'Levitating Sheep - Multiple Backgrounds for Simple Parallax Effect',
	    body:
	    %{One of my recent discoveries while styling out my site is that CSS3 lets us specify multiple background images and they get stacked on top of each other, kinda like photoshop layers. I wrote a quick script that pans my background images in order to create a simple parallax effect. To test this, I thought it would be cool to take a simple sheep, and make her levitate (or fall depending on which way you're scrolling...). <img src="/assets/posts/parallax/sheep.jpg" /> The basic premise is, as a user is scrolling through a post, a background image will also scroll from top to bottom within the post's background. I thought this looked pretty cool as a first run with only one background image, but then I had the idea to add an additional background image layer so that I can use 2 layers of scrolling backgrounds. If the top layer's image has a greater height, then it will scroll faster than the bottom layer's image, which esentially creates a simple parallax effect. That's the effect that I used to get these levitating sheep, with some being farther away and some being closer. Heres the simplified css: <code>background-image: url(big-falling-sheep.png), url(small-falling-sheep.png);<br />background-position: 50% 0%;</code> To get it to work, I just simply adjust the background-position from 50% 0% to 50% 100% using javascript as the user scrolls along the page.},
	    background_url: 'posts/parallax/parallax-bg.png',
	    foreground_url: 'posts/parallax/parallax-fg.png',
	    shifting_background: true,
	    space: 'foreground',
	    published: true,
	    type: 'two-column-text',
	    date_published: DateTime.new(2012, 10, 5, 15, 3))


p = Post.create(title: 'Object In Nature - Session 1',
	    body:
	    %{So, after over 4 years of not painting, I decided to sign up for a studio painting class with Larry Robinson (http://www.larryrobinson.net/). Larry's a super nice and really great teacher, I took a Fundamentals of Painting class with him several years ago at Berkeley Extension and loved it. Its a little weird painting again, and I forget most of the steps and fundamentals, but I'm slowly getting the hang of it again. Our first project is to paint an object in nature, so I dug out a photo that I took last week of my friend Audrey biking next to a Fjord in Norway. I switched the composition a little bit by pulling her closer into the foreground, and cropping off the right side and removing some houses, which you'll see in the next post. I'm going to post the evolution of the painting from week to week, stay tuned.},
	    background_url: 'http://stuffpoint.com/gamesrocks/image/13260-gamesrocks-superman.jpg',
	    shifting_background: false,
	    published: true,
	    space: 'midground',
	    type: 'series',
	    date_published: DateTime.new(2012, 9, 25, 14, 43))

Image.create(url: 'posts/painting/painting-1.png',
	     post_id: p.id)

p = Post.create(title: 'Object In Nature - Session 2',
	    body:
	    %{After doing the initial grey wash and sketching out the composition of the painting using vine charcoal, the first main step of the painting process is to use a technique called ROR. It stands for (R)unny (O) (R)andom. The idea is to randomly fill in the space with very diluted paints so that you get a very runny surface. Its very initial, and we will end up painting over the initial layer several times over, but this first layer is just to get us started.},
	    space: 'auto',
	    published: true,
	    type: 'series',
	    date_published: DateTime.new(2012, 10, 2, 14, 43))

Image.create(url: 'posts/painting/painting-2.jpg',
	     post_id: p.id)

p = Post.create(title: 'Object In Nature - Session 3',
	    body:
	    %{The next layer we start using thicker paint with warm and cool colors to help define the space. You'll notice that I tried using warmer colors such as red, orange, and yellow for objects that I want to pull closer to the foreground, such as the biker, and cooler color such as blues and greens for objects that I want to push back. Black and white also help with giving objects texture and depth, where black pushes an object back and white pulls it forward. You can notice that I tried using white at the front edge of the roof of the house and black on the right edge of the bikers vest and helmet to give both of those objects some extra depth. Still got a ton of work to do, I forgot how long and tedious painting is!},
	    background_url: 'posts/painting/painting-3.jpg',
	    shifting_background: true,
	    space: 'midground',
	    published: true,
	    type: 'series',
	    date_published: DateTime.new(2012, 10, 5, 14, 43))

Image.create(url: 'posts/painting/painting-3.jpg',
	     post_id: p.id)

p = Post.create(title: 'Iceland, Germany, and Amsterdam',
	    body:
	    %{I just wanted to post some pictures that Bryan took with his Diana on our 10 day trip through Europe. This was really the first time that I've had a chance to travel abroad with some of my best friends, and it was an amazing experience.  Ill let the pictures speak for themselves.},
	    background_url: 'posts/eu/eu-bg.jpg',
	    shifting_background: false,
	    space: 'background',
	    published: true,
	    type: 'album',
	    date_published: DateTime.new(2012, 7, 15, 14, 43))

(1..28).each { |num| Image.create(url: "posts/eu/eu-#{num}.jpg", post_id: p.id) }

Post.create(title: 'Norway',
	    body:
	    %{Norway was, plain and simply put, the most beautiful country that I have ever been to. Drive even 10 minutes out of Oslo, the capital, and you're surrounded in all directions by miles of green trees, open farms, glacier capped mountains, and fjords and lakes streaming with waterfalls and rivers abound. We were constantly surrounded by breathtaking sight after breathtaking sight as we drove through a barren plateau, ferried through grand fjords, hiked to the foot of a glacier, snaked our way though mountainous tunnels, ducked under a massive waterfall, and weaved through millions upon millions of yellow and green birch trees. Norwegians were exceptionally friendly, progressive, laid back, and helpful, and the food was great with fresh fish for nearly every meal, and gourmet meals of rain deer and moose meat. The only complaint was how expensive it is there (about $12 for a beer), but I guess every great thing has its price, and Norway was well worth every penny.},
	    published: true,
	    space: 'midground',
	    type: 'album',
	    date_published: DateTime.new(2012, 9, 24, 14, 43))


p = Post.create(title: 'The Tac Cup',
	    body:
	    %{So recently Steven decided to start officially keeping track of our beer pong records and to set up a ladder ranking system to finally figure out who's the best of the best. We are using the Elo Ranking system, which is the system that is used for chess rankings as well as a whole bunch of different ladder systems (we used it on Wasteland Empires for our leaderboard). We also got a trophy that works kinda like a championship belt. Whoever is at the top of the ladder gets to hold onto it, and it will change hands as the top ranked player gets dethroned from season to season. We decided to call it the "Canuto Tacderan Cup" after our landlord, Tac, because we've played the majority of beer pong games in this apartment and the apartment downstairs. And why the pig you ask? Well, I'd like to answer your question with another question… why not?<br /><br />
Week 1 Results:
<ol>
<li>Eiki: 1246.3987116397748</li>
<li>Steven: 1243.8842794401128</li>
<li>Bert: 1235.1158369251668</li>
<li>Charles: 1231.3171983847715</li>
<li>Tony: 1222.8737570589594</li>
<li>Laurie: 1208.82164970538</li>
<li>Jenny: 1208.0354660629528</li>
<li>Steven's Left hand: 1206.1899734444848</li>
<li>Jason: 1204.7400846680832</li>
<li>Gloria: 1199.4454061091308</li>
<li>James: 1197.1143539352672</li>
<li>Lijen: 1196.7430199001321</li>
<li>Young: 1193.0281911373372</li>
<li>Janet: 1191.7178337812875</li>
<li>Steph: 1186.1870239613854</li>
<li>Bryan: 1184.2294898937203</li>
<li>CarolineKu: 1179.0680874597494</li>
<li>KevinLu: 1177.526129843166</li>
<li>Jeremy: 1173.3913168957872</li>
<li>KevinHuey: 1171.930483353671</li>
<li>amy: 1171.3777459196115</li>
<li>Norman: 1170.863960480068</li>
<li>Total Number of Games Recorded: 35</li>
</ol>},
	    background_url: 'posts/tac/tac-bg.jpg',
	    shifting_background: true,
	    published: true,
	    space: 'midground',
	    type: 'photos',
	    date_published: DateTime.new(2012, 10, 4, 14, 43))

Image.create(url: 'posts/tac/tac-1.jpg',
	     post_id: p.id)

Image.create(url: 'posts/tac/tac-2.jpg',
	     post_id: p.id)

Image.create(url: 'posts/tac/tac-3.jpg',
	     post_id: p.id)

Post.create(title: 'Harvard Psychology 1504 - History and Introduction to Positive Psychology',
	    body:
	    %{The first 3 lectures are to get a sense of what the class is about to see if its something for you, might not be for everybody.  This class is “applied” and “strength” psychology (aka “positive” psychology).

I. History of Positive Psychology
Positive psychology took the world on in a storm, and many classes became offered very recently.  Humanistic psychology, which is a group of psychologists like Abraham Maslow, Rolo May, Carl Rogers, started it in the 50s.  They were considered the 3rd force of psychology, the 1st was behavioralism and the 2nd was psychoanalysis.

So what is behaviorism?  Its view is like we are a box, you put in a stimulus and you get out a response.  Similar to machines.  It was also a reaction to psychoanalysis, which focused on neurosis and our instincts.  Humanistic psych is saying that we are more than just boxes, we are more than just boxes and stimuli, instincts and neurosis... we have the potential for greatness, “we” being everyone.  It was a fresh voice for psychology and it attracted a lot of attention.

The problem is that it didnt have the rigorous methodology of traditional psychology.  It evolved in the 60s, 70s, and 80s into the self help movement.  It didnt have the scientific or empirical rigor to hold and gain traction...  It had impact in bookstores, but not in universities and academia.

Then came positive psych.

Positive psych said we’ll take the approach of humanistic psychology and put rigor into it.  Humanistic psych is like the grandparent of Positive psych.

Meet the grandparents:

Abraham Maslow - 1954 published seminal work with chapter called “toward positive psychology”, way ahead of his time. Talked about psychology of kindness and optimism, of success and focusing on the positive instead of the negative.  Came from behavioral school of psych

Karen Horney - Came from psychoanalysis (student of Frued), but thought it focused too much on the negative instead of the positive

Meet the parents:

Martin Seligman - Work on learnt helplessness and learnt optimism.  1996 APA president, agenda was to make psych more applied and to champion positive psych.  He unified the field of pos psych

Ellen Langer - Prof. at Harvard.  Did some of the most important studies in the field.  Took ideas from humanistic psychology like mindfulness and brought empirical rigor to it

Philip Stone - 1999 taught the first pos psych class in Harvard.  The reason that Prof. Shahar is teaching today

II. What is Positive Psychology and this class?
This class isnt about information, research studies, etc.  Its about transformation.

Its not just about putting information into our minds (which it will do as well), but its about changing the way we see the world and changing the shape of our minds.

For example, if you’re in a swim meet and have a disappointing result, you can interpret it as “i suck”, “im not good”, depressed about it.  Or another way is, “ok, this sucks, but what can I learn from it?”.  Learn to fail, or fail to learn.  In other words, its the same information (you lost the swim meet), but different interpretations by the mind.

There are people that seem to have everything, prominent, successful, wealthy, but they’re unhappy.  And you have people who barely have the minimum, but they are always upbeat and happy.  What goes in isnt always what determines happiness. The way we look at the world is more that 50% of the equation of happiness.

In 1999 they showed that the structure of our brain changes until the day we die.  Before they thought it only changed till we were at younger ages.  One way is through meditation, it actually changes the neural pathways of the brain if we persist and do it over time.  We know this cause we have MRIs.  “Transformation” is meant also in a literal way.

Michelangelo was onced asked “how did you create David?”. He said, “I went to the quarry, saw this huge piece of marble, and I saw David.  All I needed to do was chip away the excess stone”.  Youre going to learn very few new things in this class, but what you will learn is how to chip away the excess stone.  The potential is already in you, but has been limited by false beliefs, education, and other limitations.  We will chip away those limitations.

“The soul grows by subtraction, not addition” - Henry David Thoreau

“In pursuit of knowledge, every day something is acquired; in pursuit of wisdom, everyday something is dropped” - Lao Tzu

“Humanistic philosophy [offers] a new conception of learning, of teaching, and of education.  Stated simply, such a concept holds that the function of education, the goal of education—the human goal, the humanistic goal, the goal so far as human beings are concerned—is ultimately the ‘self-actualization’ of a person, the becoming fully human, the development of the fullest height that the human species can stand up to or that the particular individual can come to.  In a less technical way, it is helping the person to become the best that he is able to become.” - Maslow

Sounds naive and optimistic, but we’ll also talk about those concepts in this course

It is not about providing definitive answers concerning the good life. It is about identifying the right questions.  There isnt any “right” way to do it, you can only learn how to always ask the right questions.  Education is a quest, the best way to get through it is to ask the right questions.

As children was ask questions, were always looking forward.  We lose that as we get older...

“The one real object of education is to leave a man in the condition of continually asking questions.” - Bishop Creighton

1974 HBS class was followed, 20 years later all were successful, some were even more successful, what was unique about them?  (1) They were driven and they believed they could do well (2) They were always asking questions

So what is the biggest question?  “How can we help ourselves and others - individuals, communities, and societies - become happier?”.  Note that its “happier” and not “happy”.  Happy is not binary and you cant measure it in an objective measure.  You cant gauge that, but you can gauge if you’ve become happier over time compared to your previous self.

Focus will be Western Psychology.  Eastern has been doing it for thousands of years, and it will be brought in, such as meditation and mindfulness, but this, although eclectic, is not cross-cultural.

We will be studying ourselves and others, which is a great way to learn.  It takes a different type of effort because you will be forced to be introspective, and change is hard.  We want you to change habits, chip away that excess stone.  We will delve into learning how to change habits and chip away at the bad ones.

this course = rigor (academia) + fun/accessibility (self help movement)

Topics for lectures will include: science of positive thinking, question of focus, external vs internal, how to change perspective and interpretations, can we change? yes we can change, the mind body connection, importance of sleep, perfectionism, humor, relationships},
	    published: true,
	    space: 'auto',
	    type: 'notes',
	    date_published: DateTime.new(2012, 7, 11, 14, 43))


Post.create(title: 'Harvard Psychology 1504 - Why is Positive Psychology So Important?',
	    body:
	    %{This past week the prof was really sick and was sent to the ER.  In the process he asked himself "what do I want to do with my life".  Spend time with family, but more specifically, professionally?  What does he want to get out of this year?  He wants to leave a coherent document for others to understand his view of PP. Ultimately it was a false alarm.

So why is PP so important? Why did the grandparents and parents think this had to be its own community of psychology instead of as part of the whole?

In 1967-2000, ratio of 21/1 when Martin Seligman looked at negative vs positive keywords in psycology (ie: anger/anxiety/depression vs joy/happiness/life satisfaction).  Basically, theres been a ton of research on the negative, violence, anger, and evil and very little on virtue, goodness, etc.

"The aim of PP is to catalyze a change in psych from a preoccuopation only with repairing the worst things in life to also building the best qualities in life" - Martin Seligman

The research reflects the reality.  People are generally more depressed today than they were before. Some of the causes include easy access to information and the internet.  According to a recent article in The Harvard Crimson, 80% of students were depressed at least once last year. In a study of 13500 stundents nation-wide, nearly 45% were depressed to the point of not being able to function, 94% were severely stressed.  So why PP to address this?

1) Psychology shouldnt react to the status quo, it should instead create a separate reality
2) Happiness is not the negation of unhappiness, we need to do more
3) Prevention through cultivating the positive

(1) Psych today are creating a spiral of negative experience.  Neg. experiences make people want to research them.  This neg. research is also reenforcing more neg. experiences, creating more depression and anxiety.  It becomes a self fullfilling prophecy.  PP needs to break this cycle and reverse it. Positive research leads to positive experiences, which leads to more positive research.

Heisenberg principle - you cannot research something without affecting it

(2) Happiness is not the negation of unhappiness.  Cant just get rid of negativity, neurosis, psychosis, etc, and then people will just be happy.  You cant just get rid of indigestion to enjoy soup

"Most men lead a life of quiet desperation" - Thoreau

PP strives to take the next step, current psy tries to get from negative to zero, PP will take us from zero to plus, etc

2 models of psych:
a) Disease model (Conventional Psych) - focuses on "what am I bad at" (not "what am i good at?"), overcoming deficiencies, avoiding pain, running from unhappiness, neutral state (0) as ceiling
b) Health model (PP) - focuses on strengths, building competencies, seeking pleasure, pursuing happiness

(3) PP can even prevent us from going negative by cultivating things like virtue, self esteem, levels of happiness, and Ill be better to deal with anxiety and depression when I get there if I've cultivated the correct traits.

In PP illness is the absence of health, in generaly psy health is the absence of illness. Its saying, if we take away of our striving toward self actualization toward happiness, thats when we become unhappy.  We need to strive toward happiness to not be unhappy.  Maslow says that neurosis is the failure of personal growth. We go to the negative because we havent cultivated the positive enough.

PP strengthens our immune system.  People who practice PP still experience anxiety and depression, you wont avoid it.  Its natural, its human nature to go through these ups and downs. Strong immune system means you get sick less often and you recover quicker. Strengthens our emotional and physical immune system.

The Crimson article says that we need more resources at Harvard to deal with student mental health. But its not enought. Why not a center at Harvard to help people find their passions and personal strengths - a happiness center? This is the aim of PP.

Case study answering the question of why do so many people fail? Poverty, lack of resources, broken families, child abuse, poor education have been the answers.

In 1979 (long before PP) a book by Antonofski that said, we shouldnt just look at the negative, we have to ask different questions. The question became, what makes some individuals succeed in spite of all of these circumstances? This question alone changed the framing of the question, and yields different answers.  This question spawned the question of "resilience".

Initially they said that these kids must've been superkids, genetically or something about them made them more resilient and better.  As more research came out they realized that these were just normal kids, nothing exceptional about them. They had some or all of these traits:

1) Social support - they seeked this on a bad day, talked about bad and good things.  Women are better at this than men (men generally benefit from marriage more than men do).  Its important to seek social support from the right person, be selective.
2) Cultivating optimism and self esteem
3) Faith and a sense of meaning - for a lot of kids and older people, its a religious faith, but it doesnt have to be. Just a sense of meaning or something that you wanna do with your life, purpose
4) Prosocial behavior/benevolence - helping others helps ourselves, moves us from helplessness to helpfulness
5) Focusing on strengths
6) Set goals

All of this was because of the framing of the different research question in terms of "Why do people succeed" instead of "why do people fail". Alot of these people had a role model who they emulated, parent, athlete, hero, etc.

Profs role model is Marva Collins.  She was born in Alabama, in a place of great african american descrimination (she was af. am.). Father sent her to what was then the glass ceiling, secretary school.  She went there, but then said, "I want more with my life"; she wanted to become a teacher. She went to night class and got her teachers certification.  Got married and moved to Chicago, this was back in the 60s.  She joined the inner city public school system, lots of crime, drugs, and hopelessness.  Teachers just hoped that students would finish school that would help to keep them off the streets, away from gangs, prostitues, and drug pushers. Marva Collins tried to change things, started in 1st and 2nd grade, and then later beyond.  First thing she said was "we are going to do a lot of believing in ourselves", she repeated this message over and over again. "its up to you to succeed, stop blaming other people, and you can succeed". These students excelled and were doing amazing things by the time they were in 4th grade. Negative rumors about her teaching style, so she left public schooling and created a school in her own home.  Started with 4 students, 2 of which were her own children.  More students came in, mostly failures from the public school system. Ran out of space in her home, moved to a shack in inner city chicago.  Miracles kept coming, all students made high school, and then all made college. Marva Collins had to fight poverty, she wouldnt turn any students away.  They succeeded somehow, driven by the passion. In 1980 someone heard about it and they were on 60 minutes, over night she became famous. Jan 1981, pres. Regan offers her to be the secretary of education, she turns him down b/c she loves to teach too much. 1989 Jan Bush Sr makes the same offer, she turns him down for the same reason. 1995 wealthy american donates $100M and now there are Marva Collins schools around the world. Her students today are extremely successful.  People come from all over the world and study what she does, and she will come up in many classes because she inspired a large part of this class.

So what is the message of Marva Collins? Its basic. She provides them with role models. They study biographies of great people. She provides them optimism and faith in themselves, not ignore the difficult situation.  Shifts them from blaming others to taking responsibility of their own lives. Rather than focusing on weaknesses, she focuses on their strengths.  She accentuates their strengths.

Going back to the question, "why are these kids failing", vs "why do some kids succeed"? The first depicts people as victims of their circumstance.  The Marva Collins question (PP question), puts them as active agents.  The question we ask influences reality and the actions that we take. Passive Victim vs Active Agent.

In a girlfriend break up. A passive victim will very quickly go to blame (its because of A.. B.. C..) when something bad happens. Then to frustration, and ultimately anger. The active agent will take responsibility and the initiative to fix the situation, to meet more women, etc. They have a stronger immune system.

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

"The message of the positive psychology movement is to remind our field that it has been deformed. Psych is not just the study of disease, weakness, and damage.  It also is the study of strength and virtue.  Treatment is not just fixing what is wrong, it also is building what is right. Psychology is not just about illness or health, it is about work, education, insight, love, growth, and play. And in this quest for what is best, PP does not rely on wishful thinking, self-deception or hand-waving. Instead it tries to adapt what is best in the scientific method to the unique problems that human behavior presents in all its complexity." - Martin Seligman},
	    published: true,
	    space: 'auto',
	    type: 'notes',
	    date_published: DateTime.new(2012, 7, 24, 14, 43))
