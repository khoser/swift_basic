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


//Task 3
var array100: Array<Int> = []
for i in 1...100 {
    array100.append(i)
}
print(array100)
print(array100[3])


//Task 4
var isEven, is3ven: Bool
for i in array100.reversed() {
    isEven = isEven(i)
    is3ven = isThreeven(i)
    print("\(i) четное: \(isEven), делится на 3:\(is3ven) - удаляем: \(isEven || !is3ven)")
    if isEven || !is3ven {
        array100.remove(at: i-1)
    }
}
print(array100)


//Task 5
func addOneFibo(_ arr: inout Array<Int>) {
    if arr.count < 2 {
        arr.removeAll()
        arr.append(0)
        arr.append(1)
    } else {
        arr.append(arr.last! + arr[arr.count - 2])
    }
}
var arrayFibo: Array<Int> = []
while arrayFibo.count < 50 {
    addOneFibo(&arrayFibo)
    print(arrayFibo)
}
print(arrayFibo.count)


//Task 6
//решил считать по-своему. не как в задаче. менее эффективно вроде бы. Но в задаче есть ошибка - если мы в пункте с будем удалять от 2+р, то при р=3 мы удалим 5, а это не верно.
func remAllDividedToTheFirst(_ arr : inout Array<Int>) {
    var k = arr.count - 1
    for i in arr.reversed() {
        if i % arr.first! == 0 {
            arr.remove(at: k)
        }
        k -= 1
    }
}

func isPrime(_ val : Int) -> Bool {
    switch val {
    case 1:
        return true
    case _ where val <= 0:
        return false
    default:
        break
    }
    var arr: Array<Int> = []
    for i in 2...val {
        arr.append(i)
    }
    var countBefore = arr.count
    for _ in 2...val {
        if countBefore == 1 && arr.last! == val {
            return true
        }
        remAllDividedToTheFirst(&arr)
        if arr.last! != val {
            return false
        }
        if countBefore == arr.count {
            return true
        }
        countBefore = arr.count
    }
    return false
}

print(isPrime(4))
array100.removeAll()
var i = 2
while array100.count < 100 {
    if isPrime(i) {
        array100.append(i)
        print(i)
    }
    i += 1
}
print(array100)
