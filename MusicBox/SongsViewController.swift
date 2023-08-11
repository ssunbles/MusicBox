//
//  SongsViewController.swift
//  MusicBox
//
//  Created by Айнур on 19.07.2023.
//

import UIKit

struct Song {
    let imageName : UIImage?
    let songName : String?
    let artistName : String?
}




class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    

    let tableViewOfSongs = UITableView()
    let songs = [
        Song(imageName: UIImage(named: "wu-tang"), songName: "C.R.E.A.M", artistName: "Wu-Tang Clan"),
        Song(imageName: UIImage(named: "drake"), songName: "Toosie Slide", artistName: "Drake"),
        Song(imageName: UIImage(named: "rihanna"), songName: "Work work work", artistName: "Rihanna"),
        Song(imageName: UIImage(named: "nirvana"), songName: "Lithium", artistName: "Nirvana")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Список песен"

        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        //MARK: - Создаем таблицу и задаем ей размерность
        tableViewOfSongs.delegate = self
        tableViewOfSongs.dataSource = self
        tableViewOfSongs.register(SectionOfSongs.self, forCellReuseIdentifier: "sectionOfSongs")
        view.addSubview(tableViewOfSongs)
        
        tableViewOfSongs.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewOfSongs.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewOfSongs.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewOfSongs.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewOfSongs.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
       
        

        
    }
    //MARK: - Методы таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOfSongs.dequeueReusableCell(withIdentifier: "sectionOfSongs", for: indexPath) as! SectionOfSongs
        let song = songs [indexPath.row]
        cell.songImageView.image = song.imageName
        cell.songTitle.text = song.songName
        cell.artistLabel.text = song.artistName
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

   
}

class SectionOfSongs : UITableViewCell  {
    
    // расписываем элементы ячейки с песней
    let songImageView : UIImageView = {
        let imageView = UIImageView()
        // нужно установить размерность изображения
        return imageView
    }()
    
    let songTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20) // меняем размер шрифта

        
        
        return label
    }()
    
    
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14) // меняем размер шрифта
        return label
    }()
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(songImageView)
        contentView.addSubview(songTitle)
        contentView.addSubview(artistLabel)
        
        // Констреинты надо будет прописать
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            songImageView.widthAnchor.constraint(equalToConstant: 50),
            songImageView.heightAnchor.constraint(equalToConstant: 50),
            songImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songTitle.leadingAnchor.constraint(equalTo: songImageView.leadingAnchor, constant: 60),
            songTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
    
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: songImageView.leadingAnchor, constant: 60),
            artistLabel.topAnchor.constraint(equalTo: songTitle.bottomAnchor, constant: 10)
        ])
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
