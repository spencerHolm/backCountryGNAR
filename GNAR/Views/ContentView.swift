//
//  ContentView.swift
//  GNAR
//
//  Created by Spencer Holm on 3/16/21.
//

import SwiftUI
import UIKit
import Combine

class GameSettings: ObservableObject{
    @Published  var score = 0
}

struct ContentView: View {
    
    var body: some View {
        RulesList().environmentObject(GameSettings())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
