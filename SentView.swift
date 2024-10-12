//
//  SentView.swift
//  Демо экзамен
//
//  Created by Айдарова Оксана Николаевна on 12.10.2024.
//

import SwiftUI
struct SentView: View {
@State var isShowingHomeView = false
@State var isEmptyFields = false
@State var isOn = false
@StateObject var userViewModel = UserViewModel()
var body: some View {
    VStack{
        VStack(alignment: .leading){
            NavigationLink(destination: EmptyView(), isActive: $userViewModel.isNavigate){}
            Spacer()
            VStack(alignment: .leading){
                Text("Forgot Password")
                    .foregroundColor(.black)
                    .font(.custom("Roboto-Medium", size: 28))
                    .padding(.bottom, 1)
                    .padding(.leading)
                Text("Enter your email address")
                    .foregroundColor(.gray)
                    .font(.custom("Roboto-Medium", size: 14))
                    .padding(.bottom, 20)
                    .padding(.leading)
            }
            .padding(.horizontal, 10)
            CustomTextField(label: "Email Adress", placeholder: "****@mail.ru", text: $userViewModel.email)
            
            Spacer()
        }
        
        VStack{
            Button("Sent OTP")
            {
                if !userViewModel.email.isEmpty && !userViewModel.password.isEmpty{
                } else{
                    self.isEmptyFields = true
                }
            }
            .padding(.horizontal, 120)
            .padding(.vertical, 20)
            .background(.blue)
            .foregroundColor(.white)
            .font(.custom("Roboto-Medium", size: 18))
            .cornerRadius(8)
        }
        .alert(isPresented: $isEmptyFields){
            Alert(title: Text("Error"),
                  message: Text("Please fill all fields!"),
                  dismissButton: .default(Text("OK")))
        }
        VStack{
            HStack{
                Text("Remember password? Back to")
                Text("Sign UP")
                    .foregroundColor(.blue)
                    .font(.custom("Roboto-Medium", size: 14))
            }
            .padding(.bottom, 16)
            Text("or log in using")
                .padding(.bottom, 3)
            Image(systemName: "house")
                .font(.system(size: 14))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40)
        }
    }
        .navigationBarBackButtonHidden()
}
}

#Preview {
SentView()
}
