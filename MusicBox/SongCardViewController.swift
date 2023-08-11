//
//  SongCardViewController.swift
//  MusicBox
//
//  Created by Айнур on 26.07.2023.
//

import UIKit
import SnapKit




class SongCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SongSelectionDelegate {
    
    // Свойство типа Song для хранения информации о выбранной песне
    var song: Song?
    
    
    // Создаем таблицу для отображения информации о песне
    let tableViewSongCard = UITableView()
    
    
    
    // Инициализатор класса
    init(song: Song?) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    // Обязательный инициализатор (не реализован)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Создаем контейнер и добавляем в него таблицу и навигационную панель
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.addSubview(tableViewSongCard)
        containerView.addSubview(navigationController!.navigationBar)
        
        // Добавляем кнопку "Главная" в навигационную панель
        let titleButton =  UIButton(type: .system)
        titleButton.setTitle("Главная", for: .normal)
        titleButton.addTarget(self, action: #selector(goToRootVC), for: .touchUpInside)
        navigationItem.titleView = titleButton
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        // Устанавливаем делегат и источник данных для таблицы
        tableViewSongCard.delegate = self
        tableViewSongCard.dataSource = self
        
        let collectionViewManager = OtherSongsCollectionViewManager()
        collectionViewManager.delegate = self
       
        
        // Регистрируем ячейки для таблицы
        tableViewSongCard.register(ImageSongSection.self, forCellReuseIdentifier: "imageSongSection")
        tableViewSongCard.register(TitleSongSection.self, forCellReuseIdentifier: "titleSongSection")
        tableViewSongCard.register(LyricSongSection.self, forCellReuseIdentifier: "lyricSongSection")
        tableViewSongCard.register(OtherSongsSection.self, forCellReuseIdentifier: "otherSongsSection")
        
        tableViewSongCard.separatorStyle = .none
        tableViewSongCard.translatesAutoresizingMaskIntoConstraints = false
        tableViewSongCard.isScrollEnabled = true
        // Устанавливаем констрейнты для контейнера и таблицы
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewSongCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewSongCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableViewSongCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableViewSongCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        containerView.addSubview(tableViewSongCard)

    }
    
    
    func didSelect (song: Song) {
        // Создание нового экземпляра SongCardViewController с переданной песней
        let secondSongCardVC = SongCardViewController(song: song)
        // Проверка, есть ли у текущего контроллера навигационный контроллер
        if let navigationController = navigationController {
        // Если есть, используем навигационный контроллер для перехода к новому SongCardViewController
            navigationController.pushViewController(secondSongCardVC, animated: true)
        }
    }
    
    
    
    @objc func goToRootVC () {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    //MARK: - Методы таблицы
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableViewSongCard.dequeueReusableCell(withIdentifier: "imageSongSection", for: indexPath) as! ImageSongSection
            if let songImage = song?.imageName {
                cell.songImageView.image = songImage
            }
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableViewSongCard.dequeueReusableCell(withIdentifier: "titleSongSection", for: indexPath) as! TitleSongSection
            if let song = song {
                cell.configure(with: song)
            }
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableViewSongCard.dequeueReusableCell(withIdentifier: "lyricSongSection", for: indexPath) as! LyricSongSection
            if let songLyrics = song?.lyrics {
                cell.configure(with : songLyrics)
            }
            cell.expandButtonAction = { [weak self] in
                        self?.tableViewSongCard.beginUpdates()
                        self?.tableViewSongCard.endUpdates()
                    }
            return cell
        }
        else if indexPath.section == 3 {
            let cell = tableViewSongCard.dequeueReusableCell(withIdentifier: "otherSongsSection", for: indexPath) as! OtherSongsSection
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 110
        } else if indexPath.section == 3 {
            return 140
        }
        
        
        return UITableView.automaticDimension
    }
    
   
        
     
    
    
    
    
}

class ImageSongSection : UITableViewCell {
    let songImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        songImageView.contentMode = .scaleAspectFit
        songImageView.clipsToBounds = true
        contentView.addSubview(songImageView)
        
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            songImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            songImageView.heightAnchor.constraint(equalToConstant: 280)])
    }
    
}

class TitleSongSection: UITableViewCell {
    let songTitleLabel = UILabel()
    let songGenreLabel = UILabel()
    let songRatingLabel = UILabel()
    let containerView = UIView()

    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.backgroundColor = UIColor.brown
        
        containerView.addSubview(songTitleLabel)
        containerView.addSubview(songGenreLabel)
        containerView.addSubview(songRatingLabel)

        
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        songRatingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            songTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            songTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            songTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            songGenreLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor),
            songGenreLabel.heightAnchor.constraint(equalToConstant: 20),
            songGenreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songGenreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            songGenreLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 10),
            
            songRatingLabel.topAnchor.constraint(equalTo: songGenreLabel.bottomAnchor),
            songRatingLabel.heightAnchor.constraint(equalToConstant: 20),
            songRatingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songRatingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])

        
    }
    func configure(with song: Song) {
          songTitleLabel.text = (song.songName ?? "Unknown Song") + " - " + (song.artistName ?? "Unknown Artist")
        songTitleLabel.textColor = UIColor.white
        songGenreLabel.text = "Genre: " + (song.genreName ?? "Unknown Song")
        songGenreLabel.textColor = UIColor.white
        songRatingLabel.text = "Songs rating: " + String((song.ratingNumber ?? 0))
        songRatingLabel.textColor = UIColor.white
        
        songTitleLabel.font = UIFont.systemFont(ofSize: 19)
        songGenreLabel.font = UIFont.systemFont(ofSize: 14)
        songRatingLabel.font = UIFont.systemFont(ofSize: 14)


      }

      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  }
    
    
    
    
    


class LyricSongSection : UITableViewCell {
    let containerView = UIView()
    let titleLyricLabel = UILabel()
    let textOfLyricLabel = UILabel()
    let initialMaxLines = 5
    var isExpanded = false
    var expandButton: UIButton!
    
    var songLyrics: String?
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    var expandButtonAction: (() -> Void)?

    
    
    
    
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
       // containerView.backgroundColor = UIColor(red: 208/255, green: 250/255, blue: 62/255, alpha: 1)

        contentView.addSubview(containerView)
        containerView.addSubview(titleLyricLabel)
        containerView.addSubview(textOfLyricLabel)
        

        
        
        titleLyricLabel.text = "Текст песни:"
        titleLyricLabel.textColor = UIColor.brown
        titleLyricLabel.translatesAutoresizingMaskIntoConstraints = false
        textOfLyricLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            titleLyricLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLyricLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLyricLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLyricLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            textOfLyricLabel.topAnchor.constraint(equalTo: titleLyricLabel.bottomAnchor, constant: 10),
            textOfLyricLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textOfLyricLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textOfLyricLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
        ])
        
        
        
        
        // Создание кнопки и добавление действия
        expandButton = UIButton(type: .system)
        expandButton.setTitle("Развернуть", for: .normal)
        expandButton.addTarget(self, action: #selector(toggleExpand), for: .touchUpInside)
        containerView.addSubview(expandButton)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        
        expandButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(1)
        }
        
        
        
        
    }
    
    
    @objc func toggleExpand (){ // переключается на развернуть
        isExpanded.toggle()
        
        if isExpanded {
            textOfLyricLabel.numberOfLines = 0
            expandButton.setTitle("Свернуть", for: .normal)
            textOfLyricLabel.text = songLyrics
            
            
            
        } else
        {
            let lines = songLyrics?.components(separatedBy: "\n") ?? []
            let truncatedLyrics = lines.prefix(initialMaxLines).joined(separator: "\n")
            textOfLyricLabel.text = truncatedLyrics
            expandButton.setTitle("Развернуть", for: .normal)
        }
        
        expandButtonAction?()
        
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (with lyrics: String) {
        isExpanded = false
        let lines  = lyrics.components(separatedBy: "\n")
        let truncatedLyrics = lines.prefix(initialMaxLines).joined(separator: "\n")
        textOfLyricLabel.text = truncatedLyrics

        
        songLyrics = lyrics
        textOfLyricLabel.numberOfLines = 0
        textOfLyricLabel.font = UIFont.systemFont(ofSize: 15)

    }
    
    
}
    
    class OtherSongsSection : UITableViewCell {
        let containerView = UIView()
        let titleOtherLabel = UILabel()
        
        var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout ()
            // задаем горизонтальную ориентацию
            layout.scrollDirection = .horizontal
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor(red: 143/256, green: 139/256, blue: 187/256, alpha: 1)
            return collectionView
        }()
        
        var collectionViewManager : OtherSongsCollectionViewManager?
        
        
        override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            //регистрируем ячейку перед использованием
            collectionView.register(OtherSongsCollectionView.self, forCellWithReuseIdentifier: "OtherSongsCollection")

            
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            titleOtherLabel.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = UIColor(red: 143/256, green: 139/256, blue: 187/256, alpha: 1)
            contentView.addSubview(containerView)
            containerView.addSubview(titleOtherLabel)
            titleOtherLabel.text = "Другие песни"
            titleOtherLabel.font = UIFont.systemFont(ofSize: 15)
            

            
            containerView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.trailing.equalToSuperview()
                make.leading.equalToSuperview()
                
            }
            titleOtherLabel.snp.makeConstraints {make in
                make.top.equalToSuperview().inset(8)
                make.leading.equalToSuperview().inset(20)
                make.height.equalTo(17)
                make.trailing.equalToSuperview().inset(-20)
            }
            
            //Настройка collectionView и CollectionViewManager
            collectionViewManager = OtherSongsCollectionViewManager()
            collectionView.delegate = collectionViewManager
            collectionView.dataSource = collectionViewManager
            
            // добавляем коллекцию в ячейку
            
            containerView.addSubview(collectionView)

            
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(titleOtherLabel.snp.bottom).offset(0)
                make.bottom.equalToSuperview().offset(10)
                make.leading.trailing.equalToSuperview()
            }
            
        }
    
            
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
}

protocol SongSelectionDelegate : AnyObject {
    func didSelect(song: Song)
}

class OtherSongsCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: SongSelectionDelegate?
    var otherSongs: [Song]  = []
   
   
    override init () {
        
        
        // загружаем остальные песни, кроме текущей
        otherSongs = DataManager.songs.filter { $0 != DataManager.songs.first }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherSongsCollection", for: indexPath) as! OtherSongsCollectionView
        let song = otherSongs[indexPath.row]
        cell.configure(with : song)
        return cell
        
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSong = otherSongs [indexPath.row]
        delegate?.didSelect(song: selectedSong)
    }
    
    
}

class OtherSongsCollectionView : UICollectionViewCell {
    let otherSongTitleLabel = UILabel()
    let otherSongImageLabel = UIImageView()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews () {
        otherSongTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        otherSongImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(otherSongTitleLabel)
        contentView.addSubview(otherSongImageLabel)
        
        
        otherSongImageLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(50)
            
        }
        otherSongTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(otherSongImageLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        
    }
    
    
    func configure(with song: Song) {
        otherSongTitleLabel.text = song.songName ?? "Unknown Song"
        otherSongTitleLabel.font = UIFont.systemFont(ofSize: 12)
        
        if let songImage = song.imageName {
            otherSongImageLabel.image = songImage
        } else {
            otherSongImageLabel.image = UIImage(named: "default Image")
        }
        
        
    }
}
