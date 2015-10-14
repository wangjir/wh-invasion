//
//  Constants.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation


enum RACE {
    case CHAOS, DARKELF, DWARF, EMPIRE, HIGHELF, ORC
    func simpleDescription() -> String {
        switch self {
        case .CHAOS:
            return "Chaos"
        case .DARKELF:
            return "Dark Elf"
        case .DWARF:
            return "Dwarf"
        case .EMPIRE:
            return "Empire"
        case .HIGHELF:
            return "High Elf"
        case .ORC:
            return "Orc"
        }
    }
    static func all() -> [RACE] {
        return [CHAOS, DARKELF, DWARF, EMPIRE, HIGHELF, ORC]
    }
}

enum CARD_TYPE {
    case LEGEND, UNIT, SUPPORT, TACTIC, QUEST
    func simpleDescription() -> String {
        switch self {
        case .LEGEND:
            return "Legend"
        case .UNIT:
            return "Unit"
        case .SUPPORT:
            return "Support"
        case .TACTIC:
            return "Tactic"
        case .QUEST:
            return "Quest"
        }
    }
    static func all() -> [CARD_TYPE] {
        return [LEGEND, UNIT, SUPPORT, TACTIC, QUEST]
    }
}

