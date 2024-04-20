//
//  ProfileViewModel.swift
//  CourseApp
//
//  Created by Elvis Rexha on 20/04/2024.
//

import Foundation
import SwiftUI


class ProfileViewModel: ObservableObject {
    @Published var showDeleteButton: Bool = false
    @Published var xOffset: CGSize = .zero
    let maxOffset: CGFloat = 50

    func dragGesture() -> _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged { [weak self] value in
                guard let self = self else { return }
                self.handleDragChanged(value: value)
            }
            .onEnded { [weak self] value in
                guard let self = self else { return }
                self.handleDragEnded(value: value)
            }
    }

    private func handleDragChanged(value: DragGesture.Value) {
        let newOffset = CGSize(width: value.translation.width, height: value.translation.height)
        xOffset = CGSize(
            width: max(-maxOffset, min(maxOffset - 50, newOffset.width)),
            height: max(-maxOffset + 50, min(maxOffset - 50, newOffset.height))
        )

        if xOffset.width < -20 {
            withAnimation(.smooth) {
                showDeleteButton = true
            }
        }
    }

    private func handleDragEnded(value: DragGesture.Value) {
        withAnimation(.smooth) {
            if xOffset.width < -20 {
                xOffset.width = -50
            } else {
                showDeleteButton = false
            }
        }
    }
}
