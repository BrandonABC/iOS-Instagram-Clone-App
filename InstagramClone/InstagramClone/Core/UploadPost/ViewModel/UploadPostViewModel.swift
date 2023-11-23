//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Brandon Yu on 11/21/23.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        // make sure we have the image, since it's optional
        guard let item = item else { return }
        
        // get the data from the selected image
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        // using that data to construct ui image
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        // create swift ui image
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
