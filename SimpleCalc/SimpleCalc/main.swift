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
        if args[1] == "+" {
            result = args[0] + args[2]
        }
        else if args[1] == "-" {
            result = args[0] - args[2]
        }
        else if args[1] == "/" {
            result = args[0] / args[2]
        }
        else if args[1] == "*" {
            result = args[0] * args[2]
        }
        else if args[1] == "%" {
            if args[2] > args[0] {
                result = args[0]
            }
            else if args[2] = args[0] {
                result = 0
            }
            else {
                var base = args[2]
                while base < args[0] {
                    base += args[2]
                }
                result = base - args[0]
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

