
//  StandingsDataModel.swift
//  Court Vision
//  Created by Daniel Efrain Ocasio on 7/7/23.


import Foundation

//This is the Model for the Standings Data
struct StandingsResponse: Decodable {
	
	let season: SeasonInfo
	
	let conferences: [Conference]
	
}

struct SeasonInfo: Decodable {
	
	let year: Int
	
	let type: String
	
}

struct Conference: Decodable {

	let divisions: [Division]
	
}

struct Division: Decodable {
	
	let teams: [Teams]
	
}

struct Teams: Decodable {
	
	let name: String
		
	let market: String
	
	let wins: Int
	
	let losses: Int
	
	let win_pct: Double
	
	let games_behind: GamesBehind
	
	let calc_rank: Rank
	
	let records: [Records]?
	
}

struct Rank: Decodable {
	
	let conf_rank: Int?
	
}

struct GamesBehind: Decodable {
	
	let conference: Double
	
}


struct Records: Decodable {
	
	let losses: Int
	
	let record_type: String
	
	let wins: Int
	
}
