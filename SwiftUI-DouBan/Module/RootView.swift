//
//  RootView.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

struct RootView: View {

    @State private var selectedTab = 0
    @State private var menuToggle: Bool = false

    var handler: Binding<Int> { Binding(
        get: { self.selectedTab },
        set: {
            self.selectedTab = $0
            self.clickHandler()
        })
    }

    var body: some View {
        ZStack() {
            TabView(selection: handler) {
                HomeView(menuToggle: $menuToggle).tag(0)
                Module2().tag(1)
                Module3().tag(2)
                Module4().tag(3)
                Module5().tag(4)
            }.overlay(
                CustomTabBarView(selectedTab: $selectedTab)
                , alignment: .bottom)
                .accentColor(DouBan.mainColor)
            MenuView(menuToggle: $menuToggle)
                .offset(x: menuToggle ? 0 : -DouBan.screenWidth, y: 0)
                .edgesIgnoringSafeArea(.vertical)
        }
    }

    func clickHandler() {
        print("clickHandler \(selectedTab)")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
//        RootView()
        CustomTabBarView(selectedTab: .constant(0))
            .accentColor(DouBan.mainColor)
            .previewLayout(.fixed(width: 500, height: 80))

    }
}

struct CustomTabBarView: View {

    @Binding var selectedTab: Int
    @StateObject private var tabBarModel: TabBarModel = TabBarModel()

    var body: some View {
        VStack {
            Divider()
            Color(hex: "#ffffff")
                .edgesIgnoringSafeArea(.vertical)
                .frame(height: 50)
                .overlay(
                HStack {
                    ForEach(tabBarModel.items) { item in
                        CustomTabBarItem(action: {
                            withAnimation {
                                selectedTab = item.index
                                clickAction(item: item)
                            }
                        }, viewModel: item)
                    }
                }
            )
        }
    }

    func clickAction(item: TabBarItemModel) {
        tabBarModel.selectHandler(item: item)
    }
}

struct CustomTabBarItem: View {

    var action: () -> Void

    @ObservedObject var viewModel: TabBarItemModel

    var body: some View {
        Button(action: action, label: {
            VStack {
                Image(systemName: viewModel.select ? viewModel.selectImage : viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(viewModel.select ? DouBan.mainColor : Color(hex: "#6F6F6F"))
                    .opacity(viewModel.select ? 1 : 0.4)
                    .animation(.easeInOut, value: viewModel.select)
                Text(viewModel.title)
                    .font(.system(size: 12))
                    .foregroundColor(viewModel.select ? DouBan.mainColor : Color(hex: "#6F6F6F"))
                    .animation(.easeInOut, value: viewModel.select)
            }
        }).frame(maxWidth: .infinity)
    }
}
