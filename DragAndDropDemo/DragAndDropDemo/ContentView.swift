//
//  ContentView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32.0) {
                NavigationLink {
                    HeadshotView()
                } label: {
                    Text("Image Demo")
                }

                NavigationLink {
                    FullProfileView()
                } label: {
                    Text("Codable Demo")
                }
                
                NavigationLink {
                    PhotoView()
                } label: {
                    Text("Photo Picker Demo")
                }
                
                NavigationLink {
                    CustomPhotoView()
                } label: {
                    Text("Photo Picker Demo 2")
                }
                
                NavigationLink {
                    UTTypeView()
                } label: {
                    Text("UTType Explorer")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
