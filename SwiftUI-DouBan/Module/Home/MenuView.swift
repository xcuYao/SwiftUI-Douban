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
                    Text("???????????????")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#757473"))
                }
                Spacer()
            }.padding([.leading], 20)
            VStack(alignment: .leading, spacing: 16) {
                MenuIcon(imageName: "menu_bookmark", text: "????????????/??????")
                MenuIcon(imageName: "menu_follow", text: "????????????")
                MenuIcon(imageName: "menu_history", text: "????????????")
                VStack { Divider().background(Color(hex: "#D9D9D9")) }.padding([.trailing], 20)
                MenuIcon(imageName: "menu_umbrella", text: "???????????????")
                MenuIcon(imageName: "menu_setting", text: "??????")
                MenuIcon(imageName: "menu_help", text: "???????????????")
            }.padding([.leading, .top], 20)
        }
    }
}

struct MenuBottomView: View {
    var body: some View {
        VStack {
            VStack() {
                HStack {
                    MenuIcon2(imageName: "menu_order", text: "??????")
                    MenuIcon2(imageName: "menu_buycar", text: "?????????")
                    MenuIcon2(imageName: "menu_wallet", text: "??????")
                }.padding([.top], 14)
                HStack {
                    MenuIcon2(imageName: "menu_timer", text: "????????????")
                    MenuIcon2(imageName: "menu_twitter", text: "??????????????????")
                    MenuIcon2(imageName: "menu_radio", text: "??????FM")
                }.padding([.top, .bottom], 14)
            }.padding([.leading, .trailing], 6)
                .background(Color.white)
                .cornerRadius(8)
            HStack {
                Image("icon-40-gray").resizable().frame(width: 24, height: 24)
                Text("??????").font(.system(size: 16, weight: .heavy))
                Text("????????????>").font(.system(size: 14)).foregroundColor(Color(hex: "#828282"))
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
