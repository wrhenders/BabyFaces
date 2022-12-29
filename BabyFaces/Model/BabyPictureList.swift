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
        BabyPicture(id: 1, emotion: .curious, img: "angry1"),
        BabyPicture(id: 2, emotion: .happy, img: "happy1"),
        BabyPicture(id: 3, emotion: .upset, img: "sad1"),
        BabyPicture(id: 4, emotion: .surprised, img: "1"),
        BabyPicture(id: 5, emotion: .happy, img: "2"),
        BabyPicture(id: 6, emotion: .surprised, img: "3"),
        BabyPicture(id: 7, emotion: .joyful, img: "4"),
        BabyPicture(id: 8, emotion: .delighted, img: "5"),
        BabyPicture(id: 9, emotion: .sad, img: "6")
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
