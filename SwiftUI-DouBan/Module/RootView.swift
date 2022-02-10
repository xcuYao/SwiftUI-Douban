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
    
    var handler: Binding<Int> { Binding(
        get: { self.selectedTab },
        set: {
            self.selectedTab = $0
            self.clickHandler()
        })
    }

    var body: some View {
        ZStack {
            NavigationView {
                TabView(selection: handler) {
                    HomeView(menuToggle: $menuToggle)
                        .tabItem {TabItem(type: .home, selection: selectedTab)}
                        .tag(TabItemType.home.rawValue)
                        .navigationBarHidden(true)
                        .ignoresSafeArea(edges: .all)
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
                }.accentColor(DouBan.mainColor)
            }
            if menuToggle {
                MenuView(menuToggle: $menuToggle)
                    .ignoresSafeArea(edges: .all)
            }
        }
    }

    func clickHandler() {
        print("clickHandler \(selectedTab)")
    }
}

struct MenuView: View {
    
    @Binding var menuToggle: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack{}
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#000000"))
                .opacity(0.4)
                .onTapGesture {
                    withAnimation {
                        menuToggle.toggle()
                    }
                }
            VStack {
                Text("MenuView")
                Text("MenuView")
                Text("MenuView")
                Text("MenuView")
                Spacer()
            }.frame(width: 220)
            .background(Color(hex: "#F7F7F7"))
        }
        .frame(width: DouBan.screenWidth, height: DouBan.screenHeight)
        .transition(AnyTransition.opacity.combined(with: .slide))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
