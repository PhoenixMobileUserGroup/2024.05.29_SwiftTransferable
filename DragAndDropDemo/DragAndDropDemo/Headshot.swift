//
//  Headshot.swift
//  DragAndDropDemo
//
//  Created by Michael Collins on 5/29/24.
//

import SwiftUI

struct Headshot: View {
    var candidate: Candidate
    
    var body: some View {
        Image(candidate.headshot)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 12.0))
    }
}

struct DraggableHeadshot: View {
    var candidate: Candidate
    
    var body: some View {
        Headshot(candidate: candidate)
            .draggable(Image(candidate.headshot))
    }
}

struct DraggableCandidate: View {
    var candidate: Candidate
    
    var body: some View {
        Headshot(candidate: candidate)
            .draggable(candidate)
    }
}
