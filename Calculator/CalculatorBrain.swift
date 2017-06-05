//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by khaled on 9/10/1438 AH.
//  Copyright © 1438 K55xApps. All rights reserved.
//

import Foundation

//func multiply(op1: Double , op2: Double ) -> Double {
//    return op1 * op2
//}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum OperationType {
        
        case constant(Double)
        case unary( (Double) -> (Double) )
        case binary ( (Double,Double) -> (Double) )
        case equals
    }
    
    private var operation = [
        "π" : OperationType.constant(M_PI) ,
        "e" : OperationType.constant(M_E) ,
        "√" : OperationType.unary(sqrt) ,
        "cos": OperationType.unary(cos) ,
        "✕" : OperationType.binary( { $0 * $1 } ) ,
        "÷" : OperationType.binary( { $0 / $1 } ) ,
        "+" : OperationType.binary( { $0 + $1 } ) ,
        "-" : OperationType.binary( { $0 - $1 } ) ,
        "=" : OperationType.equals
        ]
    
    mutating func performOperation (_ symbol : String ) {
        
        if let OperationType = operation[symbol] {
            
            switch OperationType {
            case .constant(let value): accumulator = value
            case .unary(let function): if accumulator != nil { accumulator = function(accumulator!) }
            case .binary(let function): if accumulator != nil {
                pending = pendingBinary(function: function, firstOprand: accumulator!)
                accumulator = nil
                }
            case .equals: performPending()
            }
        }
        
    }
    
    private var pending : pendingBinary?
    
    private mutating func performPending() {
        
        if pending != nil && accumulator != nil {
        
        accumulator = pending?.perform(with: accumulator!)
            
        }
    }
    
    private struct pendingBinary {
        
        let function: (Double,Double) -> Double
        let firstOprand: Double
        
        func perform(with secondOperand: Double) -> Double {
            
            return function( firstOprand , secondOperand )
        }
    }
    
    mutating func setOperand (_ operand : Double ) {
        
        accumulator = operand
        
    }
    
    var result : Double? {
        
        get {
                return accumulator
        }
    }
    
    
}
