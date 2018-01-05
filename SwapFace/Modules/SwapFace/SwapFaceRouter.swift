//
//  SwapFaceRouter.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import UIKit

class SwapFaceRouter: SwapFaceWireframe {
  weak var viewController: UIViewController?
  
  static func assembleModule() -> UIViewController {
    let view = SwapFaceVC(nibName: "SwapFaceView", bundle: nil)
    let presenter = SwapFacePresenter()
    let interactor = SwapFaceInteractor()
    let router = SwapFaceRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.output = presenter
    
    router.viewController = view
    
    return view
  }
}


