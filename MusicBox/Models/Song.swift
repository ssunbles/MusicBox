//
//  Song.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

struct Song : Equatable  {
    let imageName : UIImage?
    let songName : String?
    let artistName : String?
    let genreName : String?
    let ratingNumber : Int?
    let lyrics : String?
    init(imageName: UIImage?, songName: String?, artistName: String?, genreName: String?, ratingNumber: Int?, lyrics: String?) {
        self.imageName = imageName
        self.songName = songName
        self.artistName = artistName
        self.genreName = genreName
        self.ratingNumber = ratingNumber
        self.lyrics = lyrics
    }
}
