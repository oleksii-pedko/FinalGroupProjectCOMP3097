//
//  AboutView.swift
//  FinalGroupProjectCOMP3097
//
//  Created by Sergey Pavlov on 2022-04-20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Team 38 – Restaurant Guide").bold()
                Text("Alexander Kudin (101258693)")
                Text("Oleksii Pedko (101242285)")
                Text("Sergey Pavlov (101288444)")
            }
                .navigationTitle("About")
        }
        .navigationViewStyle(.stack)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
