//
//  ContentView.swift
//  AirbnbSwiftUI
//
//  Created by Aleksa on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    @State var backgroundColor: Color = Color.white
    
    
    //MARK: MAIN
    var body: some View {
        
        //TODO: Change to NavigationStack (from iOS v16.0)
        NavigationView {
            
            ZStack {
                backgroundColor.ignoresSafeArea(.all)
                HeaderLoginPage()
                BodyLoginPage()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
//MARK: HEADER
struct HeaderLoginPage: View {
    var body: some View {
        VStack{
            
            HStack {
                Image("airbnbLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(30)
                    .frame(width:200, height:100, alignment: .leading)
                
                Spacer()
                
            }
            
            Text("Welcome to Airbnb")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
            
            
            Spacer()
            
        }
    }
}
//MARK: BODY
struct BodyLoginPage: View {
    
    
    @State var textFieldColor: Color = Color.gray
    var body: some View {
        VStack {
            
            //SECTION: LOGIN
            LoginSection()
            Button("Login"){
                
            }
            
            .frame(width:200, height: 50)
            .foregroundColor(.white)
            .background(Color("airbnb"))
            .cornerRadius(20)
            .font(.body).bold()
            
            
            //SECTION: DON'T HAVE AN ACCOUNT?
            SignupHere()
            
            
            //SECTION: CONTINUE WITH GOOGLE, APPLE ETC.
            ContinueWith()
            
            
        }//VStack
    }
}
//MARK: SIGNUP SECTION
struct SignupHere: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0, content: {
                Text("Don't have an account?").font(.title3)
                NavigationLink("Signup here", destination:SignupPage()).padding(.leading, 40)
                    .font(.title2).bold()
                
                
            })
            .padding(30)
            
        }//HStack
    }
}
//MARK: LOGIN SECTION
struct LoginSection: View {
    @State var textFieldColor: Color = Color.gray
    @State var textFieldUsername: String = ""
    @State var secureFieldPassword: String = ""
    @State var isVisiblePassword: Bool = false
    var body: some View {
        
        Text("Login")
            .font(.title2).bold()
            .padding(.top,100)
        
        TextField("Username (email) ", text: $textFieldUsername)
            .padding()
            .background(textFieldColor.opacity(0.15).cornerRadius(10))
            .frame(width: 350, height:60, alignment: .center)
        
        if (isVisiblePassword) {
            
            HStack {
                TextField("Password", text: $secureFieldPassword)
                Button {
                    isVisiblePassword.toggle()
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
                SecureField("Password", text: $secureFieldPassword)
                Button {
                    isVisiblePassword.toggle()
                    
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
//MARK: CONTINUE WITH
struct ContinueWith: View {
    var body: some View {
        VStack{
            
            HStack {
                Image("google")
                    .resizable()
                    .frame(width:30, height:30, alignment: .leading)
                
                Text("Continue with Google")
                
            }//HStack
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.white)
                .shadow(radius: 5)
                .frame(width:350, height: 50))
                .padding(40)
            
            HStack {
                Image("apple")
                    .resizable()
                    .frame(width:30, height:30, alignment: .leading)
                
                Text("Continue with Apple")
            }//HStack
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.white)
                .shadow(radius: 5)
                .frame(width:350, height: 50))
        }
    }
}
