//
//  SCNNode.swift
//  SwapFace
//
//  Created by Miguel Zapata on 10-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import SceneKit

extension SCNNode {
  
  func createNodeFromAsset(resourceName: String) -> SCNNode {
    let url = Bundle.main.url(forResource: resourceName, withExtension: "scn", subdirectory: "Models.scnassets")!
    let node = SCNReferenceNode(url: url)!
    node.load()
    return node
  }

}
