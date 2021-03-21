//
//  RulesDetail.swift
//  GNAR
//
//  Created by Spencer Holm on 3/18/21.
//

import SwiftUI

struct RulesDetail: View {
    
    @EnvironmentObject var settings: GameSettings
    
    var points: Points
    
    var body: some View {
        
        VStack{
        VStack(alignment: .leading){
            
            Text("Type: \(points.type)")
                .font(.title2)
                .foregroundColor(.secondary)
            HStack{
                Text(points.name)
                Spacer()
                Text("\(points.points) pts")
                    
            }
            .font(.title)
            
            Divider()
            
            Text("Description:")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Text(points.description)
                
            .navigationTitle(points.name)
                .navigationBarTitleDisplayMode(.automatic)
        }
        
            
            Button(action: {
                settings.score += strToInt(str: points.points)
            }){
                Text("Add")
            }
            .buttonStyle(CustomButtonStyle())
            
            Button(action: {
                settings.score -= strToInt(str: points.points)
            }){
                Text("Remove")
            }
            .buttonStyle(RemoveButtonStyle())
            
            Spacer()
        }
        .padding()
    }
}



func strToInt(str: String) -> Int {
    var str = str
    str.removeAll {$0 == ","}
    return Int(str) ?? 0
}

struct RulesDetail_Previews: PreviewProvider {
    static var previews: some View {
        RulesDetail(points: ruleslist[0].rules[0])
    }
}
