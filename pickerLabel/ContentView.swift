//
//  ContentView.swift
//  pickerLabel
//
//  Created by Chris Wu on 11/2/22.
//

import SwiftUI

struct MyData : Identifiable, Hashable {
    let id = UUID()
    
    let name : String
    let SFname : String
    let color : Color
}

struct ContentView: View {
    @State private var mySelection : MyData = MyData(name: "", SFname: "", color: .clear)
    
    let allData : [MyData] = [.init(name: "Turtle", SFname: "tortoise.fill", color: .green)]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("HStack", selection: $mySelection) {
                    ForEach(allData) { datum in
                        HStack {
                            Image(systemName: datum.SFname)
                                .foregroundColor(datum.color)
                            Spacer()
                            Text(datum.name)
                        }
                        .tag(datum as MyData)
                    }
                }
                .pickerStyle(.navigationLink)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
