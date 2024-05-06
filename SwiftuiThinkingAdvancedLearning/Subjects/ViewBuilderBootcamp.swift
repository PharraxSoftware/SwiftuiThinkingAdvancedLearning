//
//  ViewBuilderBootcamp.swift
//  SwiftuiThinkingAdvancedLearning
//
//  Created by YILMAZ ER on 6.05.2024.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: "\(iconName)")
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHstack<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
        }
    }
}

struct HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: ()-> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            HeaderViewRegular(title: "New Title", description: nil, iconName: nil)
            HeaderViewGeneric(title: "Title") {
                CustomHstack {
                    Text("subtitle")
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
            }
            Spacer()
        }
    }
}

#Preview("one") {
    LocalViewBuilder(type: .one)
}

#Preview("two") {
    LocalViewBuilder(type: .two)
}


#Preview("three") {
    LocalViewBuilder(type: .three)
}


enum ViewType {
    case one, two, three
}

struct LocalViewBuilder: View {
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    private var viewTwo: some View {
        VStack {
            Text("twoooo")
            Image(systemName: "heart.fill")
        }
    }
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
