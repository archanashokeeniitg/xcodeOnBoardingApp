
//
//  PageViewController.swift
//  OnboardingScreenEN
//
//  Created by Archana Shokeen on 4/11/21.
//  Copyright © 2021 Archana Shokeen. All rights reserved.
//
import Foundation
import SwiftUI
import UIKit


struct PageViewController: UIViewControllerRepresentable{
    
    @Binding var currentPageIndex: Int
    var viewControllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewControllers[currentPageIndex]], direction: .forward , animated: true )
      
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else{
                return nil
            }
            if index == 0 {
                return parent.viewControllers.last
            }
            return parent.viewControllers[index-1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else{
                return nil
            }
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            return parent.viewControllers[index + 1]
        }
    }
}


