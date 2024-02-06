//
//  GameScoresView.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/10/23.
//

import Foundation
import UIKit

class GameSlateView: UIView, UITabBarDelegate {
	let colorManager = ColorManager()
	
	// The UI Element declarations
	let topView = UIView()
	let appTitleLabel = UILabel()
	let dividerLine = UIView()
	let screenSubTitle = UILabel()

	
	// Override Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = colorManager.black
		setupTopDesign()
		setupAppTitleLabel()
		setupSubTitle()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupDividerLine()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: - Top UI Setup
	
	// topUIView: FUNCTION that sets up the the grey top area
	
	func setupTopDesign() {
		self.addSubview(topView)
		topView.backgroundColor = colorManager.lightBlack
		
		topView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topView.topAnchor.constraint(equalTo: topAnchor),
			topView.heightAnchor.constraint(equalToConstant: 95),
			topView.leadingAnchor.constraint(equalTo: leadingAnchor),
			topView.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
	}

	
	//  appTitleLabel: at the top of the screen within the topView
	
	func setupAppTitleLabel() {
		topView.addSubview(appTitleLabel)
		appTitleLabel.text = "Court Vision"
		appTitleLabel.font = UIFont(name: "Menlo", size: 28)
		appTitleLabel.textColor = colorManager.white
		
		appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			appTitleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
			appTitleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -15)
			
		])
	}
	
	//	greenLineView: the green line separator that sits under the UIView
	
	func setupDividerLine() {
		self.addSubview(dividerLine)
		
		let gradient = CAGradientLayer()
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1, y: 1)
		dividerLine.layer.insertSublayer(gradient, at: 0)
		gradient.frame = dividerLine.bounds
		gradient.colors = [colorManager.electricBlue.cgColor, colorManager.tiffanyBlue.cgColor]
		
		dividerLine.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			dividerLine.topAnchor.constraint(equalTo: topView.bottomAnchor),
			dividerLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			dividerLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			dividerLine.heightAnchor.constraint(equalToConstant: 1.5)
		])
	}
	
	// screenSubTitle: The text under the top UIView

	func setupSubTitle() {
		self.addSubview(screenSubTitle)
		screenSubTitle.text = "Today's Slate of Games"
		screenSubTitle.font = UIFont(name: "Menlo", size: 12)
		screenSubTitle.textColor = colorManager.white
		
		screenSubTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			screenSubTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			screenSubTitle.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 25)
		])
	}
	
}

