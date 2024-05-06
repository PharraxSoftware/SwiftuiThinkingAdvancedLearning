//
//  ViewModifierBootcamp.swift
//  SwiftuiThinkingAdvancedLearning
//
//  Created by YILMAZ ER on 5.05.2024.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
        
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self
            .modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            Text("Hello, everyone!")
                .withDefaultButtonFormatting()
            
            Text("Hello!!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .red)
        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
