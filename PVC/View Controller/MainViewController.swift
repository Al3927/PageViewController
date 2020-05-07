//
//  MainViewController.swift
//  PVC
//
//  Created by user on 5/7/20.
//  Copyright © 2020 vinova.Duncan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var pageView: UIView!
    
    let dataSource = ["VC1", "VC2", "VC3"]
    
    var currentViewControllerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageViewController()
        
        // Do any additional setup after loading the view.
    }
    
    func configurePageViewController(){
        
        let pageViewController = PageViewController()
        
//        pageViewController.delegate = self
//        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageView.addSubview(pageViewController.view)
        
        let viewsDictionary: [String:Any] = ["pageViewController": pageViewController.view!]
        
        
        
        let pageView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageViewController]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let pageView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageViewController]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        pageView.addConstraints(pageView_H)
        pageView.addConstraints(pageView_V)
        
//        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else {
//            return
//        }
//
//        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        
    }
    
//    func detailViewControllerAt(index: Int) -> DataViewController? {
//    guard let dataViewController = DataViewController() else {
//        return nil
//    }
//        return nil
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
