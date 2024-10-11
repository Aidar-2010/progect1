//
//  OTPField.swift
//  project1
//
//  Created by user on 12.10.2024.
//

import SwiftUI



struct OTPField: View {
    @Binding var code : String
    @Binding var wrongCode : Bool
    var body: some View {
        TextField("", text: $code)
            .frame(width: 7, height: 7)
            .padding()
            .background(.white)
            .padding(1)
            .background(wrongCode ? .red : (code != "" ? .blue : .gray ))
            .font(.custom("Roboto-Medium" , size: 18))
            .foregroundColor(.black)
            .padding(.horizontal, 5)
    }
}
