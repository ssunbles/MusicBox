//
//  DataManager.swift
//  MusicBox
//
//  Created by Айнур on 26.07.2023.
//

import Foundation
import UIKit

class DataManager {
    static let songs : [Song] = [
        Song(imageName: UIImage(named: "wu-tang"), songName: "C.R.E.A.M", artistName: "Wu-Tang Clan", genreName: "Hip-hop", ratingNumber: 2,
             lyrics: """
    What that nigga want God?
    Word up, look out for the cops (Wu-Tang five finger shit)
    (Cash Rules) Word up, two for fives over here baby
    Word up, two for fives them niggas got garbage down the way, word up
    Know what I'm sayin'?
    (Cash Rules Everything Around Me
    C.R.E.A.M. get)
    Yeah, check this ol' fly shit out
    Word up
    (Cash Rules Everything Around Me) Take you on a natural joint
    (C.R.E.A.M. get the money) Here we here we go
    (Dolla dolla bill y'all) Check this shit, yo!

    I grew up on the crime side, the New York Times side
    Staying alive was no jive
    Had second hands, moms bounced on old men
    So then we moved to Shaolin land
    A young youth, yo rockin' the gold tooth, 'Lo goose
    Only way, I begin to G off was drug loot
    And let's start it like this son, rollin' with this one
    And that one, pullin' out gats for fun
    But it was just a dream for the teen, who was a fiend
    Started smokin' woolas at sixteen
    And running up in gates, and doing hits for high stakes
    Making my way on fire escapes
    No question I would speed, for cracks and weed
    The combination made my eyes bleed
    No question I would flow off, and try to get the dough all
    Sticking up white boys in ball courts
    My life got no better, same damn 'Lo sweater
    Times is ruff and tuff like leather
    Figured out I went the wrong route
    So I got with a sick ass click and went all out
    Catchin' keys from across seas
    Rollin in MPV's, every week we made forty G's
    Yo nigga respect mine, or here go the TEC-9
    Ch-chick-POW! Move from the gate now

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all

    It's been twenty-two long hard years, I'm still strugglin'
    Survival got me buggin', but I'm alive on arrival
    I peep at the shape of the streets
    And stay awake to the ways of the world 'cause shit is deep
    A man with a dream with plans to make C.R.E.A.M.
    Which failed I went to jail at the age of 15
    A young buck sellin' drugs and such who never had much
    Trying to get a clutch at what I could not
    The court played me short, now I face incarceration
    Pacin' going upstate's my destination
    Handcuffed in back of a bus, forty of us
    Life as a shorty shouldn't be so rough
    But as the world turns I learned life is hell
    Living in the world no different from a cell
    Everyday I escape from Jakes givin' chase, sellin' base
    Smokin' bones in the staircase
    Though I don't know why I chose to smoke sess
    I guess that's the time when I'm not depressed
    But I'm still depressed, and I ask what's it worth?
    Ready to give up so I seek the Old Earth
    Who explained working hard may help you maintain
    To learn to overcome the heartaches and pain
    We got stickup kids, corrupt cops, and crack rocks
    And stray shots, all on the block that stays hot
    Leave it up to me while I be living proof
    To kick the truth to the young black youth
    But shorty's running wild smokin' sess drinkin' beer
    And ain't trying to hear what I'm kickin' in his ear
    Neglected, for now, but yo, it gots to be accepted
    That what? That life is hectic

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all

    Cash, Rules, Everything, Around, Me
    C.R.E.A.M.
    Get the money
    Dollar, dollar bill y'all
    """),
        Song(imageName: UIImage(named: "drake"), songName: "Toosie Slide", artistName: "Drake", genreName: "Hip-hop", ratingNumber: 1, lyrics:
            """
    Black leather gloves, no sequins
    Buckles on the jacket, it's Alyx shit
    Nike crossbody, gotta piece it
    Gotta dance but it's really on some street shit
    I'ma show you how to get it

    It go right foot up, left foot slide
    Left foot up, right foot slide
    Basically I'm saying, either way we 'bout to slide, ayy
    Can't let this one slide, ayy

    Don't you want to dance with me?
    Yeah, I can dance like Michael Jackson
    I can give you the whole action
    This girl Thriller on the track, where you from?
    Baby don't you want to dance with me?
    No, I can dance like Michael Jackson
    I can give you satisfaction
    And you know we out here everyday with it
    I'ma show you how to do it

    It go right foot up, left foot slide
    Left foot up, right foot slide
    Basically I'm saying, either way we 'bout to slide, ayy
    Can't let this one slide, ayy

    Two thousand shorties wanna tie the knot, ayy, yeah
    Two hundred shooters on my hood blocked down, ayy yeah
    Had a long froze like I'm loaded now
    I don't know what's wrong with me, I can't stop anything
    Won't stop, yeah, yeah, don't stop, ayy, yeah, yeah


    Got too many people that I love, I can't drop top
    Other than the family, I gotta see what you mean
    That's just how I get to see what you mean
    This lifestyle too deep for you baby
    Two or three of us about to creep with us, yeah, yeah

    Black leather gloves, no sequins
    Buckles on the jacket, it's Alyx shit
    Nike crossbody, you gotta piece it
    Gotta dance but it's really on some street shit
    I'ma show you how to get it

    It go right foot up, left foot slide
    Left foot up, right foot slide
    Basically I'm saying, either way we 'bout to slide, ayy
    Can't let this one slide, ayy

    Tootsie slide, then I hit it double time
    And I hit the swing 'cause a stunna got it both times
    Niggas think they got time but they for the whole time
    The memories are open

    Black leather gloves, no sequins
    Buckles on the jacket, it's Alyx shit
    Nike crossbody, you gotta piece it
    Gotta dance but it's really on some street shit
    I'ma show you how to get it

    It go right foot up, left foot slide
    Left foot up, right foot slide
    Basically I'm saying, either way we 'bout to slide, ayy
    Can't let this one slide, ayy
"""),
        Song(imageName: UIImage(named: "rihanna"), songName: "Work work work", artistName: "Rihanna", genreName: "RnB", ratingNumber: 4, lyrics: """
        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Dry! ...Me a desert him
        Nuh time to have you lurking
        Him ah go act like he nuh like it
        You know I dealt with you the nicest
        Nuh body touch me you nuh righteous
        Nuh badda, text me in a crisis
        I believed all of your dreams, adoration
        You took my heart and my keys and my patience
        You took my heart on my sleeve for decoration
        You mistaken my love I brought for you for foundation
        All that I wanted from you was to give me
        Something that I never had
        Something that you've never seen
        Something that you've never been!
        Mm!
        But I wake up and act like nothing's wrong
        Just get ready fi

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        Ner ner ner ner ner ner!
        When yuh ago learn learn learn learn learn learn!
        Before the tables turn turn turn turn turn turn!

        Beg you something, please
        Baby don't you leave
        Don't leave me stuck here in the streets, uh huh
        If I get another chance to
        I will never, no never neglect you
        I mean who am I to hold your past against you?
        I just hope that it gets to you
        I hope that you see this through
        I hope that you see this true
        What can I say?
        Please recognize I'm trying, babe!!!
        I have to

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Yeah, okay
        You need to get done, done, done, done at work, come over
        We just need to slow the motion
        Don't give that away to no one
        Long distance, I need you
        When I see potential I just gotta see it through
        If you had a twin, I would still choose you
        I don't wanna rush into it, if it's too soon
        But I know you need to get done, done, done, done
        If you come over
        Sorry if I'm way less friendly
        I got niggas tryna end me, oh
        I spilled all my emotions tonight, I'm sorry
        Rolling, rolling, rolling, rolling, rolling
        How many more shots until you're rolling?
        We just need a face to face
        You could pick the time and the place
        You spent some time away
        Now you need to forward and give me all the

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work
        He se me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Mm, mm
        Mm, mm
        Work, work, work, work, work, work
        Mm, mm
"""),
        Song(imageName: UIImage(named: "nirvana"), songName: "Lithium", artistName: "Nirvana", genreName: "Grunge", ratingNumber: 3, lyrics: """
        I'm so happy 'cause today I found my friends
        They're in my head
        I'm so ugly, that's okay, 'cause so are you
        Broke our mirrors
        Sunday morning is everyday, for all I care
        And I'm not scared
        Light my candles in a daze
        'Cause I've found God
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I'm so lonely, that's okay, I shaved my head
        And I'm not sad
        And just maybe I'm to blame for all I've heard
        But I'm not sure
        I'm so excited, I can't wait to meet you there
        And I don't care
        I'm so horny, that's okay
        My will is good
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I'm so happy 'cause today I found my friends
        They're in my head
        I'm so ugly, that's okay, 'cause so are you
        Broke our mirrors
        Sunday morning is everyday, for all I care
        And I'm not scared
        Light my candles in a daze
        'Cause I've found God
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
"""),
        Song(imageName: UIImage(named: "paintItBack"), songName: "Paint It, Black", artistName: "The Rolling Stones", genreName: "psychedelic rock", ratingNumber: 5, lyrics: """
I see a red door and I want it painted black
No colors anymore I want them to turn black
I see the girls walk by dressed in their summer clothes
I have to turn my head until my darkness goes
 
I see a line of cars and they're all painted black
With flowers and my love, both never to come back
I see people turn their heads and quickly look away
Like a newborn baby it just happens everyday
 
I look inside myself and see my heart is black
I see my red door and it has been painted black
Maybe then I'll fade away and not have to face the facts
It's not easy facing up when your whole world is black
 
No more will my green sea go turn a deeper blue
I could not forsee this thing happening to you
If I look hard enough into the setting sun
My love will laugh with me before the morning comes
 
I see a red door and I want it painted black
No colours anymore I want them to turn black
I see the girls walk by dressed in their summer clothes
I have to turn my head until my darkness goes
 
I wanna see it painted, painted black
Black as night, black as coal
I wanna see the sun, blotted out from the sky
I wanna see it painted, painted, painted, painted black
Yeah
"""),
Song(imageName: UIImage(named: "nirvana"), songName: "Lithium", artistName: "Nirvana", genreName: "Grunge", ratingNumber: 3, lyrics: """
                I'm so happy 'cause today I found my friends
                They're in my head
                I'm so ugly, that's okay, 'cause so are you
                Broke our mirrors
                Sunday morning is everyday, for all I care
                And I'm not scared
                Light my candles in a daze
                'Cause I've found God
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah, yeah
                I'm so lonely, that's okay, I shaved my head
                And I'm not sad
                And just maybe I'm to blame for all I've heard
                But I'm not sure
                I'm so excited, I can't wait to meet you there
                And I don't care
                I'm so horny, that's okay
                My will is good
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah, yeah
                I like it, I'm not gonna crack
                I miss you, I'm not gonna crack
                I love you, I'm not gonna crack
                I killed you, I'm not gonna crack
                I like it, I'm not gonna crack
                I miss you, I'm not gonna crack
                I love you, I'm not gonna crack
                I killed you, I'm not gonna crack
                I'm so happy 'cause today I found my friends
                They're in my head
                I'm so ugly, that's okay, 'cause so are you
                Broke our mirrors
                Sunday morning is everyday, for all I care
                And I'm not scared
                Light my candles in a daze
                'Cause I've found God
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah
                Yeah, yeah, yeah
                I like it, I'm not gonna crack
                I miss you, I'm not gonna crack
                I love you, I'm not gonna crack
                I killed you, I'm not gonna crack
                I like it, I'm not gonna crack
                I miss you, I'm not gonna crack
                I love you, I'm not gonna crack
                I killed you, I'm not gonna crack
        """),
                Song(imageName: UIImage(named: "paintItBack"), songName: "Paint It, Black", artistName: "The Rolling Stones", genreName: "psychedelic rock", ratingNumber: 5, lyrics: """
        I see a red door and I want it painted black
        No colors anymore I want them to turn black
        I see the girls walk by dressed in their summer clothes
        I have to turn my head until my darkness goes
         
        I see a line of cars and they're all painted black
        With flowers and my love, both never to come back
        I see people turn their heads and quickly look away
        Like a newborn baby it just happens everyday
         
        I look inside myself and see my heart is black
        I see my red door and it has been painted black
        Maybe then I'll fade away and not have to face the facts
        It's not easy facing up when your whole world is black
         
        No more will my green sea go turn a deeper blue
        I could not forsee this thing happening to you
        If I look hard enough into the setting sun
        My love will laugh with me before the morning comes
         
        I see a red door and I want it painted black
        No colours anymore I want them to turn black
        I see the girls walk by dressed in their summer clothes
        I have to turn my head until my darkness goes
         
        I wanna see it painted, painted black
        Black as night, black as coal
        I wanna see the sun, blotted out from the sky
        I wanna see it painted, painted, painted, painted black
        Yeah
        """),
        Song(imageName: UIImage(named: "rihanna"), songName: "Work work work", artistName: "Rihanna", genreName: "RnB", ratingNumber: 4, lyrics: """
        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Dry! ...Me a desert him
        Nuh time to have you lurking
        Him ah go act like he nuh like it
        You know I dealt with you the nicest
        Nuh body touch me you nuh righteous
        Nuh badda, text me in a crisis
        I believed all of your dreams, adoration
        You took my heart and my keys and my patience
        You took my heart on my sleeve for decoration
        You mistaken my love I brought for you for foundation
        All that I wanted from you was to give me
        Something that I never had
        Something that you've never seen
        Something that you've never been!
        Mm!
        But I wake up and act like nothing's wrong
        Just get ready fi

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        Ner ner ner ner ner ner!
        When yuh ago learn learn learn learn learn learn!
        Before the tables turn turn turn turn turn turn!

        Beg you something, please
        Baby don't you leave
        Don't leave me stuck here in the streets, uh huh
        If I get another chance to
        I will never, no never neglect you
        I mean who am I to hold your past against you?
        I just hope that it gets to you
        I hope that you see this through
        I hope that you see this true
        What can I say?
        Please recognize I'm trying, babe!!!
        I have to

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work!
        He see me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Yeah, okay
        You need to get done, done, done, done at work, come over
        We just need to slow the motion
        Don't give that away to no one
        Long distance, I need you
        When I see potential I just gotta see it through
        If you had a twin, I would still choose you
        I don't wanna rush into it, if it's too soon
        But I know you need to get done, done, done, done
        If you come over
        Sorry if I'm way less friendly
        I got niggas tryna end me, oh
        I spilled all my emotions tonight, I'm sorry
        Rolling, rolling, rolling, rolling, rolling
        How many more shots until you're rolling?
        We just need a face to face
        You could pick the time and the place
        You spent some time away
        Now you need to forward and give me all the

        Work, work, work, work, work, work
        He said me haffi
        Work, work, work, work, work, work
        He se me do mi
        Dirt, dirt, dirt, dirt, dirt, dirt!
        So me put in
        Work, work, work, work, work, work
        When you ah guh
        Learn, learn, learn, learn, learn
        Meh nuh cyar if him
        Hurt, hurt, hurt, hurt, hurting

        Mm, mm
        Mm, mm
        Work, work, work, work, work, work
        Mm, mm
"""),
        Song(imageName: UIImage(named: "nirvana"), songName: "Lithium", artistName: "Nirvana", genreName: "Grunge", ratingNumber: 3, lyrics: """
        I'm so happy 'cause today I found my friends
        They're in my head
        I'm so ugly, that's okay, 'cause so are you
        Broke our mirrors
        Sunday morning is everyday, for all I care
        And I'm not scared
        Light my candles in a daze
        'Cause I've found God
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I'm so lonely, that's okay, I shaved my head
        And I'm not sad
        And just maybe I'm to blame for all I've heard
        But I'm not sure
        I'm so excited, I can't wait to meet you there
        And I don't care
        I'm so horny, that's okay
        My will is good
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I'm so happy 'cause today I found my friends
        They're in my head
        I'm so ugly, that's okay, 'cause so are you
        Broke our mirrors
        Sunday morning is everyday, for all I care
        And I'm not scared
        Light my candles in a daze
        'Cause I've found God
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah
        Yeah, yeah, yeah
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
        I like it, I'm not gonna crack
        I miss you, I'm not gonna crack
        I love you, I'm not gonna crack
        I killed you, I'm not gonna crack
"""),
        Song(imageName: UIImage(named: "paintItBack"), songName: "Paint It, Black", artistName: "The Rolling Stones", genreName: "psychedelic rock", ratingNumber: 5, lyrics: """
I see a red door and I want it painted black
No colors anymore I want them to turn black
I see the girls walk by dressed in their summer clothes
I have to turn my head until my darkness goes
 
I see a line of cars and they're all painted black
With flowers and my love, both never to come back
I see people turn their heads and quickly look away
Like a newborn baby it just happens everyday
 
I look inside myself and see my heart is black
I see my red door and it has been painted black
Maybe then I'll fade away and not have to face the facts
It's not easy facing up when your whole world is black
 
No more will my green sea go turn a deeper blue
I could not forsee this thing happening to you
If I look hard enough into the setting sun
My love will laugh with me before the morning comes
 
I see a red door and I want it painted black
No colours anymore I want them to turn black
I see the girls walk by dressed in their summer clothes
I have to turn my head until my darkness goes
 
I wanna see it painted, painted black
Black as night, black as coal
I wanna see the sun, blotted out from the sky
I wanna see it painted, painted, painted, painted black
Yeah
""")
    ]
}

