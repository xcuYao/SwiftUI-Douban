//
//  HomeView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct HomeView: View {

    @State private var menuToggle: Bool = false
    var test = false

    var body: some View {

        ZStack {
            VStack {
                HomeHeader(menuToggle: $menuToggle)
                    .frame(height: DouBan.statusBarHeight + 40)
                    .clipped()
                HomeBody()
                Text(menuToggle ? "true" : "false")
                Spacer()
            }
            if menuToggle {
                MenuView()
            }
        }
    }
}

struct MenuView: View {
    var body: some View {
        VStack {
            Text("MenuView")
            Text("MenuView")
            Text("MenuView")
            Text("MenuView")
        }.frame(width: 200, height: 200)
            .padding(20)
            .background(Color.red)
//            .transition(.scale)
//            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            .transition(.opacity)
            .transition(AnyTransition.opacity.combined(with: .slide))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
