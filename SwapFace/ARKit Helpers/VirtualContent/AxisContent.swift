//
//  AxisContent.swift
//  SwapFace
//
//  Created by Miguel Zapata on 09-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import ARKit
import SceneKit

class AxisContent: SCNNode {
  let occlusionNode: SCNNode
  
  init(geometry: ARSCNFaceGeometry) {
    
    let material = SCNMaterial()
    material.diffuse.contents = UIColor.white
    material.transparencyMode = .default
    material.lightingModel = .physicallyBased
    geometry.firstMaterial!.colorBufferWriteMask = []
    
    occlusionNode = SCNNode(geometry: geometry)
    occlusionNode.renderingOrder = 1
    occlusionNode.geometry?.materials = [material]
    occlusionNode.opacity = 0.2
  
    super.init()
    
    addChildNode(occlusionNode)

    let axisCoordinatesNode = createNodeFromAsset(resourceName: "AxisCoordinates")
    axisCoordinatesNode.renderingOrder = 2
    addChildNode(axisCoordinatesNode)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension AxisContent: VirtualFaceContent {
  func update(withFaceAnchor anchor: ARFaceAnchor) {
    let faceGeometry = occlusionNode.geometry as! ARSCNFaceGeometry
    faceGeometry.update(from: anchor.geometry)
  }
}
