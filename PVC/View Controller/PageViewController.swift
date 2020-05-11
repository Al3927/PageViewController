//
//  PageViewController.swift
//  PVC
//
//  Created by user on 5/7/20.
//  Copyright © 2020 vinova.Duncan. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //let pageVC = UIPageViewController()

    var VC1 = ViewController1()
    var VC2 = ViewController2()
    var VC3 = ViewController3()
    
    lazy var orderedViewController: [UIViewController] = {
        return [VC1, VC2, VC3]
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
    
    func goToPage(At: Int){
        
       setViewControllers([orderedViewController[At]], direction: .forward, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func CreatButton(color: UIColor = UIColor.white, text: String, isCorner: Bool = false) -> UIButton {
            
    //        GeometryReader { geometry in
    //            //screenWidth: geometry.size.width //CG Float
    //        }
            
            let newButton = UIButton()
            newButton.frame.size = CGSize(width: buttonWidth, height: buttonHeight)
            newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            newButton.backgroundColor = color
            newButton.setTitle(text, for: .normal)
            newButton.setTitleColor(.black, for: .normal)
            newButton.translatesAutoresizingMaskIntoConstraints = false
            if isCorner {
                newButton.layer.cornerRadius = newButton.bounds.size.width / 4
                newButton.clipsToBounds = true
            }
            //self.view.addSubview(newButton)
            
            return newButton
        }
    
    @objc func buttonAction(sender: UIButton!){
        
        
        
    }
    
    
}

extension PageViewController{
    private var buttonWidth: CGFloat {
        return self.view.bounds.width
    }
    private var buttonHeight: CGFloat {
        return 50.0;
    }
}
