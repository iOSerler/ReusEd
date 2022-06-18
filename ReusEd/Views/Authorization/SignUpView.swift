//
//  SignUpView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert = false
    @State private var alertText: String = ""
    @State private var isSecured1: Bool = true
    @State private var isSecured2: Bool = true
    @FocusState  var focusedField: SignUpField?
    
    enum SignUpField {
        case name
        case email
        case password
        case confirmPassword
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
                Image(notificationPermissionData.logoImage)

                Text("Get Started")
                    .font(Font.custom(notificationPermissionData.titleFont, size: 20))
                    .foregroundColor(Color(notificationPermissionData.titleColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)

                Text("Create your account and enjoy easy and intuitive learning with ReusEd.")
                    .font(Font.custom(notificationPermissionData.titleFont, size: 14))
                    .foregroundColor(Color(notificationPermissionData.descriptionColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                    .padding(.horizontal)
            }
            VStack {
                HStack {
                    Image("user")

                    TextField("Name", text: $name)
                        .focused($focusedField, equals: .name)
                        .textContentType(.givenName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.custom("Rubik-Regular", size: 14))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.leading, 12)
                        .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                        .keyboardType(.default)
                        .submitLabel(.next)
                    Spacer()

                }
                Divider()
                HStack {
                    Image("envelope")

                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.custom("Rubik-Regular", size: 14))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.leading, 12)
                        .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                    Spacer()

                }
                .padding(.top, 20)

                Divider()

                HStack {
                    Image("lock")
                    if self.isSecured1 {
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
                            .submitLabel(.next)

                    } else {
                        TextField("Password", text: $password)
                            .focused($focusedField, equals: .password)
                            .textContentType(.password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.custom("Rubik-Regular", size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.leading, 12)
                            .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                            .submitLabel(.next)
                    }

                    Spacer()

                    Button(action: {
                                    isSecured1.toggle()
                                },
                           label: {
                                    Image(systemName: self.isSecured2 ? "eye.slash" : "eye")
                                        .accentColor(Color("Grey"))
                                })
                }
                .padding(.top, 20)

                Divider()

                HStack {
                    Image("lock")
                    if self.isSecured2 {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .focused($focusedField, equals: .confirmPassword)
                            .textContentType(.password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.custom("Rubik-Regular", size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.leading, 12)
                            .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                            
                    } else {
                        TextField("Confirm Password", text: $confirmPassword)
                            .focused($focusedField, equals: .confirmPassword)
                            .textContentType(.password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.custom("Rubik-Regular", size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.leading, 12)
                            .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                            
                    }

                    Spacer()

                    Button(action: {
                                    isSecured2.toggle()
                                },
                           label: {
                                    Image(systemName: self.isSecured2 ? "eye.slash" : "eye")
                                        .accentColor(Color("Grey"))
                                })
                }
                .padding(.top, 20)
                Divider()

            }
            .padding(.top, 50)
            .padding(.horizontal, 20)
            .onSubmit {
                switch focusedField {
                case .name:
                    focusedField = .email
                case .email:
                    focusedField = .password
                case .password:
                    focusedField = .confirmPassword
                default:
                    print("Creating account…")
                }
            }

            Spacer()

            Text("By continuing, you agree to our")
                .font(.custom("Rubik-Regular", size: 12))
                .foregroundColor(Color("Grey"))

            HStack {
                Link("Terms of Service", destination: URL(string: "https://www.apple.com")!)
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(Color("Primary"))
                Text("·")
                Link("Privacy Policy", destination: URL(string: "https://www.apple.com")!)
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(Color("Primary"))
                Text("·")
                Link("Content Policy", destination: URL(string: "https://www.apple.com")!)
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(Color("Primary"))

            }

            Button(action: {
                if !self.name.isEmpty {
                    if isValidString(string: self.email, regEx: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") {
                        if isValidString(string: self.password, regEx: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$") {
                            UserDefaults.standard.set(self.name, forKey: "Name")
                            UserDefaults.standard.set(self.email, forKey: "Email")
                            UserDefaults.standard.set(self.password, forKey: "Password")

                            DispatchQueue.main.async {
                                withAnimation {
                                    viewRouter.completeAuthorization(with: "token", and: "signUp")
                                }
                            }
                        } else {
                            self.alertText = "Wrong password type"
                            self.showAlert = true
                        }
                    } else {
                        self.alertText = "Please, enter a proper email"
                        self.showAlert = true
                    }
                } else {
                    self.alertText = "Name cannot be empty"
                    self.showAlert = true
                }
                // sdfhdfh@dfhfh.com
               // Tsgsdg52435sfsadF
            }, label: {
                Text("Continue")
                    .font(Font.custom("Rubik-Medium", size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(notificationPermissionData.buttonColor))
                    .accentColor(Color(notificationPermissionData.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/60)
            })

            .alert(self.alertText, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }

            HStack(alignment: .center) {
                Text("Already have an account? ")
                    .font(Font.custom(notificationPermissionData.descriptionFont, size: 14))
                    .foregroundColor(Color("MainText"))

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Sign In")
                        .font(Font.custom(notificationPermissionData.descriptionFont, size: 14))
                        .foregroundColor(Color(notificationPermissionData.titleColor))
                })
            }
            .padding(.bottom, 10)
        }.navigationBarTitleDisplayMode(.inline)
    }

    func isValidString(string: String, regEx: String) -> Bool {
            let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
            return pred.evaluate(with: string)
        }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

// sdfhdfh@dfhfh.com
// Tsgsdg52435sfsadF
