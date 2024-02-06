//
//  Standings View.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/7/23.
//

import Foundation
import UIKit
class StandingsView: UIView {
	let colorManager = ColorManager()
	
	//Top View
	let topView = UIView()
	let textTitle: UILabel = {
		let label = UILabel()
		label.text = "Standings"
		label.font = UIFont(name: "Menlo", size: 28)
		return label
	}()
	
	let dividerLine = UIView()
	
	
	override init(frame: CGRect){
		super.init(frame: frame)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = colorManager.black
		setupTopView()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupDividerLine()
	}
	
	func setupTopView() {
		//Top Background
		addSubview(topView)
		topView.translatesAutoresizingMaskIntoConstraints = false
		topView.backgroundColor = colorManager.lightBlack
		//Text Label
		addSubview(textTitle)
		textTitle.translatesAutoresizingMaskIntoConstraints = false
		textTitle.textColor = colorManager.white

		NSLayoutConstraint.activate([
			//Top Background
			topView.topAnchor.constraint(equalTo: topAnchor),
			topView.leadingAnchor.constraint(equalTo: leadingAnchor),
			topView.trailingAnchor.constraint(equalTo: trailingAnchor),
//			topView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -740),
			topView.heightAnchor.constraint(equalToConstant: 95),
			//Text Label
			textTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
			textTitle.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -15),
		])
	}
	
	func setupDividerLine() {
		//Divider Line
		addSubview(dividerLine)
		dividerLine.translatesAutoresizingMaskIntoConstraints = false
		let gradient = CAGradientLayer()
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1, y: 1)
		gradient.frame = dividerLine.bounds
		gradient.colors = [colorManager.electricBlue.cgColor, colorManager.tiffanyBlue.cgColor]
		dividerLine.layer.insertSublayer(gradient, at: 0)

		NSLayoutConstraint.activate([
			dividerLine.topAnchor.constraint(equalTo: topView.bottomAnchor),
			dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor),
			dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor),
			dividerLine.heightAnchor.constraint(equalToConstant: 1.5)
		
		])
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
