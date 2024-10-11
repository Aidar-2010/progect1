//
//  SwiftUIView.swift
//  progect1
//
//  Created by user on 06.10.2024.
//

import SwiftUI

struct SwiftUIView: View {
    @Binding var value: Bool
    var body: some View {
        Group{
        @binding var text:String
        var Body: some View {
            ZStrack{
                TexFild(placeholder, text: $text)
                padding()
                background (Color.black)
            }
        }

    }
}

#Preview {
    SwiftUIView()
}
