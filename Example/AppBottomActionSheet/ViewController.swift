//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import UIKit
import AppBottomActionSheet

class ViewController: UIViewController, HalfSheetPresentingProtocol, HalfSheetCompletionProtocol {
    
    var transitionManager: HalfSheetPresentationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAct(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        presentUsingHalfSheet(vc)
    }
    
    func didDismiss() {
        print("dismiss called in view controller")
    }
}

