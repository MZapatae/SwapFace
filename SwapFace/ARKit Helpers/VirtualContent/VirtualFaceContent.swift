//
//  VirtualFaceContent.swift
//  SwapFace
//
//  Created by Miguel Zapata on 05-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

import ARKit
import SceneKit

protocol VirtualFaceContent where Self: SCNNode {
  func update(withFaceAnchor anchor: ARFaceAnchor)
}
