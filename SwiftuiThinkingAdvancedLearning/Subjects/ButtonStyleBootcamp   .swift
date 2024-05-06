//
//  ButtonStyleBootcamp   .swift
//  SwiftuiThinkingAdvancedLearning
//
//  Created by YILMAZ ER on 5.05.2024.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp___: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Click Me")
                .withDefaultButtonFormatting(backgroundColor: .purple)
        })
        .withPressableStyle(scaledAmount: 0.9)
        .padding()
    }
}

#Preview {
    ButtonStyleBootcamp___()
}
