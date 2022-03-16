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
            }).frame(alignment: .center)
                .pagerTabStripViewStyle(.scrollableBarButton(indicatorBarHeight: 4, indicatorBarColor: Color(hex: "#181818"), tabItemSpacing: 40, tabItemHeight: 40))
        }.statusBar(hidden: menuToggle)
    }
}

private class ButtonTheme: ObservableObject {
    @Published var textColor = Color.gray
}

struct DoubanNavBarItem: View, PagerTabViewDelegate {

    let title: String

    @ObservedObject fileprivate var theme = ButtonTheme()

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(theme.textColor)
                .font(.system(size: 16))
        }
    }

    func setState(state: PagerTabViewState) {
        switch state {
        case .selected:
            self.theme.textColor = Color(hex: "#181818")
        case .highlighted:
            self.theme.textColor = DouBan.mainColor
        default:
            self.theme.textColor = Color(hex: "#818182")
        }
    }

}

struct HomeBody2: View {
    var body: some View {
        ScrollView {
            ForEach(0...4, id: \.self) { i in
                ZStack(alignment: .bottom, content: {
                    Image("avatar")
                    Text("Hello, World! \(i)")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(Color.red)
                        .cornerRadius(10)
                }).frame(maxWidth: .infinity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(menuToggle: .constant(false))
    }
}
