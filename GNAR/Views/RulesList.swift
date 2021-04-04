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
            ZStack{
                Color.init(red: 90.0/255.0, green: 205.0/255.0, blue: 255.0/255.0).ignoresSafeArea()
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
                    .background(Color.init(red: 90.0/255.0, green: 205.0/255.0, blue: 255.0/255.0))
                    
                    .navigationTitle("GNAR Points")
                }
                //.background(Color.blue)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct RulesList_Previews: PreviewProvider {
    static var previews: some View {
        RulesList().environmentObject(GameSettings())
    }
}

