//
//  GameDataManager.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/25/23.
//
import Foundation


class GameSlateDataManager {
	
	//Variable that will be used to pass the fetched data back to the VC
	var passData: (([Game])-> Void)?
	
	//This is used to get the current date in string form to be used in the URL
	lazy var dateString: String = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy/MM/dd"
		let dateString = dateFormatter.string(from: Date.now)
		return dateString
	}()
	
	//Fetches the current dates NBA Game data
	func fetchData() {
		//Key 1 (Working Key)
		let url = "https://api.sportradar.us/nba/trial/v8/en/games/\(dateString)/schedule.json?api_key=kq3yztxczwfxd95e2bwp3zbh"
//		let url = "https://api.sportradar.us/nba/trial/v8/en/games/2023/04/09/schedule.json?api_key=kq3yztxczwfxd95e2bwp3zbh"


		//This is where the actual URL Session begins and data task is initiated,
		//Once the fetch is completed it passes the data using the passData closure
		URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
			guard let data = data, error == nil else {
				print("Error with the GameSlate Fetch")
				return
			}
			var gameData: GameSlateResponse?
			do {
				gameData = try JSONDecoder().decode(GameSlateResponse.self, from: data)
			}
			catch {
				print(error)
			}
			
			guard let dailyGameData = gameData else {
				return
			}
			
			DispatchQueue.main.async {
				self.passData?(dailyGameData.games)
			}
		}).resume()
	}
}
