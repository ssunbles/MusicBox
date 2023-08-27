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
        }
        
        //MARK: - Конфигурации для вьюшек
        // конфигурации для контейнера
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.addSubview(tableViewArtistCard)
        containerView.addSubview(navigationController!.navigationBar)
        
        //конфигурации для кнопки - главная
        let artistsTitleButton = UIButton(type: .system)
        artistsTitleButton.setTitle("Главная", for: .normal)
        artistsTitleButton.addTarget(self, action: #selector(goToRootVC), for: .touchUpInside)
        navigationItem.titleView = artistsTitleButton
        artistsTitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        //MARK: -конфигурации для таблицы
        tableViewArtistCard.delegate = self
        tableViewArtistCard.dataSource = self
        
        // регистрация ячейки для таблицы
        tableViewArtistCard.register(TitleArtistImageViewCell.self, forCellReuseIdentifier: TitleArtistImageViewCell.self.identifier)
        
        tableViewArtistCard.register(PopularSongsOfArtistViewCell.self, forCellReuseIdentifier: PopularSongsOfArtistViewCell.self.identifier)
        
        tableViewArtistCard.register(AlbumsOfArtistViewCell.self, forCellReuseIdentifier: AlbumsOfArtistViewCell.self.identifier)
        
        tableViewArtistCard.register(ArtistDescriptionViewCell.self, forCellReuseIdentifier: ArtistDescriptionViewCell.self.identifier)
        
        tableViewArtistCard.register(OtherArtistsViewCell.self, forCellReuseIdentifier: OtherArtistsViewCell.self.identifier)
        
        containerView.addSubview(tableViewArtistCard)
        tableViewArtistCard.separatorStyle = .none
        tableViewArtistCard.translatesAutoresizingMaskIntoConstraints = false
        tableViewArtistCard.isScrollEnabled = true
        
        
        
        //MARK: -Констреинты
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
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
            let cell = tableViewArtistCard.dequeueReusableCell(withIdentifier: TitleArtistImageViewCell.identifier, for: indexPath) as! TitleArtistImageViewCell
            if let artistImage = artist?.artistImage {
                cell.artistImageView.image = artistImage
            }
            return cell
            }
        else if indexPath.section == 1 {
                let cell = tableViewArtistCard.dequeueReusableCell(withIdentifier: PopularSongsOfArtistViewCell.identifier, for: indexPath) as! PopularSongsOfArtistViewCell
            if let artist = artist {
                let popularSongs = getPopularSongs (for: artist)
                cell.artistSongs = popularSongs
                cell.setupCollectionView()

            }
            return cell
        }
        return UITableViewCell()
    }
    func getPopularSongs (for artist: Artist) -> [Song] {
        if let popularSongs = artistSongsDict [artist] {
        return popularSongs
        } else
        {
            return []
        }
    }
}
