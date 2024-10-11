//
//  ContentView.swift
//  progect1
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct ContentView: View {
// Поля для ввода информации
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: LoginView(), isActive: $userViewModel.isNavigate){}
                VStack(alignment: .leading){
                    Text("Create an account")
                        .foregroundColor(.black)
                        .font(.custom("Roboto-Medium", size: 28))
                        .padding(.bottom, 1)
                        .padding(.leading)
                    Text("Complite the sign up process to get started")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 20)
                        .padding(.leading)
                    Text("Full name")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    TextField("Ivanov Ivan", text:$userViewModel.user.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Text("Phone Number")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    TextField("Number", text:$userViewModel.user.phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Text("Email Address")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    TextField("*****@mail.ru", text:$userViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    SecureField ("*******", text: $userViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Text("ConfirmPassword")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    SecureField ("*******", text: $userViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                    Text("Terms and conditions and private poicy")
                        .foregroundColor(.yellow)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 5)
                        .padding(.leading)
                }.padding()
  // Кнопка регистрации
                VStack{
                    Button("Sign Up")
                    {
                        userViewModel.signUp()
                    }
                    .frame(width: 342, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium", size: 18))
                    .cornerRadius(8)
                    .padding()
               
                }
                VStack{
                    HStack{
                        Text("Already have an account?")
                        
                        NavigationLink("Sign UP", destination: LoginView())
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
        
        }
    
    #Preview {
        ContentView()
    }

