//
//  HomeView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct HomeView: View {

    @Binding var menuToggle: Bool
    @State private var selection = 0
    
    var body: some View {
        VStack {
            HomeHeader(menuToggle: $menuToggle)
                .frame(height: 40)
                .clipped()

            PagerTabStripView(swipeGestureEnabled: true, selection: $selection, content: {
                HomeBody().pagerTabItem {
                    DoubanNavBarItem(title: "动态")
                }
                HomeBody2().pagerTabItem {
                    DoubanNavBarItem(title: "关注")
                }
            })
        }.statusBar(hidden: menuToggle)
    }
}

struct DoubanNavBarItem: View, PagerTabViewDelegate {

    let title: String

    @State private var textColor = Color.red

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(textColor)
                .font(.system(size: 14))
        }
            .background(Color.clear)
    }

    func setState(state: PagerTabViewState) {
        switch state {
        case .selected:
            self.textColor = Color.black
        case .highlighted:
            self.textColor = Color.yellow
        default:
            self.textColor = Color.red
        }
    }

}

struct HomeBody2: View {
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Image("avatar")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .padding(10)
                .background(Color.red)
                .cornerRadius(10)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(menuToggle: .constant(false))
    }
}
