//
//  LoginView.swift
//  progect1
//
//  Created by user on 12.10.2024.
//

import SwiftUI

//Поля для ввода информации

struct LoginView: View {
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
                    Text("Welcome Back")
                        .foregroundColor(.black)
                        .font(.custom("Roboto-Medium", size: 28))
                        .padding(.bottom, 1)
                        .padding(.leading)
                    Text("Fill in your email and password to continue")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 20)
                        .padding(.leading)
                }
                .padding(.horizontal, 10)
                CustomTextField(label: "Email Adress", placeholder: "****@mail.ru", text: $userViewModel.email)
                CustomTextField(label: "Password", placeholder: "*********", text: $userViewModel.password)
                
            }
            HStack{
               
                Text("Remember Password")
                    .foregroundColor(.gray)
                    .font(.custom("Roboto-Medium", size: 14))
                Spacer()
             NavigationLink("Forgot Password",destination: SentView())
               
                    .foregroundColor(.blue)
                    .font(.custom("Roboto-Medium", size: 14))
            }
            
            .padding(.bottom, 16)
            .frame(width: 330)
            }
            VStack{
                Button("Log in")
                {
                    if !userViewModel.email.isEmpty && !userViewModel.password.isEmpty{
                   
                    } else{
                        self.isEmptyFields = true
                    }
                }
                .padding(.horizontal, 150)
                .padding(.vertical, 14)
                .background(.blue)
                .foregroundColor(.white)
                .font(.custom("Roboto-Medium", size: 18))
                .cornerRadius(8)
                .padding()
                
            }
            .alert(isPresented: $isEmptyFields){
                Alert(title: Text("Error"),
                      message: Text("Please fill all fields!"),
                      dismissButton: .default(Text("OK")))
            }
            VStack{
                HStack{
                    Text("Already have an account?")
                    Text("Sign UP")
                        .foregroundColor(.blue)
                        .font(.custom("Roboto-Medium", size: 14))
                    
                }
             //   NavigationLink("Sign UP",destination: SentView())
                .padding(.bottom, 16)
                Text("or log in using")
                    .padding(.bottom, 3)
                Image(systemName: "house")
                    .font(.system(size: 14))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 40)
            }.navigationBarBackButtonHidden()
        }
            
    }


#Preview {
    LoginView()
}
