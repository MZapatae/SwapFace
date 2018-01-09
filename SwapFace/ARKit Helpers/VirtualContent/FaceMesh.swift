//
//  FaceMesh.swift
//  SwapFace
//
//  Created by Miguel Zapata on 05-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import ARKit
import SceneKit

class FaceMesh: SCNNode {
  
  init (geometry: ARSCNFaceGeometry) {
    let material = geometry.firstMaterial!
    material.diffuse.contents = UIColor.white
    material.lightingModel = .physicallyBased
    
    super.init()
    self.geometry = geometry
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: VirtualFaceContent Protocol

extension FaceMesh: VirtualFaceContent {
  
  func update(withFaceAnchor anchor: ARFaceAnchor) {
    let faceGeometry = geometry as! ARSCNFaceGeometry
    faceGeometry.update(from: anchor.geometry)
  }
}
