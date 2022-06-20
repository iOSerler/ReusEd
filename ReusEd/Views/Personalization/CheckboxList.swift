//
//  PersonalizationCompleteView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct CheckboxList: View {
    
    let question: QuestionData
    
    var body: some View {
        List {
            ForEach(question.optionsData) { optionData in
                
                CheckboxRow(
                    optionData: optionData,
                    tapAction: { checked in
                        if checked {
                            personalizationQuestionSelectedItemsDict[question.id]?.insert(optionData.id)
                            
                        } else {
                            personalizationQuestionSelectedItemsDict[question.id]?.remove(optionData.id)
                        }
                    },
                    checked: personalizationQuestionSelectedItemsDict[question.id]?.contains(optionData.id) ?? false
                )
                .padding()
                .listRowSeparator(.visible, edges: .bottom)
                .listRowSeparator(.hidden, edges: .all)
            }
        }.listStyle(.plain)
    }
}

struct CheckboxRow: View {
    
    let optionData: OptionData
    let tapAction: (Bool) -> Void
    
    @State var checked: Bool
    
    var body: some View {
        HStack {
            self.checked ? Image(icons.checkboxFull) : Image(icons.checkboxEmpty)
            Text(optionData.firstPart)
                .padding(.leading, 10)
            Text(optionData.secondPart)
            Spacer()
        }.contentShape(Rectangle())
            .onTapGesture(perform: {
                checked.toggle()
                tapAction(checked)
                
            })
    }
}
