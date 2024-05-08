//  ViewController.swift
//  HW_SpringAnimation
//
//  Created by Pavel Dolgopolov on 19.04.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var springView: SpringView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    // MARK: - Private properties
    private var animate = Animate.randomAnimation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.animation = animate.preset
        springView.curve = animate.curve
        springView.duration = animate.duration
        springView.animate()
        
        label.text = animate.description
        
        animate = Animate.randomAnimation
    }
    
    // MARK: - IB Actions
    @IBAction func pressButton(_ sender: SpringButton) {
        springView.animation = animate.preset
        springView.curve = animate.curve
        springView.force = animate.force
        springView.duration = animate.duration
        springView.delay = animate.delay
        springView.damping = animate.damping
        springView.velocity = animate.velocity
        springView.scaleX = animate.scaleX
        springView.scaleY = animate.scaleY
        springView.rotate = animate.rotate
        springView.animate()
        
        label.text = animate.description
        
        animate = Animate.randomAnimation
        
        sender.setTitle("Run \(animate.preset)", for: .normal)
    }
}
