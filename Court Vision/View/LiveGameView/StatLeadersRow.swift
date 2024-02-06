//
//  StatLeadersStack.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/27/23.
//

import Foundation
import UIKit

class StatLeadersRow: UIView {
	let colorManager = ColorManager()
	
	//Row Attributes
	lazy var horizontalLine: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = colorManager.subHeadingGrey
		return view
	}()
	
	lazy var verticalLine: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = colorManager.subHeadingGrey
		return view
	}()
	
	lazy var rowTitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 11)
		label.textColor = colorManager.subHeadingGrey
		return label
	}()
	
	
	
	//Team One Attributes
	lazy var teamOnePlayer: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		
		let font = UIFont(name: "Menlo", size: 11)
		let boldFont = UIFont(descriptor: font!.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 11)
		label.font = boldFont
		
		label.textColor = colorManager.white
		label.numberOfLines = 2
		return label
	}()
	
	lazy var teamOneStat: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 11)
		label.textColor = colorManager.white
		
		return label
	}()
	
	lazy var teamOneMiscStat: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 7)
		label.textColor = colorManager.white
		return label
	}()
	
	//Team Two Attributes
	lazy var teamTwoPlayer: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		
		let font = UIFont(name: "Menlo", size: 11)
		let boldFont = UIFont(descriptor: font!.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 11)
		label.font = boldFont
		
		label.textColor = colorManager.white
		label.textAlignment = .right
		label.numberOfLines = 2
		return label
	}()
	
	lazy var teamTwoStat: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 11)
		label.textColor = colorManager.white
		
		return label
	}()
	
	lazy var teamTwoMiscStat: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 7)
		label.textColor = colorManager.white
		return label
	}()
	
	
	
	//Initializer or ViewDidLoad
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupRow()
		
	}
	
	
	func setupRow() {
		translatesAutoresizingMaskIntoConstraints = false
		//Row Attributes
		addSubview(horizontalLine)
		addSubview(verticalLine)
		addSubview(rowTitle)
		//Team One Attributes
		addSubview(teamOnePlayer)
		addSubview(teamOneStat)
		addSubview(teamOneMiscStat)
		//Team Two Attributes
		addSubview(teamTwoPlayer)
		addSubview(teamTwoStat)
		addSubview(teamTwoMiscStat)
		
		NSLayoutConstraint.activate([
			//Row Attributes
			//horizontal Line
			horizontalLine.leadingAnchor.constraint(equalTo: leadingAnchor),
			horizontalLine.trailingAnchor.constraint(equalTo: trailingAnchor),
			horizontalLine.topAnchor.constraint(equalTo: topAnchor),
			horizontalLine.heightAnchor.constraint(equalToConstant: 1),
			//Row Title
			rowTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
			rowTitle.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 2),
			//Vertical Line
			verticalLine.centerXAnchor.constraint(equalTo: centerXAnchor),
			verticalLine.topAnchor.constraint(equalTo: rowTitle.bottomAnchor, constant: 5),
			verticalLine.bottomAnchor.constraint(equalTo: bottomAnchor),
			verticalLine.widthAnchor.constraint(equalToConstant: 1),
			
			//Team One Attributes
			//Team One Player
			teamOnePlayer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
			teamOnePlayer.centerYAnchor.constraint(equalTo: centerYAnchor),
			teamOnePlayer.widthAnchor.constraint(equalToConstant: 90),
			//Team One Stat
			teamOneStat.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
			teamOneStat.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
			//Team One Misc Stat
			teamOneMiscStat.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
			teamOneMiscStat.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
			
			//Team Two Attributes
			//Team Two Player
			teamTwoPlayer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
			teamTwoPlayer.centerYAnchor.constraint(equalTo: centerYAnchor),
			teamTwoPlayer.widthAnchor.constraint(equalToConstant: 90),
			//Team Two Stat
			teamTwoStat.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
			teamTwoStat.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
			//Team Two Misc Stat
			teamTwoMiscStat.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
			teamTwoMiscStat.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
			
		])
		
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
}
