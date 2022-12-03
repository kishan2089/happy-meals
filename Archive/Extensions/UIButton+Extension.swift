//
//  UIButton+Extension.swift
//  Trichordal
//
//  Created by Sunil Zalavadiya on 23/01/19.
//  Copyright © 2019 Sunil Zalavadiya. All rights reserved.
//

import UIKit

extension UIButton {

    public func setUnderlineButton() {
        let text = self.titleLabel?.text
        let titleString = NSMutableAttributedString(string: text!)
        titleString.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue], range: NSMakeRange(0, (text?.count)!))
        self.setAttributedTitle(titleString, for: .normal)
    }
    
    public func centerVertically(withPadding padding: CGFloat) {
        let imageSize: CGSize? = imageView?.frame.size
        let titleString: NSString = (self.titleLabel?.text)! as NSString
        let titleSize: CGSize = titleString.size(withAttributes: [NSAttributedString.Key.font: (self.titleLabel?.font)!])
        
        let totalHeight = (imageSize?.height ?? 0.0) + (titleSize.height ) + CGFloat(padding)
        
        imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - (imageSize?.height ?? 0.0)), left: 0.0, bottom: 0.0, right: -(titleSize.width ))
        
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -(imageSize?.width ?? 0.0), bottom: -(totalHeight - (titleSize.height )), right: 0.0)
    }
    
    func roundedButton() {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft],
                                     cornerRadii: CGSize(width: 90, height: 90))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    func setAnimationForSelect() {
        /*UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: { [weak self] in
            self?.transform = .identity
            }, completion: { (Success) in
         
        })*/
        
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: { [weak self] in
            self?.transform = .identity
            }, completion: nil)
    }
    
    func applyGradiuntBorder() {
        let gradient = CAGradientLayer()
           gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
           gradient.colors = [#colorLiteral(red: 0.462745098, green: 0.06666666667, blue: 0.9647058824, alpha: 1).cgColor, #colorLiteral(red: 0.9058823529, green: 0.1058823529, blue: 0.5176470588, alpha: 1).cgColor, #colorLiteral(red: 0.9843137255, green: 0.862745098, blue: 0, alpha: 1).cgColor]

           let shape = CAShapeLayer()
           shape.lineWidth = 4
           shape.path = UIBezierPath(rect: self.bounds).cgPath
           shape.strokeColor = UIColor.black.cgColor
           shape.fillColor = UIColor.clear.cgColor
           gradient.mask = shape
           self.layer.addSublayer(gradient)
    }


func applyGradient(colors: [CGColor]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colors
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    gradientLayer.frame = self.bounds
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
}

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
