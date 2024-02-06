//
//  GameData.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/25/23.
//

//This is the model for the GameSlate/Main Screen
import Foundation


struct GameSlateResponse: Decodable {
	
	let games: [Game]
	
	
}

struct Game: Decodable, Hashable {

	let home: Team
	
	let away: Team
	
	let id: String
	
	let scheduled: String
	
	let status: String
		
	let home_points: Int?
	
	let away_points: Int?
	
	static func == (lhs: Game, rhs: Game) -> Bool {
		return lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

struct Team: Decodable {
	
	let name: String
	
	let alias: String
	
}


