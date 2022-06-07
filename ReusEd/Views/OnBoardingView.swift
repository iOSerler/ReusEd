//
//  OnBoardingView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct OnBoardingView: View {
    let backgroundColor = Color(#colorLiteral(red: 0.2705882353, green: 0.3019607843, blue: 0.3568627451, alpha: 1))
    let primaryMain = Color(#colorLiteral(red: 0.3803921569, green: 0.2745098039, blue: 0.7764705882, alpha: 1))
    
    
    @State var isPresented =  UserDefaults.standard.bool(forKey: "OnBoardingPresented")
    
    var body: some View {
        NavigationView{
            Group{
                if isPresented {
                    Test1View()
                } else {
                    pages()
                }
            }
//            pages()
//        }.sheet(isPresented: $isPresented) {
//            Test1View()
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}


struct pages: View {
    let grey2 = Color(#colorLiteral(red: 0.6078431373, green: 0.6196078431, blue: 0.662745098, alpha: 1))
    let mainText = Color(#colorLiteral(red: 0.2117647059, green: 0.2117647059, blue: 0.3607843137, alpha: 1))
    let primaryMain = Color(#colorLiteral(red: 0.3803921569, green: 0.2745098039, blue: 0.7764705882, alpha: 1))
    let primaryLighter = Color(#colorLiteral(red: 0.8745098039, green: 0.8549019608, blue: 0.9568627451, alpha: 1))
    
    @State private var selectedIndex: Int = 0
    var body: some View {
        VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(pagesData) { page in
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
               
                ForEach(0..<pagesData.count) { index in
                    Capsule()
                        .foregroundColor(selectedIndex == index ? primaryMain : primaryLighter)
                        .frame(width: selectedIndex == index ? 16 : 8, height: 8)
                }
            }.onChange(of: selectedIndex) { newValue in
                if selectedIndex == pagesData.count - 1 {
                    UserDefaults.standard.set(true, forKey: "OnBoardingPresented")
                }
            }
            
            
            
            
            Button(action: {
                if selectedIndex < pagesData.count - 1 {
                    withAnimation {
                        selectedIndex += 1
                    }
                } else {
                    UserDefaults.standard.set(true, forKey: "OnBoardingPresented")
                }
            }, label: {
                HStack {
                    Text("Next")
                        .font(.custom("Rubik-Medium", size: 14))
                        .foregroundColor(.white)
                    
                    Image("fi-rr-arrow-right")
                        .padding(.leading, 20)
                }
            })
            .frame(width: UIScreen.main.bounds.width - 60, height: selectedIndex != pagesData.count - 1 ? 50 : 0, alignment: .center)
            
                .background(selectedIndex != pagesData.count - 1 ? primaryMain : Color.clear)
                .foregroundColor(selectedIndex != pagesData.count - 1 ? .white : Color.clear)
                .cornerRadius(12)
                .padding(.top, 15)
                .disabled(selectedIndex == pagesData.count - 1)
        
            
            

            
            

            NavigationLink(
                destination: Test1View().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label: {
                    HStack {
                        Text("Start")
                            .font(.custom("Rubik-Medium", size: 14))
                            .foregroundColor(selectedIndex == pagesData.count - 1 ? .white : Color.clear)

                        Image("fi-rr-arrow-right")
                            .padding(.leading, 20)
                            .opacity(selectedIndex == pagesData.count - 1 ? 1 : 0)
                    }

                    .frame(width:  UIScreen.main.bounds.width - 40, height: selectedIndex == pagesData.count - 1 ? 50 : 0, alignment: .center)
                    .background(selectedIndex == pagesData.count - 1 ? primaryMain : Color.clear)
                    .cornerRadius(12)
                    .padding(.top, 5)

                })

                .disabled(selectedIndex != pagesData.count - 1)
            
            
            
            
        }
        
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: Test1View().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    label: {
                                        Text("skip")
                                            .foregroundColor(selectedIndex != pagesData.count - 1 ? grey2 : Color.clear)
                                            .font(.custom("Rubik-Regular", size: 14))

                                    }).disabled(selectedIndex == pagesData.count - 1)
        )
        .navigationBarBackButtonHidden(true)
    }
}

