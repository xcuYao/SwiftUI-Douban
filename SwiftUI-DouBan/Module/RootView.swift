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
                Image("search_icon")
                Spacer()
                Image("search_icon")
            }.padding([.leading, .trailing], 20)
            HStack() {
                Image("search_icon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(Color.red)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text("Neo")
                        .font(.system(size: 18))
                    Text("资料与账号")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.leading], 20)
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("我的收藏/豆列")
                    Spacer()
                }
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("我的关注")
                    Spacer()
                }
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("浏览历史")
                    Spacer()
                }
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("青少年模式")
                    Spacer()
                }
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("设置")
                    Spacer()
                }
                HStack(spacing: 14) {
                    Image("search_icon")
                    Text("帮助与反馈")
                    Spacer()
                }
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

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomView()
    }
}
