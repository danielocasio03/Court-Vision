//
//  StandingsViewSection.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/9/23.
//

import Foundation
import UIKit

class StandingsViewHeader: UITableViewHeaderFooterView {
	let colorManager = ColorManager()
	
	let sectionSeparator: UIView = {
		let separator = UIView()
		separator.translatesAutoresizingMaskIntoConstraints = false
		return separator
	}()
	
	
	let sectionTitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		let font = UIFont(name: "Menlo", size: 15)
		let boldFont = UIFont(descriptor: font!.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 15)
		label.font = boldFont
		
		return label
		
	}()
	
	//The Headings
	let winLossHeading: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10.5)
		label.text = "W   L"
		return label
	}()
	
	let lastTenHeading: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10.5)
		label.text = "L10"
		return label
	}()
	
	lazy var winPctHeading: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10.5)
		label.text = "PCT"
		return label
	}()
	
	lazy var gamesBehindHeading: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Menlo", size: 10.5)
		label.text = "GB"
		return label
	}()
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: "HeaderView")
		self.contentView.backgroundColor = colorManager.lightBlack
		setupAttributes()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		roundedBorderSetup()
	}
	
	func roundedBorderSetup() {
		let mask = CAShapeLayer()
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
		mask.path = path.cgPath
		layer.mask = mask
		
	}
	
	func setupAttributes() {
		//Section Title
		contentView.addSubview(sectionTitle)
		sectionTitle.textColor = colorManager.white
		//Section Separator
		contentView.addSubview(sectionSeparator)
		sectionSeparator.backgroundColor = colorManager.subHeadingGrey
		//Wins Heading
		addSubview(winLossHeading)
		winLossHeading.textColor = colorManager.subHeadingGrey
		//Last 10 Heading
		addSubview(lastTenHeading)
		lastTenHeading.textColor = colorManager.subHeadingGrey
		//Win Percentage
		addSubview(winPctHeading)
		winPctHeading.textColor = colorManager.subHeadingGrey
		//Streak
		addSubview(gamesBehindHeading)
		gamesBehindHeading.textColor = colorManager.subHeadingGrey
		
		NSLayoutConstraint.activate([
			//Section Title
			sectionTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8),
			sectionTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			//Section Separator
			sectionSeparator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.25),
			sectionSeparator.widthAnchor.constraint(equalTo: widthAnchor),
			sectionSeparator.heightAnchor.constraint(equalToConstant: 0.25),
			//Wins Heading
			winLossHeading.centerXAnchor.constraint(equalTo: sectionTitle.centerXAnchor),
			winLossHeading.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 10),
			//LastTen Heading
			lastTenHeading.leadingAnchor.constraint(equalTo: winLossHeading.trailingAnchor, constant: 25),
			lastTenHeading.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 10),
			// Win Percentage
			winPctHeading.leadingAnchor.constraint(equalTo: lastTenHeading.trailingAnchor, constant: 25),
			winPctHeading.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 10),
			//Streak
			gamesBehindHeading.leadingAnchor.constraint(equalTo: winPctHeading.trailingAnchor, constant: 25),
			gamesBehindHeading.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 10)
		])
		
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
