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
                    ForEach(question2.optionsData){ info in
                        RowView(id: question2.optionsData.firstIndex(of: info)!, firstPart: info.firstPart, secondPart: info.secondPart)
                            .padding()
                            .listRowSeparator(.visible, edges: .bottom)
                            .listRowSeparator(.hidden, edges: .all)
                           
                    }
                }.listStyle(.plain)
                    
                
                Spacer()
                
                NavigationLink(destination: Question3View()) {
                    Text("Continue")
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .foregroundColor(Color(question2.buttonTextColor))
                        .background(Color(question2.buttonColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }.simultaneousGesture(TapGesture().onEnded{
                    ///
                                      
                })
                
                
            }
    }
}

struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
