//
//  TextAnimation.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/13/22.
//

import SwiftUI

struct TextEffect: GeometryEffect {
    var x: CGFloat = 0
    
    var animatableData: CGFloat {
        get { x }
        set { x = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: x, y: 0))
    }
}

struct UniqueChar: Identifiable {
    let id = UUID()
    let char: Character
}

struct AnimatedText: View {
    var charArray: [UniqueChar] = []
    @State var animate = false
    
    init(_ text: String) {
        self.charArray = Array(text).map {UniqueChar(char: $0)}
    }
    
    func random() -> CGFloat {
        return CGFloat(Int.random(in: 0...10))
    }
    
    var body: some View {
        HStack(spacing:1) {
            ForEach(charArray, id: \.self.id) { uniqueChar in
                Text(String(uniqueChar.char))
                    .font(.largeTitle )
                    .fontWeight(.bold)
                    .modifier(TextEffect(x: animate ? random() : -random()).ignoredByLayout())
            }
        }
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                self.animate = true
            }
        }
    }
}
