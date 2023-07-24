//
//  MusicCloneViewController.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/23.
//

import UIKit

class MusicCloneViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var sameMusicButton: UIButton!
    @IBOutlet weak var instaButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var likePersonLabel: UILabel!
    @IBOutlet weak var musicPictureImg: UIImageView!
    
    var likePersoInt: Int = 0
    
    let musicList: [String: String] = ["UnderWater": "권은비", "Celeb": "PSY", "Track9": "이소라", "금붕어의 꿈": "오담률(feat. 한요한)"]
    
    let MusicImg: [String] = ["cake", "churros", "doughnut", "icecream"]
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButton()

    }
    

    //MARK: - setUI
    func setUI(){
        likePersonLabel.text = "\(likePersoInt)"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 20)
        artistLabel.textColor = .white
        changeMusic()
        musicPictureImg.contentMode = .scaleAspectFill
    }
    
    func setButton(){
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        likeButton.setTitle("", for: .normal)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .selected)
    }
    
    //MARK: - tappedEvent
    @IBAction func tappedChangeMusicButton(_ sender: UIButton) {
        changeMusic()
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        } else{
            sender.isSelected = true
        }
        if sender == likeButton{
            changeLiker(sender)
        }
    }
    
    
    //MARK: - Helper
    func changeLiker(_ sender: UIButton){
        if sender.isSelected {
            likePersoInt += 1
        } else{
            likePersoInt -= 1
        }
        likePersonLabel.text = "\(likePersoInt)"
    }
    
    
    //음악을 바꾼다.
    func changeMusic(){
        let music = musicList.randomElement()
        titleLabel.text = music?.key
        artistLabel.text = music?.value
        musicPictureImg.image = UIImage(named: MusicImg.randomElement()!)
    }

}
