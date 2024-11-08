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
  
    
    //MARK: BODY
    var body: some View {
        
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

struct BodyLoginPage: View {
    
    @State var textFieldUsername: String = ""
    @State var secureFieldPassword: String = ""
    @State var textFieldColor: Color = Color.gray
    var body: some View {
        VStack {
            
            //SECTION: LOGIN
            Text("Login")
                .font(.title2).bold()
                .padding(.top,100)
            TextField("Username (email) ", text: $textFieldUsername)
                .padding()
                .background(textFieldColor.opacity(0.2).cornerRadius(10))
                .frame(width: 350, height:60, alignment: .center)
            SecureField("Password", text: $secureFieldPassword)
                .padding()
                .background(textFieldColor.opacity(0.2).cornerRadius(10))
                .frame(width: 350, height:60, alignment: .center)
            
            Button("Login"){
                
            }
            
            .frame(width:200, height: 50)
            .foregroundColor(.white)
            .background(Color("airbnb"))
            .cornerRadius(20)
            .font(.body).bold()
        
            
            //SECTION: DON'T HAVE AN ACCOUNT?
            HStack {
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Don't have an account?").font(.title3)
                    NavigationLink("Signup here", destination: Text("Signup page"))
                        .font(.title2)
                    
                })
                .padding(30)
                Spacer()
                  
            }
            
        
            //SECTION: CONTINUE WITH GOOGLE, APPLE ETC.
            VStack{
            Text("Continue with Google")
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.white)
                    .shadow(radius: 5)
                    .frame(width:350, height: 50))
                .padding(50)
                            
            Text("Continue with Apple")
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.white)
                .shadow(radius: 5)
                .frame(width:350, height: 50))
            
                        }
            
                
        }
    }
}
