//
//  main.swift
//  swift_basic
//
//  Created by Олег on 24.08.2021.
//

import Foundation


enum Engine{
    case Start
    case Stop
}
enum Window {
    case Open
    case Close
}
enum Goods{
    case Load(_ volume: Double)
    case Unload(_ volume: Double)
}
enum CarAction {
    case Engine(_ action: Engine)
    case Window(_ action: Window)
    case Goods(_ action: Goods)
}


struct SportCar {
    var marka: String
    var year: Int
    var budyVolume: Double
    var engineIsRunning = false
    var windowIsOpen = false
    var loaded = 0.0
    
    init(marka: String, year: Int, budyVolume: Double){
        self.marka = marka
        self.year = year
        self.budyVolume = budyVolume
    }
    
    func showState(){
        print("Легковушка \(marka)\n от \(year)\n с объемом кузова \(budyVolume)\n заведена: \(engineIsRunning)\n окна открыты: \(windowIsOpen)\n везет груз в объеме \(loaded)")
    }
    
    mutating func changeState(_ action: CarAction) {
        switch action {
        case .Engine(let eAction):
            switch eAction {
            case .Start where !self.engineIsRunning:
                self.engineIsRunning = true
            case .Stop:
                self.engineIsRunning = false
            default:
                break
            }
        case .Window(let wAction):
            switch wAction {
            case .Open:
                self.windowIsOpen = true
            case .Close:
                self.windowIsOpen = false
            }
        case .Goods(let gAction):
            switch gAction {
            case .Load(let vol):
                self.loaded += vol
            case .Unload(let vol):
                self.loaded -= vol
            }
        }
    }
}


struct TrunkCar {
    var marka: String
    var year: Int
    var engineIsRunning = false
    var windowIsOpen = false
    var trunkVolume: Double
    var loaded = 0.0
    
    init(marka: String, year: Int, trunkVolume: Double){
        self.marka = marka
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    func showState(){
        print("Грузовик \(marka)\n от \(year)\n с объемом кузова \(trunkVolume)\n заведена: \(engineIsRunning)\n окна открыты: \(windowIsOpen)\n везет груз в объеме \(loaded)")
    }
    
    mutating func changeState(_ action: CarAction) {
        switch action {
        case .Engine(let eAction):
            switch eAction {
            case .Start where !self.engineIsRunning:
                self.engineIsRunning = true
            case .Stop:
                self.engineIsRunning = false
            default:
                break
            }
        case .Window(let wAction):
            switch wAction {
            case .Open:
                self.windowIsOpen = true
            case .Close:
                self.windowIsOpen = false
            }
        case .Goods(let gAction):
            switch gAction {
            case .Load(let vol):
                self.loaded += vol
            case .Unload(let vol):
                self.loaded -= vol
            }
        }
    }
}

var car1 = SportCar(marka: "Вжигули", year: 1980, budyVolume: 200)
var car2 = SportCar(marka: "Вжигули", year: 1980, budyVolume: 200)
var car3 = TrunkCar(marka: "Зил", year: 1980, trunkVolume: 1200)
var car4 = TrunkCar(marka: "Камаз", year: 1980, trunkVolume: 2000)

car1.showState()
car2.showState()
car3.showState()
car4.showState()

car1.changeState(.Engine(.Start))
car1.changeState(.Window(.Open))

car2.changeState(.Goods(.Load(300)))

car3.changeState(.Goods(.Unload(1500)))

car1.showState()
car2.showState()
car3.showState()
car4.showState()
