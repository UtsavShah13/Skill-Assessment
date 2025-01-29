//
//  MatchView.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//

import SwiftUI

struct MatchView: View {
    @StateObject var viewModel = MatchDetailsViewModel()
    @State var isFirstMatch: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                if let match = viewModel.matchDetails?.matchDetail {
                    HStack {
                        Text("Match:")
                            .font(.title)
                            .bold()

                        Text("\(match.teamHome ?? "") vs \(match.teamAway ?? "")")
                    }
                    
                    HStack {
                        Text("Venu:")
                            .font(.title)
                            .bold()

                        Text(match.venue?.name ?? "")

                    }
                    
                    HStack {
                        Text("Date:")
                            .font(.title)
                            .bold()

                        Text(match.match?.date ?? "")

                    }

                    NavigationLink(destination: SquadView(matchDetails: viewModel.matchDetails)) {
                        Text("View Squads")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        if isFirstMatch {
                            viewModel.getOtherMatches()
                        } else {
                            viewModel.getMatches()
                        }
                        isFirstMatch = !isFirstMatch
                        
                    }) {
                        if isFirstMatch {
                            Text("Other match")
                                .font(.title)
                                .bold()

                        } else {
                            Text("First match")
                                .font(.title)
                                .bold()

                        }

                    }
                } else {
                    ProgressView("Loading Match Details...")
                        .onAppear {
                            viewModel.getMatches()
                        }
                }
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
