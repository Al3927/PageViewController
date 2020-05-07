//
//  PageViewController.swift
//  PVC
//
//  Created by user on 5/7/20.
//  Copyright © 2020 vinova.Duncan. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var VC1 = ViewController1()
    var VC2 = ViewController2()
    
    lazy var orderedViewController: [UIViewController] = {
        return [VC1, VC2]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        self.dataSource = self
        
        if let firstViewController = orderedViewController.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
        }
        
        self.delegate = self
        configurePageControl()
        // Do any additional setup after loading the view.
    }
    
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 150, width: UIScreen.main.bounds.width, height: 150))
        
        pageControl.numberOfPages = orderedViewController.count
        
        pageControl.currentPage = 0
        
        pageControl.tintColor = .black
        
        pageControl.pageIndicatorTintColor = .white
        
        pageControl.currentPageIndicatorTintColor = .black
        
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewController.firstIndex(of:viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewController.count != nextIndex else {
            return orderedViewController.first
        }
        
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of:viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewController.last
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }


    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0]
        
        self.pageControl.currentPage = orderedViewController.firstIndex(of: pageContentViewController)!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
