// new code


import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SecondSectionDelegate {
    //MARK: - Свойства
    let tableView = UITableView()
    let buttons = ["Песни", "Рейтинг", "Жанры", "Артисты"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Главная"
        
        //MARK: - Создание таблицы и задание ей размерности
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstSectionCell.self, forCellReuseIdentifier: "firstSectionCell")
        tableView.register(SecondSectionCell.self, forCellReuseIdentifier: "secondSectionCell")
        tableView.contentInset = UIEdgeInsets.zero
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
    }
    
    //MARK: - Методы таблицы
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return buttons.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstSectionCell", for: indexPath) as? FirstSectionCell else { return UITableViewCell() }
            cell.configure()
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondSectionCell", for: indexPath) as? SecondSectionCell else { return UITableViewCell() }
            cell.configure(title: buttons[indexPath.row], tag: indexPath.row)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 320
        } else if indexPath.section == 1 {
            return 110
        }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let selectedButtonTitle = buttons[indexPath.row]
            
            switch selectedButtonTitle {
            case "Песни" :
                let songsArray : [Song] = DataManager.songs
                let songsViewController = SongsViewController (songs: songsArray)
                navigationController?.pushViewController(songsViewController, animated: true)
                
            default:
                break
            }
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 320
        } else if indexPath.section == 1 {
            return 110
        }
        return UITableView.automaticDimension
    }
    func buttonPressed(withSongs songs: [Song], tag: Int) {
        if tag == 0 {
            let songsArray: [Song] = DataManager.songs
            let songsViewController = SongsViewController(songs: songsArray)
            navigationController?.pushViewController(songsViewController, animated: true)
        }
        
        else if tag == 3 {
            let artistsArray: [Artist] = DataManager.artists
            let artistsViewController = ArtistsViewController(artists: artistsArray)
            navigationController?.pushViewController(artistsViewController, animated: true)
        }
        
        
    }
}
