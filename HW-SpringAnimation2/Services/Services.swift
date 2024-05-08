//
//  Services.swift
//  HW-SpringAnimation2
//
//  Created by Pavel Dolgopolov on 08.05.2024.
//

import SpringAnimation

final class DataStore {
    static let shared = DataStore()

    let animationPreset = AnimationPreset.allCases
    let animationCurve = AnimationCurve.allCases

    private init() {}
}
