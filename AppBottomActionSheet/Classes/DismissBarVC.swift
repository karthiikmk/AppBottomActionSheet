//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation

public class DismissBarVC: UIViewController {

    private static var storyboardName: String = "DismissBar"
    private static var identifier: String = "DismissBarVC"

    @IBOutlet weak var backgroundView: UIView?

    public static func instance(tintColor: UIColor) -> DismissBarVC {

        let storyboard = UIStoryboard(name: DismissBarVC.storyboardName, bundle: AppBottmSheetHelper.getBundle()!)

        let vc = storyboard.instantiateViewController(withIdentifier: DismissBarVC.identifier) as! DismissBarVC
        vc.loadViewIfNeeded()
        vc.backgroundView?.backgroundColor = tintColor
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
