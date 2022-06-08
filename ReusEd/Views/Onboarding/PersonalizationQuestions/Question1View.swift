//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

var selectedItems = [Int]()

struct Question1View: View {
    
    //selectedItems =  UserDefaults.standard.value(forKey: "question1Answers")
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15){
                Image(question1.stepsImage)
                
                Text(question1.title)
                    .font(Font.custom(question1.titleFont, size: 20))
                    .foregroundColor(Color(question1.titleColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                
                Text(question1.description)
                    .font(Font.custom(question1.descriptionFont, size: 14))
                    .foregroundColor(Color(question1.descriptionColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                    .padding(.horizontal)
                
                
                List{
                    ForEach(question1.optionsData){ info in
                        RowView(id: question1.optionsData.firstIndex(of: info)!,firstPart: info.firstPart, secondPart: info.secondPart)
                            .padding()
                            .listRowSeparator(.visible, edges: .bottom)
                            .listRowSeparator(.hidden, edges: .all)
                           
                    }
                }.listStyle(.plain)
                 .onAppear(){
                     if let selectedItems =  UserDefaults.standard.value(forKey:"question1Answers") {
                         print(selectedItems)
                     }
                     
                 }
                    
                
                Spacer()
                
                NavigationLink(destination: Question2View()) {
                    Text("Continue")
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .foregroundColor(Color(question1.buttonTextColor))
                        .background(Color(question1.buttonColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                        
                }.simultaneousGesture(TapGesture().onEnded{
                    print(selectedItems)
                    
                    UserDefaults.standard.set(selectedItems, forKey: "question1Answers")
                    selectedItems = []
                })
                
            }.padding(.top, UIScreen.main.bounds.height/20)
             .navigationBarTitleDisplayMode(.inline)
             .navigationBarHidden(true).transition(.opacity)
            
        }.accentColor(Color(question1.titleColor))
    }
}

struct RowView: View {
    var id: Int
    var firstPart: String
    var secondPart: String
    
    @State private var tapped = false
    
    var body: some View {
        HStack{
            self.tapped ? Image("checkbox-full") : Image("checkbox-empty")
            Text(firstPart)
                .padding(.leading,10)
            Text(secondPart)
        }.onTapGesture(perform: {
            tapped.toggle()
            
            if self.tapped {
                if let _ = selectedItems.firstIndex(of: id) {
                    print("contains")
                } else {
                    selectedItems.append(id)
                }
            } else {
                if let index = selectedItems.firstIndex(of: id) {
                    selectedItems.remove(at: index)
                }
            }
            
        })
    }
}

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
