//
//  MatchDetailModel.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//

import Foundation

// MARK: - Root Model
struct MatchDetailResponse: Codable {
    let matchDetail: MatchDetail
    let nuggets: [String]?
    let innings: [Inning]?
    let teams: [String: Team]?
    let notes: [String:[String]]?
    
    enum CodingKeys: String, CodingKey {
        case matchDetail = "Matchdetail"
        case nuggets = "Nuggets"
        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
    }
}

// MARK: - Match Detail
struct MatchDetail: Codable {
    let teamHome: String?
    let teamAway: String?
    let match: MatchInfo?
    let series: Series?
    let venue: Venue?
    let officials: Officials?
    let weather: String?
    let tossWonBy: String?
    let status: String?
    let statusID: String?
    let playerMatch: String?
    let result: String?
    let winningTeam: String?
    let winMargin: String?
    let equation: String?

    enum CodingKeys: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tossWonBy = "Tosswonby"
        case status = "Status"
        case statusID = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningTeam = "Winningteam"
        case winMargin = "Winmargin"
        case equation = "Equation"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teamHome = try values.decodeIfPresent(String.self, forKey: .teamHome)
        teamAway = try values.decodeIfPresent(String.self, forKey: .teamAway)
        match = try values.decodeIfPresent(MatchInfo.self, forKey: .match)
        series = try values.decodeIfPresent(Series.self, forKey: .series)
        venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
        officials = try values.decodeIfPresent(Officials.self, forKey: .officials)
        weather = try values.decodeIfPresent(String.self, forKey: .weather)
        tossWonBy = try values.decodeIfPresent(String.self, forKey: .tossWonBy)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        statusID = try values.decodeIfPresent(String.self, forKey: .statusID)
        playerMatch = try values.decodeIfPresent(String.self, forKey: .playerMatch)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        winningTeam = try values.decodeIfPresent(String.self, forKey: .winningTeam)
        winMargin = try values.decodeIfPresent(String.self, forKey: .winMargin)
        equation = try values.decodeIfPresent(String.self, forKey: .equation)
    }
}

// MARK: - Match Information
struct MatchInfo: Codable {
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

    enum CodingKeys: String, CodingKey {
        case liveCoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case dayNight = "Daynight"
    }
}

// MARK: - Series Information
struct Series: Codable {
    let id: String
    let name: String
    let status: String
    let tour: String
    let tourName: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}

// MARK: - Venue Information
struct Venue: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - Officials Information
struct Officials: Codable {
    let umpires: String
    let referee: String

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}

// MARK: - Inning Details
struct Inning: Codable {
    let number: String
    let battingTeam: String
    let total: String
    let wickets: String
    let overs: String
    let runRate: String
    let target: String?
    let batsmen: [Batsman]
    let bowlers: [Bowler]
    let fallOfWickets: [FallOfWicket]
    let powerPlay: PowerPlay?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case battingTeam = "Battingteam"
        case total = "Total"
        case wickets = "Wickets"
        case overs = "Overs"
        case runRate = "Runrate"
        case target = "Target"
        case batsmen = "Batsmen"
        case bowlers = "Bowlers"
        case fallOfWickets = "FallofWickets"
        case powerPlay = "PowerPlay"
    }
}

// MARK: - Batsman Information
struct Batsman: Codable {
    let batsmanID: String
    let runs: String
    let balls: String
    let fours: String
    let sixes: String
    let strikerate: String
    let dismissal: String
    let howOut: String
    let bowler: String?
    let fielder: String?

    enum CodingKeys: String, CodingKey {
        case batsmanID = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
        case fours = "Fours"
        case sixes = "Sixes"
        case strikerate = "Strikerate"
        case dismissal = "Dismissal"
        case howOut = "Howout"
        case bowler = "Bowler"
        case fielder = "Fielder"
    }
}

// MARK: - Bowler Information
struct Bowler: Codable {
    let bowlerID: String
    let overs: String
    let maidens: String
    let runs: String
    let wickets: String
    let economyRate: String
    let noBalls: String
    let wides: String
    let dots: String

    enum CodingKeys: String, CodingKey {
        case bowlerID = "Bowler"
        case overs = "Overs"
        case maidens = "Maidens"
        case runs = "Runs"
        case wickets = "Wickets"
        case economyRate = "Economyrate"
        case noBalls = "Noballs"
        case wides = "Wides"
        case dots = "Dots"
    }
}

// MARK: - Fall of Wickets
struct FallOfWicket: Codable {
    let batsmanID: String
    let score: String
    let overs: String

    enum CodingKeys: String, CodingKey {
        case batsmanID = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
}

// MARK: - Power Play Information
struct PowerPlay: Codable {
    let pp1: String
    let pp2: String?

    enum CodingKeys: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
}

// MARK: - Team Information
struct Team: Codable {
    let fullName: String
    let shortName: String
    let players: [String: Player]

    enum CodingKeys: String, CodingKey {
        case fullName = "Name_Full"
        case shortName = "Name_Short"
        case players = "Players"
    }
}

// MARK: - Player Information
struct Player: Codable {
    let position: String
    let fullName: String
    let isCaptain: Bool?
    let iskeeper: Bool?
    let batting: BattingStats
    let bowling: BowlingStats?

    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case fullName = "Name_Full"
        case isCaptain = "Iscaptain"
        case batting = "Batting"
        case bowling = "Bowling"
        case iskeeper = "Iskeeper"
    }
}

// MARK: - Batting Stats
struct BattingStats: Codable {
    let style: String
    let average: String?
    let strikeRate: String?
    let runs: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikeRate = "Strikerate"
        case runs = "Runs"
    }
}

// MARK: - Bowling Stats
struct BowlingStats: Codable {
    let style: String
    let average: String?
    let economyRate: String?
    let wickets: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyRate = "Economyrate"
        case wickets = "Wickets"
    }
}

//// Decoding Example
//func decodeJSON(from jsonData: Data) -> MatchDetailResponse? {
//    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
//    do {
//        return try decoder.decode(MatchDetailResponse.self, from: jsonData)
//    } catch {
//        print("Error decoding JSON: \(error)")
//        return nil
//    }
//}
