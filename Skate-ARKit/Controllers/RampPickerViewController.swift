//
//  RampPickerViewController.swift
//  Skate-ARKit
//
//  Created by SenorLappy on 24/2/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerViewController: UIViewController {

    var sceneView: SCNView!
    var size: CGSize!
    
    weak var rampPlacerVC: RampPlacerViewController!
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        
       
        let scene = SCNScene(named: "art.scnassets/ramps.scn")!
        sceneView.scene = scene
        
        // set custom camera /view
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(screenTap)
        
        preferredContentSize = size
        
        //Popup View border color  
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 3.0
        
        // use Ramp.swift Model to instantiate objects
        //PIPE
        let pipe = Ramp.getPipe()
        Ramp.startRotation(node: pipe)
        scene.rootNode.addChildNode(pipe)
        
        
        //pyramid
               let pyramid = Ramp.getPyramid()
               Ramp.startRotation(node: pyramid)
               scene.rootNode.addChildNode(pyramid)
        //Quarte Pipe
                    let quarter = Ramp.getQuarter()
                    Ramp.startRotation(node: quarter)
                    scene.rootNode.addChildNode(quarter)
        
      // Made the following rotation and objects into a model Ramp.swift
        
//        // create rotate action
//        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
//
//        // add new halfpipe to scene
//        let object = SCNScene(named: "art.scnassets/pipe.dae")
//        let node = object?.rootNode.childNode(withName: "pipe", recursively: true)!
//        node?.scale = SCNVector3Make(0.0023, 0.0023, 0.0023)
//        node?.position = SCNVector3Make(1, 0.6, -1)
//        scene.rootNode.addChildNode(node!) // adds object as reference - can reuse variables for new object
//        node?.runAction(rotate)
//
//    // add new pyramid to scene
//        let object2 = SCNScene(named: "art.scnassets/pyramid.dae")
//        let node2 = object2?.rootNode.childNode(withName: "pyramid", recursively: true)!
//        node2?.scale = SCNVector3Make(0.0062, 0.0062, 0.0062)
//        node2?.position = SCNVector3Make(1, -0.6, -0.90)
//        scene.rootNode.addChildNode(node2!) // adds to scene
//         node2?.runAction(rotate)
//
//        // add new quarterpipe to scene
//          let object3 = SCNScene(named: "art.scnassets/quarter.dae")
//          let node3 = object3?.rootNode.childNode(withName: "quarter", recursively: true)!
//          node3?.scale = SCNVector3Make(0.0062, 0.0062, 0.0062)
//          node3?.position = SCNVector3Make(1, -2.4, -0.80)
//          scene.rootNode.addChildNode(node3!) // adds to scene
//         node3?.runAction(rotate)
    
    }
    // figure out what object was tapped on ( reference 3D obect
 @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
    let point = gestureRecognizer.location(in: sceneView)
    let hitResult = sceneView.hitTest(point, options: [:])
    
    if hitResult.count > 0 {
        let node = hitResult[0].node
//        print(node.name!) // for testing only
        rampPlacerVC.onRampSelected(node.name!)
        dismiss(animated: true, completion: nil)
        }
         }
        
//        switch node.name! {
//            case "pipe":
//                rampPlacerVC.onRampSelected("pipe")
//            break
//            case "pyramid":
//                rampPlacerVC.onRampSelected("pyramid")
//            break
//            case "quarter":
//                rampPlacerVC.onRampSelected("quarter")
//            break
//            default:
//        }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
