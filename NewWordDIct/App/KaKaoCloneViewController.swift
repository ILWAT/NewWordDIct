//
//  KaKaoCloneViewController.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/23.
//

import UIKit

class KaKaoCloneViewController: UIViewController {
    @IBOutlet var kakaoStoryButton: UIButton!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var talkMyselfButton: UIButton!
    @IBOutlet var mentionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImgView: UIImageView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var giftButton: UIButton!
    @IBOutlet var qrButton: UIButton!
    @IBOutlet var settingButton: UIButton!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    //MARK: - setUI()
    
    func setUI(){
        setText(stringName: "JACK", stringMention: "안녕하세요 JACK입니다.")
        
        profileImgView.layer.cornerRadius = 40
        profileImgView.contentMode = .scaleAspectFill
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.numberOfLines = 1
        nameLabel.textColor = .white
        
        mentionLabel.textAlignment = .center
        mentionLabel.font = .systemFont(ofSize: 12)
        mentionLabel.numberOfLines = 1
        mentionLabel.textColor = .white
        
        setBottomButton(button: [talkMyselfButton, editProfileButton, kakaoStoryButton])
    }
    
    func setBottomButton(button: [UIButton]){
        for element in button {
            if #available(iOS 15.0, *) {
                var config = UIButton.Configuration.plain()
                config.image = element.imageView?.image!
                config.baseForegroundColor = .white
                config.titleAlignment = .center
                config.imagePlacement = .top
                var attributedString = AttributedString.init(stringLiteral: element.titleLabel?.text ?? "")
                attributedString.font = .systemFont(ofSize: 10)
                config.attributedTitle = attributedString
                config.imagePadding = 10
                element.configuration = config
            } else {
                
            }
        }
    }
    

    func setText(stringName: String?, stringMention: String?) {
        nameLabel.text = stringName ?? "익명"
        mentionLabel.text = stringMention ?? ""
    }

}
