//
//  SignInView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    
    @State private var isSecured: Bool = true
    @FocusState private var focusedField: SignInField?
    
    enum SignInField {
        case email
        case password
    }
    
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
                Image(notificationPermissionData.logoImage)
                
                Text("Welcome Back!")
                    .font(Font.custom(notificationPermissionData.titleFont, size: 20))
                    .foregroundColor(Color(notificationPermissionData.titleColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                Text("Log In into your account and get back to your courses and topics.")
                    .font(Font.custom(notificationPermissionData.titleFont, size: 14))
                    .foregroundColor(Color(notificationPermissionData.descriptionColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                    .padding(.horizontal)
            }
            
            VStack {
                HStack {
                    Image("envelope")
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .font(.custom("Rubik-Regular", size: 14))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                        .padding(.leading, 12)
                        .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                    Spacer()
                    
                }
                
                Divider()
                
                HStack {
                    Image("lock")
                    
                    if self.isSecured {
                        SecureField("Password", text: $password)
                            .focused($focusedField, equals: .password)
                            .textContentType(.password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.custom("Rubik-Regular", size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.leading, 12)
                            .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                            .keyboardType(.default)
                            .submitLabel(.done)
                    } else {
                        TextField("Password", text: $password)
                            .focused($focusedField, equals: .password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.custom("Rubik-Regular", size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.leading, 12)
                            .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                            .keyboardType(.default)
                            .submitLabel(.done)
                    }
                    
                    Spacer()
                    Button(
                        action: {
                            isSecured.toggle()
                        },
                        label: {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(Color("Grey"))
                        }
                    )
                }
                .padding(.top, 20)
                Divider()
            }
            .padding(.top, 50)
            .padding(.horizontal, 20)
            HStack {
                Spacer()
                NavigationLink(destination: ForgotPasswordView()) {
                    
                    Text("Forgot password?")
                        .font(Font.custom(notificationPermissionData.descriptionFont, size: 14))
                        .foregroundColor(Color(notificationPermissionData.titleColor))
                    
                }
                .frame(width: UIScreen.main.bounds.width / 3)
                .padding(.top, 16)
                .padding(.trailing, 20)
            }
            
            
            
            Spacer()
            Button(action: {
                let password = UserDefaults.standard.value(forKey: "Password") as? String ?? ""
                let email = UserDefaults.standard.value(forKey: "Email") as? String ?? ""
                if self.email == "11" && self.password == "11" {
                    self.showingAlert = false
                } else {
                    self.showingAlert = password != self.password || email != self.email || email.isEmpty ? true : false
                }
                
                if  !self.showingAlert {
                    DispatchQueue.main.async {
                        withAnimation {
                            viewRouter.completeAuthorization(with: "token", and: "signIn")
                        }
                    }
                }
            }, label: {
                Text("Sign In")
                    .font(Font.custom("Rubik-Medium", size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(notificationPermissionData.buttonColor))
                    .accentColor(Color(notificationPermissionData.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/60)
            })
            .alert("Wrong email or password", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            
            HStack(alignment: .center) {
                Text("Don’t have an account yet? ")
                    .font(Font.custom(notificationPermissionData.descriptionFont, size: 14))
                    .foregroundColor(Color("MainText"))
                
                NavigationLink(destination: SignUpView()
                    .navigationBarBackButtonHidden(false).navigationBarHidden(false)) {
                        Text("Sign Up")
                            .font(Font.custom(notificationPermissionData.descriptionFont, size: 14))
                            .foregroundColor(Color(notificationPermissionData.titleColor))
                    }
            }
            .padding(.bottom, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            default:
                print("Logging in…")
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

// sdfhdfh@dfhfh.com
// Tsgsdg52435sfsadF
