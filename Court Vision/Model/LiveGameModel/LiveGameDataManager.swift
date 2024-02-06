//
//  LiveGameDataManager.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/29/23.
//

import Foundation


class LiveGameDataManager {
	
	//Variable used to pass the data back to the Live Game VC
	var passLiveData: ((LiveResponse)-> Void)?
	
	//This function is called by the Game Slate VC using the GameID
	//which is derived from the game the user selected they want to see LiveData from
	func fetchLiveData(game: Game) {
		let gameID = game.id
		//Key 1 (working key)
		let url = "https://api.sportradar.us/nba/trial/v8/en/games/\(gameID)/boxscore.json?api_key=kq3yztxczwfxd95e2bwp3zbh"
		
print(url)
		//This is where the URLSession begins and data Task initiated, once the data is fetched
		//its then passed to the liveGameVC using the passLiveData closure
		URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
			guard let data = data, error == nil else {
				print("Error with the LiveGame fetch")
				return
			}
			
			var gameData: LiveResponse?
			
			do {
				gameData = try JSONDecoder().decode(LiveResponse.self, from: data)
			}
			catch {
				print(error)
			}
			
			guard let liveGameData = gameData else {
				return
			}
			DispatchQueue.main.async {
				self.passLiveData!(liveGameData)
			}
			
		}).resume()
		
	}
	
}
