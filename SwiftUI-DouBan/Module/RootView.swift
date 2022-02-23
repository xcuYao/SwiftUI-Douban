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
    @State private var menuToggle: Bool = false
    @State private var menuMoveX: Double = 0.0

    var handler: Binding<Int> { Binding(
        get: { self.selectedTab },
        set: {
            self.selectedTab = $0
            self.clickHandler()
        })
    }

    var body: some View {
        NavigationView {
            ZStack() {
                TabView(selection: handler) {
                    HomeView(menuToggle: $menuToggle)
                        .tabItem { TabItem(type: .home, selection: selectedTab) }
                        .tag(TabItemType.home.rawValue)
                        .navigationBarHidden(true)
                        .ignoresSafeArea(edges: .all)
                    Module2()
                        .tabItem { TabItem(type: .art, selection: selectedTab) }
                        .tag(TabItemType.art.rawValue)
                    Module3()
                        .tabItem { TabItem(type: .group, selection: selectedTab) }
                        .tag(TabItemType.group.rawValue)
                    Module4()
                        .tabItem { TabItem(type: .market, selection: selectedTab) }
                        .tag(TabItemType.market.rawValue)
                    Module5()
                        .tabItem { TabItem(type: .me, selection: selectedTab) }
                        .tag(TabItemType.me.rawValue)
                }.accentColor(DouBan.mainColor)
                MenuView(menuToggle: $menuToggle)
                    .frame(width: DouBan.screenWidth, height: DouBan.screenHeight)
                    .offset(x: menuToggle ? 0 : -DouBan.screenWidth, y: 0)
//                    .offset(x: -DouBan.screenWidth + menuMoveX, y: 0)
                    .ignoresSafeArea(edges: .all)
            }.gesture(
                DragGesture()
                    .onChanged({ gesture in
                        print("change:\(gesture.translation)")
                        if gesture.translation.width < 120 {
                            menuToggle.toggle()
                        }
                    })
                    .onEnded({ ges in
                        if ges.translation.width > 20 {
                            withAnimation {
                                menuToggle.toggle()
                            }
                        }
                    })
            )
        }
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
