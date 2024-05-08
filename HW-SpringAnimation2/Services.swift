//
//  Services.swift
//  HW-SpringAnimation2
//
//  Created by Pavel Dolgopolov on 08.05.2024.
//

import Foundation

struct Animate {
    var preset: String = "squeeze"
    var curve: String = "spring"
    var force: Double = 0
    var duration: Double = 3
    var delay: Double = 0
    var damping: Double = 0
    var velocity: Double = 0
    var scaleX: Double = 0
    var scaleY: Double = 0
    var rotate: Double = 0
}

public enum AnimationPreset: String, CaseIterable {
    case pop
    case slideLeft
    case slideRight
    case slideDown
    case slideUp
    case squeezeLeft
    case squeezeRight
    case squeezeDown
    case squeezeUp
    case fadeIn
    case fadeOut
    case fadeOutIn
    case fadeInLeft
    case fadeInRight
    case fadeInDown
    case fadeInUp
    case zoomIn
    case zoomOut
    case fall
    case shake
    case flipX
    case flipY
    case morph
    case squeeze
    case flash
    case wobble
    case swing
}

public enum AnimationCurve: String, CaseIterable {
    case easeIn
    case easeOut
    case easeInOut
    case linear
    case spring
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeInBack
    case easeOutBack
    case easeInOutBack
}
