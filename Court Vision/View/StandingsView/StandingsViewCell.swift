//
//  StandingsViewCell.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/9/23.
//

import Foundation
import UIKit

class StandingsViewCell: UITableViewCell {
	let colorManager = ColorManager()
	
	//Team seed
	lazy var seedNumber: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 9.5)
		label.textAlignment = .center
		return label
	}()
	
	//Team Name
	lazy var teamName: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 9)
		return label
	}()
	
	lazy var teamRecord: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10)
		return label
	}()
	
	lazy var teamlastTen: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10)
		return label
	}()
	
	lazy var teamPct: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10)
		return label
	}()
	
	lazy var teamGamesBehind: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10)
		return label
		
	}()
	
	lazy var customSeparator: UIView = {
		let separator = UIView()
		separator.translatesAutoresizingMaskIntoConstraints = false
		separator.backgroundColor = .clear
		return separator
	}()
	
	lazy var teamLogo: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: "standingsCell")
		setupCell()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCell() {
		backgroundColor = colorManager.lightBlack
		textLabel?.textColor = colorManager.subHeadingGrey
		textLabel?.font = UIFont(name: "Menlo", size: 8)
		separatorInset.left = 0
		//SeedNumber
		addSubview(seedNumber)
		seedNumber.textColor = colorManager.subHeadingGrey
		//TeamName
		addSubview(teamName)
		teamName.textColor = colorManager.white
		//Team Record
		addSubview(teamRecord)
		teamRecord.textColor = colorManager.white
		//Team Last Ten
		addSubview(teamlastTen)
		teamlastTen.textColor = colorManager.white
		//Team PCT
		addSubview(teamPct)
		teamPct.textColor = colorManager.white
		//Team Games Behind
		addSubview(teamGamesBehind)
		teamGamesBehind.textColor = colorManager.white
		//Separator
		addSubview(customSeparator)
		//Team Logo
		addSubview(teamLogo)
		
		NSLayoutConstraint.activate([
			//Seed Number
			seedNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
			seedNumber.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -2),
			//Team Record
			teamRecord.centerXAnchor.constraint(equalTo: centerXAnchor),
			teamRecord.centerYAnchor.constraint(equalTo: centerYAnchor),
			//Team Last Ten
			teamlastTen.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
			teamlastTen.centerYAnchor.constraint(equalTo: centerYAnchor),
			//Team Pct
			teamPct.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 92),
			teamPct.centerYAnchor.constraint(equalTo: centerYAnchor),
			//Team Games Behind
			teamGamesBehind.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 137),
			teamGamesBehind.centerYAnchor.constraint(equalTo: centerYAnchor),
			//Separator
			customSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
			customSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
			customSeparator.heightAnchor.constraint(equalToConstant: 1),
			customSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
			//Team Logo
			teamLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
			teamLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
			teamLogo.widthAnchor.constraint(equalToConstant: 18),
			teamLogo.heightAnchor.constraint(equalToConstant: 18),
			//Team Name
			teamName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
			teamName.centerYAnchor.constraint(equalTo: centerYAnchor),
			
		])
	}
	
}
