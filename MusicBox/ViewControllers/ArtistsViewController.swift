//
//  ArtistsViewController.swift
//  MusicBox
//
//  Created by Айнур on 23.08.2023.
//

import UIKit

// Класс для отображения списка артистов
class ArtistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Переменные
    // Массив артистов
    let artists: [Artist]
    // Таблица для отображения списка песен
    let tableViewOfArtists = UITableView()
    //Кнопка для заголовка в навигационной панели
    let artistsTitleButton = UIButton(type : .system)
    
    // Инициализация класса с передачей массива артистов
    init (artists: [Artist]) {
        self.artists = artists
        super.init(nibName: nil, bundle: nil)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: -Контейнер
        // Создание контейнера и добавление его на вью
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        // Констреинты контейнера
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
       
        //MARK: - Кнопка-заголовок
        // Настройка кнопки-заголовка в навигационной панели
        artistsTitleButton.setTitle("Список артистов", for: .normal)
        navigationItem.titleView = artistsTitleButton
        artistsTitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        containerView.addSubview(navigationController!.navigationBar)
        
        //MARK: - Таблица
        // Настройка таблицы
        tableViewOfArtists.delegate = self
        tableViewOfArtists.dataSource = self
        tableViewOfArtists.register(SectionOfArtists.self, forCellReuseIdentifier: SectionOfArtists.self.identifier)
        view.addSubview(tableViewOfArtists)
        tableViewOfArtists.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавление таблицы в контейнер
        containerView.addSubview(tableViewOfArtists)
        
        // Констреинты
        tableViewOfArtists.snp.makeConstraints { make in
            make.top.equalTo(containerView.safeAreaLayoutGuide)
            make.bottom.leading.trailing.equalTo(containerView)
        }
        
    }
    
    //MARK: -Методы делегата и источника данных для таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // создаем ячейку с конфигурациями из SectionOfArtists
        guard let cell = tableViewOfArtists.dequeueReusableCell (withIdentifier: SectionOfArtists.identifier, for: indexPath) as? SectionOfArtists else { return UITableViewCell() }
       
        // добавляем артистов
        let artists = artists [indexPath.row]
        // прописываем конфигурации для ячеек артистов
        cell.artistsImageView.image = artists.artistImage
        cell.artistsTitle.text = artists.artistName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArtist = artists[indexPath.row]
        let artistCardVC = ArtistsCardViewController(artist : selectedArtist)
        navigationController?.pushViewController(artistCardVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artistsTitleButton.setTitle("Список артистов", for: .normal)
    }
}
    
    
    
    


