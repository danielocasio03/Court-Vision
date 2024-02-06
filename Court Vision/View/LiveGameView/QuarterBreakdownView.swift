//
//  QuarterBreakdownVIew.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 6/23/23.
//

import Foundation
import UIKit

class QuarterBreakDown: UIView {
	let colorManager = ColorManager()
	
	//Extra Attributes
	let teamColorOne: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let  teamColorTwo: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	let titleLabel = UILabel()
	let dividerLine = UIView()
	let q1label = UILabel()
	let q2label = UILabel()
	let q3label = UILabel()
	let q4label = UILabel()

	
	//Team One
	let teamAliasOne = UILabel()
	let teamOne1st = UILabel()
	let teamOne2nd = UILabel()
	let teamOne3rd = UILabel()
	let teamOne4th = UILabel()

	//Team Two
	let teamAliasTwo = UILabel()
	let teamTwo1st = UILabel()
	let teamTwo2nd = UILabel()
	let teamTwo3rd = UILabel()
	let teamTwo4th = UILabel()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupContainerView()

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func setupContainerView() {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = colorManager.lightBlack
		layer.cornerRadius = 10
		layer.borderColor = colorManager.subHeadingGrey.cgColor
		layer.borderWidth = 0.2
		clipsToBounds = true
		setupExtraContainerAttributes()
		setupTeamAttributes()
	}
	
	func setupExtraContainerAttributes() {
		
		//Team Colors
		addSubview(teamColorOne)
		addSubview(teamColorTwo)
		
		//Title Label
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Quarter Breakdown"
		titleLabel.textColor = colorManager.white
		titleLabel.font = UIFont(name: "Menlo", size: 12)
		
		//Divider Line
		addSubview(dividerLine)
		dividerLine.translatesAutoresizingMaskIntoConstraints = false
		dividerLine.backgroundColor = colorManager.subHeadingGrey
		
		//Quarter Labels
			//Quarter 1 label
			addSubview(q1label)
			q1label.translatesAutoresizingMaskIntoConstraints = false
			q1label.text = "1st"
			q1label.font = UIFont(name: "Menlo", size: 9)
			q1label.textColor = colorManager.subHeadingGrey
			//Quarter 2 label
			addSubview(q2label)
			q2label.translatesAutoresizingMaskIntoConstraints = false
			q2label.text = "2nd"
			q2label.font = UIFont(name: "Menlo", size: 9)
			q2label.textColor = colorManager.subHeadingGrey
			//Quarter 3 label
			addSubview(q3label)
			q3label.translatesAutoresizingMaskIntoConstraints = false
			q3label.text = "3rd"
			q3label.font = UIFont(name: "Menlo", size: 9)
			q3label.textColor = colorManager.subHeadingGrey
			//Quarter 4 label
			addSubview(q4label)
			q4label.translatesAutoresizingMaskIntoConstraints = false
			q4label.text = "4th"
			q4label.font = UIFont(name: "Menlo", size: 9)
			q4label.textColor = colorManager.subHeadingGrey
			
		NSLayoutConstraint.activate([
			//Team Colors
			teamColorOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			teamColorOne.topAnchor.constraint(equalTo: topAnchor),
			teamColorOne.bottomAnchor.constraint(equalTo: dividerLine.topAnchor),
			teamColorOne.widthAnchor.constraint(equalToConstant: 2),
			
			teamColorTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			teamColorTwo.bottomAnchor.constraint(equalTo: bottomAnchor),
			teamColorTwo.topAnchor.constraint(equalTo: teamColorOne.bottomAnchor),
			teamColorTwo.widthAnchor.constraint(equalToConstant: 2),
			
			//Title Label
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			
			//Divider Line
			dividerLine.heightAnchor.constraint(equalToConstant: 1),
			dividerLine.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 5),
			dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
			dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
			
			//Quarter Labels
				//Q1
				q1label.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: -35),
				q1label.centerXAnchor.constraint(equalTo: dividerLine.centerXAnchor,constant: -100),
				//Q2
				q2label.centerYAnchor.constraint(equalTo: q1label.centerYAnchor),
				q2label.centerXAnchor.constraint(equalTo: q1label.centerXAnchor, constant: 65),
				//Q3
				q3label.centerYAnchor.constraint(equalTo: q1label.centerYAnchor),
				q3label.centerXAnchor.constraint(equalTo: q1label.centerXAnchor, constant: 130),
				//Q4
				q4label.centerYAnchor.constraint(equalTo: q1label.centerYAnchor),
				q4label.centerXAnchor.constraint(equalTo: q1label.centerXAnchor, constant: 195)
			
		])
	}
	
	func setupTeamAttributes() {
		
		//Team One
			//Team Alias
		addSubview(teamAliasOne)
		teamAliasOne.translatesAutoresizingMaskIntoConstraints = false
		teamAliasOne.textColor = colorManager.white
		teamAliasOne.font = UIFont(name: "Menlo", size: 11)
			//Team 1st Score
		addSubview(teamOne1st)
		teamOne1st.translatesAutoresizingMaskIntoConstraints = false
		teamOne1st.textColor = colorManager.white
		teamOne1st.font = UIFont(name: "Menlo", size: 9)
			//Team 2nd Score
		addSubview(teamOne2nd)
		teamOne2nd.translatesAutoresizingMaskIntoConstraints = false
		teamOne2nd.textColor = colorManager.white
		teamOne2nd.font = UIFont(name: "Menlo", size: 9)
			//Team 3rd Score
		addSubview(teamOne3rd)
		teamOne3rd.translatesAutoresizingMaskIntoConstraints = false
		teamOne3rd.textColor = colorManager.white
		teamOne3rd.font = UIFont(name: "Menlo", size: 9)
			//Team 4th Score
		addSubview(teamOne4th)
		teamOne4th.translatesAutoresizingMaskIntoConstraints = false
		teamOne4th.textColor = colorManager.white
		teamOne4th.font = UIFont(name: "Menlo", size: 9)
		
		//Team Two
			//Team Alias
		addSubview(teamAliasTwo)
		teamAliasTwo.translatesAutoresizingMaskIntoConstraints = false
		teamAliasTwo.font = UIFont(name: "Menlo", size: 11)
		teamAliasTwo.textColor = colorManager.white
			//Team 1st Score
		addSubview(teamTwo1st)
		teamTwo1st.translatesAutoresizingMaskIntoConstraints = false
		teamTwo1st.textColor = colorManager.white
		teamTwo1st.font = UIFont(name: "Menlo", size: 9)
			//Team 2nd Score
		addSubview(teamTwo2nd)
		teamTwo2nd.translatesAutoresizingMaskIntoConstraints = false
		teamTwo2nd.textColor = colorManager.white
		teamTwo2nd.font = UIFont(name: "Menlo", size: 9)
			//Team 3rd Score
		addSubview(teamTwo3rd)
		teamTwo3rd.translatesAutoresizingMaskIntoConstraints = false
		teamTwo3rd.textColor = colorManager.white
		teamTwo3rd.font = UIFont(name: "Menlo", size: 9)
			//Team 4th Score
		addSubview(teamTwo4th)
		teamTwo4th.translatesAutoresizingMaskIntoConstraints = false
		teamTwo4th.textColor = colorManager.white
		teamTwo4th.font = UIFont(name: "Menlo", size: 9)
		
		
		
		NSLayoutConstraint.activate([
			//Team One
				//Team Alias
			teamAliasOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			teamAliasOne.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
				//Team 1st Score
			teamOne1st.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: -13),
			teamOne1st.centerXAnchor.constraint(equalTo: q1label.centerXAnchor),
				//Team 2nd Score
			teamOne2nd.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: -13),
			teamOne2nd.centerXAnchor.constraint(equalTo: q2label.centerXAnchor),
				//Team 3rd Score
			teamOne3rd.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: -13),
			teamOne3rd.centerXAnchor.constraint(equalTo: q3label.centerXAnchor),
				//Team 4th Score
			teamOne4th.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: -13),
			teamOne4th.centerXAnchor.constraint(equalTo: q4label.centerXAnchor),
			
			//Team Two
				//Name
			teamAliasTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			teamAliasTwo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
				//Team 1st Score
			teamTwo1st.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: 13),
			teamTwo1st.centerXAnchor.constraint(equalTo: q1label.centerXAnchor),
				//Team 2nd Score
			teamTwo2nd.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: 13),
			teamTwo2nd.centerXAnchor.constraint(equalTo: q2label.centerXAnchor),
				//Team 3rd Score
			teamTwo3rd.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: 13),
			teamTwo3rd.centerXAnchor.constraint(equalTo: q3label.centerXAnchor),
				//Team 4th Score
			teamTwo4th.centerYAnchor.constraint(equalTo: dividerLine.centerYAnchor, constant: 13),
			teamTwo4th.centerXAnchor.constraint(equalTo: q4label.centerXAnchor)
		
		])
	}
	
}
