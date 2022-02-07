//
//  IconFont.swift
//  SwiftUI-DouBan
//
//  Created by yaoning on 2021/12/27.
//

import SwiftUI

enum IconFont: String {
    case arrowTop = "\u{e65f}"
    case arrowRightTop = "\u{e660}"
    case arrowRight = "\u{e65e}"
    case arrowRightBottom = "\u{e68c}"
    case arrowBottom = "\u{e661}"
    case arrowLeftBottom = "\u{e66f}"
    case arrowLeft = "\u{e67a}"
    case arrowLeftTop = "\u{e662}"
}

//extension UIImage {
//    /*
//
//     //方法一：
//     UIImage.init(from: iconFont, textColor: .black, size: CGSize.init(width: 25, height: 25))
//     //方法二：
//     UIImage.icon(from: iconFont, iconColor: .black, imageSize: CGSize.init(width: 25, height: 25), ofSize: 25)
//     */
//    convenience init(from font: IconFont, textColor: UIColor = .black, backgroundColor: UIColor = .clear, size: CGSize) {
//        let drawText = font
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = NSTextAlignment.center
//
//        let fontSize = min(size.width / 1.28571429, size.height)
//        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.iconfont(ofSize: fontSize) ?? UIFont.systemFont(ofSize: 14), .foregroundColor: textColor, .backgroundColor: backgroundColor, .paragraphStyle: paragraphStyle]
//
//        let attributedString = NSAttributedString(string: drawText.rawValue, attributes: attributes)
//        UIGraphicsBeginImageContextWithOptions(size, false , UIScreen.main.scale)
//        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        if let image = image {
//            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
//        } else {
//            self.init()
//        }
//    }
//
//    static func icon(from font: IconFont, iconColor: UIColor, imageSize: CGSize, ofSize size: CGFloat) -> UIImage
//    {
//        let drawText = font.rawValue
//
//        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = NSTextAlignment.center
//
//        drawText.draw(in: CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height), withAttributes: [.font: UIFont.iconfont(ofSize: size) ?? UIFont.systemFont(ofSize: 14), .paragraphStyle: paragraphStyle, .foregroundColor: iconColor])
//
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return image!
//    }
//}

//extension Image {
//    init(from font: IconFont, color: Color = .black, size: CGSize = CGSize(width: 24, height: 24)) {
//        let drawText = font
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = NSTextAlignment.center
//        let fontSize = min(size.width / 1.28571429, size.height)
////        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.iconfont(ofSize: fontSize) ?? UIFont.systemFont(ofSize: 14), .foregroundColor: textColor, .backgroundColor: backgroundColor, .paragraphStyle: paragraphStyle]
//
//        let uiImage = UIImage()
//        self.init(uiImage: uiImage)
//    }
//}

