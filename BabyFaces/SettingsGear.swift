//
//  SettingsGear.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/29/22.
//

import SwiftUI

struct SettingsGear: View {
    @GestureState var press = false
    let clickAction: () -> Void
    
    var body: some View {
        ZStack{
            Image(systemName: "gearshape.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width:30, height: 30)
            Circle()
                .trim(from: press ? 0.001 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
        }
        .animation(.easeInOut(duration: 2), value: press)
        .frame(width: 40, height: 40)
        .gesture(
            LongPressGesture(minimumDuration: 2)
                .updating($press) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { value in
                    clickAction()
                }
        )
    }
}

struct SettingsGear_Previews: PreviewProvider {
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
