//
//  PageVC.swift
//  demo
//
//  Created by Jiehao Zhang on 2020/2/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    private lazy var VC1 = storyboard!.instantiateViewController(withIdentifier: "VC1")
    private lazy var VC2 = storyboard!.instantiateViewController(withIdentifier: "VC2")
    private lazy var VC3 = storyboard!.instantiateViewController(withIdentifier: "VC3")
    private lazy var pages = [VC1,VC2,VC3]
    
    var pageControl: UIPageControl!
    var pendingIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self

        setViewControllers([VC1], direction: .forward, animated: true, completion: nil)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 700, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = pages.count
        view.addSubview(pageControl)
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

extension PageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.firstIndex(of: viewController)!
        
        return currentIndex == 0 ? pages[2] : pages[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.firstIndex(of: viewController)!
        
        return currentIndex == 2 ? pages[0] : pages[currentIndex+1]
    }
    
    
}

extension PageVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = pages.firstIndex(of: pendingViewControllers[0])!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = pendingIndex
        }
    }
}
