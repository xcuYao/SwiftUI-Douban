//
//  RootView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct RootView: View {

    @State private var selectedTab = 0
    private var itemType: TabItemType { TabItemType(rawValue: selectedTab)! }

    var handler: Binding<Int> { Binding(
        get: { self.selectedTab },
        set: {
            self.selectedTab = $0
            self.clickHandler()
        })
    }

    var body: some View {
        NavigationView {
            TabView(selection: handler) {
                HomeView()
                    .tabItem {TabItem(type: .home, selection: selectedTab)}
                    .tag(TabItemType.home.rawValue)
                Module2()
                    .tabItem {TabItem(type: .art, selection: selectedTab)}
                    .tag(TabItemType.art.rawValue)
                Module3()
                    .tabItem {TabItem(type: .group, selection: selectedTab)}
                    .tag(TabItemType.group.rawValue)
                Module4()
                    .tabItem {TabItem(type: .market, selection: selectedTab)}
                    .tag(TabItemType.market.rawValue)
                Module5()
                    .tabItem {TabItem(type: .me, selection: selectedTab)}
                    .tag(TabItemType.me.rawValue)
            }.accentColor(Color(hex: "#2DBA31"))
        }
//        .navigationBarTitle(itemType.titleText.v)
    }

    func clickHandler() {
        print("clickHandler \(selectedTab)")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
