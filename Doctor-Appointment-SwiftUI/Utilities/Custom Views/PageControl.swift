//
//  PageControl.swift
//  Doctor-Appointment-swiftui
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import SwiftUI

struct PageControl: View {
    let numberOfPages: Int
    @Binding var selectedPage: Int
    @State private var width: CGFloat = 28
    let  height: CGFloat = 8
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                RoundedRectangle(cornerRadius: width / 2)
                    .frame(width: index == selectedPage ? width : height, height: height)
                    .foregroundStyle(index == selectedPage ? .doapMain : .doap500)
            }
        }
    }
}

#Preview {
    PageControl(numberOfPages: 3, selectedPage: .constant(0))
}
