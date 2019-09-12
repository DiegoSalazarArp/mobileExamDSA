//
//  ContentView.swift
//  mobileExamDSA
//
//  Created by Diego Salazar Arp on 12-09-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
     @ObservedObject private var matchListVM = MatchListViewModel()
    
    var body: some View {
          NavigationView {
            MatchListView(matches: self.matchListVM.matches)
                
                        .navigationBarTitle("Lista de Partidos".uppercased())
            
                .navigationBarItems(leading: Button(action: reloadInfo){
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
            }
               ) }
            }
    
    private func reloadInfo() {
        self.matchListVM.fetchMatch()
    }
    
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
