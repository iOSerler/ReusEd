//
//  ScoresView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct ScoresView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World! This is Scores View")
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Scores")
        }
        
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
