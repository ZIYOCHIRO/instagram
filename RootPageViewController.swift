//
//  RootPageViewController.swift
//  instagram
//
//  Created by 10.12 on 2019/4/2.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var vcArrays: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let cameraVC = storyboard.instantiateViewController(withIdentifier: "cameraVC")
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC")
        let messageVC = storyboard.instantiateViewController(withIdentifier: "messageVC")
        
        return [cameraVC, mainVC, messageVC]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([vcArrays[1]], direction: .forward, animated: true, completion: nil)

        

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = vcArrays.firstIndex(of: viewController) else { return nil }
        let prevIndex = vcIndex - 1
        guard prevIndex >= 0 else { return vcArrays.last }
        
        return vcArrays[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = vcArrays.firstIndex(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard nextIndex <= 2 else { return vcArrays.first }
        
        
        return vcArrays[nextIndex]
    }
    


}
