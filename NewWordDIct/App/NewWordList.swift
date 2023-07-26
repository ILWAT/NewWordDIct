//
//  NewWordList.swift
//  NewWordDIct
//
//  Created by 문정호 on 2023/07/25.
//

import Foundation

enum newWordList: String, CaseIterable {
    case 버카충 = "버카충"
    case 분좋카 = "분좋카"
    case 알잘딱깔센 = "알잘딱깔센"
    case 별다줄 = "별다줄"
    case 킹받네 = "킹받네"
    case 캘박 = "캘박"
    case 중꺽마 = "중꺽마"
}

extension newWordList {
    func getMean() -> String{
        switch self{
        case .버카충 : return "버스 카드 충전"
        case .분좋카 : return "분위기 좋은 카페"
        case .알잘딱깔센 : return "알아서 잘 딱 깔끔하게 센스있게"
        case .별다줄 : return "별거 다 줄인다"
        case .킹받네 : return "King + 받네"
        case .캘박 : return "캘린더 박제"
        case .중꺽마 : return "중요한 것은 꺽이지 않는 마음"
        }
    }
}
