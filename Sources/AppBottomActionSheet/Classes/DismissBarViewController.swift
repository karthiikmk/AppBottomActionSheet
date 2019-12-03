//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation

/// Change this to customize
public struct DismissView {
    public static var canShow: Bool = true
    public static var overlay: UIColor = UIColor.black.withAlphaComponent(0.55)
    public static var spacing: CGFloat = 0
    public static var bgColor: UIColor = UIColor.white
    public static var cornerRadius: CGFloat = 8
    
    public static var indicatorColor: UIColor = UIColor.lightGray
    public static var indicatorHeight: CGFloat = 4
    public static var indicatorWidth: CGFloat = 60
    public static var indicatorSpacing: CGFloat = 0
    public static var indicatorCornerRadius: CGFloat = 2
}

public class DismissBarViewController: UIViewController {

    private static var storyboardName: String = "DismissBar"
    private static var identifier: String = "DismissBarViewController"

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dismissIndicator: UIView!
    
    @IBOutlet weak var leadingCons: NSLayoutConstraint!
    @IBOutlet weak var trailingCons: NSLayoutConstraint!
    
    @IBOutlet weak var indicatorWidthCons: NSLayoutConstraint!
    @IBOutlet weak var indicatorHeightCons: NSLayoutConstraint!
    @IBOutlet weak var indicatorBottomCons: NSLayoutConstraint!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private static func getDismissViewController() -> DismissBarViewController? {
        
        guard let bunlde = AppBottmSheetHelper.getBundle() else {
            print("Error: AppBottomActionSheet Bundle not found")
            return nil
        }
        
        let storyboard = UIStoryboard(name: DismissBarViewController.storyboardName, bundle: bunlde)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: DismissBarViewController.identifier) as? DismissBarViewController else {
            return nil
        }
        
        // Layouting - imp
        vc.loadViewIfNeeded()
        
        return vc
    }
    
    /// Show Top bar with Customization
    public static func instance() -> DismissBarViewController? {
        
        guard let vc = self.getDismissViewController() else {
            return nil
        }
        
        guard DismissView.canShow else {
            vc.backgroundView.isHidden = true
            vc.dismissIndicator.isHidden = true
            return vc
        }

        /// Top Background View
        vc.backgroundView.layer.cornerRadius = DismissView.cornerRadius
        vc.backgroundView.clipsToBounds = true
        vc.backgroundView.backgroundColor = DismissView.bgColor
        vc.leadingCons.constant = DismissView.spacing
        vc.trailingCons.constant = DismissView.spacing
        
        /// Indicator Height and Spacing
        vc.dismissIndicator.backgroundColor = DismissView.indicatorColor
        vc.dismissIndicator.layer.cornerRadius = DismissView.indicatorCornerRadius
        vc.dismissIndicator.clipsToBounds = true
        vc.indicatorBottomCons.constant = DismissView.indicatorSpacing
        vc.indicatorHeightCons.constant = DismissView.indicatorHeight
        vc.indicatorWidthCons.constant = DismissView.indicatorWidth
 
        return vc
    }
}


class AppBottmSheetHelper {
    
    static func getBundle() -> Bundle? {
        
        let podBundle = Bundle(for: self)
        
        guard let bundleUrl = podBundle.url(forResource: "AppBottomActionSheet", withExtension: "bundle") else {
            print("Error: Bundle url not found")
            return nil
        }
        
        guard let bundle = Bundle(url: bundleUrl) else {
            print("Error: Bundle not found")
            return nil
        }
        
        return bundle
    }
}
