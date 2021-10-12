//
//  Utils.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 05/10/2021.
//

import Foundation
import SideMenu
import UIKit

class Utils{
    static func setupMenuViewController<T>(_ t: T.Type, withIndentifier: String, menu: inout SideMenuNavigationController!, viewForGesture: UIView){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let menuViewController = storyBoard.instantiateViewController(withIdentifier: withIndentifier) as! T
        
        menu = SideMenuNavigationController(rootViewController: menuViewController as! UIViewController)
        menu.leftSide = true
        menu.presentationStyle = SideMenuPresentationStyle.menuSlideIn
        menu.menuWidth = menu.view.frame.width * 0.8
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: viewForGesture)
    }
    
    static func createViewInNavbar(viewController: UIViewController) -> UIViewController{
        let vc = UINavigationController(rootViewController: viewController)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.shadowColor = .clear
        
        vc.navigationBar.standardAppearance = appearance;
        vc.navigationBar.scrollEdgeAppearance = vc.navigationBar.standardAppearance
        vc.navigationBar.tintColor = UIColor.white
        
        return vc
    }
}
