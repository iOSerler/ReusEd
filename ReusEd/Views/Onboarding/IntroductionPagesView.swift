//
//  IntroductionPages.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct IntroductionPagesView: View {
    let grey2 = Color(#colorLiteral(red: 0.6078431373, green: 0.6196078431, blue: 0.662745098, alpha: 1))
    let mainText = Color(#colorLiteral(red: 0.2117647059, green: 0.2117647059, blue: 0.3607843137, alpha: 1))
    let primaryMain = Color(#colorLiteral(red: 0.3803921569, green: 0.2745098039, blue: 0.7764705882, alpha: 1))
    let primaryLighter = Color(#colorLiteral(red: 0.8745098039, green: 0.8549019608, blue: 0.9568627451, alpha: 1))
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var selectedIndex: Int = 0
    var body: some View {
        VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(introductionPagesData) { page in
                        GeometryReader { g in
                            VStack(alignment: .center) {
                                Image(page.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: UIScreen.main.bounds.height / 3)
//                                    .padding(.top, UIScreen.main.bounds.height / 15)
                                
                                Text(page.title)
                                    .font(.custom("Rubik-Medium", size: 18))
                                    .foregroundColor(mainText)
                                    .multilineTextAlignment(.center)
                                    .padding(.top , 30)
                                
                                Text(page.description)
                                    .font(.custom("Rubik-Regular", size: 14))
                                    .foregroundColor(grey2)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 12)
                                    .padding(.horizontal, 20)
                            }
                            .opacity(Double(g.frame(in : . global).minX)/200+1)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.top)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            
                
            HStack(spacing: 12) {
               
                ForEach(0..<introductionPagesData.count) { index in
                    Capsule()
                        .foregroundColor(selectedIndex == index ? primaryMain : primaryLighter)
                        .frame(width: selectedIndex == index ? 16 : 8, height: 8)
                }
            }

            
            
            
            Button(action: {
                if selectedIndex < introductionPagesData.count - 1 {
                    withAnimation {
                        selectedIndex += 1
                    }
                } else {
//                    UserDefaults.standard.set(true, forKey: "OnBoardingPresented")
                    DispatchQueue.main.async {
                        withAnimation {
                            viewRouter.currentPage = .notificationPermission
                        }
                    }
                }
            }, label: {
                HStack {
                    Text(selectedIndex != introductionPagesData.count - 1 ? "Next" : "Start")
                        .font(.custom("Rubik-Medium", size: 14))
                        .foregroundColor(.white)
                    
                    Image("fi-rr-arrow-right")
                        .padding(.leading, 20)
                }.frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
            })
            
            
                .background(primaryMain)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.top, 15)
                .padding(.bottom, UIScreen.main.bounds.height/30)
            
        
            
        }
            .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: DailyNotificationsPermissionView().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    label: {
                                        Text("skip")
                                            .foregroundColor(selectedIndex != introductionPagesData.count - 1 ? grey2 : Color.clear)
                                            .font(.custom("Rubik-Regular", size: 14))

                                    }).disabled(selectedIndex == introductionPagesData.count - 1)
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct IntroductionPagesView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionPagesView()
    }
}
