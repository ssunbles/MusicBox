//
//  DataManager.swift
//  MusicBox
//
//  Created by Айнур on 26.07.2023.
// new code

import Foundation
import UIKit

class DataManager {
    //MARK: - счетчики айди
    private static var currentSongId = 0
    private static var currentArtistId = 0
    private static var currentAlbumId = 0

    
    //MARK: - Методы для подсчитывания
    static func getNextSongId() -> Int {
        currentSongId += 1
        return currentSongId
    }
    
    static func getNextArtistId() -> Int {
        currentArtistId += 1
        return currentArtistId
    }
    
    static func getNextAlbumId() -> Int {
        currentAlbumId += 1
        return currentAlbumId
    }
    
    //MARK: - создание экземпляров
    static func createArtist(artistName: String?, artistImage: UIImage?, artistDescription: String?, artistAlbums:[Album]) -> Artist {
        let artist = Artist(artistId: getNextArtistId(), artistName: artistName, artistImage: artistImage, artistDescription: artistDescription, artistAlbums: artistAlbums)
        return artist
    }
    
    static func createSong (songImage: UIImage?, songName: String?, songArtist: Artist, songGenre: String?, songRating: Int?, songLyrics: String?) -> Song {
        let song = Song(songId: getNextSongId(), songImage: songImage, songName: songName, songArtist: songArtist, songGenre: songGenre, songRating: songRating, songLyrics: songLyrics)
        return song
    }
    
    static func createAlbum (albumName: String?, albumArtist : Artist, albumSongs : [Song], albumImage : UIImage?) -> Album {
        let album = Album(albumId: getNextAlbumId(), albumName: albumName, albumArtist: albumArtist, albumSongs: albumSongs, albumImage: albumImage)
        return album
    }
    
    
    //MARK: - создание массива
    static let artists : [Artist] = [
        DataManager.createArtist(artistName: "Wu-Tang Clan", artistImage: UIImage( named: "wu-tang-artist"), artistDescription:  """
    Wu-Tang Clan - это легендарная американская хип-хоп группа, известная своим уникальным стилем, текстами с глубоким смыслом и влиянием на культуру. Группа была образована в Нью-Йорке в начале 1990-х годов и стала одной из наиболее влиятельных и признаваемых коллективов в истории хип-хопа.

    Основными участниками Wu-Tang Clan являются RZA, GZA, Method Man, Raekwon, Ghostface Killah, Inspectah Deck, U-God, Masta Killa и Ol' Dirty Bastard (покойный). Группа славится своим уникальным подходом к коллективной и индивидуальной работе, а также использованием псевдонимов и виртуозным мастерством слова.

    Их дебютный альбом "Enter the Wu-Tang (36 Chambers)", выпущенный в 1993 году, считается классикой жанра. Группа также известна своими символами и эмблемами, такими как знак Wu-Tang и разнообразные ассоциации с восточной философией и кино.

    Wu-Tang Clan оказала огромное влияние на развитие хип-хоп музыки, моды и культуры в целом. Их музыка и творчество продолжают вдохновлять поколения хип-хоп исполнителей и поклонников по всему миру.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "Rihanna", artistImage: UIImage( named: "rihanna-artist"), artistDescription:  """
    Рианна (Rihanna), настоящее имя Робин Рианна Фенти (Robyn Rihanna Fenty), является барбадосской певицей, актрисой, дизайнером моды и предпринимателем. Она родилась 20 февраля 1988 года. Рианна стала одной из самых влиятельных и успешных исполнительниц в мировой музыкальной индустрии.

    Свою карьеру она начала в подростковом возрасте, подписав контракт с лейблом Def Jam Recordings. Ее дебютный альбом "Music of the Sun" вышел в 2005 году, а первый сингл "Pon de Replay" стал хитом. Однако настоящий успех пришел к ней с выпуском альбома "Good Girl Gone Bad" в 2007 году, который включал хиты, такие как "Umbrella" и "Don't Stop the Music". С тех пор Рианна выпустила множество успешных альбомов, включая "Loud", "Talk That Talk", "Unapologetic", "Anti" и другие.

    Она также активно занимается актерской деятельностью, снявшись в фильмах, таких как "Боевой ангел" и "Восьмая миля". Кроме того, Рианна является известной дизайнером модной одежды и косметики. Ее бренд Fenty Beauty получил признание за включение широкого спектра тональностей для всех типов кожи.

    Музыкальный стиль Рианны разнообразен и включает в себя элементы попа, R&B, хип-хопа и дэнсхолла. Она не только известна своими музыкальными достижениями, но и является образцом стиля и влияния для молодежи по всему миру.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "Nirvana", artistImage: UIImage( named: "nirvana-artist"), artistDescription:  """
    Нирвана - американская рок-группа, которая существовала в 1987-1994 годах и стала одной из самых влиятельных и значимых групп своего времени. Основатели группы, Курт Кобейн и Крист Новоселич, подарили миру музыку, которая не только изменила облик рок-сцены, но и сформировала целое поколение музыкальных энтузиастов.

    Их альбом "Nevermind", выпущенный в 1991 году, стал настоящим взрывом, подарившим нам хит "Smells Like Teen Spirit". Эта песня не только стала гимном поколения, но и привнесла новый звук и энергию в музыкальную индустрию. Группа продолжила радовать поклонников творчеством, выражая эмоции и рефлексии в своей музыке.

    Характерный стиль "гранжа", характерный для Нирваны, отразил дух времени и стал вдохновением для многих других артистов. И хотя карьера группы была короткой, её влияние ощущается и по сей день. Нирвана продолжает вдохновлять поколения своей музыкой, стоя на стыке мощных риффов и глубоких эмоций.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "Drake", artistImage: UIImage( named: "drake-artist"), artistDescription:  """
    Дрейк (Drake), настоящее имя Аубри Дрейк Грэм (Aubrey Drake Graham), - канадский музыкант, рэпер, певец и продюсер, который сумел завоевать сердца миллионов своей уникальной музыкой и талантом. Родился 24 октября 1986 года, Дрейк стал одним из наиболее успешных и влиятельных артистов в мировой музыкальной индустрии.

    Его музыкальный стиль объединяет элементы хип-хопа, R&B и поп-музыки, что делает его творчество узнаваемым и универсальным. Дрейк прославился своими глубокими текстами, в которых он часто рассказывает о своих личных переживаниях, отношениях и жизненных историях.

    С момента дебютного альбома "Thank Me Later" в 2010 году, Дрейк стал неотъемлемой частью музыкального пейзажа. Его хиты, такие как "Hotline Bling", "One Dance", "In My Feelings" и многие другие, не только занимали верхние строчки чартов, но и становились частью поп-культуры.

    Дрейк также известен своим вкладом в хип-хоп культуру и сотрудничеством с другими артистами. Он неоднократно получал награды и признание, включая премии Grammy.

    Помимо музыки, Дрейк также активно участвует в различных благотворительных и общественных инициативах, подчеркивая важность взаимопомощи и социальной ответственности.

    С его талантом, энергией и постоянным исследованием новых музыкальных направлений, Дрейк продолжает оставаться одним из самых влиятельных и успешных артистов современности.
    """, artistAlbums:[] ),

        DataManager.createArtist(artistName: "The Rolling Stone", artistImage: UIImage( named: "therollingstone-artist"), artistDescription:  """
    The Rolling Stones — британская рок-группа, основанная в 1962 году и до сих пор оставающаяся одной из самых известных и влиятельных коллективов в истории музыки. Группа принесла миру уникальное сочетание рок-н-ролла, блюза, R&B и других стилей, что помогло сформировать звук, ставший символом эпохи.

    Основной состав The Rolling Stones включал Мика Джаггера (вокал, губная гармошка), Кита Ричардса (гитара, вокал), Брайана Джонса (гитара), Чарли Уоттса (ударные) и Билла Ваймана (бас-гитара). Группа продемонстрировала выдающийся талант в создании хитов, включая "Satisfaction", "Paint It Black", "Angie", "Start Me Up" и многие другие.

    The Rolling Stones славились как своими энергичными выступлениями на сцене, так и студийными записями. Группа не только влияла на музыкальные вкусы поколений, но и оказала огромное влияние на моду, культуру и общественное мнение.

    В своей более чем полувековой истории The Rolling Stones выпустили множество успешных альбомов, оставив невероятное наследие в музыкальном мире. Вопреки времени, группа продолжает давать концерты и записывать новую музыку, продолжая вдохновлять и радовать поклонников по всему миру.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "A$AP Rocky", artistImage: UIImage( named: "rocky-artist"), artistDescription:  """
    A$AP Rocky (полное имя - Rakim Athelaston Mayers) - американский рэпер, продюсер и дизайнер моды. Он выделяется не только своим музыкальным талантом, но и оригинальным стилем, визуальным восприятием и влиянием на современную моду и культуру.

    Родился 3 октября 1988 года, A$AP Rocky приобрел известность в начале 2010-х годов. Его дебютный микстейп "Live.Love.A$AP" вызвал интерес благодаря характерному звучанию, включая комбинацию трэпа, хип-хопа и электронных элементов. A$AP Rocky также привнес модные инновации, подчеркнув важность визуального аспекта в музыке.

    Однако настоящий успех пришел к нему с выпуском дебютного альбома "Long. Live. A$AP" в 2013 году. Альбом включал хиты, такие как "Goldie" и "F**kin' Problems". С тех пор он выпустил ряд успешных альбомов, включая "At. Long. Last. A$AP" и "Testing".

    A$AP Rocky также является фигурой модной индустрии, сотрудничая с такими брендами, как Dior и Gucci. Его стиль внешности и одежды оказал сильное влияние на молодежь и модные тенденции.

    Помимо музыки и моды, A$AP Rocky активно участвует в общественных и благотворительных инициативах, подчеркивая важность социальной ответственности. Его творчество продолжает вдохновлять и разнообразить музыкальный и культурный ландшафт.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "Mac Miller", artistImage: UIImage( named: "mac-artist"), artistDescription:  """
    Mac Miller, настоящее имя Малколм Джеймс МакКормик, был американским рэпером, певцом и продюсером, чей талант и творчество оказали значительное влияние на хип-хоп сцену. Его музыка отражает личные переживания, эмоции и жизненные уроки, что сделало его одним из самых уникальных и ценных артистов своего времени.

    Родился 19 января 1992 года, Mac Miller начал свою карьеру в подростковом возрасте, выпустив свои первые микстейпы. Его дебютный студийный альбом "Blue Slide Park" (2011) стал первым независимым релизом, возглавившим чарты США. Однако Мак Миллер нашел настоящее признание исключительно своим творчеством, включая альбомы "Watching Movies with the Sound Off" (2013), "GO: OD AM" (2015) и "The Divine Feminine" (2016).

    Он отличался не только музыкальным талантом, но и способностью писать тексты, отражающие глубокие мысли и чувства. В своих песнях он открыто разговаривал о своих борьбах с депрессией, зависимостью и самопознанием.
    """, artistAlbums:[] ),
        
        DataManager.createArtist(artistName: "XXXTentacion", artistImage: UIImage( named: "xxxtentacion-artist"), artistDescription:  """
    XXXTentacion, настоящее имя Хасе Онфрой Джамейн Рикардо Ледгемен, был американским рэпером, певцом и автором песен, известным своим экспериментальным подходом к музыке и смешением различных жанров. Его музыкальное творчество отражает его эмоции, мысли и личные борьбы, что привлекло большое внимание и поддержку молодых слушателей.

    XXXTentacion родился 23 января 1998 года. Он стал известным с выпуском своих микстейпов и синглов, таких как "Look at Me!", который стал вирусным хитом и привлек к нему широкую аудиторию.

    Он был известен своим нестандартным музыкальным стилем, который включал элементы рэпа, рока и R&B. Его песни часто олицетворяли его внутренние борьбы с депрессией, одиночеством и насилием. Однако он также выражал надежду на позитивное изменение и собирался влиять на свою аудиторию через свою музыку.
    """, artistAlbums:[] )
        
    ]

        static let songs : [Song] = [
            DataManager.createSong(songImage: UIImage(named: "wu-tang"), songName: "C.R.E.A.M", songArtist: artists[0], songGenre: "Hip-hop", songRating: 2, songLyrics: """
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
    
            DataManager.createSong(songImage: UIImage(named: "drake"), songName: "Toosie Slide", songArtist: artists[3], songGenre: "Hip-hop", songRating: 1, songLyrics: """
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
            
            DataManager.createSong(songImage: UIImage(named: "rihanna"), songName: "Work work work", songArtist: artists[1], songGenre: "RnB", songRating: 4, songLyrics: """
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
            
            DataManager.createSong(songImage: UIImage(named: "nirvana"), songName: "Lithium", songArtist: artists[2], songGenre: "Grunge", songRating: 3, songLyrics: """
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
            
            DataManager.createSong(songImage: UIImage(named: "paintItBack"), songName: "Paint It, Black", songArtist: artists[4], songGenre: "psychedelic rock", songRating: 5, songLyrics: """
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
            
            DataManager.createSong(songImage: UIImage(named: "xxxtentacion-artist"), songName: "STARING AT THE SKY", songArtist: artists[7], songGenre: "Grunge", songRating: 6, songLyrics: """
        [Intro]
        Ahem
        Yeah

        [Chorus]
        I was staring at the sky
        Singin' toxic lullabies
        I was starin' at the sky

        [Verse]
        Screaming words with no remorse
        Pitchforks pointed at my heart
        I was staring at the sky

        [Bridge]
        We're gonna break
        We're gonna break
        We're gonna break
        We're gonna break

        [Chorus]
        I was staring at the sky
        Singin' toxic lullabies
        I was starin' at the sky
        """),
            
            DataManager.createSong(songImage: UIImage(named: "mac-artist"), songName: "Loud", songArtist: artists[6], songGenre: "Hip-hop", songRating: 7, songLyrics: """
        Ladies and gentleman
        This is Macadelic
        Motherfucker

        Verse 1

        Ugh I got codeine in my cup, you can bet your ass I’m sippin’
        Groupies fall in love, I’m like bitch you must be trippin’
        I’m just tryna fuck and she just need tuition
        Why you tryna stunt, you need to play your own position
        Never gave a fuck and nothing ’bout me changed
        Still roll up them blunts, got diamonds in my chain
        Yeah you heard me I got diamonds in my chain
        But it don’t make a difference if you cryin’ in the rain
        Two hundred shows, I’ma kill more
        I just sold out that Fillmore
        Got a million, make a mil’ more
        Play a number one spot on the billboard
        Bridge
        Yeah people lie, numbers won’t
        Keep me high, drugs is close
        Growing up, po’ a cup
        Watch the world go up in smoke

        Hook
        I like my music real loud (real loud)
        Can you turn that shit up for me right now (right now)
        Here it come, there it go, ask your homies, ask your hoes
        If you didn’t, now you know, never keep your pockets low
        I like my music real loud (real loud)
        Can you turn that shit up for me right now (right now)
        Here she comes, there she go, never chasing after hoes
        If you didn’t, now you know, never keep your pockets low

        Verse 2
        I’ma get that Grammy soon, fuck your magazine
        Jordan gonna hand me shoes, still fuck your magazine
        Hammer team, in that pack with me
        Hear the Jerm beat bangin’ wit’ a glass of lean
        When I went to every high school class would be
        Tryna fuck the female faculty
        I’ma crazy little fucker, think my head done ran away
        I experiment with drugs but I won’t ever fuck with yay
        I just made a million dollars still I think I’m underpaid
        Fuck with me? Kid no way
        When you meet me, bitches stand up straight
        Pump out reps, yeah I got reps
        Tryna talk shit what you think about that?
        For the pesos, getting bank rolls, I’ma lay low chill, til I let that stack

        Bridge
        Yeah people lie, numbers won’t
        Keep me high, drugs is close
        Growing up, po’ a cup
        Watch the world go up in smoke

        Hook
        I like my music real loud (real loud)
        Can you turn that shit up for me right now (right now)
        Here it come, there it go, ask your homies, ask your hoes
        If you didn’t, now you know, never keep your pockets low
        I like my music real loud (real loud)
        Can you turn that shit up for me right now (right now)
        Here she comes, there she go, never chasing after hoes
        If you didn’t, now you know, never keep your pockets low
        """),
            
            DataManager.createSong(songImage: UIImage(named: "rocky-artist"), songName: "L$D", songArtist: artists[5], songGenre: "Grunge", songRating: 8, songLyrics: """
        I know I dream about her all day
        I think about her with her clothes off
        I’m ridin’ ’round with my system pumpin’ LSD
        I look for ways to say, «I love you»

        But I ain’t into makin’ love songs
        Baby, I’m just rappin’ to this LSD
        She ain’t a stranger to the city life
        I introduce her to this hippy life
        We make love under pretty lights, LSD (Acid)
        I get a feelin’ it’s a trippy night
        Them other drugs just don’t fit me right
        Girl, I really fuckin’ want love, sex, dream
        Another quarter to the face system
        Make no mistakes, it’s all a leap of faith for love
        It takes a place in feelin’ that you crave doin’ love, sex, dreams
        It started in Hollywood
        Dreamin’ of sharin’ love
        My tongue at a loss for words
        Cause my feelings just said it all
        Party just started up
        Dreamin’ of sharin’ worlds
        Held this feeling for way too long
        Said, «I really wanna let it go»

        I’ve been gettin’ fly because the gimmick’s so dope
        I’ve been getting high cause I figured Lord told me
        I’ve been drinking, driving, now we’ll never go home
        I gon’ stay in doubt because the weather’s so cold

        Feeling low sometimes when the light shines down
        Makes me high
        Can you feel it?

        Can you feel it?
        Feeling low sometimes when the light shines down
        Makes me high
        Can you feel it?
        Can you feel it?
        It started in Hollywood
        Dreamin’ of sharin’ love
        My tongue had a loss for words
        Cause my feelings just said it all

        I look for ways to say, «I love you»
        But I ain’t into makin’ love songs
        Baby I’m just rappin’ to this LSD
        """),
            
            DataManager.createSong(songImage: UIImage(named: "bestDayEver"), songName: "Best Day Ever", songArtist: artists[6], songGenre: "Hip-hop", songRating: 8, songLyrics: """
        I never take a day off
        Work around the clock, my engineer gettin' paid off
        Rock like Aesop, light the weed and take off
        So high I cannot see, Adolf
        Now I got these rappers all breakin' up a sweat
        'Cause every time I get up on the mic, it come correct
        And I learned it from the best, always dressed in somethin' fresh
        Lookin' for a little dime, big butt and nice chest
        Yes, they heard I used to rock Guess
        But now I'm rockin' clothes that ain't in the stores yet
        Travel back in time, I'm in a vortex
        Tryna to make it work out, think I need more reps
        Used to take a bus, now the boy board jets
        'Cause kids got me buzzin' like a fuckin' hornet
        They say I got next, tell 'em that I got now
        It's all Disney boy, my family Proud
        Make 'em say, "Ow, " make 'em say, "Oh"
        The hoes that tell me, "Yes", the same ones that tell you, "No"
        Whoa, I ain't just an Average Joe, way above the average flow
        Boy, my life is most dope
        No matter where life takes me, find me with a smile
        Pursuit to be happy, only laughing like a child
        I never thought life would be this sweet
        It got me cheesin' from cheek to cheek (ayy, ayy)
        And I ain't gonna wait for nothing 'cause that just ain't my style
        Life couldn't get better, this gon' be the best day ever
        If it ain't about a dream, then it ain't about me
        Go a couple full weeks without a good night's sleep
        Imagination, makin', musical creation
        The journey that I'm facin' plus the paper that I'm chasin'
        Got me crazy, half insane and with the lames I see you hatin'
        But there's nothing' that you're changin', thumbs up, I'm maintainin'
        No complainin' when it's rainin', I'll be in another zone
        Move out my mother's home to a world I call my own
        I ain't gonna play around no more
        Found a difference from the ground and the floor
        If we got a fight, I'll be down for the war
        Thumbs up, homie, I'll be sure
        No matter where life takes me, find me with a smile
        Pursuit to be happy, only laughing like a child
        I never thought life would be this sweet
        It got me cheesin' from cheek to cheek (ayy, ayy)
        And I ain't gonna wait for nothing 'cause that just ain't my style
        Life couldn't get better, this gon' be the best day ever
        """),
           
            DataManager.createSong(songImage: UIImage(named: "macCircles"), songName: "Once a Day", songArtist: artists[6], songGenre: "Hip-hop", songRating: 9, songLyrics: """
        Once a day I rise
        Once a day I fall asleep with you
        Once a day I try but I can't find a single word

        I wonder what they know
        I wonder if they ever even cared at all
        I wonder do they see their own reflection in the rain
        And look away

        Everybody keep rushing
        Why aren't we taking our time?
        Every now and again, baby, I get high

        Don't ask me what I think
        It never really mattered what I had to say
        I just keep waiting for another open door
        To come up soon

        Don't keep it all in your head
        The only place that you know nobody ever can see
        You're running low on regret
        No tears that's keeping you wet
        I think you getting it now

        But everybody keep rushing
        Why aren't we taking our time?
        Every now and again, baby, I get high

        And everybody means something
        When they're stuck on your mind
        But every now and again why can't we just be fine?

        Once a day I rise
        Once a day I fall asleep with you
        Once a day I try but I can't find a single word
        """),
    ]
    
    //MARK: - массивы альбомов
    static let albums : [Album] = [
        DataManager.createAlbum(albumName: "Wheels of Fire", albumArtist: artists[0], albumSongs: [songs [0]], albumImage: UIImage(named: "WheelsofFire")),
                                
        DataManager.createAlbum(albumName: "Toosie Slide", albumArtist: artists[3], albumSongs: [songs [1]], albumImage: UIImage(named: "Toosie Slide")),
        DataManager.createAlbum(albumName: "Anti", albumArtist: artists[1], albumSongs: [songs [2]], albumImage: UIImage(named: "Anti")),
        DataManager.createAlbum(albumName: "Nevermind", albumArtist: artists[2], albumSongs: [songs [3]], albumImage: UIImage(named: "Nevermind")),
        DataManager.createAlbum(albumName: "Aftermath", albumArtist: artists[4], albumSongs: [songs [4]], albumImage: UIImage(named: "Aftermath")),
        DataManager.createAlbum(albumName: "SKINS", albumArtist: artists[7], albumSongs: [songs [5]], albumImage: UIImage(named: "SKINS")),
        DataManager.createAlbum(albumName: "Macadelic", albumArtist: artists[6], albumSongs: [songs [6]], albumImage: UIImage(named: "Macadelic")),
        DataManager.createAlbum(albumName: "At. Long. Last. ASAP", albumArtist: artists[5], albumSongs: [songs [7]], albumImage: UIImage(named: "At. Long. Last. ASAP")),
        DataManager.createAlbum(albumName: "Best Day Ever (5th Anniversary Remastered Edition)", albumArtist: artists[6], albumSongs: [songs [8]], albumImage: UIImage(named: "Best Day Ever (5th Anniversary Remastered Edition)")),
        DataManager.createAlbum(albumName: "Circles", albumArtist: artists[6], albumSongs: [songs [9]], albumImage: UIImage(named: "Circles"))

        ]
}

