//
//  Event.swift
//  MVVMPlayground
//
//  Created by Mohamed Ezzat on 6/3/22.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let thumbnailUrl: String?
    let url: String
}
