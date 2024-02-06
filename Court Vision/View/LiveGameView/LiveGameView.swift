//
//  GameInfoView.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/19/23.
//

import Foundation
import UIKit

class  LiveGameView: UIView {
	let colorManager = ColorManager()
	let quarterBreakdown = QuarterBreakDown()
	let statLeaders = StatLeadersView()
	
	//Section of the view
	let topView = UIView()
	let splitTeamColorView = SplitTeamColorView()

	//Other View attributes
	let quarterLabel = UILabel()
	let clockLabel = UILabel()
	
	//Home Team attributes
	let homeTeamName = UILabel()
	let homeTeamRecord = UILabel()
	let homeTeamScore = UILabel()
	let homeTeamColor = UIView()
	let homeTeamLogo: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	//Away Team Attributes
	let awayTeamName = UILabel()
	let awayTeamRecord = UILabel()
	let awayTeamScore = UILabel()
	let awayTeamColor = UIView()
	let awayTeamLogo: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = colorManager.black
		setupTopView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupTopView() {
		addSubview(topView)
		topView.translatesAutoresizingMaskIntoConstraints = false
		topView.backgroundColor = colorManager.black
		topView.clipsToBounds = true
		topView.addSubview(splitTeamColorView)
		splitTeamColorView.transform = CGAffineTransform(rotationAngle: .pi/15)
		
		TopSetupTeamAttributes()
		setupExtraAttributes()
		setConstraints()
		
		
	}
	
	func TopSetupTeamAttributes() {
		let teamNameFont = UIFont(name: "Menlo", size: 17)
		let boldFont = UIFont(descriptor: (teamNameFont?.fontDescriptor.withSymbolicTraits(.traitBold))!, size: 20)
		
		//Team One
			//Team Name
		topView.addSubview(homeTeamName)
		homeTeamName.translatesAutoresizingMaskIntoConstraints = false
		homeTeamName.font = boldFont
		homeTeamName.textColor = colorManager.white
		homeTeamName.numberOfLines = 3
		homeTeamName.textAlignment = .left
			//Team Record
		topView.addSubview(homeTeamRecord)
		homeTeamRecord.translatesAutoresizingMaskIntoConstraints = false
		homeTeamRecord.textColor = colorManager.white
		homeTeamRecord.font = UIFont(name: "Menlo", size: 10)
			//Team Score
		topView.addSubview(homeTeamScore)
		homeTeamScore.translatesAutoresizingMaskIntoConstraints = false
		homeTeamScore.textColor = colorManager.white
		homeTeamScore.font = UIFont(name: "Menlo", size: 30)
			//Team Color
		addSubview(homeTeamColor)
		homeTeamColor.translatesAutoresizingMaskIntoConstraints = false
			//Team Logo
		addSubview(homeTeamLogo)
		
		//Team Two
			//Team Name
		topView.addSubview(awayTeamName)
		awayTeamName.translatesAutoresizingMaskIntoConstraints = false
		awayTeamName.textColor = colorManager.white
		awayTeamName.font = boldFont
		awayTeamName.numberOfLines = 3
		awayTeamName.textAlignment = .right
			//Team Record
		topView.addSubview(awayTeamRecord)
		awayTeamRecord.translatesAutoresizingMaskIntoConstraints = false
		awayTeamRecord.textColor = colorManager.white
		awayTeamRecord.font = UIFont(name: "Menlo", size: 10)
			//Team Score
		topView.addSubview(awayTeamScore)
		awayTeamScore.translatesAutoresizingMaskIntoConstraints = false
		awayTeamScore.textColor = colorManager.white
		awayTeamScore.font = UIFont(name: "Menlo", size: 30)
			//Team Score
		addSubview(awayTeamColor)
		awayTeamColor.translatesAutoresizingMaskIntoConstraints = false
			//Team Logo
		addSubview(awayTeamLogo)
	}
	
	func setupExtraAttributes() {
		//Quarter label
		topView.addSubview(quarterLabel)
		quarterLabel.translatesAutoresizingMaskIntoConstraints = false
		quarterLabel.textColor = colorManager.white
		quarterLabel.font = UIFont(name: "Menlo", size: 12)
		//Clock Label
		topView.addSubview(clockLabel)
		clockLabel.translatesAutoresizingMaskIntoConstraints = false
		clockLabel.textColor = colorManager.white
		clockLabel.font = UIFont(name: "Menlo", size: 12)
		//Quarter Breakdown Section
		addSubview(quarterBreakdown)
		//Stat Leaders Section
		addSubview(statLeaders)
		
	}
	
	func setConstraints() {
		
		NSLayoutConstraint.activate([
			//TopView Constraints
			topView.topAnchor.constraint(equalTo: topAnchor),
			topView.leadingAnchor.constraint(equalTo: leadingAnchor),
			topView.trailingAnchor.constraint(equalTo: trailingAnchor),
			topView.heightAnchor.constraint(equalToConstant: 225),
			
			//Split Team Color Gradient
			splitTeamColorView.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 7),
			splitTeamColorView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
			splitTeamColorView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 2.6),
			splitTeamColorView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1.2),
			
			//Team One
				//Team Name
			homeTeamName.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
			homeTeamName.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 20),
			homeTeamName.widthAnchor.constraint(equalToConstant: 150),
				//Team Record
			homeTeamRecord.leadingAnchor.constraint(equalTo: homeTeamName.leadingAnchor),
			homeTeamRecord.bottomAnchor.constraint(equalTo: homeTeamName.topAnchor),
			homeTeamRecord.widthAnchor.constraint(equalToConstant: 50),
				//Team Score
			homeTeamScore.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
			homeTeamScore.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 70),
				//Team Color
			homeTeamColor.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
			homeTeamColor.topAnchor.constraint(equalTo: topView.bottomAnchor),
			homeTeamColor.trailingAnchor.constraint(equalTo: topView.centerXAnchor, constant: -17),
			homeTeamColor.heightAnchor.constraint(equalToConstant: 2),
				//Team Logo
			homeTeamLogo.leadingAnchor.constraint(equalTo: homeTeamName.leadingAnchor, constant: -10),
			homeTeamLogo.topAnchor.constraint(equalTo: homeTeamName.bottomAnchor),
			homeTeamLogo.heightAnchor.constraint(equalToConstant: 55),
			homeTeamLogo.widthAnchor.constraint(equalToConstant: 55),
			
			//Team Two
				//Team Name
			awayTeamName.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
			awayTeamName.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 20),
			awayTeamName.widthAnchor.constraint(equalToConstant: 150),
				//Team Record
			awayTeamRecord.trailingAnchor.constraint(equalTo: awayTeamName.trailingAnchor),
			awayTeamRecord.bottomAnchor.constraint(equalTo: awayTeamName.topAnchor),
			awayTeamRecord.widthAnchor.constraint(equalToConstant: 50),
				//Team Score
			awayTeamScore.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
			awayTeamScore.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -70),
				//Team Color
			awayTeamColor.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
			awayTeamColor.topAnchor.constraint(equalTo: topView.bottomAnchor),
			awayTeamColor.leadingAnchor.constraint(equalTo: topView.centerXAnchor, constant: -17),
			awayTeamColor.heightAnchor.constraint(equalToConstant: 2),
				//Team Logo
			awayTeamLogo.trailingAnchor.constraint(equalTo: awayTeamName.trailingAnchor, constant: 10),
			awayTeamLogo.topAnchor.constraint(equalTo: awayTeamName.bottomAnchor),
			awayTeamLogo.heightAnchor.constraint(equalToConstant: 55),
			awayTeamLogo.widthAnchor.constraint(equalToConstant: 55),
			
			//Extra Attribute Constraints
				//Quarter Label
			quarterLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
			quarterLabel.centerYAnchor.constraint(equalTo: topView.bottomAnchor, constant: -60),
				//Clock Label
			clockLabel.topAnchor.constraint(equalTo: quarterLabel.bottomAnchor, constant: 4),
			clockLabel.centerXAnchor.constraint(equalTo: quarterLabel.centerXAnchor),
				//Quarter Breakdown
			quarterBreakdown.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40),
			quarterBreakdown.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
			quarterBreakdown.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16),
			quarterBreakdown.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
			quarterBreakdown.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
				//Stat Leaders
			statLeaders.topAnchor.constraint(equalTo: quarterBreakdown.bottomAnchor, constant: 40),
			statLeaders.centerXAnchor.constraint(equalTo: quarterBreakdown.centerXAnchor),
			statLeaders.widthAnchor.constraint(equalTo: quarterBreakdown.widthAnchor),
			statLeaders.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
				
		])
	}
}
