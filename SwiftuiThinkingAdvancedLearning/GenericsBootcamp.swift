//
//  GenericsBootcamp.swift
//  SwiftuiThinkingAdvancedLearning
//
//  Created by YILMAZ ER on 6.05.2024.
//

import SwiftUI

struct StringModel {
    let info: String?
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

struct GenericView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(self.title)
            content
        }
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericModel(info: "Hello, world!")
    @Published var genericBoolModel = GenericModel(info: false)
    
    func removeData() {
        self.stringModel = stringModel.removeInfo()
        self.boolModel = boolModel.removeInfo()
        self.genericBoolModel = genericBoolModel.removeInfo()
        self.genericStringModel = genericStringModel.removeInfo()
    }
    
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "new view!")
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no data")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            vm.removeData()
        }
        
    }
}

#Preview {
    GenericsBootcamp()
}
