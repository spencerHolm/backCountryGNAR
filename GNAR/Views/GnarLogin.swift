//
//  GnarLogin.swift
//  GNAR
//
//  Created by Spencer Holm on 3/21/21.
//

import SwiftUI
import FirebaseAuth

struct GnarLogin: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationFailed = false
    @State var okPushToView = false
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.init(red: 90.0/255.0, green: 205.0/255.0, blue: 255.0/255.0).ignoresSafeArea()
                VStack{
                    Text("Who Said Skiing Was Fun?")
                        .font(.title)
                        //.fontWeight(.bold)
                        .padding()
                    
                    TextField("Email", text: $username)
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
                        
                        
                        Auth.auth().signIn(withEmail: username, password: password) { (result, err) in
                            
                            if let err = err{
                                //something wrong
                                authenticationFailed = true
                                print(err)
                            }else{
                                okPushToView = true
                            }
                        }
                        
                    }
                    .buttonStyle(CustomButtonStyle())
                    NavigationLink(destination: RulesList(), isActive: $okPushToView){}
                    
                    Button("Sign-Up"){
                        self.selection = 1
                    }
                    .padding()
                    NavigationLink(destination: GnarSignUp(), tag: 1, selection: $selection){}
                }
                .padding()
                .navigationBarTitle("Backcountry G.N.A.R.")
            }
            
        }
    }
}

/*
func userAuthentication(usr: String, pswd: String) -> Bool{
    let tempUser: String = "User1234"
    let tempPswd: String = "password"
    
    if tempUser == usr && tempPswd == pswd {
        
        return true
    }else{
        return false
    }
}
*/
struct GnarLogin_Previews: PreviewProvider {
    static var previews: some View {
        GnarLogin()
    }
}
