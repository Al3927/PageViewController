//
//  PageViewController.swift
//  PVC
//
//  Created by user on 5/7/20.
//  Copyright © 2020 vinova.Duncan. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
   
    var dataSources = ["Welcome", "Fast and Furious", "Like a Boss"]
    var imageSource = ["","",""]
    var currentViewControllerIndex = 0
    //let pageVC = UIPageViewController()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        self.dataSource = self
        
        let firstViewController = detailViewControllerAt(index:0)
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
        
        
        self.delegate = self
        configurePageControl()
        // Do any additional setup after loading the view.
    }
    
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 150, width: UIScreen.main.bounds.width, height: 150))
        
        pageControl.numberOfPages = dataSources.count
        
        pageControl.currentPage = 0
        
        pageControl.tintColor = .black
        
        pageControl.pageIndicatorTintColor = .white
        
        pageControl.currentPageIndicatorTintColor = .black
        
        self.view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDictionary: [String:Any] = ["pageControl": pageControl]
        
        
        
        let pageControl_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageControl]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let pageControl_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-300-[pageControl]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(pageControl_H)
        view.addConstraints(pageControl_V)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        

        
        let dataViewController = viewController as? DataViewController
        
        guard let viewControllerIndex = dataViewController?.index else {
            return nil
        }
        
        currentViewControllerIndex = viewControllerIndex
        
        let nextIndex = viewControllerIndex + 1
        
        guard dataSources.count != nextIndex else {
            return detailViewControllerAt(index:0)
        }
        
        guard dataSources.count > nextIndex else {
            return nil
        }
        
        return detailViewControllerAt(index:nextIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        
        let dataViewController = viewController as? DataViewController
        
        guard let viewControllerIndex = dataViewController?.index else {
            return nil
        }
        
        currentViewControllerIndex = viewControllerIndex
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return detailViewControllerAt(index: dataSources.endIndex-1)
           
        }
        
        guard dataSources.count > previousIndex else {
            return nil
        }
        
        return detailViewControllerAt(index: previousIndex)
        
         
    }


    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0]
        
        //self.pageControl.currentPage = orderedViewController.firstIndex(of: pageContentViewController)!
        let tempController = pageContentViewController as? DataViewController
        
        guard let index = tempController?.index else{
            return
        }
            
        self.pageControl.currentPage = index
        
        
    }
    
    
    func goToPage1(At: Int){
        if(At < 0 || At >= dataSources.count){
            
            return
        }else{
            
            setViewControllers([detailViewControllerAt(index: At)], direction: .forward, animated: true, completion: nil)
            
            self.pageControl.currentPage = At
            
        }
       
        
    }
    
    func detailViewControllerAt(index: Int) -> DataViewController{
//        if(index<0||index>=orderedViewController.count){
//            return nil
//        }
        let dataViewController = DataViewController()
        dataViewController.index = index
        dataViewController.displayText = dataSources[index]
        dataViewController.backgroundImageURL = imageSource[index]
        return dataViewController
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
