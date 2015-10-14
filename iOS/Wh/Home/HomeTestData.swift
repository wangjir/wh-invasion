//
//  HomeTestData.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class TestNum {
    var num: Int
    init(num: Int) {
        self.num = num
    }
    
    func TriNum() -> Int {
        return num * 3
    }
}

enum TestEnum {
    case SCHOOL, OFFICE
    func simpleDescription() -> String {
        switch self {
        case .SCHOOL:
            return "School"
        case .OFFICE:
            return "Office"
        }
    }
    static func all() -> [TestEnum] {
        return [SCHOOL, OFFICE]
    }
}

enum TestEnum2 {
    case CAR, BUS
    func simpleDescription() -> String {
        switch self {
        case .CAR:
            return "Car"
        case .BUS:
            return "BUS"
        }
    }
    static func all() -> [TestEnum2] {
        return [CAR, BUS]
    }
}


class HomeTestData {
    var numberOfSides: Int = 2
    var name: String
    
    init(name: String) {
        self.name = name
        
        setupValue(name)
    }
    
    func setupValue(name: String) {
        self.name = name
        
    }
    
    func simple() -> String {
        /*
        let x = [
            TestNum(num: 3),
            TestNum(num: 4),
            TestNum(num: 2)
        ]
        let y = x.reduce(0) { $1.TriNum() + $0 }
        */
        let x = TestEnum.all()
        
        return "Hello:\(x) sides \(name). "
    }
}


