//
//  HomeBody.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/28.
//

import SwiftUI

struct HomeBody: View {

    @State private var showToast: Bool = false
    private let toastOptions = SimpleToastOptions(
        hideAfter: 5
    )

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(0...100, id: \.self) { i in
                    HStack {
                        HomeBodyItem()
                    }
                }
            }
        }
//        ZStack(alignment: .bottom, content: {
//            Image("avatar")
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .foregroundColor(Color.white)
//                .padding(10)
//                .background(Color.red)
//                .cornerRadius(10)
//            Button(action: {
//                showToast.toggle()
//            }, label: {
//                    Text("Show Toast")
//                })
//        }).simpleToast(isPresented: $showToast, options: toastOptions, onDismiss: {
//            print("toast dismiss")
//        }, content: {
//                HStack {
//                    Image(systemName: "exclamationmark.triangle")
//                    Text("This is some simple toast message.")
//                }
//                    .padding()
//                    .background(Color.red.opacity(0.8))
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//            })
    }
}

struct HomeBodyItem: View {
    var body: some View {
        VStack {
            HStack {
                Image("avatar")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(21)
                Text("枫叶")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "#141414"))
                Spacer()
                Image("icon_more")
                    .resizable()
                    .frame(width: 32, height: 20)
            }
            VStack(alignment: .leading) {
                Text("上班：刘海上去\n下班：刘海下来刘海上去")
                HStack(spacing: 4) {
                    Image("avatar")
                        .resizable()
                        .frame(height: 160)
                        .cornerRadius(6)
                    Image("avatar")
                        .resizable()
                        .frame(height: 160)
                        .cornerRadius(6)
                    Image("avatar")
                        .resizable()
                        .frame(height: 160)
                        .cornerRadius(6)
                }
            }
            HStack {
                HomeBodyItemButton(icon: "icon_like", text: "点赞").frame(maxWidth: .infinity)
                HomeBodyItemButton(icon: "icon_comment", text: "评论").frame(maxWidth: .infinity)
                HomeBodyItemButton(icon: "icon_share", text: "转发").frame(maxWidth: .infinity)
            }
            HStack {
                Color(hex: "F2F2F1")
                    .frame(maxWidth: .infinity, maxHeight: 16)
            }.padding([.leading, .trailing], -10)
        }.padding([.leading, .trailing], 6)
    }
}

struct HomeBodyItemButton: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(icon)
                .resizable()
                .frame(width: 20, height: 20)
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "#6C6D6C"))
        }
    }
}

struct HomeBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeBody()
    }
}
