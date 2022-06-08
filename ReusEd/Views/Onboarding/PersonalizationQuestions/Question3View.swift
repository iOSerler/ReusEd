//
//  Question3View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question3View: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        VStack(alignment: .center){
            Image("Question3")
            
            Text("Pick your learning goal")
                .font(Font.custom("Rubik-Medium", size: 20))
                .foregroundColor(Color(notificationPermissionData.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.top, 30)
            
            Text("Tell us how much time you’re willing to spend during your day learing.")
                .font(Font.custom("Rubik-Regular", size: 14))
                .foregroundColor(Color(notificationPermissionData.descriptionColor))
                .multilineTextAlignment(.center)
                .frame(idealHeight: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            
            
            
            Button(action: {
                print("casual")
            }) {
                HStack {
                    Text("Casual")
                        .font(.custom("Rubik-Medium", size: 16))
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    Spacer()
                    Text("5 min / day")
                        .font(.custom("Rubik-Regular", size: 14))
                        .foregroundColor(Color("Gray"))
                        .padding(.trailing, 20)
                    
                }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .background(.white)
                    
                    
            }
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("border"), lineWidth: 2))
                .padding(.top, 30)
                
                
                
                
            
            
            Button(action: {
                print("regular")
            }) {
                HStack {
                    Text("Regular")
                        .font(.custom("Rubik-Medium", size: 16))
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    Spacer()
                    Text("10 min / day")
                        .font(.custom("Rubik-Regular", size: 14))
                        .foregroundColor(Color("Gray"))
                        .padding(.trailing, 20)
                    
                }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .background(.white)
                    
            }
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("border"), lineWidth: 2))
                .padding(.top, 10)
                
                
                
            
            
            Button(action: {
                print("serious")
            }) {
                HStack {
                    Text("Serious")
                        .font(.custom("Rubik-Medium", size: 16))
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    Spacer()
                    Text("15 min / day")
                        .font(.custom("Rubik-Regular", size: 14))
                        .foregroundColor(Color("Gray"))
                        .padding(.trailing, 20)
                    
                }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .background(.white)
                    
            }
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("border"), lineWidth: 2))
                .padding(.top, 10)
            
            
            
            
            
            Button(action: {
                print("intense")
            }) {
                HStack {
                    Text("Intense")
                        .font(.custom("Rubik-Medium", size: 16))
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    Spacer()
                    Text("20 min / day")
                        .font(.custom("Rubik-Regular", size: 14))
                        .foregroundColor(Color("Gray"))
                        .padding(.trailing, 20)
                    
                }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .background(.white)
                    
            }
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("border"), lineWidth: 2))
                .padding(.top, 10)
               
                
                
            
            
            
            
            
            
            
            Spacer()
            
            
            
            
            
            
            
            
            
            Button(action: {
                print("continue")
            }) {
                Text("Continue")
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(notificationPermissionData.buttonColor))
                    .accentColor(Color(notificationPermissionData.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }
        }.padding(.top, UIScreen.main.bounds.height/20)
        
    }
}

struct Question3View_Previews: PreviewProvider {
    static var previews: some View {
        Question3View()
    }
}



