//
//  SquadView.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//
import SwiftUI

struct SquadView: View {
    let matchDetails: MatchDetailResponse?
    @State private var selectedTeam: String = "All"
    @State private var selectedPlayer: Player?
    @State private var showAlert: Bool = false
    
    var filteredSquad: [Player] {
            guard let teams = matchDetails?.teams else { return [] }
            
        if selectedTeam == "All" {
               return teams.values.flatMap { Array($0.players.values) }
           } else if let team = teams.first(where: { $0.key == selectedTeam }) {
               return Array(team.value.players.values)
           } else {
               return []
           }
        }
    
    var body: some View {
        VStack {
            if let teams = matchDetails?.teams {
                Picker("Select Team", selection: $selectedTeam) {
                    Text("All").tag("All")
                    ForEach(Array(teams.keys), id: \..self) { team in
                        Text(team).tag(team)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(filteredSquad, id: \..fullName) { player in
                    Button(action: {
                        selectedPlayer = player
                        showAlert = true
                    }) {
                        HStack {
                            Text(player.fullName)
                                .fontWeight(player.isCaptain == true ? .bold : .regular)
                                .foregroundColor(.black)
                            if player.isCaptain == true && player.iskeeper == true {
                                Text("(c & wk)")
                                    .foregroundColor(.red)
                            } else {
                                if player.iskeeper == true {
                                    Text("(wk)")
                                        .foregroundColor(.red)
                                } else if player.isCaptain == true {
                                    Text("(c)")
                                        .foregroundColor(.red)
                                }
                            
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Squads")
        .alert("Player Details", isPresented: $showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            if let player = selectedPlayer {
                Text("Batting: \(player.batting.style)\nBowling: \(player.bowling?.style ?? "N/A")")
            }
        })
    }
}
