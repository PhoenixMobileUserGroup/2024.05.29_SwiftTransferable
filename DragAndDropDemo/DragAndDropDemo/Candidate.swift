//
//  Candidate.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct Candidate {
    static let type = UTType(
        exportedAs: "blog.michaelcollins.interviews.candidate"
    )
    
    var name: String
    var headshot: String
}

extension Candidate: Codable {}

extension Candidate: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: Self.type)

        DataRepresentation(exportedContentType: .jpeg) {
            UIImage(named: $0.headshot)!.jpegData(compressionQuality: 1.0)!
        }
    }
}
