import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstSectionCell", for: indexPath) as! FirstSectionCell
            cell.configure()
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondSectionCell", for: indexPath) as! SecondSectionCell
            cell.configure(title: buttons[indexPath.row], tag: indexPath.row)
            cell.delegate = self
            cell.selectionStyle = .none
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
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 320
            } else if indexPath.section == 1 {
                return 110
            }
            return UITableView.automaticDimension
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
           if indexPath.row == 0 {
                
                print("Pressed : Песни")
                let songsArray: [Song] = DataManager.songs // получаем массив песен из DataManager
                let songsViewController = SongsViewController(songs: songsArray)
                
                navigationController?.pushViewController(songsViewController, animated: true)
            }
            else {
                print("Pressed : не попал")
            }
        }
    }
    
}

class FirstSectionCell: UITableViewCell {
    let roundButton = UIButton(type: .system)
    
    func configure() {
        backgroundColor = UIColor.red
        roundButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        roundButton.backgroundColor = UIColor.blue
        roundButton.layer.cornerRadius = roundButton.frame.size.width / 2
        roundButton.clipsToBounds = true
        roundButton.setTitle("Что послушать?", for: .normal)
        roundButton.setTitleColor(UIColor.white, for: .normal)
        roundButton.center = contentView.center
        contentView.addSubview(roundButton)
        
        
        NSLayoutConstraint.activate([
                  roundButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                  roundButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                  roundButton.widthAnchor.constraint(equalToConstant: 200),
                  roundButton.heightAnchor.constraint(equalToConstant: 200)
              ])
    }
    
}

protocol SecondSectionDelegate: AnyObject { // протокол делегата
    func buttonPressed(withSongs songs: [Song])
}

class SecondSectionCell: UITableViewCell {
    let button = UIButton(type: .system)
    weak var delegate: SecondSectionDelegate? // свойство делегата
    
    func configure(title: String, tag: Int) {
        backgroundColor = UIColor.blue
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.backgroundColor = UIColor.red
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.center = contentView.center
        contentView.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonIsPressed), for: .touchUpInside)
    }
    
    @objc func buttonIsPressed() {
        delegate?.buttonPressed(withSongs: DataManager.songs)
    }
}

extension ViewController: SecondSectionDelegate {
    func buttonPressed(withSongs songs: [Song]) {
        let songViewController = SongsViewController(songs: songs)
        navigationController?.pushViewController(songViewController, animated: true)
    }
}