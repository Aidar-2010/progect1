//
//  CustomTextField.swift
//  project1
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct CustomTextField: View{
    let label: String
    let placeholder: String
    @Binding var text: String
    var body: some View{
        VStack(alignment: .leading){
            Text(label)
                .foregroundColor(.gray)
                .font(.custom("Roboto-Medium", size: 14))
                .padding(.leading, 30)
        }
        VStack(alignment: .leading){
           
            ZStack{
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(1)
                    .background(
                        text == "" ? Color.gray : Color.blue
                    )
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    .font(.custom("Roboto-Medium", size: 14))
                    
                if text == ""{
                    HStack{
                        Text(placeholder)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.custom("Roboto-Medium", size: 14))
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 10)
        .padding(.horizontal, 30)
    }
}



