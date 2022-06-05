//
//  Event.swift
//  MVVMPlayground
//
//  Created by Neo on 01/10/2017.
//  Copyright © 2017 ST.Huang. All rights reserved.
//

import Foundation
struct Photos: Codable {
     let photos: [Photo]
}

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let name: String
    let url: String
    let thumbnailUrl: String?
    let image_url: String
    let created_at: Date
    let camera: String?
    let for_sale: Bool
    let description: String?
}
