//
//  TabItem.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

enum TabItemType: Int {
    case home
    case art
    case group
    case market
    case me

    var image: Image {
        switch self {
        case .home:
            return Image(systemName: "house.circle")
        case .art:
            return Image(systemName: "paintpalette")
        case .group:
            return Image(systemName: "person.3")
        case .market:
            return Image(systemName: "florinsign.circle")
        case .me:
            return Image(systemName: "person")
        }
    }

    var selectImage: Image {
        switch self {
        case .home:
            return Image(systemName: "house.circle.fill")
        case .art:
            return Image(systemName: "paintpalette.fill")
        case .group:
            return Image(systemName: "person.3.fill")
        case .market:
            return Image(systemName: "florinsign.circle.fill")
        case .me:
            return Image(systemName: "person.fill")
        }
    }

    var titleText: Text {
        switch self {
        case .home:
            return Text("首页")
        case .art:
            return Text("书影音")
        case .group:
            return Text("小组")
        case .market:
            return Text("市集")
        case .me:
            return Text("我")
        }
    }
}

struct TabItem: View {

    let type: TabItemType
    let selection: Int

    var body: some View {
        VStack {
            if type.rawValue == selection {
                type.selectImage
            } else {
                type.image
            }
            type.titleText
        }
    }
}
