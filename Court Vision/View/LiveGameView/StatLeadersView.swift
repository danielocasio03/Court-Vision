//
//  Stat Leaders.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/26/23.
//

import Foundation
import UIKit

class StatLeadersView: UIView {
	//References
	let colorManager = ColorManager()
	
	
	//Player Stats StackView
	let playerStats = UIStackView()
	
	lazy var pointsRow: StatLeadersRow = {
		let row = StatLeadersRow()
		row.rowTitle.text = "Points"
		return row
	}()
	
	lazy var reboundsRow: StatLeadersRow = {
		let row = StatLeadersRow()
		row.rowTitle.text = "Rebounds"
		return row
	}()
	
	lazy var assistsRow: StatLeadersRow = {
		let row = StatLeadersRow()
		row.rowTitle.text = "Assists"
		return row
	}()
	
	
	//Extra attributes
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Stat Leaders"
		label.font = UIFont(name: "Menlo", size: 12)
		label.textColor = colorManager.white
		return label
	}()
	
	lazy var teamOneColor: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var teamTwoColor: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	
	//Initializer or ViewDidLoad
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupExtraAttributes()
		setupStatsStack()
	}
	
	
	//Layout subviews
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.borderWidth = 0.2
		layer.borderColor = colorManager.subHeadingGrey.cgColor
		//Team One Color masking
		let maskLayerOne = CAShapeLayer()
		let maskPathOne = UIBezierPath(roundedRect: teamOneColor.bounds,
									byRoundingCorners: [.topLeft,.bottomLeft],
									cornerRadii: CGSize(width: 10, height: 10))
		maskLayerOne.path = maskPathOne.cgPath
		teamOneColor.layer.mask = maskLayerOne
		//Team Two Color Masking
		let maskLayerTwo = CAShapeLayer()
		let maskPathTwo = UIBezierPath(roundedRect: teamTwoColor.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
		maskLayerTwo.path = maskPathTwo.cgPath
		teamTwoColor.layer.mask = maskLayerTwo

	}
	
	func setupStatsStack() {
		addSubview(playerStats)
		playerStats.translatesAutoresizingMaskIntoConstraints = false
		playerStats.distribution = .fillEqually
		playerStats.axis = .vertical
		playerStats.spacing = 2
		playerStats.addArrangedSubview(pointsRow)
		playerStats.addArrangedSubview(reboundsRow)
		playerStats.addArrangedSubview(assistsRow)
		
		NSLayoutConstraint.activate([
			playerStats.topAnchor.constraint(equalTo: topAnchor, constant: 35),
			playerStats.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
			playerStats.leadingAnchor.constraint(equalTo: teamOneColor.trailingAnchor),
			playerStats.trailingAnchor.constraint(equalTo: teamTwoColor.leadingAnchor)
		])
		
	}
	
	//Sets up the entire view
	func setupExtraAttributes() {
		//setup of the container
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = colorManager.lightBlack
		layer.cornerRadius = 10
		//setup of the title label
		addSubview(titleLabel)
		addSubview(teamOneColor)
		addSubview(teamTwoColor)
		
		NSLayoutConstraint.activate([
			//Title Label
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			//Team One Color
			teamOneColor.topAnchor.constraint(equalTo: topAnchor),
			teamOneColor.bottomAnchor.constraint(equalTo: bottomAnchor),
			teamOneColor.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
			teamOneColor.leadingAnchor.constraint(equalTo: leadingAnchor),
			//Team Two Color
			teamTwoColor.topAnchor.constraint(equalTo: topAnchor),
			teamTwoColor.bottomAnchor.constraint(equalTo: bottomAnchor),
			teamTwoColor.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
			teamTwoColor.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
		
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
	
}
