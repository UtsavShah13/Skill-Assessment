//
//  MatchDetailModel.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//

import Foundation

struct MatchDetail: Codable {
    let teamHome: String
    let teamAway: String
    let match: Match
    let series: Series
    let venue: Venue
    let officials: Officials
    let weather: String
    let tossWonBy: String
    let status: String
    let statusID: String
    let playerMatch: String
    let result: String
    let winningTeam: String
    let winMargin: String
    let equation: String
}

struct Match: Codable {
    let liveCoverage: String
    let id: String
    let code: String
    let league: String
    let number: String
    let type: String
    let date: String
    let time: String
    let offset: String
    let dayNight: String
}

struct Series: Codable {
    let id: String
    let name: String
    let status: String
    let tour: String
    let tourName: String
}

struct Venue: Codable {
    let id: String
    let name: String
}

struct Officials: Codable {
    let umpires: String
    let referee: String
}

struct Innings: Codable {
    let number: String
    let battingTeam: String
    let total: String
    let wickets: String
    let overs: String
    let runRate: String
    let byes: String
    let legByes: String
    let wides: String
    let noBalls: String
    let penalty: String
    let allottedOvers: String
    let batsmen: [Batsman]
    let bowlers: [Bowler]
    let fallOfWickets: [FallOfWicket]
    let powerPlay: PowerPlay
    let partnershipCurrent: [partnershipCurrent]
}

struct partnershipCurrent: Codable {
    let runs: String
    let balls: String
    let batsmen: [Batsman]
}

struct Batsman: Codable {
    let batsman: String
    let runs: String
    let balls: String
    let fours: String
    let sixes: String
    let dots: String
    let strikeRate: String
    let dismissal: String
    let howOut: String
    let bowler: String?
    let fielder: String?
}

struct Bowler: Codable {
    let bowler: String
    let overs: String
    let maidens: String
    let runs: String
    let wickets: String
    let economyRate: String
    let noBalls: String
    let wides: String
    let dots: String
}

struct FallOfWicket: Codable {
    let batsman: String
    let score: String
    let overs: String
}

struct PowerPlay: Codable {
    let pp1: String
    let pp2: String
}

struct Teams: Codable {
    let teams: [String: Team]
}

struct Team: Codable {
    let nameFull: String
    let nameShort: String
    let players: [String: Player]
}

struct Player: Codable {
    let position: String
    let nameFull: String
    let isCaptain: Bool?
    let iskeeper: Bool?
    let batting: Batting
    let bowling: Bowling
}

struct Batting: Codable {
    let style: String
    let average: String
    let strikeRate: String
    let runs: String
}

struct Bowling: Codable {
    let style: String
    let average: String
    let economyRate: String
    let wickets: String
}

struct Root: Codable {
    let matchDetail: MatchDetail
    let nuggets: [String]
    let innings: [Innings]
    let teams: Teams
    let notes: [String: [String]]
}

// Decoding Example
func decodeJSON(from jsonData: Data) -> Root? {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        return try decoder.decode(Root.self, from: jsonData)
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}
