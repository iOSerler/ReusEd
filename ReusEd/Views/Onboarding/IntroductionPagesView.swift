//
//  IntroductionPages.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct IntroductionPagesView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var selectedIndex: Int = 0
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(introductionPagesData) { page in
                    GeometryReader { geom in
                        VStack(alignment: .center) {
                            Image(page.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height / 3)
                            //                                    .padding(.top, UIScreen.main.bounds.height / 15)
                            
                            Text(page.title)
                                .font(.custom(page.titleFont, size: 18))
                                .foregroundColor(Color(page.titleColor))
                                .multilineTextAlignment(.center)
                                .padding(.top, 30)
                            
                            Text(page.description)
                                .font(.custom(page.descriptionFont, size: 14))
                                .foregroundColor(Color(page.descriptionColor))
                                .multilineTextAlignment(.center)
                                .padding(.top, 12)
                                .padding(.horizontal, 20)
                        }
                        .opacity(Double(geom.frame(in: . global).minX)/200+1)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 12) {
                
                ForEach(0..<introductionPagesData.count, id: \.self) { index in
                    Capsule()
                        .foregroundColor(
                            selectedIndex == index ?
                            Color(introductionPagesData[0].buttonColor) :
                                Color(introductionPagesData[0].capsuleOffColor)
                        )
                        .frame(width: selectedIndex == index ? 16 : 8, height: 8)
                }
            }
            
            Button(action: {
                if selectedIndex < introductionPagesData.count - 1 {
                    withAnimation {
                        selectedIndex += 1
                    }
                } else {
                    DispatchQueue.main.async {
                        withAnimation {
                            viewRouter.completeIntroduction()
                        }
                    }
                }
            }, label: {
                HStack {
                    Text(selectedIndex != introductionPagesData.count - 1 ? "Next" : "Get Started")
                        .font(.custom(introductionPagesData[0].titleFont, size: 16))
                        .foregroundColor(Color(introductionPagesData[0].buttonTextColor))
                    
                    Image(introductionPagesData[0].buttonImage)
                        .padding(.leading, 20)
                }
                
                .font(Font.custom("Rubik-Medium", size: 16))
                .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                .background(Color(introductionPagesData[0].buttonColor))
                .accentColor(Color(introductionPagesData[0].buttonTextColor))
                .cornerRadius(UIScreen.main.bounds.width/35)
            })
            .padding(.top, 15)
            .padding(.bottom, UIScreen.main.bounds.height/30)
        }
        .navigationBarItems(trailing:
                                
                                Button(action: {
            viewRouter.showNotificationPermission()
            
        }, label: {
            Text("skip")
                .foregroundColor(
                    selectedIndex != introductionPagesData.count - 1 ?
                    Color(introductionPagesData[0].descriptionColor) : Color.clear
                )
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
