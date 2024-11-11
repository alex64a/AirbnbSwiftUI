//
//  SignupPage.swift
//  AirbnbSwiftUI
//
//  Created by Aleksa on 11/9/24.
//

import SwiftUI

//MARK: SIGNUP PAGE MAIN
struct SignupPage: View {
    
    
    
    var body: some View {
        @State var backgroundColor: Color = Color.white
        @State var firstname: String = ""
        @State var lastname: String = ""
        
        ZStack{
            
            backgroundColor.ignoresSafeArea(.all)
            HeaderSignupPage()
            SignupPageBody()
            
        }//ZStack
    }
    
}

#Preview {
    SignupPage()
}

//MARK: SIGNUP PAGE HEADER
struct HeaderSignupPage: View {
    var body: some View {
        VStack{
            
            HStack {
                Image("airbnbLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(30)
                    .frame(width:200, height:100, alignment: .leading)
                
                Spacer()
                
            }//HStack
            
            Text("Create an account")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
            
            
            Spacer()
            
        }//VStack
    }
}

//MARK: SIGNUP PAGE BODY
struct SignupPageBody: View {
    
    
    @State var textFieldColor: Color = Color.white
    
    var body: some View {
        
        VStack {
            //SECTION: USERNAME
            Username()
            
            //SECTION: PASSWORD
            Password()
            
            //SECTION: PASSWORD CONFIRMATION
            PasswordConfirmation()
            
            
            
            Button {
            } label: {
                Text("Signup")
                    .frame(width:200, height: 50)
                    .foregroundColor(.white)
                    .background(Color("airbnb"))
                    .cornerRadius(20)
                    .font(.body).bold()
                    .padding()
            }//Button
            
            
        }//Vstack
    }
}
//MARK: PASSWORD
struct Password: View {
    
    @State var passwordSignup: String = ""
    @State var isVisiblePasswordFirst: Bool = false
    @State var textFieldColor: Color = Color.gray
    
    var body: some View {
        
        if (isVisiblePasswordFirst) {
            
            HStack {
                Image(systemName: "key").font(.title2)
                TextField("Password", text: $passwordSignup).padding(.leading, 20)
                Button {
                    isVisiblePasswordFirst.toggle()
                } label: {
                    Image(systemName: "eye").foregroundColor(Color.black)
                }
                
            }//HStack
            .padding()
            .background(textFieldColor.opacity(0.15).cornerRadius(10))
            .frame(width: 350, height:60, alignment: .center)
            
        }
        else {
            HStack {
                Image(systemName: "key").font(.title2)
                SecureField("Password", text: $passwordSignup).padding(.leading, 20)
                Button {
                    isVisiblePasswordFirst.toggle()
                    
                } label: {
                    Image(systemName: "eye.slash").foregroundColor(Color.black)
                }
                
                
            }//Hstack
            .padding()
            .background(textFieldColor.opacity(0.15).cornerRadius(10))
            .frame(width: 350, height:60, alignment: .center)
        }
        
    }
}

//MARK: PASSWORD CONFIRMATION
struct PasswordConfirmation: View {
    
    @State var passwordConfirmation: String = ""
    @State var isVisiblePasswordSecond: Bool = false
    @State var textFieldColor: Color = Color.gray
    
    var body: some View {
        
        if (isVisiblePasswordSecond) {
            
            HStack {
                Image(systemName: "key").font(.title2)
                TextField("Confirm password", text: $passwordConfirmation).padding(.leading, 20)
                Button {
                    isVisiblePasswordSecond.toggle()
                } label: {
                    Image(systemName: "eye").foregroundColor(Color.black)
                }
                
            }//HStack
            .padding()
            .background(textFieldColor.opacity(0.15).cornerRadius(10))
            .frame(width: 350, height:60, alignment: .center)
            
        }
        else {
            HStack {
                Image(systemName: "key").font(.title2)
                SecureField("Confirm password", text: $passwordConfirmation).padding(.leading, 20)
                Button {
                    isVisiblePasswordSecond.toggle()
                    
                } label: {
                    Image(systemName: "eye.slash").foregroundColor(Color.black)
                }
                
                
            }//HStack
            .padding()
            .background(textFieldColor.opacity(0.15).cornerRadius(10))
            .frame(width: 350, height:60, alignment: .center)
        }
        
    }
}
//MARK: USERNAME
struct Username: View {
    
    @State var usernameSignup: String = ""
    @State var textFieldColor: Color = Color.gray
    
    var body: some View {
        HStack {
            Image(systemName:"person").font(.title2)
            TextField("Username (email) ", text: $usernameSignup).padding(.leading, 15).autocapitalization(.none)
            
        }//HStack
        .padding()
        .background(textFieldColor.opacity(0.15).cornerRadius(10))
        .frame(width: 350, height:60, alignment: .center)//HStack
    }
}

func isValidEmail(email: String) -> Bool {
    let usernameRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"#
    return NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: email)
}
func isValidPassword(password: String) -> Bool {
    let passwordRegex = "^(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{6,}$"
    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
}
