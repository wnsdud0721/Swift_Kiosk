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
    
    let singleMenuList = SingMenuFunc()
    let setMenuList = SetMenuFunc()
    let otherMenuList = OtherMenu()
    
    let basketFunctions = BasketFunctions()
    
    var basket = [Any]()
    
    
    override func showBurgerMenu() {
        print("\n[ 버거 \(itemType.itemType == "단품" ? "단품" : "세트") 메뉴 ]")
        if itemType.itemType == "단품" {
            for (index, burger) in singleMenuList.singleBurgerList.enumerated() {
                
                print("\(index + 1). \(burger.name)     | W \(burger.price)")
            }
        }
        else {
            for (index, burger) in setMenuList.setBurgerList.enumerated() {
                print("\(index + 1). \(burger.name)     | W \(burger.price)")
            }
        }
        print("0. 뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showMcMorningMenu() {
        print("\n[ 맥 모닝 \(itemType.itemType == "단품" ? "단품" : "세트") 메뉴 ]")
        if itemType.itemType == "단품" {
            for (index, morning) in singleMenuList.singleMcMorningList.enumerated() {
                print("\(index + 1). \(morning.name)     | W \(morning.price)")
            }
        }
        else {
            for (index, morning) in setMenuList.setMcMorningList.enumerated() {
                print("\(index + 1). \(morning.name)     | W \(morning.price)")
            }
        }
        print("0. 뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
        
    }
    
    override func showCoffeeMenu() {
        print("\n[ 맥카페 메뉴 ]")
        for (index, coffee) in otherMenuList.coffeMenuList.enumerated() {
            print("\(index + 1). \(coffee.name)     | W \(coffee.price)")
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showDrinkMenu() {
        print("\n[ 음료 메뉴 ]")
        for (index, drink) in otherMenuList.drinkMenuList.enumerated() {
            print("\(index + 1). \(drink.name)      | W \(drink.price)")
        }
        print("뒤로가기")
        print("\n번호를 입력해주세요: ", terminator: "")
    }
    
    override func showSideMenu() {
        print("\n[ 스낵과 사이드 메뉴 ]")
        for (index, side) in otherMenuList.sideMenuList.enumerated() {
            print("\(index + 1). \(side.name)       | W \(side.price)")
        }
    }
    
    override func showDessertMenu() {
        print("\n[ 디저트 메뉴 ]")
        for (index, dessert) in otherMenuList.dessertMenuList.enumerated() {
            print("\(index + 1). \(dessert.name)     | W \(dessert.price)")
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
        print("0. 뒤로가기")
        print("\n 번호를 입력해주세요: ", terminator: "")
    }
    
    override func displayInfo() {
        while true {
            print("\"McDonalds에 오신걸 환영합니다\"")
            print(String(repeating: "=", count: 30))
            orderType.chooseOrderType()
            if let orderTypeInt = Int(readLine() ?? "") {
                switch orderTypeInt {
                case 1:
                    orderType.chooseItemType()
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
                                    var input = Int(readLine()!) ?? 0
                                    
                                    if input - 1 == -1 {
                                        input = 0
                                    } else {
                                        input = input - 1
                                        basket.append(singleMenuList.singleBurgerList[input].name)
                                        basket.append(singleMenuList.singleBurgerList[input].price)
                                        basket.append(1) //수량
                                        basketFunctions.appendProduct(basket: basket)
                                    }
                                    
                                    
                                case 2:
                                    itemType.itemType = "세트"
                                    showBurgerMenu()
                                    var input = Int(readLine()!) ?? 0
                                    
                                    if input - 1 == -1 {
                                        input = 0
                                    } else {
                                        input = input - 1
                                        basket.append(setMenuList.setBurgerList[input].name)
                                        basket.append(setMenuList.setBurgerList[input].price)
                                        basket.append(1) //수량
                                        basketFunctions.appendProduct(basket: basket)
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
                                    var input = Int(readLine()!) ?? 0
                                    
                                    if input - 1 == -1 {
                                        input = 0
                                    } else {
                                        input = input - 1
                                        basket.append(singleMenuList.singleMcMorningList[input].name)
                                        basket.append(singleMenuList.singleMcMorningList[input].price)
                                        basket.append(1) //수량
                                        basketFunctions.appendProduct(basket: basket)
                                    }
                                case 2:
                                    itemType.itemType = "세트"
                                    showMcMorningMenu()
                                    var input = Int(readLine()!) ?? 0
                                    
                                    if input - 1 == -1 {
                                        input = 0
                                    } else {
                                        input = input - 1
                                        basket.append(setMenuList.setMcMorningList[input].name)
                                        basket.append(setMenuList.setMcMorningList[input].price)
                                        basket.append(1) //수량
                                        basketFunctions.appendProduct(basket: basket)
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
                            var input = Int(readLine()!) ?? 0
                            
                            if input - 1 == -1 {
                                input = 0
                            } else {
                                input = input - 1
                                basket.append(CoffeeMenu.coffeeMenuList[input].name)
                                basket.append(CoffeeMenu.coffeeMenuList[input].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket)
                            }
                        case 4:
                            showDrinkMenu()
                            var input = Int(readLine()!) ?? 0
                            
                            if input - 1 == -1 {
                                input = 0
                            } else {
                                input = input - 1
                                basket.append(DrinkMenu.drinkMenuList[input].name)
                                basket.append(DrinkMenu.drinkMenuList[input].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket)
                            }
                        case 5:
                            showSideMenu()
                            var input = Int(readLine()!) ?? 0
                            
                            if input - 1 == -1 {
                                input = 0
                            } else {
                                input = input - 1
                                basket.append(SideMenu.sideMenuList[input].name)
                                basket.append(SideMenu.sideMenuList[input].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket)
                            }
                        case 6:
                            showDessertMenu()
                            var input = Int(readLine()!) ?? 0
                            
                            if input - 1 == -1 {
                                input = 0
                            } else {
                                input = input - 1
                                basket.append(DessertMenu.dessertMenuList[input].name)
                                basket.append(DessertMenu.dessertMenuList[input].price)
                                basket.append(1) //수량
                                basketFunctions.appendProduct(basket: basket)
                            }
                        case 7:
                            print("장바구니")
                            print(String(repeating: "=", count: 30))
                            basketFunctions.showCurrentBasket()
                            
                        case 0:
                            print("뒤로가기")
                            continue
                        default :
                            print("올바른 번호를 입력해주세요")
                        }
                    }
                    return
                case 2:
                    orderType.orderType = "포장"
                    mainMenu()
                    if let mainInt = Int(readLine() ?? "") {
                        switch mainInt {
                            
                        case 1:
                            itemType.chooseItemType()
                        case 2:
                            itemType.chooseItemType()
                            
                        case 3:
                            print("장바구니")
                            
                            basketFunctions.showCurrentBasket()
                            
                        case 0:
                            print("뒤로가기")
                            continue
                        default :
                            print("올바른 번호를 입력해주세요")
                        }
                    }
                case 0:
                    print("주문을 종료합니다")
                    return
                default:
                    print("올바른 번호를 입력해주세요")
                }
            }
        }
        
    }
    
}

