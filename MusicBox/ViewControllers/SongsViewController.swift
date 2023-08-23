//
//  SongsViewController.swift
//  MusicBox
//
//  Created by Айнур on 19.07.2023.
// new code


import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let songs: [Song]
    let tableViewOfSongs = UITableView()
    let titleButton = UIButton(type: .system)
    init(songs: [Song]) {
        self.songs = songs
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(tableViewOfSongs)
        containerView.addSubview(navigationController!.navigationBar)
        titleButton.setTitle("Список песен", for: .normal)
        navigationItem.titleView = titleButton
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        //MARK: - Создаем таблицу и задаем ей размерность
        tableViewOfSongs.delegate = self
        tableViewOfSongs.dataSource = self
        tableViewOfSongs.register(SectionOfSongs.self, forCellReuseIdentifier: "sectionOfSongs")
        view.addSubview(tableViewOfSongs)
        tableViewOfSongs.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewOfSongs.topAnchor.constraint(equalTo:  containerView.safeAreaLayoutGuide.topAnchor),
            tableViewOfSongs.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableViewOfSongs.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableViewOfSongs.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    //MARK: - Методы таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOfSongs.dequeueReusableCell(withIdentifier: "sectionOfSongs", for: indexPath) as! SectionOfSongs
        let song = songs [indexPath.row]
        cell.songImageView.image = song.songImage
        cell.songTitle.text = song.songName
        cell.artistLabel.text = song.songArtist.artistName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath) {
        let selectedSong = songs[indexPath.row]
        let songCardVC = SongCardViewController(song : selectedSong)
        navigationController?.pushViewController(songCardVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleButton.setTitle("Список песен", for: .normal)
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
        songImageView.contentMode = .scaleAspectFill
        songImageView.clipsToBounds = true
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

