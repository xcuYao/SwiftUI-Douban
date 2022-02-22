//
//  HomeHeader.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/28.
//

import SwiftUI

struct HomeHeader: View {

    @Binding var menuToggle: Bool

    var body: some View {
        VStack {
            HStack {
                Image("douban_icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("豆瓣")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }.frame(height: 22)
            Spacer()
            HStack {
                Button(action: {
                    withAnimation {
                        menuToggle.toggle()
                    }
                }, label: {
                        Image("menu_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                HomeSearchView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Button(action: {
                    print("show mail")
                }, label: {
                        Image("mail_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
            }.frame(height: 40)
                .padding([.leading, .trailing], 10)
        }
    }

    func hideAfter() {
        print("hide After")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("hide After 2")
            withAnimation {
                menuToggle.toggle()
            }
        }
    }

}

struct HomeSearchView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("search_icon")
            Text("疫情前的最后一次旅行")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: "#939E95"))
            Spacer()
        }.padding(6).background(Color(hex: "#EBF2ED"))
            .cornerRadius(12)
    }
}

struct HomeHeader_Previews: PreviewProvider {

    @State var menuToggle: Bool = false

    static var previews: some View {
        HomeHeader(menuToggle: .constant(false))
            .frame(width: UIScreen.main.bounds.width, height: DouBan.statusBarHeight)
            .previewLayout(.sizeThatFits)
    }
}
