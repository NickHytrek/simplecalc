//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var result = 0
        if args[args.count - 1] == "count" {
            result = args.count - 1
        }
        else if args[args.count - 1] == "avg" {
            if args.count - 1 == 0 {
                result = 0
            }
            else {
                var i = 0
                var sum = 0
                while i < args.count - 1 {
                    let arg = (args[i] as NSString).integerValue
                    sum = sum + arg
                    i = i + 1
                }
                result = sum / i
            }

        }
        else if args[args.count - 1] == "fact" {
            if (args.count == 1) {
                result = 0
            }
            else {
                var i = 1
                var total = 1
                let count = (args[i - 1] as NSString).integerValue
                while i <= count {
                    total = total * i
                    i = i + 1
                }
                result = total
            }

        }
        else {
            let firstNum = (args[0] as NSString).integerValue
            let secondNum = (args[2] as NSString).integerValue
            if args[1] == "+" {
                result = firstNum + secondNum
            }
            else if args[1] == "-" {
                result = firstNum - secondNum
            }
            else if args[1] == "/" {
                result = firstNum / secondNum
            }
            else if args[1] == "*" {
                result = firstNum * secondNum
            }
            else if args[1] == "%" {
                if secondNum > firstNum {
                    result = firstNum
                }
                else if secondNum == firstNum {
                    result = 0
                }
                else {
                    var base = secondNum
                    while base < firstNum {
                        base += secondNum
                    }
                    result = base - firstNum
                }
            }
        }
        
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

