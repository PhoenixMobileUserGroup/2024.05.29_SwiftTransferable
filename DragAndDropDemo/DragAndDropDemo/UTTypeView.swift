//
//  UTTypeView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct UTTypeView: View {
    let type: UTType = .jpeg
    
    @State private var hierarchy: String
    
    init() {
        hierarchy = UTTypeView.formatHierarchy(for: .jpeg)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text(type.identifier)
            
            TextEditor(text: $hierarchy)
                .frame(maxHeight: .infinity)
        }
        .padding()
    }
    
    static func formatHierarchy(for type: UTType, indent: Int = 0) -> String {
        let supertypes = type.supertypes.map {
            formatHierarchy(for: $0, indent: indent + 2)
        }
        let result = "\(String(repeating: " ", count: indent ))\(type.identifier)\n\(supertypes.joined(separator: ""))"
        return result
    }
}

#Preview {
    UTTypeView()
}
