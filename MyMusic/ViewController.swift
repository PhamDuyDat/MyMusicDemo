//
//  ViewController.swift
//  MyMusic
//
//  Created by Phạm Duy Đạt on 20/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    func configureSongs() {
        songs.append(Song( name: "3Lau",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover1",
                           trackName: "3LAU - Touch"))
        
        songs.append(Song( name: "Head In The Clouds",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover2",
                           trackName: "Head In The Clouds"))
        
        songs.append(Song( name: "How To Love",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover3",
                           trackName: "How To Love"))
        
        songs.append(Song( name: "Jonas Blue",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover4",
                           trackName: "Jonas Blue"))
        
        songs.append(Song( name: "Nevada",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover5",
                           trackName: "Nevada"))
        
        songs.append(Song( name: "Normal No More",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover6",
                           trackName: "Normal No More"))
        
        songs.append(Song( name: "On My Way",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover7",
                           trackName: "On My Way"))
        
        songs.append(Song( name: "So Far Away",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover8",
                           trackName: "So Far Away"))
        
        songs.append(Song( name: "The Ocean",
                           albumName: "123Something",
                           artistName: "ColPlay",
                           imageName: "cover9",
                           trackName: "The Ocean"))
    }
    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18 )
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17 )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
       vc.songs = songs
       vc.position = position
        
        present(vc, animated: true)
    }
 

}
struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}
