//
//  DetailViewController.swift
//  AppBottomActionSheet_Example
//
//  Created by Karthik on 3/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import AppBottomActionSheet

extension UIView {
    func rounded(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

class DetailViewController: UIViewController, HalfSheetPresentableProtocol, HalfSheetTopVCProviderProtocol {
    
    @IBOutlet weak var containerview: UIView! {
        didSet {
            containerview.layer.cornerRadius = 14
            containerview.clipsToBounds = true
        }
    }
    
    var topVCTransitionStyle: HalfSheetTopVCTransitionStyle {
        return .slide
    }
    
    lazy var topVC: UIViewController = {
        DismissView.canShow = false
        return DismissBarViewController.instance()!
    }()
    
    var sheetHeight: CGFloat? = 400
    
    weak var managedScrollView: UIScrollView? {
        return nil
    }
    
    var dismissMethod: [DismissMethod] {
        return [.tap, .swipe]
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true)
    }
}

extension DetailViewController: HalfSheetAppearanceProtocol {
    
    var presentAnimationDuration: TimeInterval {
        return 0.35
    }
    
    var dismissAnimationDuration: TimeInterval {
        return 0.25
    }
}
