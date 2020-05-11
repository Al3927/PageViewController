//
//  MainViewController.swift
//  PVC
//
//  Created by user on 5/7/20.
//  Copyright © 2020 vinova.Duncan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //@IBOutlet weak var pageViewProgrammatically: UIView!
    
    let dataSource = ["VC1", "VC2", "VC3"]
    
    var currentViewControllerIndex = 0
    
    let pageViewProgrammatically = UIView()
    
    let pageViewController = PageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureStack()
        
        configureUIView()
        
        configurePageViewController()
        
        
        // Do any additional setup after loading the view.
    }
    
    func configureStack(){
        
        let buttonArray:[UIButton]=[CreatButton(text: "Page1"),CreatButton(text: "Page2"),CreatButton(text: "Page3")]
        
        let buttonStack = creatHStack(buttonArray: buttonArray)
        
        self.view.addSubview(buttonStack)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDictionary: [String:Any] = ["buttonStack": buttonStack]
        
        
        let buttonStack_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[buttonStack]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let buttonStack_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[buttonStack]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(buttonStack_H)
        view.addConstraints(buttonStack_V)
    }
    
    func configurePageViewController(){
        
        
        
        
        
        
//        pageViewController.delegate = self
//        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewProgrammatically.addSubview(pageViewController.view)
        
        let viewsDictionary: [String:Any] = ["pageViewController": pageViewController.view!]
        
        
        
        let pageView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageViewController]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let pageView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageViewController]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        pageViewProgrammatically.addConstraints(pageView_H)
        pageViewProgrammatically.addConstraints(pageView_V)
        
        
        
//        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else {
//            return
//        }
//
//        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        
    }
    
    func configureUIView(){
        
        self.view.addSubview(pageViewProgrammatically)
        
        pageViewProgrammatically.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDictionary: [String:Any] = ["pageViewProgrammatically": pageViewProgrammatically]
        
        
        
        let pageViewProgrammatically_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageViewProgrammatically]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let pageViewProgrammatically_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-120-[pageViewProgrammatically]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(pageViewProgrammatically_H)
        view.addConstraints(pageViewProgrammatically_V)
    }
    
    func creatHStack(buttonArray: [UIView], isFillEqually: Bool = true) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        //stackView.bounds.origin = CGPoint(x: -12, y: -view.bounds.maxY + buttonsize * 6 + 12 * 4)
        stackView.axis = .horizontal
        if isFillEqually {
            stackView.distribution = .fillEqually
        } else {
            stackView.distribution = .fill
        }
        
        stackView.alignment = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //self.view.addSubview(stackView)
        
        return stackView
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    func CreatButton(color: UIColor = UIColor.white, text: String, isCorner: Bool = false) -> UIButton {
            
    //        GeometryReader { geometry in
    //            //screenWidth: geometry.size.width //CG Float
    //        }
            
            let newButton = UIButton()
            newButton.frame.size = CGSize(width: buttonWidth, height: buttonHeight)
            newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            newButton.backgroundColor = color
            newButton.setTitle(text, for: .normal)
        //newButton.titleLabel?.text = text
            //newButton.setTitleColor(.black, for: .normal)
            newButton.translatesAutoresizingMaskIntoConstraints = false
            if isCorner {
                newButton.layer.cornerRadius = newButton.bounds.size.width / 4
                newButton.clipsToBounds = true
            }
            //self.view.addSubview(newButton)
            
            return newButton
        }
    
     var buttonTitleBefore = ""
    
    @objc func buttonAction(sender: UIButton!){
        
       
        
        if(sender.title(for: .normal) == "Next")
        {
            pageViewController.goToNextPage()
        }else if(sender.title(for:.normal) == "Previous"){
            pageViewController.goToPreviousPage()
        }else if (sender.title(for:.normal) == "Page1" && buttonTitleBefore != "Page1"){
            
            pageViewController.goToPage1(At: 0)
            buttonTitleBefore = "Page1"
            
            
        }else if sender.title(for:.normal) == "Page2" && buttonTitleBefore != "Page2"{
            pageViewController.goToPage1(At: 1)
            buttonTitleBefore = "Page2"
        }else if sender.title(for:.normal) == "Page3" && buttonTitleBefore != "Page3"{
            pageViewController.goToPage1(At: 2)
            buttonTitleBefore = "Page3"
        }else{
            //print("Khong co gi")
        }
        
        
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

extension MainViewController {
    private var buttonWidth: CGFloat {
        return self.view.bounds.width
    }
    private var buttonHeight: CGFloat {
        return 50.0;
    }
}

extension UIPageViewController {
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
    }

    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentViewController){
                setViewControllers([previousPage], direction: .reverse, animated: true, completion: completion)
            }
        }
    }
    
    
}
