//
//  FullProfileView.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI

struct FullProfileView: View {
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
    
    @State private var selectedCandidate: Candidate?
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    DraggableCandidate(candidate: candidates[0])
                    DraggableCandidate(candidate: candidates[1])
                    DraggableCandidate(candidate: candidates[2])
                }
                GridRow {
                    DraggableCandidate(candidate: candidates[3])
                    DraggableCandidate(candidate: candidates[4])
                    DraggableCandidate(candidate: candidates[5])
                }
                GridRow {
                    DraggableCandidate(candidate: candidates[6])
                    DraggableCandidate(candidate: candidates[7])
                    DraggableCandidate(candidate: candidates[8])
                }
            }
            
            Spacer()
            
            VStack {
                if let candidate = selectedCandidate {
                    Image(candidate.headshot)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300.0, height: 300.0)
                        .dropDestination(for: Candidate.self) { items, _ in
                            selectedCandidate = items.first
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
                        .dropDestination(for: Candidate.self) { items, _ in
                            selectedCandidate = items.first
                            return true
                        }
                }
                
                Text(selectedCandidate?.name ?? "")
                    .font(.body)
            }
        }
        .padding()
    }
}

#Preview {
    FullProfileView()
}
