//
//  Constant.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2022/2/9.
//

import Foundation
import UIKit
import SwiftUI

struct DouBan {

}

extension DouBan {
    static var statusBarHeight: Double {
        get {
            let keyWindow = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first
            let manager = keyWindow?.windowScene?.statusBarManager
            let h = manager?.statusBarFrame.height ?? 0
            return Double(h)
        }
    }
    static var mainColor: Color {
        get {
            return Color(hex: "#2DBA31")
        }
    }
}
