//
//  AppRouter.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import UIKit

class AppRouter {
    
    func setupRootScreen(in window: UIWindow) {
        let swapfaceVC = SwapFaceRouter.assembleModule()
        presentView(viewController: swapfaceVC, in: window)
    }
    
    fileprivate func presentView(viewController: UIViewController, in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = viewController
    }
}

