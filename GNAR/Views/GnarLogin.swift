//
//  GnarLogin.swift
//  GNAR
//
//  Created by Spencer Holm on 3/21/21.
//

import SwiftUI

struct GnarLogin: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationFailed = false
    @State var okPushToView = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Who Said Skiing Was Fun?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                if authenticationFailed {
                    Text("Username or password incorrect")
                        .foregroundColor(.red)
                        .offset(y: -10)
                }

                Button("Login"){
                    if userAuthentication(usr: username, pswd: password){
                        okPushToView = true
                    }else{
                        authenticationFailed = true
                    }
                    
                }
                .buttonStyle(CustomButtonStyle())
                NavigationLink(destination: RulesList(), isActive: $okPushToView){ }
            }
            .padding()
            .navigationBarTitle("Backcountry G.N.A.R.")
        }
    }
}

func userAuthentication(usr: String, pswd: String) -> Bool{
    let tempUser: String = "User1234"
    let tempPswd: String = "password"
    
    if tempUser == usr && tempPswd == pswd {
        
        return true
    }else{
        return false
    }
}

struct GnarLogin_Previews: PreviewProvider {
    static var previews: some View {
        GnarLogin()
    }
}
