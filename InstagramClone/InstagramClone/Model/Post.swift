//
//  Post.swift
//  InstagramClone
//
//  Created by Brandon Yu on 11/20/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now",
            likes: 123,
            imageUrl: "batman",
            timestamp: Timestamp(),
            user: User.MOCK_USER[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Wakanda Forever",
            likes: 104,
            imageUrl: "black-panther-1",
            timestamp: Timestamp(),
            user: User.MOCK_USER[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Iron Man",
            likes: 12,
            imageUrl: "iron-man-1",
            timestamp: Timestamp(),
            user: User.MOCK_USER[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Venom is hungry. Time to eat",
            likes: 314,
            imageUrl: "venom",
            timestamp: Timestamp(),
            user: User.MOCK_USER[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now",
            likes: 76,
            imageUrl: "venom",
            timestamp: Timestamp(),
            user: User.MOCK_USER[1]
        )
    ]
}
