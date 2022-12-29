//
//  BabyEmotions.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import SwiftUI

enum BabyEmotion: String {
    case angry
    case happy
    case sad
    case silly
    case sleepy
    case surprised
    case excited
    case upset
    case ecstatic
    case joyful
    case relaxed
    case delighted
    case curious
    
    var color: Color {
        switch self {
        case .angry, .upset:
            return Color.red
        case .happy, .joyful, .delighted, .ecstatic:
            return Color.green
        case .sad:
            return Color.blue
        case .silly, .excited:
            return Color.cyan
        case .sleepy, .relaxed:
            return Color.indigo
        case .surprised, .curious:
            return Color.mint
        }
    }
    
    var title: String {
        return rawValue.capitalized
    }
}
