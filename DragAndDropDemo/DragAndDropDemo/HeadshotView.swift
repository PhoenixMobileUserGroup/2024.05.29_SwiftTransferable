//
//  HeadshotView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct HeadshotView: View {
    let candidates: [Candidate] = [
        .init(name: "John", headshot: "Headshot-1"),
        .init(name: "Shelly", headshot: "Headshot-2"),
        .init(name: "James", headshot: "Headshot-3"),
        .init(name: "Sarah", headshot: "Headshot-4"),
        .init(name: "Samuel", headshot: "Headshot-5"),
        .init(name: "Julie", headshot: "Headshot-6"),
        .init(name: "Mary", headshot: "Headshot-7"),
        .init(name: "Jerry", headshot: "Headshot-8"),
        .init(name: "Meg", headshot: "Headshot-9")
    ]
    
    @State private var droppedImage: Image?
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    DraggableHeadshot(candidate: candidates[0])
                    DraggableHeadshot(candidate: candidates[1])
                    DraggableHeadshot(candidate: candidates[2])
                }
                GridRow {
                    DraggableHeadshot(candidate: candidates[3])
                    DraggableHeadshot(candidate: candidates[4])
                    DraggableHeadshot(candidate: candidates[5])
                }
                GridRow {
                    DraggableHeadshot(candidate: candidates[6])
                    DraggableHeadshot(candidate: candidates[7])
                    DraggableHeadshot(candidate: candidates[8])
                }
            }
            
            Spacer()
            
            if let image = droppedImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 300.0)
                    .dropDestination(for: Image.self) { items, _ in
                        droppedImage = items.first
                        return true
                    }
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
                    .dropDestination(for: Image.self) { items, _ in
                        droppedImage = items.first
                        return true
                    }
            }
        }
        .padding()
    }
}

#Preview {
    HeadshotView()
}
