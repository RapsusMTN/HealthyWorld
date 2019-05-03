//
//  HealthyARViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 03/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import ARKit

class HealthyARViewController: UIViewController,ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        self.title = "AR Healthy"
        super.viewDidLoad()
        self.sceneView.delegate = self
        createNode()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.sceneView.session.pause()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal,.vertical]
        self.sceneView.session.run(configuration, options: [])
    }
    

    func createNode() {
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.red
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0, 0, -1.5)
        
        let text = SCNText(string: "Healthy World", extrusionDepth: 1.0)
        text.firstMaterial?.diffuse.contents = UIColor.white
        let textNode = SCNNode(geometry: text)
        textNode.scale = SCNVector3(0.2,0.2,0.2)
        textNode.position = SCNVector3(0, 0.2, -1.5)
        
        let scene = SCNScene()
        self.sceneView.scene = scene
        
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        self.sceneView.scene.rootNode.addChildNode(textNode)
    }
    


}
