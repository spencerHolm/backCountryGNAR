//
//  RulesRow.swift
//  GNAR
//
//  Created by Spencer Holm on 3/18/21.
//

import SwiftUI

struct RulesRow: View {
    
    var pointsList: Points
    
    var body: some View {
        HStack{
            Text(pointsList.name)
                .font(.title2)
            Spacer()
            
            Text(pointsList.points)
                .font(.title2)
        }
        .padding()
    }
}

struct RulesRow_Previews: PreviewProvider {
    static var previews: some View {
        RulesRow(pointsList: ruleslist[0].rules[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
