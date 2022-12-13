//
//  ContentView.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import SwiftUI

struct MainView: View {
    @Binding var pictureList: BabyPictureList
    @State private var animate = false
    
    
    var body: some View {
        GeometryReader {proxy in
            ZStack {
                Image(pictureList.currentPicture.img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                AnimatedText(pictureList.currentPicture.emotion.title)
                    .foregroundColor(pictureList.currentPicture.emotion.color)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 40)
                    .id(pictureList.currentPicture.id)
                RoundedRectangle(cornerRadius: 55)
                    .strokeBorder(pictureList.currentPicture.emotion.color, lineWidth: 10)
                    .frame(width: proxy.size.width)
            }
            .frame(width: proxy.size.width)
            .onTapGesture {
                withAnimation(.easeInOut){
                    pictureList.nextPicture()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    struct BindingTestHolder: View {
        @State var pictureList = BabyPictureList()
        var body: some View {
            MainView(pictureList: $pictureList)
        }
    }
    static var previews: some View {
        BindingTestHolder()
    }
}
