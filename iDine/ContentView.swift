//
//  ContentView.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack{
            List{
                ForEach (menu){section in
                    Section(header:Text(section.name)){
                        ForEach (section.items){items in
                          ItemRow(item: items)
                            NavigationLink{
                                ItemDetails(item: items)
                            }label: {
                                ItemRow(item: items)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MENU")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
