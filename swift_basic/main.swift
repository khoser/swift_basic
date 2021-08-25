//
//  main.swift
//  swift_basic
//
//  Created by Олег on 24.08.2021.
//

import Foundation

//task 1
print("Task 1:")

let a: Double = 1
let b: Double = 0
let c: Double = -1

let d = b * b - 4 * a * c

if d < 0 {
    print("Нет решения - дискриминант отрицательный: \(d)")
} else if a == 0 {
    if b == 0 {
        print("Решения нет")
    } else {
        let x = -c/b
        print("Это не квадратное уравнение. x = \(x)")
    }
} else if d == 0 {
    let x: Double = 0 - b / 2 / a
    print("x = \(x)")
} else {
    let x1: Double = (0 - b + sqrt(d)) / 2 / a
    let x2: Double = (0 - b - sqrt(d)) / 2 / a
    print("D = \(d)\nx1 = \(x1)\nx2 = \(x2)")
}

//task 2
print("\nTask 2:")

let ab: Double = 3
let ac: Double = 4

let square: Double = ab*ac/2
let bc: Double = sqrt(ab*ab + ac*ac)
let perimeter: Double = ab+bc+ac
    
print("Площадь = \(square)\nПериметр = \(perimeter)\nГипотенуза = \(bc)")

//task 3
print("\nTask 3:")

let sum: Double = 100000
let percent: Double = 3
let years: Double = 5

// Будем считать как капитализацию процентов каждый день.
let capitalisationPeriods: Double = 365  //считаю все годы не високосными для простоты

//эффективная ставка будет такой
let es: Double = (pow((1 + percent / 100 / capitalisationPeriods) , capitalisationPeriods * years) - 1) * 100 * years

let result: Double = round(sum + sum * es / 100)
print("Через \(years) лет сумма будет \(result)")
