//
//  main.swift
//  swift_basic
//
//  Created by Олег on 24.08.2021.
//
//lesson 2

import Foundation


//Task 1
func isEven(_ val : Int) -> Bool {
    return val % 2 == 0
}

print(isEven(2))
print(isEven(3))


//Task 2
//я помню правило - если сложить цыфры и получить 3,6 или 9, то число делится на 3 без остатка! Поэтому и спрашивал про символы строки - оказалось есть перебор! метод сложный, но я попрактикуюсь:
func sumSymbol(_ val: Int) -> Int {
    var result = 0
    for character in String(val) {
        result += Int(String(character))!
    }
    return result
}
func isThreeven(_ val : Int) -> Bool {
    var checked = val
    repeat {
        checked = sumSymbol(checked)
    } while checked != sumSymbol(checked)
    return checked == 3 || checked == 6 || checked == 9
    //return val % 3 == 0
}

print(isThreeven(150))
print(isThreeven(1501))
