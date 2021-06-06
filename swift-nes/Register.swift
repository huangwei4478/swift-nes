//
//  Register.swift
//  swift-nes
//
//  Created by huangwei on 2021/6/6.
//

import Foundation

struct Register {
    
    enum BitMask: UInt8 {
        case value      = 0b00000111
        case state      = 0b00011000
        case switch1    = 0b00100000
        case switch2    = 0b01000000
        case unused     = 0b10000000
    }
    
    var rawValue: UInt8
    
    var value: UInt8 {
        get { get(.value) }
        set { set(.value, with: newValue) }
    }
    
    var state: UInt8 {
        get { get(.state) }
        set { set(.state, with: newValue)}
    }
    
    var switch1: UInt8 {
        get { get(.switch1) }
        set { set(.switch1, with: newValue) }
    }
    
    var switch2: UInt8 {
        get { get(.switch2) }
        set { set(.switch2, with: newValue) }
    }
    
    var unused: UInt8 {
        get { get(.unused) }
        set { set(.unused, with: newValue) }
    }
    
    @inlinable func get(_ bitMask: BitMask) -> UInt8 {
        return rawValue & bitMask.rawValue
    }
    
    @inlinable mutating func set(_ bitMask: BitMask, with value: UInt8) {
        rawValue |= (value & bitMask.rawValue)
    }
}
