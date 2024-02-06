//
//  Standings VC.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/5/23.
//

import Foundation
import UIKit

class StandingsVC: UIViewController {
	let colorManager = ColorManager()
	let standingsView = StandingsView()
	let westTable = UITableView(frame: .zero, style: .grouped)	
	let standingsDatamanager = StandingsDataManager()
	
	//Created to house the teams in each conference, which are sorted in the StandingsManager
	var sortedEastTeams: [Teams] = []
	var sortedWestTeams: [Teams] = []
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		recieveStandingsData()
		setupStandingsView()
		setupTable()
		
		}
	
	//General UI setup of the StandingsView
	func setupStandingsView() {
		view.addSubview(standingsView)
	
		NSLayoutConstraint.activate([
			standingsView.topAnchor.constraint(equalTo: view.topAnchor),
			standingsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			standingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			standingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	//function that recieves the fetched data passed from the StandingsManager
	//then calls updateView function sending the data there
	func recieveStandingsData() {
		standingsDatamanager.fetchStandings()
		
		standingsDatamanager.passStandingsData = { eastStandingsData, westStandingsData in
			self.updateView(eastSorted: eastStandingsData, westSorted: westStandingsData)
		}
	}
	
	//Function is called with the fetched data, adding the fetched and sorted east/west data to the arrays declared earlier
	func updateView(eastSorted: [Teams], westSorted: [Teams]) {
		sortedEastTeams = eastSorted
		sortedWestTeams = westSorted
		print(sortedEastTeams.count)
		print(sortedWestTeams.count)
		westTable.reloadData()
	}
	
}


//Table View
extension StandingsVC: UITableViewDelegate, UITableViewDataSource {
	
	//Table Rows setup
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if sortedEastTeams.count + sortedWestTeams.count == 0 {
			return 1
		} else {
			if section == 0 {
				return sortedWestTeams.count
			} else {return sortedEastTeams.count}
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = westTable.dequeueReusableCell(withIdentifier: "standingsCell") as! StandingsViewCell
		cell.seedNumber.text = "\(indexPath.row + 1)"
		
		if sortedEastTeams.count + sortedWestTeams.count == 0 {
			cell.teamName.text = "Current Standings are not yet available"
		} else {
			//Adds the border colors for the 7th and 10th
			if indexPath.row == 5 {
				cell.customSeparator.backgroundColor = colorManager.playInYellow
			}
			else if indexPath.row == 9 {
				cell.customSeparator.backgroundColor =  colorManager.nonPlayoffRed
			}
			else {
				cell.customSeparator.backgroundColor = .clear
			}
			
			//Sets all the cells data based off section
			if indexPath.section == 1 {
				cell.teamName.text = "\(sortedEastTeams[indexPath.row].market) \(sortedEastTeams[indexPath.row].name)"
				cell.teamRecord.text = "\(sortedEastTeams[indexPath.row].wins)  \(sortedEastTeams[indexPath.row].losses)"
				cell.teamGamesBehind.text = "\(sortedEastTeams[indexPath.row].games_behind.conference)"
				cell.teamLogo.image = UIImage(named: sortedEastTeams[indexPath.row].name)
				
				if sortedEastTeams[indexPath.row].records?.isEmpty == true {
					cell.teamlastTen.text = "0-0"
				} else {
					
					cell.teamlastTen.text = "\(sortedEastTeams[indexPath.row].records![9].wins)-\(sortedEastTeams[indexPath.row].records![9].losses)"
				}
				cell.teamPct.text = "\(sortedEastTeams[indexPath.row].win_pct)"
				return cell
			}
			else if indexPath.section == 0 {
				cell.teamName.text = "\(sortedWestTeams[indexPath.row].market) \(sortedWestTeams[indexPath.row].name)"
				cell.teamRecord.text = "\(sortedWestTeams[indexPath.row].wins)  \(sortedWestTeams[indexPath.row].losses)"
				cell.teamGamesBehind.text = "\(sortedWestTeams[indexPath.row].games_behind.conference)"
				cell.teamLogo.image = UIImage(named: sortedWestTeams[indexPath.row].name)

				
				if sortedWestTeams[indexPath.row].records?.isEmpty == true {
					cell.teamlastTen.text = "0-0"
				} else {
					cell.teamlastTen.text = "\(sortedWestTeams[indexPath.row].records![9].wins)-\(sortedWestTeams[indexPath.row].records![9].losses)"
				}
				
				cell.teamPct.text = "\(sortedWestTeams[indexPath.row].win_pct)"
				return cell
			}
			
		}
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 32
	}
	
	
	//Table Section setup
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
		//Table Header setup
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionHeaderView = StandingsViewHeader()
		var text = String()
		
		
		if section == 0 {
			text = "Western Conference"
		} else {
			text = "Eastern Conference"
		}
		
		sectionHeaderView.sectionTitle.text = text
		return sectionHeaderView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}
	
		//Table Footer setup
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let sectionFooterView = StandingsViewFooter()
		
		return sectionFooterView
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 60
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	func setupTable() {
		view.addSubview(westTable)
		westTable.translatesAutoresizingMaskIntoConstraints = false
		westTable.delegate = self
		westTable.dataSource = self
		westTable.register(StandingsViewCell.self, forCellReuseIdentifier: "standingsCell")
		
		westTable.separatorColor = colorManager.subHeadingGrey
		westTable.layer.cornerRadius = 10
		
		westTable.backgroundColor = colorManager.black
		
		NSLayoutConstraint.activate([
			westTable.leadingAnchor.constraint(equalTo: standingsView.leadingAnchor, constant: 10),
			westTable.trailingAnchor.constraint(equalTo: standingsView.trailingAnchor, constant: -10),
			westTable.bottomAnchor.constraint(equalTo: standingsView.bottomAnchor, constant: -100),
			westTable.topAnchor.constraint(equalTo: standingsView.topView.bottomAnchor, constant: 30)
		])
		
	}
	
}
