//
//  StandingsViewFooter.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/10/23.
//

import Foundation
import UIKit

class StandingsViewFooter: UITableViewHeaderFooterView {
	let colorManager = ColorManager()
	
	//Container Declaration
	let footerContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	//Label Declarations
	let textLabelOne: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "*Seeds 7-10 Participate in the Play-in Tournament*"
		label.font = UIFont(name: "Menlo", size: 8)
		return label
	}()
	
	let textLabelTwo: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "*Seeds 11-15 miss playoffs*"
		label.font = UIFont(name: "Menlo", size: 8)
		return label
	}()
	
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: "Footer View")
		contentView.backgroundColor = colorManager.black
		
		setupAttributes()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let mask = CAShapeLayer()
		let path = UIBezierPath(roundedRect: footerContainer.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
		mask.path = path.cgPath
		footerContainer.layer.mask = mask
	}
	
	
	func setupAttributes() {
		//Container Setup
		contentView.addSubview(footerContainer)
		footerContainer.backgroundColor = colorManager.lightBlack
		//Label One
		footerContainer.addSubview(textLabelOne)
		textLabelOne.textColor = colorManager.white
		//Label Two
		footerContainer.addSubview(textLabelTwo)
		textLabelTwo.textColor = colorManager.white

		
		NSLayoutConstraint.activate([
			//Footer Container
			footerContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
			footerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			footerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			footerContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.70),
			//Label One
			textLabelOne.leadingAnchor.constraint(equalTo: footerContainer.leadingAnchor, constant: 4),
			textLabelOne.topAnchor.constraint(equalTo: footerContainer.topAnchor, constant: 9),
			//Label Two
			textLabelTwo.leadingAnchor.constraint(equalTo: footerContainer.leadingAnchor,constant: 4),
			textLabelTwo.topAnchor.constraint(equalTo: textLabelOne.bottomAnchor, constant: 2),
		])
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
