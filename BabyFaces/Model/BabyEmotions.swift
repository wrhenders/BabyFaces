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
    
    var color: Color {
        switch self {
        case .angry:
            return Color.red
        case .happy:
            return Color.green
        case .sad:
            return Color.blue
        case .silly:
            return Color.cyan
        case .sleepy:
            return Color.indigo
        case .surprised:
            return Color.mint
        }
    }
    
    var title: String {
        return rawValue.capitalized
    }
}
