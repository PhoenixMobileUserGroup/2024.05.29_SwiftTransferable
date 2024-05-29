//
//  Photo.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import CoreTransferable
import SwiftUI
import UniformTypeIdentifiers

struct Photo {
    var photoURL: URL
}

extension Photo: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(importedContentType: .jpeg) { receivedFile in
            let filename = receivedFile.file.lastPathComponent
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first!
            let photoURL = documentsURL.appendingPathComponent(filename)
            if fileManager.fileExists(atPath: photoURL.path(percentEncoded: false)) {
                try fileManager.removeItem(at: photoURL)
            }
            
            try fileManager.copyItem(at: receivedFile.file, to: photoURL)
            
            return .init(photoURL: photoURL)
        }
    }
}
