//
//  TabBar.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 7/6/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
	let colorManager = ColorManager()
	
	let border: UIView = {
		let border = UIView()
		border.translatesAutoresizingMaskIntoConstraints = false
		border.backgroundColor = ColorManager().tiffanyBlue.withAlphaComponent(0.4)
		border.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
		return border
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()
	}
	
	
	private func setupTabBar() {
		//TabBar Visuals
		view.translatesAutoresizingMaskIntoConstraints = false
		tabBar.backgroundColor = colorManager.lightBlack.withAlphaComponent(0.98)
		
		tabBar.tintColor = colorManager.white
		tabBar.isTranslucent = true
		
		//Tab VC's setup
			//This tweaks the size of the standings Icon
		let originalImage = UIImage(named: "podium")
		let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 33, height: 33)).image { _ in
			originalImage?.draw(in: CGRect(origin: .zero, size: CGSize(width: 33, height: 33)))
		}
		
		let gameSlateVC = GameSlateVC()
		let standingsVC = StandingsVC()
		self.setViewControllers([
			createNav(title: "Home", Image: UIImage(systemName: "house")!, vc: gameSlateVC),
			createNav(title: "Standings", Image: resizedImage, vc: standingsVC)
		], animated: true)
		
		//Border setup
		tabBar.addSubview(border)
		border.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
		border.widthAnchor.constraint(equalTo: tabBar.widthAnchor).isActive = true
	}
	
	
	//Creates the NavBar and sets its root VC
	private func createNav(title: String, Image: UIImage, vc: UIViewController) -> UINavigationController {
		let nav = UINavigationController(rootViewController: vc)
		nav.tabBarItem.title = title
		nav.tabBarItem.image = Image
		
		return nav
	}
	
}
