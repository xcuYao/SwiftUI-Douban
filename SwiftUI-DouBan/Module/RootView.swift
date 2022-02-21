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
                .background(Color(hex: "#F7F7F7"))
                .opacity(0.4)
                .onTapGesture {
                    withAnimation {
                        menuToggle.toggle()
                    }
                }
            VStack {
                MenuTopView()
                Spacer()
                MenuBottomView()
            }.frame(width: 220)
            .background(Color(hex: "#F7F7F7"))
        }
        .frame(width: DouBan.screenWidth, height: DouBan.screenHeight)
        .transition(AnyTransition.opacity.combined(with: .slide))
    }
}


struct MenuTopView: View {
    var body: some View {
        VStack {
            HStack {
            }.frame(height: DouBan.statusBarHeight)
                .background(Color.red)
            HStack() {
                Image("menu_close")
                    .resizable()
                    .frame(width: 22, height: 22)
                Spacer()
                Image("menu_scan")
                    .resizable()
                    .frame(width: 22, height: 22)
            }.padding([.leading, .trailing], 20)
            HStack() {
                Image("avatar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text("Neo")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#1A1919"))
                    Text("资料与账号")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#757473"))
                }
                Spacer()
            }.padding([.leading], 20)
            VStack(alignment: .leading, spacing: 16) {
                MenuIcon(imageName: "menu_bookmark", text: "我的收藏/豆列")
                MenuIcon(imageName: "menu_follow", text: "我的关注")
                MenuIcon(imageName: "menu_history", text: "浏览历史")
                VStack {Divider().background(Color(hex: "#D9D9D9"))}.padding([.trailing], 20)
                MenuIcon(imageName: "menu_umbrella", text: "青少年模式")
                MenuIcon(imageName: "menu_setting", text: "设置")
                MenuIcon(imageName: "menu_help", text: "帮助与反馈")
            }.padding([.leading, .top], 20)
        }
    }
}

struct MenuBottomView: View {
    var body: some View {
        VStack {
            VStack() {
                HStack {
                    Text("订单")
                        .frame(maxWidth: .infinity)
                    Text("订单")
                        .frame(maxWidth: .infinity)
                    Text("订单")
                        .frame(maxWidth: .infinity)
                }.padding([.leading, .trailing], 6)
                    .background(Color.red)
                HStack {
                    Text("订单")
                        .frame(maxWidth: .infinity)
                    Text("订单")
                        .frame(maxWidth: .infinity)
                    Text("订单")
                        .frame(maxWidth: .infinity)
                }.padding([.leading, .trailing], 6)
                    .background(Color.red)
            }.padding([.leading, .trailing], 6)
                .cornerRadius(8)
            HStack {
                Text("豆瓣")
                Text("证照信息>")
            }.padding([.top], 20)
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}

struct MenuIcon: View {
    var imageName: String
    var text: String
    var body: some View {
        HStack(spacing: 14) {
            Image(imageName)
                .resizable()
                .frame(width: 22, height: 22)
            Text(text).font(.system(size: 14)).foregroundColor(Color(hex: "#1A1919"))
            Spacer()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTopView()
    }
}
