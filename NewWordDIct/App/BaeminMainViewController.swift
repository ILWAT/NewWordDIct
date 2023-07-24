//
//  BaeminMainViewController.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/23.
//

import UIKit

class BaeminMainViewController: UIViewController {
    @IBOutlet var buttonViw: [UIView]!
    @IBOutlet var buttonTitle: [UILabel]!
    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonUI()
        
        print("SeSAC")
    }
    
    
    func setUI(){
        
    }
    
    func setButtonUI(){
        for view in buttonViw {
            view.layer.cornerRadius = 10
            view.clipsToBounds = true
        }
        for label in buttonTitle {
            label.font = .boldSystemFont(ofSize: 15)
        }
        
        for button in buttons{
            button.setTitle("", for: .normal)
        }
    }

}
