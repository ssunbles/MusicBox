//
//  ArtistsCardViewController.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class ArtistsCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   //MARK: - Свойства
    //свойство для хранения информации о выбранном артисте
    var artist : Artist?
    var artistSongsDict: [Artist: [Song]] = [:]
    var artistAlbumsDict: [Artist: [Album]] = [:]
    let tableViewArtistCard = UITableView()
    
    //Инициализация класса
    init(artist: Artist?) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // подбираем все песни этого артиста, чтобы потом закинуть в ячейку с популярными
        for artist in DataManager.artists {
            let songsOfArtist = DataManager.songs.filter { $0.songArtist == artist }
            artistSongsDict[artist] = songsOfArtist
            let albumsOfArtist = DataManager.albums.filter { $0.albumArtist == artist }
             artistAlbumsDict [artist] = albumsOfArtist
        }
        
        //MARK: - контейнер
        // конфигурации для контейнера
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        //MARK: -Констреинты
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        
        //MARK: - Кнопка
        let artistsTitleButton = UIButton(type: .system)
        artistsTitleButton.setTitle("Главная", for: .normal)
        artistsTitleButton.addTarget(self, action: #selector(goToRootVC), for: .touchUpInside)
        navigationItem.titleView = artistsTitleButton
        artistsTitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        containerView.addSubview(navigationController!.navigationBar)
        
        //MARK: -Таблица
        tableViewArtistCard.delegate = self
        tableViewArtistCard.dataSource = self
        containerView.addSubview(tableViewArtistCard)
        
        // регистрация ячейки для таблицы
        tableViewArtistCard.register(TitleArtistImageViewCell.self, forCellReuseIdentifier: TitleArtistImageViewCell.identifier)
        tableViewArtistCard.register(PopularSongsOfArtistViewCell.self, forCellReuseIdentifier: PopularSongsOfArtistViewCell.identifier)
        tableViewArtistCard.register(AlbumsOfArtistViewCell.self, forCellReuseIdentifier: AlbumsOfArtistViewCell.identifier)
        tableViewArtistCard.register(ArtistDescriptionViewCell.self, forCellReuseIdentifier: ArtistDescriptionViewCell.identifier)
        tableViewArtistCard.register(OtherArtistsViewCell.self, forCellReuseIdentifier: OtherArtistsViewCell.identifier)
        
        //tableViewArtistCard.separatorStyle = .none
        tableViewArtistCard.translatesAutoresizingMaskIntoConstraints = false
        tableViewArtistCard.isScrollEnabled = true
        
        //MARK: -Констреинты
        tableViewArtistCard.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.trailing.leading.equalTo(containerView)
        }
    }
    
    //MARK: - Методы таблицы и кнопок
    @objc func goToRootVC () {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableViewArtistCard.dequeueReusableCell(withIdentifier: TitleArtistImageViewCell.identifier, for: indexPath) as? TitleArtistImageViewCell else { return UITableViewCell() }
            if let artistImage = artist?.artistImage {
                cell.artistImageView.image = artistImage
            }
            return cell
            }
        else if indexPath.section == 1 {
            guard let cell = tableViewArtistCard.dequeueReusableCell(withIdentifier: PopularSongsOfArtistViewCell.identifier, for: indexPath) as? PopularSongsOfArtistViewCell else { return UITableViewCell() }
            if let artist = artist {
                let popularSongs = getPopularSongs (for: artist)
                cell.artistSongs = popularSongs
            }
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableViewArtistCard.dequeueReusableCell(withIdentifier: AlbumsOfArtistViewCell.identifier, for: indexPath) as? AlbumsOfArtistViewCell else { return UITableViewCell() }
            if let artist = artist {
                let artistAlbums = getPopularSongs(for: artist)
            }
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func getPopularSongs (for artist: Artist) -> [Song] {
        if let popularSongs = artistSongsDict [artist] {
        return popularSongs
        } else
        {
            return []
        }
    }
    
    func getArtistAlbums (for artist: Artist) -> [Song] {
        if let popularAlbums = artistSongsDict [artist] {
        return popularAlbums
        } else
        {
            return []
        }
    }
}
