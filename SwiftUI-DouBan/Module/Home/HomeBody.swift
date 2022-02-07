//
//  HomeBody.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/28.
//

import SwiftUI

struct HomeBody: View {
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Image("avatar")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .padding(10)
                .background(Color.red)
                .cornerRadius(10)
//                .alignmentGuide(.center) { d in
//                    d[.center]
//                }
        })
    }
}

struct HomeBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeBody()
    }
}
