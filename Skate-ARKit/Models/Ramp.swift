//
//  Ramp.swift
//  Skate-ARKit
//
//  Created by SenorLappy on 24/2/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit
import SceneKit

class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode {
        switch rampName {
        case "pipe":
            return Ramp.getPipe()
        case "pyramid":
            return Ramp.getPyramid()
        case "quarter":
            return Ramp.getQuarter()
        default:
         return Ramp.getPipe()
        }
    }
    
    
    class func getPipe() -> SCNNode {
        let object = SCNScene(named: "art.scnassets/pipe.dae")
        let node = object?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.scale = SCNVector3Make(0.0023, 0.0023, 0.0023)
        node?.position = SCNVector3Make(1, 0.6, -1)
        return node!
//        node?.runAction(rotate)
    }
    
    class func getPyramid() -> SCNNode {
        let object = SCNScene(named: "art.scnassets/pyramid.dae")
          let node = object?.rootNode.childNode(withName: "pyramid", recursively: true)!
          node?.scale = SCNVector3Make(0.0062, 0.0062, 0.0062)
          node?.position = SCNVector3Make(1, -0.6, -0.90)
        return node!
//          scene.rootNode.addChildNode(node2!) // adds to scene
//           node2?.runAction(rotate)
        
    }
    
    class func getQuarter() -> SCNNode {
        let object = SCNScene(named: "art.scnassets/quarter.dae")
              let node = object?.rootNode.childNode(withName: "quarter", recursively: true)!
              node?.scale = SCNVector3Make(0.0062, 0.0062, 0.0062)
              node?.position = SCNVector3Make(1, -2.4, -0.80)
        return node!
//              scene.rootNode.addChildNode(node3!) // adds to scene
//             node3?.runAction(rotate)
    }
    
    class func startRotation(node: SCNNode) {
              let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
}
