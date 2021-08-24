//
//  main.swift
//  swift_basic
//
//  Created by Олег on 24.08.2021.
//

import Foundation

//task 1
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
