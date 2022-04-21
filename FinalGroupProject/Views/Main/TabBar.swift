//
//  TabBar.swift
//  FinalGroupProjectCOMP3097
//
//  Created by Sergey Pavlov on 2022-04-20.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            NewRestaurantView()
                .tabItem{
                    Label("New", systemImage: "plus")
                }
            
            AboutView()
                .tabItem{
                    Label("About", systemImage: "square.fill.text.grid.1x2")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(RestaurantViewModel())
    }
}
