//
//  Sign.swift
//  Rock Scissors and Paper
//
//  Created by Dmitry Alexandrovich on 13.04.22.
//

import Foundation
import GameplayKit

let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors}
}

enum Sign {
    case rock, paper, scissors

    var emoji: String {
        switch self {
        case .paper:
            return "✋"
        case.rock:
            return "👊"
        case.scissors:
            return "✌️"
        }
    }

    func takeTurn(_ oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
            (.paper, .rock),
            ( .scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
    
//    func getResult(_oposite:Sign) -> GameState {
//        switch self {
//        case.rock:
//            switch _oposite {
//            case .rock:
//                return .draw
//            case .paper:
//                return.lose
//            case .scissors:
//                return.win
//            }
//        case.paper:
//            switch _oposite {
//            case .rock:
//                return .win
//            case .paper:
//                return.draw
//            case .scissors:
//                return.lose
//            }
//        case.scissors:
//            switch _oposite {
//            case .rock:
//                return .lose
//            case .paper:
//                return.win
//            case .scissors:
//                return.draw
//            }
//        }
//    }



