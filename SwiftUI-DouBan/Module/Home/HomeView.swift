//
//  HomeView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HomeHeader().frame(height: 40)
            HomeBody()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
