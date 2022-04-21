//
//  NewRestaurantView.swift
//  FinalGroupProjectCOMP3097
//
//  Created by Sergey Pavlov on 2022-04-20.
//

import SwiftUI

struct NewRestaurantView: View {
    @State private var showAddRestaurant = false
    
    var body: some View {
        NavigationView {
            Button("Add New Restaurant") {
                showAddRestaurant = true
            }
            .navigationTitle("New Restaurant")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRestaurant) {
            AddRestaurantView()
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}
