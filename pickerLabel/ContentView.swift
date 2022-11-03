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

// Label won't show the SF Symbol when using pickerStyle navigationLink.
struct ContentView: View {
    @State private var mySelection : MyData = MyData(name: "", SFname: "", color: .clear)
    
    let allData : [MyData] = [.init(name: "Turtle", SFname: "tortoise.fill", color: .green), .init(name: "Bird", SFname: "bird.fill", color: .red)]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("HStack", selection: $mySelection) {
                    ForEach(allData) { datum in
                        HStack {
                            Text(datum.name)
                            Image(systemName: datum.SFname)
                                .foregroundColor(datum.color)
                        }
                        .tag(datum as MyData)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Picker("Grid", selection: $mySelection) {
                    ForEach(allData) { datum in
                        Grid {
                            GridRow {
                                Text(datum.name)
                                Image(systemName: datum.SFname)
                                    .foregroundColor(datum.color)
                            }
                        }
                        .tag(datum as MyData)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Picker("Label", selection: $mySelection) {
                    ForEach(allData) { datum in
                        Label {
                            Text(datum.name)
                        } icon: {
                            Image(systemName: datum.SFname)
                                .foregroundColor(datum.color)
                        }
                        .tag(datum as MyData)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Picker("LabeledContent", selection: $mySelection) {
                    ForEach(allData) { datum in
                        LabeledContent {
                            Image(systemName: datum.SFname)
                                .foregroundColor(datum.color)
                        } label: {
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
