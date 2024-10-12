//
//  OPTView.swift
//  Демо экзамен
//
//  Created by Айдарова Оксана Николаевна on 12.10.2024.
//
import SwiftUI
struct OPTView: View {
@State var isShowingHomeView = false
@State var isEmptyFields = false
@State var isOn = false
    @State var wrongCode = false
    @State var code_1 = ""
    @State var code_2 = ""
    @State var code_3 = ""
    @State var code_4 = ""
    @State var code_5 = ""
    @State var code_6 = ""
@StateObject var userViewModel = UserViewModel()
    
    @State var timeRemaining = 59
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading){
                NavigationLink(destination: EmptyView(), isActive: $userViewModel.isNavigate){}
                
                VStack(alignment: .leading){
                    Text("OPT Verification")
                        .foregroundColor(.black)
                        .font(.custom("Roboto-Medium", size: 28))
                        .padding(.bottom, 1)
                        .padding(.leading)
                    Text("Enter the 6 digit numbers sent to your email")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-Medium", size: 14))
                        .padding(.bottom, 20)
                        .padding(.leading)
                }
                .padding(.horizontal, 10)
                
            }
            HStack{
                OTPField(code: $code_1 ,wrongCode: $wrongCode)
                OTPField(code: $code_2 ,wrongCode: $wrongCode)
                OTPField(code: $code_3 ,wrongCode: $wrongCode)
                OTPField(code: $code_4 ,wrongCode: $wrongCode)
                OTPField(code: $code_5 ,wrongCode: $wrongCode)
                OTPField(code: $code_6 ,wrongCode: $wrongCode)
            }
            .padding(.bottom, 20)
            HStack{
                Text("If you didn't receive code, resend after 0:\(timeRemaining < 10 ? "0" : "")\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0{
                            timeRemaining -= 1
                        }
                    }
            }
                  .foregroundColor(.gray)
                  .font(.custom("Roboto-Light", size: 14))
                  .padding(.bottom, 30)
        VStack{
            Button("Set New Password")
            {
                self.wrongCode = true
            }
            .padding(.horizontal, 100)
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
        Spacer()
    }
        .navigationBarBackButtonHidden()
}
}

#Preview {
OPTView()
}
