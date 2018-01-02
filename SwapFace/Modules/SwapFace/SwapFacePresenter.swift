//
//  SwapFacePresenter.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import Foundation

class SwapFacePresenter: SwapFacePresentation {
    weak var view: SwapFaceView?
    var interactor: SwapFaceUsesCases!
    var router: SwapFaceWireframe!
    
}

extension SwapFacePresenter: SwapFaceInteractorOutput {
    
}

