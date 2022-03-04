//
//  HomeView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct HomeView: View {

    @Binding var menuToggle: Bool

    var body: some View {
        ZStack {
            VStack {
                HomeHeader(menuToggle: $menuToggle)
                    .frame(height: DouBan.statusBarHeight + 40)
                    .clipped()
                HomeBody()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(menuToggle: .constant(false))
    }
}
