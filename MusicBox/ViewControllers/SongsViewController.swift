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
