//
//  TabBarModel.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2022/3/4.
//

import Foundation
import UIKit

class TabBarModel: ObservableObject {

    @Published var items: [TabBarItemModel] = []

    init() {
        let item1 = TabBarItemModel(index: 0, title: "首页", image: "house.circle", selectImage: "house.circle.fill", select: true)
        let item2 = TabBarItemModel(index: 1, title: "书影音", image: "paintpalette", selectImage: "paintpalette.fill", select: false)
        let item3 = TabBarItemModel(index: 2, title: "小组", image: "person.3", selectImage: "person.3.fill", select: false)
        let item4 = TabBarItemModel(index: 3, title: "市集", image: "florinsign.circle", selectImage: "florinsign.circle.fill", select: false)
        let item5 = TabBarItemModel(index: 4, title: "我", image: "person", selectImage: "person.fill", select: false)
        self.items = [item1, item2, item3, item4, item5]
    }

    func selectHandler(item: TabBarItemModel) {
        self.items.forEach { i in
            if i.index == item.index {
                i.select = true
            } else {
                i.select = false
            }
        }
        print(self.items)
        print("=========")
    }

}

class TabBarItemModel: ObservableObject, Identifiable {
    var id: UUID
    @Published var index: Int = 0
    @Published var title: String
    @Published var image: String
    @Published var selectImage: String
    @Published var select: Bool

    init(index: Int, title: String, image: String, selectImage: String, select: Bool) {
        self.id = UUID()
        self.index = index
        self.title = title
        self.image = image
        self.selectImage = selectImage
        self.select = select
    }

}
