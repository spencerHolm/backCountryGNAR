//
//  GnarSignUp.swift
//  GNAR
//
//  Created by Spencer Holm on 3/28/21.
//

import SwiftUI
import FirebaseAuth

struct GnarSignUp: View {
    @Environment(\.presentationMode) var presentation
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    
    @State var username: String = ""
    @State var password: String = ""
    @State var tempPswd: String = ""
    
    var body: some View {
        ZStack{
            Color.init(red: 90.0/255.0, green: 205.0/255.0, blue: 255.0/255.0).ignoresSafeArea()
            VStack{
                Text("Welcome to G.N.A.R.")
                    .padding()
                    .font(.largeTitle)
                
                TextField("Enter Email", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Enter Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Re-enter Password", text: $tempPswd)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                if password != tempPswd {
                    Text("Passwords don't match")
                        .foregroundColor(.red)
                        .offset(y: -10)
                }
                
                Button("Sign-Up"){
                    if password == tempPswd && !username.isEmpty{
                        //create user
                        Auth.auth().createUser(withEmail: username, password: password) { (result, err) in
                            
                            //error handling
                            if let err = err {
                                //there was an error with the database
                                print(err)
                            }
                        }
                        
                        self.presentation.wrappedValue.dismiss()
                    }else{
                        //something went wrong
                    }
                }
                .buttonStyle(CustomButtonStyle())
                
            }
            .padding()
        }
    }
    
}




struct GnarSignUp_Previews: PreviewProvider {
    static var previews: some View {
        GnarSignUp()
    }
}
