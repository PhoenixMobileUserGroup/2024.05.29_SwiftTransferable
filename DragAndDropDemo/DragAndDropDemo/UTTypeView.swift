//
//  UTTypeView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct UTTypeView: View {
	@State private var type: UTType = .jpeg
    @State private var hierarchy: String
    
    init() {
        hierarchy = UTTypeView.formatHierarchy(for: .jpeg)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
			HStack {
				Button {
					type = .jpeg
				} label: {
					Text("JPEG")
				}

				Button {
					type = .pdf
				} label: {
					Text("PDF")
				}

				Button {
					type = .quickTimeMovie
				} label: {
					Text("MOV")
				}

				Button {
					type = .json
				} label: {
					Text("JSON")
				}
			}
			.buttonStyle(.bordered)

            Text(type.identifier)
            
            TextEditor(text: $hierarchy)
                .frame(maxHeight: .infinity)
        }
        .padding()
		.onChange(of: type) {
			hierarchy = UTTypeView.formatHierarchy(for: type)
		}
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
