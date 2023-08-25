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
        
        //конфигурации для таблицы
        tableViewArtistCard.delegate = self
        tableViewArtistCard.dataSource = self
        
        // регистрация ячейки для таблицы
        tableViewArtistCard.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        
    }

    //MARK: - Методы таблицы и кнопок
    @objc func goToRootVC () {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
