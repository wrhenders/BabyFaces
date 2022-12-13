//
//  BabyFacesApp.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import SwiftUI

@main
struct BabyFacesApp: App {
    @State var allPictures: BabyPictureList = BabyPictureList()
    
    var body: some Scene {
        WindowGroup {
            MainView(pictureList: $allPictures)
        }
    }
}
