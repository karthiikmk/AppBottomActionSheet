//
//  DetailViewController.swift
//  AppBottomActionSheet_Example
//
//  Created by Karthik on 3/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import AppBottomActionSheet

class DetailViewController: UIViewController, HalfSheetPresentableProtocol, HalfSheetTopVCProviderProtocol {
    
    var topVCTransitionStyle: HalfSheetTopVCTransitionStyle {
        return .slide
    }
    
    lazy var topVC: UIViewController = {
        return DismissBarVC.instance(tintColor: .white)
    }()
    
    var sheetHeight: CGFloat? = 400
    
    var managedScrollView: UIScrollView? {
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
    var cornerRadius: CGFloat {
        return 8.0
    }
}
