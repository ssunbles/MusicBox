//
//  Song.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

struct Artist : Equatable, Hashable {
    let artistId : Int?
    let artistName : String?
    let artistImage : UIImage?
    let artistDescription : String?
    let artistAlbums : [Album]
    
    init(artistId: Int?, artistName: String?, artistImage: UIImage?, artistDescription: String?, artistAlbums: [Album]) {
        self.artistId = artistId
        self.artistName = artistName
        self.artistImage = artistImage
        self.artistDescription = artistDescription
        self.artistAlbums = artistAlbums
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(artistId)
    }
    
}

struct Song : Equatable  {
    let songId : Int?
    let songImage : UIImage?
    let songName : String?
    let songArtist : Artist
    let songGenre : String?
    let songRating : Int?
    let songLyrics : String?
    
    init(songId: Int?, songImage: UIImage?, songName: String?, songArtist: Artist, songGenre: String?, songRating: Int?, songLyrics: String?) {
        self.songId = songId
        self.songImage = songImage
        self.songName = songName
        self.songArtist = songArtist
        self.songGenre = songGenre
        self.songRating = songRating
        self.songLyrics = songLyrics
    }
}

struct Album : Equatable {
    let albumId : Int?
    let albumName: String?
    let albumArtist: Artist
    let albumSongs : [Song]
    let albumImage : UIImage?
    
    init (albumId : Int?, albumName: String?, albumArtist: Artist, albumSongs : [Song], albumImage : UIImage?) {
        self.albumId = albumId
        self.albumName = albumName
        self.albumArtist = albumArtist
        self.albumSongs = albumSongs
        self.albumImage = albumImage
    }
}
