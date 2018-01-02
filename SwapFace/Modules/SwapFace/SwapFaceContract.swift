//
//  SplashContract.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import UIKit

protocol SwapFaceView: class {
    var presenter: SwapFacePresentation! { get set }
}

protocol SwapFacePresentation: BasePresenter {
    weak var view: SwapFaceView? { get set }
    var interactor: SwapFaceUsesCases! { get set }
    var router: SwapFaceWireframe! { get set }
}

protocol SwapFaceUsesCases: class {
    weak var output: SwapFaceInteractorOutput! { get set }
    
}

protocol SwapFaceInteractorOutput: class {
    
}

protocol SwapFaceWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}

