//
//  BabyPictureList.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import Foundation
import SwiftUI

struct BabyPictureList {
    var pictureList: [BabyPicture] = [
        BabyPicture(id: 1, emotion: .angry, img: "angry1"),
        BabyPicture(id: 2, emotion: .happy, img: "happy1"),
        BabyPicture(id: 3, emotion: .sad, img: "sad1")
    ]
    var currentPictureIndex = 0
    var currentPicture: BabyPicture
    
    init() {
        pictureList = pictureList.shuffled()
        self.currentPicture = pictureList[0]
    }
    
    mutating func nextPicture() {
        if pictureList.indices.contains(currentPictureIndex + 1) {
            currentPictureIndex += 1
        } else {
            currentPictureIndex = 0
            pictureList = pictureList.shuffled()
        }
        currentPicture = pictureList[currentPictureIndex]
    }
}
