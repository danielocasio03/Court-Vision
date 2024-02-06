//
//  ViewController.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/10/23.
//

import UIKit

class GameSlateVC: UIViewController, UITabBarDelegate {
	let colorManager = ColorManager()
	let gameSlateDataManager = GameSlateDataManager()
	let gamesTable = UITableView()
	
	//Array that holds all the games for the day
	var dailyGamesSlate = [Game]()
	let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
		formatter.timeZone = TimeZone(identifier: "UTC")
		return formatter
	}()

	
	
	//This is the view created in the GameScoreView File
	let gameSlateView = GameSlateView()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavbar()
		setupGameSlateView()
		setupGamesTable()		
		
	}
	
//	Configures the NavBar
	func setupNavbar() {
		let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		backButton.tintColor = colorManager.white
		navigationItem.backBarButtonItem = backButton
	}

	
	//Configures and adds the scoreView (created in GameScoreView)
	//Then calls update View with the fetched games data
	func setupGameSlateView() {
		view.addSubview(gameSlateView)
		gameSlateDataManager.fetchData()
		
//		gameSlateView.disclaimerButton.addTarget(self, action: #selector(disclaimerTapped), for: .touchUpInside)
		
		gameSlateDataManager.passData = { games in
			self.updateView(gamesData: games)
		}
		
		gameSlateView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gameSlateView.topAnchor.constraint(equalTo: view.topAnchor),
			gameSlateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			gameSlateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			gameSlateView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	//Takes the games data and checks if theres any games for today
	//if there are not it advises the user, if there is it adds the games to the
	//dailyGamesSlate array, filtering out games that are not actually not taking place
	func updateView(gamesData: [Game]) {
		if gamesData.count == 0 {
			gameSlateView.screenSubTitle.text = "No Games Scheduled to Take Place Today :("
			
		} else {
			dailyGamesSlate = gamesData.filter { game in
				game.status != "unnecessary"
			}
			
			gamesTable.reloadData()
		}
	}


}

//MARK: - TABLE VIEW - This is the section for all the gamesTable stuff
extension GameSlateVC: UITableViewDelegate, UITableViewDataSource {
	
	//returns a row for each game in dailyGamesSlate
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dailyGamesSlate.count
	}
	
	//Creates the cell using the data retrieved earlier
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = gamesTable.dequeueReusableCell(withIdentifier: GameScoresCell.identifiter, for: indexPath) as! GameScoresCell
		let game = dailyGamesSlate[indexPath.row]
		//Below code gets the users local time in string time
		//to later give the user an accurate time the game is beginning
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		var localTime = ""
		if let utcDate = dateFormatter.date(from: game.scheduled) {
			dateFormatter.timeZone = .current
			dateFormatter.dateFormat = "h:mm a"
			localTime = dateFormatter.string(from: utcDate)
		}

		// This sets the Cells contents based on the fetched data from the API
		cell.teamNameOne.text = game.home.name
		cell.teamScoreOne.text = "\(game.home_points ?? 0)"
//		cell.SplitTeamColor.teamColorOne.backgroundColor = colorManager.teamColorDictionary[game.home.alias]?.withAlphaComponent(0.75)
		cell.SplitTeamColor.teamColorOne.layer.borderColor = colorManager.teamColorDictionary[game.home.alias]?.cgColor
		cell.SplitTeamColor.teamOnegradient.colors = [colorManager.teamColorDictionary[game.home.alias]?.cgColor as Any, colorManager.teamColorDictionary[game.home.alias]?.withAlphaComponent(0.55).cgColor as Any]
		cell.teamLogoOne.image = UIImage(named: game.home.alias)

		
		cell.teamNameTwo.text = game.away.name
		cell.teamScoreTwo.text = "\(game.away_points ?? 0)"
//		cell.SplitTeamColor.teamColorTwo.backgroundColor = colorManager.teamColorDictionary[game.away.alias]?.withAlphaComponent(0.75)
		cell.SplitTeamColor.teamColorTwo.layer.borderColor = colorManager.teamColorDictionary[game.away.alias]?.cgColor
		cell.SplitTeamColor.teamTwogradient.colors = [colorManager.teamColorDictionary[game.away.alias]?.cgColor as Any, colorManager.teamColorDictionary[game.away.alias]?.withAlphaComponent(0.55).cgColor as Any]
		cell.teamLogoTwo.image = UIImage(named: game.away.alias)
			
		//This makes it to where based on the game status different messages are displayed
		if game.status == "closed" {
			cell.quarterLabel.text = "Final"
			cell.timeLeftLabel.text = "Scores"
		}
			else if game.status == "scheduled" {
				cell.quarterLabel.text = "Tipping off at"
				cell.timeLeftLabel.text = "\(localTime)"
				cell.teamScoreOne.isHidden = true
				cell.teamScoreTwo.isHidden = true
			} else {
				cell.quarterLabel.text = "In Progress"
				cell.timeLeftLabel.text = "View Live Scores >"
				cell.teamScoreOne.isHidden = true
				cell.teamScoreTwo.isHidden = true
			}
		
		return cell
	}
	

	//below code makes it to where when the user taps on a row/game, said games live data is fetched and presented
	//on the LiveGameVC screen where the liveGameVC is then pushed from the navcontroller
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedGame = dailyGamesSlate[indexPath.row]
		let liveGameVC = LiveGameVC()
		
				if selectedGame.status == "scheduled" {
			let liveGameAlert = UIAlertController(title: "Cannot View Live Stats", message: "This game has yet to begin", preferredStyle: .actionSheet)
			let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
			liveGameAlert.addAction(dismissAction)
			present(liveGameAlert, animated: true)
				} else {
						liveGameVC.fetchData(gameData: selectedGame)
						liveGameVC.hidesBottomBarWhenPushed = true
						self.navigationController?.pushViewController(liveGameVC, animated: true)
				}

	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 137
	}
	
	
	//Genral UI setup for the tableView
	func setupGamesTable() {
		view.addSubview(gamesTable)
		gamesTable.dataSource = self
		gamesTable.delegate = self
		gamesTable.register(GameScoresCell.self, forCellReuseIdentifier: GameScoresCell.identifiter)
		gamesTable.backgroundColor = colorManager.black
		gamesTable.separatorStyle = .none
		
		gamesTable.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gamesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			gamesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			gamesTable.topAnchor.constraint(equalTo: gameSlateView.screenSubTitle.bottomAnchor, constant: 5),
			gamesTable.bottomAnchor.constraint(equalTo: gameSlateView.bottomAnchor)
		])
		
	}
	
	
}

