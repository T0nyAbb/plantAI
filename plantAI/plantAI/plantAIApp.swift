//
//  plantAIApp.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 16/11/23.
//

import SwiftUI

@main
struct plantAIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(classifier: ImageClassifier(), flowerData: FlowerViewModel())
        }
    }
}
