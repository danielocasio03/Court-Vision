//
//  File.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/15/23.
//

import Foundation
import UIKit

class GameScoresCell: UITableViewCell {
	let colorManager = ColorManager()
	let container = UIView()
	let scoreDash = UIView()
	let quarterLabel = UILabel()
	let timeLeftLabel = UILabel()
	let SplitTeamColor = SplitTeamColorView()
	
	//Team UI Elements
	let teamNameOne = UILabel()
	let teamScoreOne = UILabel()
	let teamLogoOne: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	let teamNameTwo = UILabel()
	let teamScoreTwo = UILabel()
	let teamLogoTwo: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	
	
	
	
	static let identifiter =  "gameCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
		
		//changes to the actual cells appearance
		backgroundColor = colorManager.black
		selectionStyle = .none
		
		//The setup for all the UIElements
		setupContainerView()
		setupBackgroundColors()
		setupTeamStuff()
		setupContainerElements()
	}
	
	
//MARK: - Sets up all the UI elements of the cell
	
// CONTAINER - This will be the container that makes it to where the cell has a rounded appearance and spacing between each bubble
	func setupContainerView() {
		addSubview(container)
		container.backgroundColor = colorManager.black
		container.layer.cornerRadius = 15
		container.layer.borderColor = colorManager.lightBlack.cgColor
		container.layer.borderWidth = 2
		container.clipsToBounds = true
		
		
		container.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			container.centerXAnchor.constraint(equalTo: centerXAnchor),
			container.centerYAnchor.constraint(equalTo: centerYAnchor),
			container.heightAnchor.constraint(equalToConstant: 100),
			container.widthAnchor.constraint(equalToConstant: 357)
		])
	}
		
	func setupBackgroundColors() {
		container.addSubview(SplitTeamColor)
		SplitTeamColor.transform = CGAffineTransform(rotationAngle: .pi/6)
		
		NSLayoutConstraint.activate([
			SplitTeamColor.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 2),
			SplitTeamColor.centerYAnchor.constraint(equalTo: container.centerYAnchor),
			SplitTeamColor.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
			SplitTeamColor.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 2.6)
		])
		
	}
	
// TEAM ELEMENTS - This is the setup for the 2 team elements that appear in the cell
	
	func setupTeamStuff() {
		//teamOne
			//Team Name
		container.addSubview(teamNameOne)
		teamNameOne.textColor = colorManager.white.withAlphaComponent(0.8)
		teamNameOne.font = UIFont(name: "Menlo-Bold", size: 14)
		teamNameOne.translatesAutoresizingMaskIntoConstraints = false
		teamNameOne.numberOfLines = 0
		teamNameOne.lineBreakMode = .byWordWrapping
		teamNameOne.textAlignment = .center
			//Team Score
		container.addSubview(teamScoreOne)
		teamScoreOne.textColor = colorManager.white.withAlphaComponent(0.9)
		teamScoreOne.font = UIFont(name: "Futura", size: 30)
		teamScoreOne.translatesAutoresizingMaskIntoConstraints = false
		//Team Logo
		container.addSubview(teamLogoOne)
		
		//teamTwo
			//Team Name
		container.addSubview(teamNameTwo)
		teamNameTwo.textColor = colorManager.white.withAlphaComponent(0.8)
		teamNameTwo.font = UIFont(name: "Menlo-Bold", size: 14)
		teamNameTwo.translatesAutoresizingMaskIntoConstraints = false
		teamNameTwo.numberOfLines = 0
		teamNameTwo.lineBreakMode = .byWordWrapping
		teamNameTwo.textAlignment = .center
			//Team Score
		container.addSubview(teamScoreTwo)
		teamScoreTwo.textColor = colorManager.white.withAlphaComponent(0.9)
		teamScoreTwo.font = UIFont(name: "Futura", size: 30)
		teamScoreTwo.translatesAutoresizingMaskIntoConstraints = false
			//Team Logo
		container.addSubview(teamLogoTwo)
		
		NSLayoutConstraint.activate([
		//TeamOne
			//Team Name
			teamNameOne.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
			teamNameOne.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 12),
			teamNameOne.widthAnchor.constraint(equalToConstant: 110),
			//Team Score
			teamScoreOne.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 5),
			teamScoreOne.trailingAnchor.constraint(equalTo: container.centerXAnchor, constant: -12),
			//Team Logo
			teamLogoOne.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
			teamLogoOne.bottomAnchor.constraint(equalTo: container.bottomAnchor , constant: -2),
			teamLogoOne.widthAnchor.constraint(equalToConstant: 50),
			teamLogoOne.heightAnchor.constraint(equalToConstant: 50),
			
		//TeamTwo
			//Team Name
			teamNameTwo.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
			teamNameTwo.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
			teamNameTwo.widthAnchor.constraint(equalToConstant: 110),
			//Team Score
			teamScoreTwo.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 5),
			teamScoreTwo.leadingAnchor.constraint(equalTo: container.centerXAnchor, constant: 12),
			//Team Logo
			teamLogoTwo.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
			teamLogoTwo.topAnchor.constraint(equalTo: container.topAnchor , constant: 2),
			teamLogoTwo.widthAnchor.constraint(equalToConstant: 50),
			teamLogoTwo.heightAnchor.constraint(equalToConstant: 50),
		])
		
	}

//The other UI Elements in the cell
	func setupContainerElements() {
		//Setup of the dash that goes between the scores
		container.addSubview(scoreDash)
		scoreDash.backgroundColor = colorManager.white.withAlphaComponent(0.9)
		scoreDash.translatesAutoresizingMaskIntoConstraints = false
		//Setup of the label that says what quarter it is
		container.addSubview(quarterLabel)
		quarterLabel.textColor = colorManager.white
		quarterLabel.font = UIFont(name: "Menlo", size: 8)
		quarterLabel.translatesAutoresizingMaskIntoConstraints = false
		//Setup of the label that says the time left in the quarter
		container.addSubview(timeLeftLabel)
		timeLeftLabel.textColor = colorManager.white
		timeLeftLabel.font = UIFont(name: "Menlo", size: 8)
		timeLeftLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			//Score Dash
			scoreDash.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			scoreDash.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 4),
			scoreDash.widthAnchor.constraint(equalToConstant: 12),
			scoreDash.heightAnchor.constraint(equalToConstant: 3),
			//Quarter Label
			quarterLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			quarterLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 28),
			//timeLeftLabel
			timeLeftLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			timeLeftLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 41)
			
		
		])
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
