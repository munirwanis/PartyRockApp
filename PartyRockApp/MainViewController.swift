//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Munir Wanis on 16/04/17.
//  Copyright © 2017 Munir Wanis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://yt3.ggpht.com/-k-TuTtfPpfg/AAAAAAAAAAI/AAAAAAAAAAA/AR4yj6L2f9s/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/aF1KB5O1f2k\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Clint Eastwood")
        
        partyRocks.append(p1)
        
        let p2 = PartyRock(imageURL: "http://i.vimeocdn.com/video/272412717_1280x720.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/0nOGy52xygY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Do Ya Thing")
        
        partyRocks.append(p2)
        
        let p3 = PartyRock(imageURL: "http://www.vblurpage.com/pictures/videos/images/gorillaz_stylo_07.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nhPaWIeULKk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Stylo")
        
        partyRocks.append(p3)
        
        let p4 = PartyRock(imageURL: "https://fwdlabs.com/projects/film/570-gorillaz-doncamatic_2.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OJQyTnD74gk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Doncamatic")
        
        partyRocks.append(p4)
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/CqwFe-VpFIM/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/lRlmM88zzbY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Rock The House")
        
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyTableViewCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoViewController", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    } 

}

