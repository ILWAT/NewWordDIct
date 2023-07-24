//
//  NewWordViewController.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/21.
//

import UIKit

class NewWordViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet var labelBackgroundView: UIView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var firstWordButton: UIButton!
    @IBOutlet var thirdWordButton: UIButton!
    @IBOutlet var secondWordButton: UIButton!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI(button: [firstWordButton, secondWordButton, thirdWordButton])
        setTextFieldUI()
        setEtcUI()
        
    }
    
    //MARK: -
    //버튼 클릭 시 텍스트필드의 텍스트에 버튼 타이틀이 들어가는 기능
    //1.
    @IBAction func tappedWordButton(_ sender: UIButton) {
        //2.
        wordTextField.text = sender.currentTitle ?? ""
//        wordTextField.text = sender.titleLabel?.text ?? ""
        tappedTextFieldKeyboard(wordTextField)
    }
    
    //3.
    @IBAction func tappedTextFieldKeyboard(_ sender: UITextField) {
        print("DidEndOnExit")
        
        //only if
        /*
        displayLabel.text = wordTextField.text
        if wordTextField.text == "별다줄"{
            displayLabel.text = "\(wordTextField.text ?? "별다줄") 뜻은 \"별거 다 줄인다\" 입니다."
        }
        if wordTextField.text == "버카충"{
            displayLabel.text = "\(wordTextField.text ?? "버카충") 뜻은 \"버스 카드 충전\" 입니다."
        }
        if wordTextField.text == "알잘딱깔센"{
            displayLabel.text = "\(wordTextField.text ?? "알잘딱깔센") 뜻은 \"알아서 잘 딱 깔끔하게 센스있게\" 입니다."
        }
        else{
            displayLabel.text = "찾는 결과가 없습니다."
        }*/
        
        
        //if-elseif
        /*if wordTextField.text == "버카충"{
            displayLabel.text = "\(wordTextField.text ?? "버카충") 뜻은 \"버스 카드 충전\" 입니다."
        }else if wordTextField.text == "별다줄"{
            displayLabel.text = "\(wordTextField.text ?? "별다줄") 뜻은 \"별거 다 줄인다\" 입니다."
        }else if wordTextField.text == "알잘딱깔센"{
            displayLabel.text = "\(wordTextField.text ?? "알잘딱깔센") 뜻은 \"알아서 잘 딱 깔끔하게 센스있게\" 입니다."
        }else{
            displayLabel.text = "찾는 결과가 없습니다."
        }*/

        //switch
        switch (wordTextField.text){
        case "별다줄":
            displayLabel.text = "\(wordTextField.text ?? "별다줄") 뜻은 \"별거 다 줄인다\" 입니다."
        case "버카충":
            displayLabel.text = "\(wordTextField.text ?? "버카충") 뜻은 \"버스 카드 충전\" 입니다."
        case "알잘딱깔센":
            displayLabel.text = "\(wordTextField.text ?? "알잘딱깔센") 뜻은 \"알아서 잘 딱 깔끔하게 센스있게\" 입니다."
        default:
            displayLabel.text = "찾는 결과가 없습니다."
            
        }
        
    }
    @IBAction func tappedSearchButton(_ sender: UIButton) {
        view.endEditing(true)
        //switch
        switch (wordTextField.text){
        case "별다줄":
            displayLabel.text = "\(wordTextField.text ?? "별다줄") 뜻은 \"별거 다 줄인다\" 입니다."
        case "버카충":
            displayLabel.text = "\(wordTextField.text ?? "버카충") 뜻은 \"버스 카드 충전\" 입니다."
        case "알잘딱깔센":
            displayLabel.text = "\(wordTextField.text ?? "알잘딱깔센") 뜻은 \"알아서 잘 딱 깔끔하게 센스있게\" 입니다."
        default:
            displayLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    //MARK: - setUI
    
    func setButtonUI(button: [UIButton]){
        for element in button {
            if #available(iOS 15.0, *) {
                var config = UIButton.Configuration.plain()
                config.baseForegroundColor = .black
                config.cornerStyle = .capsule
                config.title = element.currentTitle
                element.configuration = config
            } else {
                let attributedString = NSAttributedString(string: element.titleLabel?.text ?? "", attributes: [.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 20), .foregroundColor: UIColor.black])
                element.setAttributedTitle(attributedString, for: .normal)
                element.layer.cornerRadius = 10
                element.layer.borderColor = UIColor.black.cgColor
                element.layer.borderWidth = 1
                element.titleLabel?.adjustsFontSizeToFitWidth = true
                
            }
            
            
            
            //trouble shooting : 에러 발생의 소지가 많은 코드
            //Style이 Plain인 경우 viewDidLoad시에는 코드 설정으로 빌드되어지지만 클릭시 폰트가 스토리보드 지정 설정으로 바뀜
            //Style이 Default인 경우 폰트는 바뀌지만, 색은 변경되지 않음
            
//            element.titleLabel?.font = .systemFont(ofSize: 20)
//            element.titleLabel?.textColor = .black
            
        }
    }
    
    func setTextFieldUI(){
        wordTextField.text = getRandomWord()
        wordTextField.layer.borderWidth = 2
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.borderStyle = .roundedRect
    }
    
    func setEtcUI(){
        labelBackgroundView.layer.cornerRadius = 10
        labelBackgroundView.clipsToBounds = true
        searchButton.layer.cornerRadius = 10
    }
    
    //MARK: - Helper
    
    //@discardableResult : 함수 사용시 반환값을 무시해도 되게 만들어주는 키워드
    @discardableResult
    func getRandomWord() -> String{
        let randomStringArr = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        
        let result = randomStringArr.randomElement()!
        
        print(result)
        
        return result
    }
}
