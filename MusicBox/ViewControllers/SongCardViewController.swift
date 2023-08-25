//
//  SongCardViewController.swift
//  MusicBox
//
//  Created by Айнур on 26.07.2023.
// new code


import UIKit
import SnapKit

class SongCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
    
        
        // Регистрируем ячейки для таблицы
        tableViewSongCard.register(ImageSongSectionCell.self, forCellReuseIdentifier: "imageSongSection")
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
            let cell = tableViewSongCard.dequeueReusableCell(withIdentifier: "imageSongSection", for: indexPath) as! ImageSongSectionCell
            if let songImage = song?.songImage {
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
            if let songLyrics = song?.songLyrics {
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
            cell.otherSongs = DataManager.songs.filter { $0 != song }
            cell.delegate = self
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 110
        }
        return UITableView.automaticDimension
    }
}

extension SongCardViewController: SongSelectionDelegate {
    func didSelect (song: Song) {
        // Создание нового экземпляра SongCardViewController с переданной песней
        let secondSongCardVC = SongCardViewController(song: song)
        // Проверка, есть ли у текущего контроллера навигационный контроллер
        // Если есть, используем навигационный контроллер для перехода к новому SongCardViewController
        navigationController?.pushViewController(secondSongCardVC, animated: true)
    }
}
