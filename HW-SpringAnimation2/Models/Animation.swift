//
//  DataModel.swift
//  HW-SpringAnimation2
//
//  Created by Pavel Dolgopolov on 21.04.2024.
//

import Foundation

struct Animate {
    
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    let damping: Double
    let velocity: Double
    let scaleX: Double
    let scaleY: Double
    let rotate: Double
    
    var description: String {
        return """
            preset: \(animation),
            curve: \(curve),
            force: \(String(format: "%.2f", force)),
            duration: \(String(format: "%.2f", duration)),
            delay: \(String(format: "%.2f", delay)),
            damping: \(String(format: "%.2f", damping)),
            velocity: \(String(format: "%.2f", velocity)),
            scale: \(String(format: "%.2f", scaleX)),
            rotate: \(String(format: "%.2f", rotate))
        """
    }
    
    static var randomAnimation: Animate {
        Animate (
            animation: DataStore.shared.animationPreset.randomElement()?.rawValue ?? "squeeze",
            curve: DataStore.shared.animationCurve.randomElement()?.rawValue ?? "spring",
            force: Double.random(in: 0.5...3),
            duration: Double.random(in: 0.5...3),
            delay: Double.random(in: 0.5...1),
            damping: Double.random(in: 0...1),
            velocity: Double.random(in: 0...1),
            scaleX: Double.random(in: 0...5),
            scaleY: Double.random(in: 0...5),
            rotate: Double.random(in: -5...5)
        )
    }
}
