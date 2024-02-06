//
//  GameInfoVC.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/19/23.
//

import UIKit

class LiveGameVC: UIViewController {
	
	let liveGameView = LiveGameView()
	let liveGameDataManager = LiveGameDataManager()
	let colorManager = ColorManager()
	var selectedGame: Game?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupInfoView()
	}
	
	//When the view is loaded data is fetched from the manager, then passed back using the passLiveData closure in liveGameDataManager
	func fetchData(gameData: Game){
		selectedGame = gameData
		liveGameDataManager.fetchLiveData(game: gameData)
		
		liveGameDataManager.passLiveData = { liveGame in
			self.updateLiveView(gameData: liveGame)
		}
		
	}
	
	@objc func refreshHit() {
		
		print("Button Tapped")
		if let currentGame = selectedGame {
			if currentGame.status == "closed" {
				let alert = UIAlertController (title: "Cannot Refresh", message: "This Game has concluded", preferredStyle: .actionSheet)
				let dismiss = UIAlertAction(title: "Dismiss", style: .cancel)
				alert.addAction(dismiss)
				present(alert, animated: true)
			} else {
				fetchData(gameData: currentGame)
			}
		}
	}
	
	
	
	//This is the function called to update the view with all of the retrieved data from the Live data fetch
	func updateLiveView(gameData: LiveResponse) {		
		let quarterBreakdown = liveGameView.quarterBreakdown
		
			// Stat Leader Row Shortcuts
		let statLeadersPointsRow = liveGameView.statLeaders.pointsRow
		let statLeadersReboundsRow = liveGameView.statLeaders.reboundsRow
		let statLeadersAssistsRow = liveGameView.statLeaders.assistsRow

		//Top View Section
			//Team One
		liveGameView.homeTeamColor.backgroundColor = colorManager.teamColorDictionary["\(gameData.home.alias)"]
		liveGameView.splitTeamColorView.teamOnegradient.colors = [colorManager.teamColorDictionary[gameData.home.alias]?.cgColor as Any, colorManager.teamColorDictionary[gameData.home.alias]?.withAlphaComponent(0.5).cgColor as Any]
		liveGameView.splitTeamColorView.teamColorOne.layer.borderColor = colorManager.teamColorDictionary[gameData.home.alias]?.cgColor
		liveGameView.homeTeamName.text = "\(gameData.home.market)\n\(gameData.home.name)"
		liveGameView.homeTeamScore.text = "\(gameData.home.points)"
		if let homeRecords = gameData.home.record {
			liveGameView.homeTeamRecord.text = "\(homeRecords.wins)-\(homeRecords.losses)"
		}
		liveGameView.homeTeamLogo.image = UIImage(named: gameData.home.alias)
			//Team Two
		liveGameView.awayTeamColor.backgroundColor = colorManager.teamColorDictionary[gameData.away.alias]
		liveGameView.splitTeamColorView.teamTwogradient.colors = [colorManager.teamColorDictionary[gameData.away.alias]?.cgColor as Any, colorManager.teamColorDictionary[gameData.away.alias]?.withAlphaComponent(0.5).cgColor as Any]
		liveGameView.splitTeamColorView.teamColorTwo.layer.borderColor = colorManager.teamColorDictionary[gameData.away.alias]?.cgColor
		liveGameView.awayTeamName.text = "\(gameData.away.market)\n\(gameData.away.name)"
		liveGameView.awayTeamScore.text = "\(gameData.away.points)"
		if let awayRecords = gameData.away.record {
			liveGameView.awayTeamRecord.text = "\(awayRecords.wins)-\(awayRecords.losses)"
		}
		liveGameView.awayTeamLogo.image = UIImage(named: gameData.away.alias)
			//Update Clock and Quarter
		if gameData.clock == "00:00" {
			liveGameView.clockLabel.text = "Final"
		} else {
			liveGameView.clockLabel.text = gameData.clock
		}
		
		//Set Quarter Label
		switch gameData.quarter {
		case 1:
			liveGameView.quarterLabel.text = "1st Quarter"
		case 2:
			liveGameView.quarterLabel.text = "2nd Quarter"
		case 3:
			liveGameView.quarterLabel.text = "3rd Quarter"
		case 4:
			liveGameView.quarterLabel.text = "4th Quarter"
		default:
			return
		}
//		liveGameView.quarterLabel.text = "Quarter \(gameData.quarter)"
		
		
		//Quarter Breakdown Section
			//Team One
		quarterBreakdown.teamAliasOne.text = "\(gameData.home.alias) \(gameData.home.name)"
				//This code is meant to prevent issues if there is no data for a certain quarters scoring
				//For example in the case that the game is only in the 1st quarter, scoring data for the 2nd, 3rd and 4th will not yet be available
		if let homeTeamScoring = gameData.home.scoring {
			quarterBreakdown.teamOne1st.text = homeTeamScoring.count > 0 ? "\(homeTeamScoring[0].points)" : ""
			quarterBreakdown.teamOne2nd.text = homeTeamScoring.count > 1 ? "\(homeTeamScoring[1].points)" : ""
			quarterBreakdown.teamOne3rd.text = homeTeamScoring.count > 2 ? "\(homeTeamScoring[2].points)" : ""
			quarterBreakdown.teamOne4th.text = homeTeamScoring.count > 3 ? "\(homeTeamScoring[3].points)" : ""
		}
			//Team Two
		quarterBreakdown.teamAliasTwo.text = "\(gameData.away.alias) \(gameData.away.name)"
				//This code is meant to prevent issues if there is no data for a certain quarters scoring
				//For example in the case that the game is only in the 1st quarter, scoring data for the 2nd, 3rd and 4th will not yet be available
		if let awayTeamScoring = gameData.away.scoring {
			quarterBreakdown.teamTwo1st.text = awayTeamScoring.count > 0 ? "\(awayTeamScoring[0].points)" : ""
			quarterBreakdown.teamTwo2nd.text = awayTeamScoring.count > 1 ? "\(awayTeamScoring[1].points)" : ""
			quarterBreakdown.teamTwo3rd.text = awayTeamScoring.count > 2 ? "\(awayTeamScoring[2].points)" : ""
			quarterBreakdown.teamTwo4th.text = awayTeamScoring.count > 3 ? "\(awayTeamScoring[3].points)" : ""
		}
		
		liveGameView.quarterBreakdown.teamColorOne.backgroundColor = colorManager.teamColorDictionary[gameData.home.alias]
		liveGameView.quarterBreakdown.teamColorTwo.backgroundColor = colorManager.teamColorDictionary[gameData.away.alias]
		
		//Stat Leaders Section
			//Colors Section
		liveGameView.statLeaders.teamOneColor.backgroundColor = colorManager.teamColorDictionary["\(gameData.home.alias)"]
		liveGameView.statLeaders.teamTwoColor.backgroundColor = colorManager.teamColorDictionary["\(gameData.away.alias)"]

			//POINTS Row
				//Team One
		if let homePointsLeader = gameData.home.leaders?.points?[0] {
			statLeadersPointsRow.teamOnePlayer.text = "#\(homePointsLeader.jersey_number) \(homePointsLeader.full_name)"
			statLeadersPointsRow.teamOneStat.text = "\(homePointsLeader.statistics.points) Pts"
			statLeadersPointsRow.teamOneMiscStat.text = "\(homePointsLeader.statistics.field_goals_made)/\(homePointsLeader.statistics.field_goals_att) FG, \(homePointsLeader.statistics.three_points_made)/\(homePointsLeader.statistics.three_points_att) 3PT, \(homePointsLeader.statistics.free_throws_made)/\(homePointsLeader.statistics.free_throws_att) FT"
		} else { statLeadersPointsRow.teamOnePlayer.text = "No Leader yet" }
				//Team Two
		if let awayPointsLeader = gameData.away.leaders?.points?[0] {
			statLeadersPointsRow.teamTwoPlayer.text = "#\(awayPointsLeader.jersey_number) \(awayPointsLeader.full_name)"
			statLeadersPointsRow.teamTwoStat.text = "\(awayPointsLeader.statistics.points) Pts"
			statLeadersPointsRow.teamTwoMiscStat.text = "\(awayPointsLeader.statistics.field_goals_made)/\(awayPointsLeader.statistics.field_goals_att) FG, \(awayPointsLeader.statistics.three_points_made)/\(awayPointsLeader.statistics.three_points_att) 3PT, \(awayPointsLeader.statistics.free_throws_made)/\(awayPointsLeader.statistics.free_throws_att) FT"
		} else { statLeadersPointsRow.teamTwoPlayer.text = "No Leader yet" }
		
			//REBOUNDS Row
				//Team One
		if let homeReboundsLeader = gameData.home.leaders?.rebounds?[0] {
			statLeadersReboundsRow.teamOnePlayer.text = "#\(homeReboundsLeader.jersey_number) \(homeReboundsLeader.full_name)"
			statLeadersReboundsRow.teamOneStat.text = "\(homeReboundsLeader.statistics.rebounds) Reb"
			statLeadersReboundsRow.teamOneMiscStat.text = "\(homeReboundsLeader.statistics.defensive_rebounds) Def Reb, \(homeReboundsLeader.statistics.offensive_rebounds) Off Reb"
		} else { statLeadersReboundsRow.teamOnePlayer.text = "No Leader yet" }
				//Team Two
		if let awayReboundsLeader = gameData.away.leaders?.rebounds?[0] {
			statLeadersReboundsRow.teamTwoPlayer.text = "#\(awayReboundsLeader.jersey_number) \(awayReboundsLeader.full_name)"
			statLeadersReboundsRow.teamTwoStat.text = "\(awayReboundsLeader.statistics.rebounds) Reb"
			statLeadersReboundsRow.teamTwoMiscStat.text = "\(awayReboundsLeader.statistics.defensive_rebounds) Def Reb, \(awayReboundsLeader.statistics.offensive_rebounds) Off Reb"
		} else { statLeadersReboundsRow.teamTwoPlayer.text = "No Leader yet" }
			//ASSISTS ROW
				//Team One
		if let homeAssistsLeader = gameData.home.leaders?.assists?[0] {
			statLeadersAssistsRow.teamOnePlayer.text = "#\(homeAssistsLeader.jersey_number) \(homeAssistsLeader.full_name)"
			statLeadersAssistsRow.teamOneStat.text = "\(homeAssistsLeader.statistics.assists) Ast"
			statLeadersAssistsRow.teamOneMiscStat.text = "\(homeAssistsLeader.statistics.turnovers) Turnovers, \(homeAssistsLeader.statistics.pls_min) +/-"
		} else { statLeadersAssistsRow.teamOnePlayer.text = "No Leader yet" }
				//Team Two
		if let awayAssistsLeader = gameData.away.leaders?.assists?[0] {
			statLeadersAssistsRow.teamTwoPlayer.text = "#\(awayAssistsLeader.jersey_number) \(awayAssistsLeader.full_name)"
			statLeadersAssistsRow.teamTwoStat.text = "\(awayAssistsLeader.statistics.assists) Ast"
			statLeadersAssistsRow.teamTwoMiscStat.text = "\(awayAssistsLeader.statistics.turnovers) Turnovers, \(awayAssistsLeader.statistics.pls_min) +/-"
		} else { statLeadersAssistsRow.teamTwoPlayer.text = "No Leader yet" }
	}
	
	//Genreal UI setup of the area at the top of the screen
	func setupInfoView() {
		view.addSubview(liveGameView)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refreshHit))
		navigationItem.rightBarButtonItem?.tintColor = colorManager.white

		liveGameView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			liveGameView.topAnchor.constraint(equalTo: view.topAnchor),
			liveGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			liveGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			liveGameView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
}
