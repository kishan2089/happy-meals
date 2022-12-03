//
//  UILabel+Extension.swift
//  Common
//
//  Created by Sunil Zalavadiya on 01/04/19.
//  Copyright © 2019 Sunil Zalavadiya. All rights reserved.
//

import UIKit

extension UILabel {

    
    func setCharacterSpacing(_ spacing: CGFloat){
       let attributedStr = NSMutableAttributedString(string: self.text ?? "")
       attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
       self.attributedText = attributedStr
    }
    public func setUnderLine() {
        guard let text = self.text else { return }
        let textRange = NSRange(location: 0, length: text.count) //NSMakeRange(0, text.count)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        self.attributedText = attributedString
    }
    
    func strikeOnLabel(lineStyle: Int) {
        guard let text = self.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: lineStyle, NSAttributedString.Key.strikethroughColor: #colorLiteral(red: 0.7098039216, green: 0.7176470588, blue: 0.8078431373, alpha: 1), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7098039216, green: 0.7176470588, blue: 0.8078431373, alpha: 1), NSAttributedString.Key.font: UIFont(name: Application.Font.Roboto_Medium, size: 16.0)!], range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}
