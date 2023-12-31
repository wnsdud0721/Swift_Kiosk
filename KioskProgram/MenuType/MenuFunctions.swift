//
//  MenuFunction.swift
//  KioskProgram
//
//  Created by (^ㅗ^)7 iMac on 2023/07/25.
//

import Foundation

class MenuFunctions: MenuType {
    let orderType = OrderType()
    let itemType = ItemType()
    let menuType = MenuType()
    
    let singleMenuList = SingleMenuFunc()
    let setMenuList = SetMenuFunc()
    let otherMenuList = OtherMenu()
    
    let paymentFunction = PaymentFunction()
    
    let basketFunctions = BasketFunctions()
    
    let orderNumber = OrderNumber()
    

    override func showBurgerMenu() {
        print("\n[ 버거 \(itemType.itemType == "단품" ? "단품" : "세트") 메뉴 ]")
        if itemType.itemType == "단품" {
            for (index, burger) in singleMenuList.singleBurgerList.enumerated() {
                let y = String(repeating: "　", count: 15 - burger.name.count)
                print(String(format:"%2d. %@"  ,index + 1, burger.name) + y + "| ₩ " + formatter(from: burger.price))
            }
        }
        else {
            for (index, burger) in setMenuList.setBurgerList.enumerated() {
                let y = String(repeating: "　", count: 15 - burger.name.count)
                print(String(format:"%2d. %@"  ,index + 1, burger.name) + y + "| ₩ " + formatter(from: burger.price))
            }
        }
        print("0. 뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    func formatter(from number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        let convertFormatter = formatter.string(from: NSNumber(value: number))!

        return convertFormatter
    }
    
    override func showMcMorningMenu() {
        print("\n[ 맥 모닝 \(itemType.itemType == "단품" ? "단품" : "세트") 메뉴 ]")
        if itemType.itemType == "단품" {
            for (index, morning) in singleMenuList.singleMcMorningList.enumerated() {
                let y = String(repeating: "　", count: 15 - morning.name.count)
                print(String(format:"%2d. %@"  ,index + 1, morning.name) + y + "| ₩ " + formatter(from: morning.price))
            }
        }
        else {
            for (index, morning) in setMenuList.setMcMorningList.enumerated() {
                let y = String(repeating: "　", count: 15 - morning.name.count)
                print(String(format:"%2d. %@"  ,index + 1, morning.name) + y + "| ₩ " + formatter(from: morning.price))
            }
        }
        print("0. 뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showCoffeeMenu() {
        print("\n[ 맥카페 메뉴 ]")
        for (index, coffee) in otherMenuList.coffeMenuList.enumerated() {
            let y = String(repeating: "　", count: 15 - coffee.name.count)
            print(String(format:"%2d. %@"  ,index + 1, coffee.name) + y + "| ₩ " + formatter(from: coffee.price))
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showDrinkMenu() {
        print("\n[ 음료 메뉴 ]")
        for (index, drink) in otherMenuList.drinkMenuList.enumerated() {
            let y = String(repeating: "　", count: 15 - drink.name.count)
            print(String(format:"%2d. %@"  ,index + 1, drink.name) + y + "| ₩ " + formatter(from: drink.price))
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showSideMenu() {
        print("\n[ 스낵과 사이드 메뉴 ]")
        for (index, side) in otherMenuList.sideMenuList.enumerated() {
            let y = String(repeating: "　", count: 15 - side.name.count)
            print(String(format:"%2d. %@"  ,index + 1, side.name) + y + "| ₩ " + formatter(from: side.price))
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showDessertMenu() {
        print("\n[ 디저트 메뉴 ]")
        for (index, dessert) in otherMenuList.dessertMenuList.enumerated() {
            let y = String(repeating: "　", count: 15 - dessert.name.count)
            print(String(format:"%2d. %@"  ,index + 1, dessert.name) + y + "| ₩ " + formatter(from: dessert.price))
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func mainMenu() {
        print("\n[ 메인 메뉴 ]")
        print("1. Burger")
        print("2. McMorning")
        print("3. Coffee")
        print("4. Drink")
        print("5. Side")
        print("6. Dessert")
        print("7. 장바구니")
        print("0. 종료하기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func displayInfo() {
        print("\"McDonalds에 오신걸 환영합니다\"")
        print(String(repeating: "=", count: 30))
        orderType.chooseOrderType()
        if let orderTypeInt = Int(readLine() ?? "") {
            if orderTypeInt == 1 {
                orderType.orderType = "매장"
            }
            else if orderTypeInt == 2 {
                orderType.orderType = "포장"
            }
            else {
                print("올바른 번호를 입력해주세요")
            }
        }
        
        while true {
            var basket = [Any]()
            mainMenu()
            if let mainInt = Int(readLine() ?? "") {
                switch mainInt { 
                case 1:
                    itemType.chooseItemType()
                    if let itemTypeInt = Int(readLine() ?? "") {
                        switch itemTypeInt {
                        case 1:
                            itemType.itemType = "단품"
                            showBurgerMenu()
                            let input = Int(readLine() ?? "")
                            if input ?? 0 > 0, input ?? 0 <= singleMenuList.singleBurgerList.count {
                                basket.append(singleMenuList.singleBurgerList[(input ?? 0) - 1].name)
                                basket.append(singleMenuList.singleBurgerList[(input ?? 0) - 1].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                                
                                continue
                            }
                            else if input == 0 {
                                continue
                            }
                            else {
                                print("올바른 번호를 입력해주세요")
                            }
                        case 2:
                            itemType.itemType = "세트"
                            showBurgerMenu()
                            let input = Int(readLine() ?? "")
                            if input ?? 0 > 0, input ?? 0 <= setMenuList.setBurgerList.count {
                                basket.append(setMenuList.setBurgerList[(input ?? 0) - 1].name)
                                basket.append(setMenuList.setBurgerList[(input ?? 0) - 1].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                                
                                continue
                            }
                            else if input == 0 {
                                continue
                            }
                            else {
                                print("올바른 번호를 입력해주세요")
                            }
                        case 0:
                            print("뒤로가기")
                            continue
                        default:
                            print("올바른 번호를 입력해주세요")
                        }
                    }
                case 2:
                    itemType.chooseItemType()
                    if let itemTypeInt = Int(readLine() ?? "") {
                        switch itemTypeInt {
                        case 1:
                            itemType.itemType = "단품"
                            showMcMorningMenu()
                            let input = Int(readLine() ?? "")
                            if input ?? 0 > 0, input ?? 0 <= singleMenuList.singleMcMorningList.count {
                                basket.append(singleMenuList.singleMcMorningList[(input ?? 0) - 1].name)
                                basket.append(singleMenuList.singleMcMorningList[(input ?? 0) - 1].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                                
                                continue
                            }
                            else if input == 0 {
                                continue
                            }
                            else {
                                print("올바른 번호를 입력해주세요")
                            }
                        case 2:
                            itemType.itemType = "세트"
                            showMcMorningMenu()
                            let input = Int(readLine() ?? "")
                            if input ?? 0 > 0, input ?? 0 <= setMenuList.setMcMorningList.count {
                                basket.append(setMenuList.setMcMorningList[(input ?? 0) - 1].name)
                                basket.append(setMenuList.setMcMorningList[(input ?? 0) - 1].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                                
                                continue
                            }
                            else if input == 0 {
                                continue
                            }
                            else {
                                print("올바른 번호를 입력해주세요")
                            }
                        case 0:
                            print("뒤로가기")
                            continue
                        default:
                            print("올바른 번호 입력")
                        }
                    }
                case 3:
                    showCoffeeMenu()
                    let input = Int(readLine()!) ?? 0
                    if input > 0, input <= otherMenuList.coffeMenuList.count {
                        basket.append(otherMenuList.coffeMenuList[(input ?? 0) - 1].name)
                        basket.append(otherMenuList.coffeMenuList[(input ?? 0) - 1].price)
                        basket.append(1)
                        basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                        continue
                    }
                    else if input == 0 {
                        continue
                    }
                    else {
                        print("올바른 번호를 입력해주세요")
                    }
                case 4:
                    showDrinkMenu()
                    let input = Int(readLine()!) ?? 0
                    if input > 0, input <= otherMenuList.drinkMenuList.count {
                        basket.append(otherMenuList.drinkMenuList[(input ?? 0) - 1].name)
                        basket.append(otherMenuList.drinkMenuList[(input ?? 0) - 1].price)
                        basket.append(1)
                        basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                        continue
                    }
                    else if input == 0 {
                        continue
                    }
                    else {
                        print("올바른 번호를 입력해주세요")
                    }
                case 5:
                    showSideMenu()
                    let input = Int(readLine()!) ?? 0
                    if input > 0, input <= otherMenuList.sideMenuList.count {
                        basket.append(otherMenuList.sideMenuList[(input ?? 0) - 1].name)
                        basket.append(otherMenuList.sideMenuList[(input ?? 0) - 1].price)
                        basket.append(1)
                        basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                        continue
                    }
                    else if input == 0 {
                        continue
                    }
                    else {
                        print("올바른 번호를 입력해주세요")
                    }
                case 6:
                    showDessertMenu()
                    let input = Int(readLine()!) ?? 0
                    if input > 0, input <= otherMenuList.dessertMenuList.count {
                        basket.append(otherMenuList.dessertMenuList[(input ?? 0) - 1].name)
                        basket.append(otherMenuList.dessertMenuList[(input ?? 0) - 1].price)
                        basket.append(1)
                        basketFunctions.appendProduct(basket: basket, orderType: orderType.orderType)
                        continue
                    }
                    else if input == 0 {
                        continue
                    }
                    else {
                        print("올바른 번호를 입력해주세요")
                    }
                case 7:
                    basketFunctions.baksetOption()
                    let inputOption = Int(readLine() ?? "0")
                    switch inputOption {
                    case 1:
                        basketFunctions.removeProduct()
                        continue
                    case 2:
                        basketFunctions.removeEverything()
                        continue
                    case 3:
                        print("\n[결제 메뉴]")
                        print(String(repeating: "=", count: 30))
                        print("[총 결제금액은 ₩ \(formatter(from: basketFunctions.total))입니다.]")
                        print("[주문 목록]")
                        for i in 0..<basketList.count {
                            print("\(basketList[i][0])---₩ \(formatter(from:basketList[i][1] as! Int))---\(basketList[i][2])")
                        }
                        print(String(repeating: "=", count: 30))
                        paymentFunction.showList()
                        print("\n번호를 입력해 주세요:",terminator: " ")
                        var input = readLine()!
                        paymentFunction.navigatorFunction(input: input, orderType: orderType.orderType, items: basketList)
                        continue
                    case 0:
                        continue
                    default:
                        print("올바른 값을 입력해 주세요.")
                        continue
                    }
                case 0:
                    print("프로그램을 종료합니다")
                    return
                default :
                    print("올바른 번호를 입력해주세요")
                    break
                }
            }
        }
    }
}

