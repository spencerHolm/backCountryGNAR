//
//  RulesList.swift
//  GNAR
//
//  Created by Spencer Holm on 3/18/21.
//

import SwiftUI

struct RulesList: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Score:")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text("\(settings.score)")
                    .font(.system(size: 60, weight: .bold))
                    //.padding()
                
                List(){
                    ForEach(ruleslist) { rule in
                        
                        Section(header: Text(rule.type)){
                            ForEach(rule.rules){ item in
                                NavigationLink(destination: RulesDetail(points: item)){
                                    RulesRow(pointsList: item)
                                }
                            }
                        }
                    }
                }
                
                    .navigationTitle("Backcountry G.N.A.R.")
            }
        }
    }
}

struct RulesList_Previews: PreviewProvider {
    static var previews: some View {
        RulesList().environmentObject(GameSettings())
    }
}

