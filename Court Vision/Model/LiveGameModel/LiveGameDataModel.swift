//
//  LiveGameDataModel.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/13/23.
//

import Foundation

//This is the Data Model for the Live-Game screen
struct LiveResponse: Decodable {
		
	let status: String
	
	let scheduled: String
	
	let clock: String

	let quarter: Int
	
	let home: LiveTeam
	
	let away: LiveTeam
	
}


struct LiveTeam: Decodable {
	
	let name: String
	
	let alias: String
	
	let market: String
	
	let points: Int
	
	let record: TeamRecord?
	
	let scoring: [Scoring]?
	
	let leaders: Leaders?
}


struct TeamRecord: Decodable {
	
	let wins: Int
	
	let losses: Int
	
}

struct Scoring: Decodable {
	
	let number: Int
	
	let points: Int
	
	let sequence: Int
	
	let type: String
	
}

struct Leaders: Decodable {
	
	let points: [StatLeader]?
	
	let rebounds: [StatLeader]?
	
	let assists: [StatLeader]?
	
}

struct StatLeader: Decodable {
	
	let full_name: String
	
	let jersey_number: String
	
	let statistics: Statistics
	
}

struct Statistics: Decodable {
	
	let minutes: String
	
	let points: Int
	
	let field_goals_att: Int
	
	let field_goals_made: Int
	
	let three_points_att: Int
	
	let three_points_made: Int
	
	let free_throws_att: Int

	let free_throws_made: Int
	
	let rebounds: Int
		
	let offensive_rebounds: Int
	
	let defensive_rebounds: Int
	
	let assists: Int
	
	let turnovers: Int
	
	let pls_min: Int

}
