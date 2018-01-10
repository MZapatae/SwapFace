//
//  VirtualContentUpdater.swift
//  SwapFace
//
//  Created by Miguel Zapata on 05-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import SceneKit
import ARKit
import Async

class VirtualContentUpdater: NSObject {
  
  private var faceNode: SCNNode? //Content to show
  var virtualFaceNode: AxisContent? {
    didSet {
      setupFaceNodeContent()
    }
  }
  
  private func setupFaceNodeContent() {
    guard let node = faceNode else { return }
    
    for child in node.childNodes {
      child.removeFromParentNode()
    }
    
    if let content = virtualFaceNode {
      node.addChildNode(content)
    }
  }
}

// MARK: ARCSNViewDelegate Methods
extension VirtualContentUpdater: ARSCNViewDelegate {
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    faceNode = node
    Async.background {
      self.setupFaceNodeContent()
    }
  }
  
  func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    guard let faceAnchor = anchor as? ARFaceAnchor else { return }
    virtualFaceNode?.update(withFaceAnchor: faceAnchor)
  }
}
