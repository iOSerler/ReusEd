//
//  Question2View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question2View: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15){
            Image(question2.stepsImage)
            
            Text(question2.title)
                .font(Font.custom(question2.titleFont, size: 20))
                .foregroundColor(Color(question2.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
            
            Text(question2.description)
                .font(Font.custom(question2.descriptionFont, size: 14))
                .foregroundColor(Color(question2.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)
            
            
            List{
                ForEach(question2.optionsData.indices){ index in
                    RowView(id: question2.optionsData.firstIndex(of: question2.optionsData[index])!,firstPart: question2.optionsData[index].firstPart, secondPart: question2.optionsData[index].secondPart, tapped: question2SelectedItemsBool[index], questionId: 2)
                        .padding()
                        .listRowSeparator(.visible, edges: .bottom)
                        .listRowSeparator(.hidden, edges: .all)
                    
                }
            }
            .listStyle(.plain)
            .onAppear(){
                //                            print(selectedItems)
            }
            
            
            Spacer()
            
            NavigationLink(destination: Question3View()) {
                Text("Continue")
                    .font(Font.custom(question2.titleFont, size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .foregroundColor(Color(question2.buttonTextColor))
                    .background(Color(question2.buttonColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }.simultaneousGesture(TapGesture().onEnded{
                question2SelectedItemsIdx = question2SelectedItemsIdxTemp
                question2SelectedItemsBool = [Bool]()
                for _ in 0...question2.optionsData.count - 1 {
                    question2SelectedItemsBool.append(false)
                }
                for item in question2SelectedItemsIdx {
                    question2SelectedItemsBool[item] = true
                }
                //                    print(question2SelectedItemsBool)
                UserDefaults.standard.set(question2SelectedItemsIdx, forKey: "question2SelectedIdx")
                
            })
            
            
        }
    }
}

struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
