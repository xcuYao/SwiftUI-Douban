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
        ZStack(alignment: .bottom, content: {
            Image("avatar")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .padding(10)
                .background(Color.red)
                .cornerRadius(10)
            Button(action: {
                showToast.toggle()
            }, label: {
                    Text("Show Toast")
                })
        }).simpleToast(isPresented: $showToast, options: toastOptions, onDismiss: {
            print("toast dismiss")
        }, content: {
                HStack {
                    Image(systemName: "exclamationmark.triangle")
                    Text("This is some simple toast message.")
                }
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
    }
}

struct HomeBody_Previews: PreviewProvider {
    static var previews: some View {
        HomeBody()
    }
}
