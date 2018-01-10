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
  let contentUpdater = VirtualContentUpdater()
  var nodeForContentType = [VirtualContentTypes: AxisContent]()
  var selectedVirtualContent = VirtualContentTypes.faceGeometryMask {
    didSet {
      contentUpdater.virtualFaceNode = nodeForContentType[selectedVirtualContent]
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.viewDidAppear(animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    presenter.viewWillDisappear(animated: animated)
  }
  
  func createFaceGeometry() {
    let device = arSceneView.device!
    let faceGeometry = ARSCNFaceGeometry(device: device)!
    nodeForContentType = [VirtualContentTypes.faceGeometryMask: AxisContent(geometry: faceGeometry)]
    presenter.arSessionReady()
  }
}

extension SwapFaceVC: SwapFaceView {
  func startArSession() {
    contentUpdater.virtualFaceNode = nodeForContentType[selectedVirtualContent]
  }
  
  func prepareArSession() {
    arSceneView.showsStatistics = AppConfig.showArStatics
    arSceneView.delegate = contentUpdater
    arSceneView.session.delegate = self
    arSceneView.automaticallyUpdatesLighting = true
    session.configuration?.isLightEstimationEnabled = true
    createFaceGeometry()
  }
  
  func resetArTracking() {
    guard ARFaceTrackingConfiguration.isSupported else { return }
    let configuration = ARFaceTrackingConfiguration()
    configuration.isLightEstimationEnabled = true
    session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
  }
  
  func pauseArSession() {
    session.pause()
  }
}

extension SwapFaceVC: ARSessionDelegate {
  func session(_ session: ARSession, didFailWithError error: Error) {
    presenter.didArSessionFail(error: error)
  }
  
  func sessionInterruptionEnded(_ session: ARSession) {
    presenter.didSessionInterruptionEnded()
  }
}

