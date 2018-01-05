//
//  SwapFacePresenter.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import Foundation
import Async

class SwapFacePresenter: SwapFacePresentation {
  weak var view: SwapFaceView?
  var interactor: SwapFaceUsesCases!
  var router: SwapFaceWireframe!
  
  func viewDidLoad() {
    view?.prepareArSession()
  }
  
  func viewDidAppear(animated: Bool) {
    UIApplication.shared.isIdleTimerDisabled = true
    Async.main {
      self.view?.resetArTracking()
    }
  }
  
  func didSessionInterruptionEnded() {
    Async.main {
      self.view?.resetArTracking()
    }
  }
  
  func didArSessionFail(error: Error) {
    print("AR Session Error: \(error.localizedDescription)")
  }
}

extension SwapFacePresenter: SwapFaceInteractorOutput {
  
}

