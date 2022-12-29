//
//  ContentView.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import SwiftUI

struct MainView: View {
    @Binding var pictureList: BabyPictureList
    
    @State var settings = SettingsModel()
    @State private var isPresentingSettings = false
    
    var body: some View {
        GeometryReader {proxy in
            ZStack {
                Image(pictureList.currentPicture.img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                SettingsGear(clickAction: {isPresentingSettings = true})
                    .frame(width: proxy.size.width - 75, alignment: .trailing)
                    .frame(height: proxy.size.height, alignment: .top)
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
        .sheet(isPresented: $isPresentingSettings) {
            SettingsView(settings: $settings)
            .presentationDetents([.fraction(1/3)])
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
