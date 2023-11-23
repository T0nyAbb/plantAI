//
//  FlowerData.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 19/11/23.
//

import Foundation
import SwiftUI

struct FlowerData: Identifiable {
    let name: String
    let imageName: String
    let scientificName: String
    let familyName: String
    let description: String
    let onlineURL: String
    let color: Color
    let id: UUID = UUID()
}
