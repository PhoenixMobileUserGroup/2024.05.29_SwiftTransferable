//
//  PhotoView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import PhotosUI
import SwiftUI

struct PhotoView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        VStack(spacing: 20.0) {
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 300.0)
            } else {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color(uiColor: .systemGray3))
                    .stroke(
                        Color(uiColor: .systemGray),
                        style: .init(lineWidth: 5, dash: [10.0, 5.0])
                    )
                    .frame(width: 300.0, height: 300.0)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.system(size: 100.0))
                            .foregroundStyle(Color(uiColor: .systemGray5))
                    }
            }
            
            PhotosPicker(selection: $selectedItem) {
                Text("Select a photo")
            }
        }
        .onChange(of: selectedItem) {
            Task {
                do {
                    image = try await selectedItem?.loadTransferable(type: Image.self)
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }
    }
}

#Preview {
    PhotoView()
}
