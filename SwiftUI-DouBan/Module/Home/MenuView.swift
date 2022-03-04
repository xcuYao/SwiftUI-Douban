//
//  MenuView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2022/2/22.
//

import SwiftUI

struct MenuView: View {

    @Binding var menuToggle: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            if menuToggle {
                HStack {  }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "#141414"))
                    .opacity(0.4)
                    .onTapGesture {
                        withAnimation {
                            menuToggle.toggle()
                        }
                    }.transition(AnyTransition.opacity)
            }
            VStack {
                MenuTopView(menuToggle: $menuToggle)
                Spacer()
                MenuBottomView()
            }.frame(width: DouBan.screenWidth - 120)
                .background(Color(hex: "#F7F7F7"))
                .cornerRadius(20, corners: [.topRight, .bottomRight])
        }
        .transition(AnyTransition.opacity.combined(with: .slide))
    }
}

struct MenuTopView: View {

    @Binding var menuToggle: Bool

    var body: some View {
        VStack {
            HStack {
            }.frame(height: DouBan.statusBarHeight)
            HStack() {
                Image("menu_close")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .onTapGesture {
                        withAnimation {
                            menuToggle.toggle()
                        }
                    }
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
                VStack { Divider().background(Color(hex: "#D9D9D9")) }.padding([.trailing], 20)
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
                    MenuIcon2(imageName: "menu_order", text: "订单")
                    MenuIcon2(imageName: "menu_buycar", text: "购物车")
                    MenuIcon2(imageName: "menu_wallet", text: "钱包")
                }.padding([.top], 14)
                HStack {
                    MenuIcon2(imageName: "menu_timer", text: "豆瓣时间")
                    MenuIcon2(imageName: "menu_twitter", text: "豆瓣阅读书架")
                    MenuIcon2(imageName: "menu_radio", text: "豆瓣FM")
                }.padding([.top, .bottom], 14)
            }.padding([.leading, .trailing], 6)
                .background(Color.white)
                .cornerRadius(8)
            HStack {
                Image("icon-40-gray").resizable().frame(width: 24, height: 24)
                Text("豆瓣").font(.system(size: 16, weight: .heavy))
                Text("证照信息>").font(.system(size: 14)).foregroundColor(Color(hex: "#828282"))
            }.padding([.top], 20)
        }.padding([.leading, .trailing], 12)
            .padding(.bottom, 30)
    }
}

struct MenuIcon2: View {
    var imageName: String
    var text: String
    var body: some View {
        VStack(spacing: 6) {
            Image(imageName).resizable().frame(width: 28, height: 28)
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "#828282"))
        }.frame(maxWidth: .infinity)
    }
}

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
//        MenuTopView(menuToggle: .constant(false))
        MenuBottomView()
    }
}
