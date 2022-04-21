//
//  HomeView.swift
//  FinalGroupProjectCOMP3097
//
//  Created by Sergey Pavlov on 2022-04-20.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var restaurantVM: RestaurantViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                CategoryList()
                RestaurantList(restaurants: restaurantVM.restaurants)
            }
            .navigationTitle("Restaurants")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantViewModel())
    }
}
