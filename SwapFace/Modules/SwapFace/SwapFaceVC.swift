//
//  SwapFaceVC.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import UIKit
import ARKit
import Async


class SwapFaceVC: UIViewController {
  @IBOutlet weak var arSceneView: ARSCNView!
  
  var presenter: SwapFacePresentation!
  var session: ARSession { return arSceneView.session }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    arSceneView.session.delegate = self
    arSceneView.automaticallyUpdatesLighting = true
    createFaceGeometry()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIApplication.shared.isIdleTimerDisabled = true
    resetTracking()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    session.pause()
  }
  
  func resetTracking() {
    guard ARFaceTrackingConfiguration.isSupported else { return }
    let configuration = ARFaceTrackingConfiguration()
    configuration.isLightEstimationEnabled = true
    session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
  }
  
  func createFaceGeometry() {
    let device = arSceneView.device!
    let faceGeometry = ARSCNFaceGeometry(device: device)!
  }
  
 
}

extension SwapFaceVC: SwapFaceView {
  
}

extension SwapFaceVC: ARSessionDelegate {
  func session(_ session: ARSession, didFailWithError error: Error) {
    print("AR Session Error: \(error.localizedDescription)")
  }
  
  func sessionInterruptionEnded(_ session: ARSession) {
    Async.main {
      self.resetTracking()
    }
  }
}

