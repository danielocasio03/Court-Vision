//
//  SplitTeamColorBackground.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 11/16/23.
//

import Foundation
import UIKit

class SplitTeamColorView: UIView {
	
	let colorManager = ColorManager()
	
	lazy var teamColorOne: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let teamColorTwo: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	
	let teamOnegradient: CAGradientLayer = {
		let gradient = CAGradientLayer()
		gradient.startPoint = CGPoint(x: 0.25, y: 1)
		gradient.endPoint = CGPoint(x: 1 , y: 1)
		
		return gradient
	}()
	
	let teamTwogradient: CAGradientLayer = {
		let gradient = CAGradientLayer()
		gradient.startPoint = CGPoint(x: 1, y: 1)
		gradient.endPoint = CGPoint(x: 0, y: 1)
		return gradient
	}()
	
		
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(teamColorOne)
		teamColorOne.layer.borderWidth = 0.75

		
		addSubview(teamColorTwo)
		teamColorTwo.layer.borderWidth = 0.75

		
		NSLayoutConstraint.activate([
			teamColorOne.leadingAnchor.constraint(equalTo: leadingAnchor),
			teamColorOne.trailingAnchor.constraint(equalTo: centerXAnchor),
			teamColorOne.bottomAnchor.constraint(equalTo: bottomAnchor),
			teamColorOne.topAnchor.constraint(equalTo: topAnchor),
			
			teamColorTwo.leadingAnchor.constraint(equalTo: centerXAnchor),
			teamColorTwo.trailingAnchor.constraint(equalTo: trailingAnchor),
			teamColorTwo.topAnchor.constraint(equalTo: topAnchor),
			teamColorTwo.bottomAnchor.constraint(equalTo: bottomAnchor)
		
		])
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		teamColorOne.layer.insertSublayer(teamOnegradient, at: 0)
		teamOnegradient.frame = teamColorOne.bounds
		
		teamColorTwo.layer.insertSublayer(teamTwogradient, at: 0)
		teamTwogradient.frame = teamColorTwo.bounds
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}
