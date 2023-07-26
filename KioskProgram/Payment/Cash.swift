//
//  Cash.swift
//  KioskProgram
//
//  Created by (^ㅗ^)7 iMac on 2023/07/24.
//

import Foundation

// 현금
class Cash: Payment {
    
    // 결제방식 선택여부
    override func choosePayment(input: String) {
        switch input {
        case "1":
            print("현금 결제")
            return
        case "2":
            print("현금 결제 취소")
            return
        default:
            print("잘못된 번호 선택하셨습니다.")
            return
        }
    }
    
    // 결제방식 보여주는 함수
    override func checkListUserPayment() {
        print("[현금 결제 페이지입니다.]")
        let dic = ["1":"현금 결제완료", "2":"현금 결제 취소"]
        dic.sorted { $0 < $1 }.forEach { print("\($0.key). \($0.value)")}
    }
    
}
