//
//  计算器.swift
//  计算器 iOS 版本
//
//  Created by R0uter on 15/8/12.
//  Copyright © 2015年 R0uter. All rights reserved.
//

/*
至少界面出来了……
*/

import Foundation

struct calculation {
    private var Currentalgorithm:algorithm = .Nochoice
    
    
    mutating func Setcurrentalgorithm(temporary:algorithm) {
        Currentalgorithm = temporary
    }
    
    func Readthecurrentalgorithm() -> algorithm! {
        return Currentalgorithm
    }
    
    
    
    
    enum algorithm {
        case addition
        case subtraction
        case multiplication
        case division
        case pingfang
        case zhishumi
        case Nochoice
    }
    
    func Resultseeking(Operationnumber:Double, Operandoperand:Double) ->String {
        var revert = ""
        switch Currentalgorithm {
        case .addition:
            revert = "\(Operationnumber + Operandoperand)"
        case .subtraction:
            revert = "\(Operationnumber - Operandoperand)"
        case .multiplication:
            revert = "\(Operationnumber * Operandoperand)"
        case .division where Operandoperand != 0 :
            revert = "\(Operationnumber / Operandoperand)"
        case .pingfang:
           revert = "\(Operationnumber * Operationnumber)"
        case .zhishumi:
            var temporary = Operationnumber
            let intOperandoperand = Int(Operandoperand)
            for _ in 1..<intOperandoperand {
                temporary *= Operationnumber
            }
           revert = "\(temporary)"
        case .Nochoice:
            revert = "未选择算法！"
        default:
            revert = "0 不能做被除数！"
            
        }
        return revert
        
    }
}