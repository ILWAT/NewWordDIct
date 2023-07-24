//
//  DateViewController.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/20.
//

import UIKit


class DateViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet var guide400Label: UILabel!
    @IBOutlet var guide300Label: UILabel!
    @IBOutlet var guide200Label: UILabel!
    @IBOutlet var guide100Label: UILabel!
    @IBOutlet var date400Label: UILabel!
    @IBOutlet var backgroundImgView4: UIImageView!
    @IBOutlet var backgroundImgView3: UIImageView!
    @IBOutlet var date300Label: UILabel!
    @IBOutlet var date200Label: UILabel!
    @IBOutlet var backgroundImgView2: UIImageView!
    @IBOutlet var date100Label: UILabel!
    @IBOutlet var backgroundImgView: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    
    let imgArr = ["macaroon", "icecream", "doughnut", "churros", "cake"]
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDatePicker()
        applyUI()
        datePickerValueChanged(datePicker)
        
    }
    
    //MARK: - designUI
    
    func designDatePicker() {
        
//        datePicker.backgroundColor = .systemPink
        datePicker.datePickerMode = .dateAndTime
        
        if #available(iOS 14.0, *){
            datePicker.preferredDatePickerStyle = .inline
            
        } else {
            if #available(iOS 13.4, *) {
//                datePicker.preferredDatePisckerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    //MARK: - datePickerValueChanged
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        //100일 뒤를 계산
        
        let result = Calendar.current.date(byAdding: .day, value: 100, to: sender.date) //sender.date를 기준으로 100일을 계산
        let result2 = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)
        let result3 = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)
        let result4 = Calendar.current.date(byAdding: .day, value: 400, to: sender.date)
        
        print(result!)
        
        //DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        let format = DateFormatter()
        format.dateFormat = "MM월 dd일,\nyyyy년"
        
        let value = format.string(from: result!)
        print(value)
        
        date100Label.text = value
        
        date200Label.text = format.string(from: result2!)
        date300Label.text = format.string(from: result3!)
        date400Label.text = format.string(from: result4!)
        
    }
    
    //MARK: - setDateView
    
    func setDateView(imgView: UIImageView, label: UILabel, guideLabel: UILabel, days: Int) {
        
        //imgView 설정
        imgView.backgroundColor = .blue
        let imgStr = imgArr.randomElement()!
        imgView.image = UIImage(named: imgStr)
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 20
        imgView.layer.shadowColor = UIColor.black.cgColor
        imgView.layer.shadowOpacity = 0.5
        imgView.clipsToBounds = true
        imgView.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        //label 설정
        label.backgroundColor = .clear
        label.textColor = .white
//        label.layer.shadowOffset = CGSize(width: 10, height: 10)
//        label.layer.cornerRadius = 20
        label.clipsToBounds = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        label.text = ""
        
        
        
        //guideLabel 설정
        guideLabel.textColor = .white
        guideLabel.backgroundColor = .clear
        guideLabel.text = "D+\(days)"
        guideLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        //superView 그림자 설정
        imgView.superview?.layer.shadowOffset = CGSize(width: 10, height: 10)
        imgView.superview?.clipsToBounds = false
        
    }
    
    //MARK: - Helper
    
    func applyUI(){
        setDateView(imgView: backgroundImgView, label: date100Label,guideLabel: guide100Label, days: 100)
        setDateView(imgView: backgroundImgView2, label: date200Label,guideLabel: guide200Label, days: 200)
        setDateView(imgView: backgroundImgView3, label: date300Label, guideLabel: guide300Label, days: 300)
        setDateView(imgView: backgroundImgView4, label: date400Label, guideLabel: guide400Label, days: 400)
    }
    

}
