//
//  StandingsDataManager.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/13/23.
//

import Foundation

class StandingsDataManager {
	
	var passStandingsData:(([Teams], [Teams]) -> Void)?
	
	
	//Below is used to break down the large amount of data by division/conference
	
	//West Conference Data Breakdown
	var westConference: Conference?
	//West Divisions
	var southWestDivision: Division?
	var pacificDivision: Division?
	var northWestDivision: Division?
	//West Array
	var westTeamsArray: [Teams] = []
	
	//East Conference Data Breakdown
	var eastConference: Conference?
	//East Divisions
	var centralDivision: Division?
	var southeastDivision: Division?
	var atlanticDivision: Division?
	//East Array
	var eastTeamsArray: [Teams] = []


	//The below is used to calculate what season the NBA is in, depending on year and month
	//since the nba runs from october to july of the following year, the logic is used
	//to ensure the correct year is used depending on the month of the year
	var seasonYear: String = {
		let yearString: String
		
		let monthFormatter = DateFormatter()
		monthFormatter.dateFormat = "MM"
		var monthInt = Int("\(monthFormatter.string(from: Date.now))")!
		
		let yearFormatter = DateFormatter()
		yearFormatter.dateFormat = "yyyy"
		var yearInt = Int(yearFormatter.string(from: Date.now))!
		
		if (1...9).contains(monthInt) {
			yearString = "\(yearInt - 1)"
			
		} else {
			yearString = "\(yearInt)"
		}
		
		return yearString
	}()
		
	
	//This is the function that is in charge of fetching the data
	func fetchStandings() {
		//Key 1 (Working key)
		print(seasonYear)
		let urlString =  "https://api.sportradar.us/nba/trial/v8/en/seasons/\(seasonYear)/REG/standings.json?api_key=kq3yztxczwfxd95e2bwp3zbh"
//		let urlString =  "https://api.sportradar.us/nba/trial/v8/en/seasons/2022/REG/standings.json?api_key=kq3yztxczwfxd95e2bwp3zbh"
		print(urlString)
		
		//Here is where the URL Session begins and data task is initiated, once fetch is complete
		//it is passed over to dataManagement function to organize all the data
		URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: {data, response, error in
			guard let data = data, error == nil else {
				print("Error with standings fetch")
				return
			}
			
			var standingsData: StandingsResponse?
			
			do {
				standingsData = try JSONDecoder().decode(StandingsResponse.self, from: data)
			} catch {
				print(error)
			}
			
			
			
			DispatchQueue.main.async {
				guard let safeStandingsData = standingsData else {return}
				self.dataManagement(standingsData: safeStandingsData)
			}
			
			}).resume()
	}
	
	//This is called to organize the fetched data into more manageable arrays for each conference
	//Each array is also sorted by teams rank in respective conference
	//At the end the arrays are passed back to the VC
	func dataManagement(standingsData: StandingsResponse) {
		if standingsData.conferences.isEmpty {
			print("No Standings Data Available")
		} else {
			//Wstern Conference
			westConference = standingsData.conferences.first
			//Western Divisions
			southWestDivision = westConference?.divisions.first
			pacificDivision = westConference?.divisions[1]
			northWestDivision = westConference?.divisions[2]
			//East Array Team Build
			westTeamsArray.append(contentsOf: southWestDivision!.teams)
			westTeamsArray.append(contentsOf: pacificDivision!.teams)
			westTeamsArray.append(contentsOf: northWestDivision!.teams)
			//West Array Sorted By Conference Ranking
			let sortedWestTeams = westTeamsArray.sorted {
				if let rank1 = $0.calc_rank.conf_rank, let rank2 = $1.calc_rank.conf_rank {
					return rank1 < rank2
				} else {
					// Handle the case where conf_rank is nil
					// In this example, we place teams with nil conf_rank at the end.
					return ($0.calc_rank.conf_rank != nil) && ($1.calc_rank.conf_rank == nil)
				}
			}	
			
			//Eastern Conference
			eastConference = standingsData.conferences[1]
			//Eastern Divisions
			centralDivision = eastConference?.divisions.first
			southeastDivision = eastConference?.divisions[1]
			atlanticDivision = eastConference?.divisions[2]
			//East Array Team Build
			eastTeamsArray.append(contentsOf: centralDivision!.teams)
			eastTeamsArray.append(contentsOf: southeastDivision!.teams)
			eastTeamsArray.append(contentsOf: atlanticDivision!.teams)
			//East Array Sorted By Conference Ranking
			let sortedEastTeams = eastTeamsArray.sorted {
				if let rank1 = $0.calc_rank.conf_rank, let rank2 = $1.calc_rank.conf_rank {
					return rank1 < rank2
				} else {
					// Handle the case where conf_rank is nil
					// In this example, we place teams with nil conf_rank at the end.
					return ($0.calc_rank.conf_rank != nil) && ($1.calc_rank.conf_rank == nil)
				}
			}
			
			self.passStandingsData!(sortedEastTeams, sortedWestTeams)
		}
	}
	
}
