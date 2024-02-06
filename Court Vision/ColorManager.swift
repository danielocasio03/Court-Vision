//
//  ColorManager.swift
//  Court Vision
//
//  Created by Daniel Efrain Ocasio on 5/10/23.
//

import UIKit
import Foundation

class ColorManager {
	
// Genral UI Colors that are used around the app
	let black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
	let lightBlack = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.0)
	let slightyLighterBlack = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1.0)
	let lightestBlack = UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1.0)
	let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
	let subHeadingGrey = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0)
	
	//Used on the standingsView to separate the teams that need to participate in the play-in
	let playInYellow = UIColor(red: 225/255, green: 217/255, blue: 144/255, alpha: 1.0)
	//Used on the standingView to separate the teams that are not currently qualifying for the playoffs
	let nonPlayoffRed = UIColor(red: 237/255, green: 116/255, blue: 112/255, alpha: 1.0)

	//This is the theme color of the app, used in the border lines.
	let tiffanyBlue = UIColor(red: 135/255, green: 209/255, blue: 205/255, alpha: 1.0)
	 
	let electricBlue = UIColor(red: 35/255, green: 84/255, blue: 159/255, alpha: 1.0)
	
	//This is the dictionary that holds colors to represent each team,
	//and the key is the 3 letter alias that corresponds to said team
	let teamColorDictionary: [String:UIColor] = [
		"MIA": UIColor(red: 139/255, green: 26/255, blue: 48/255, alpha: 1.0),
		"BOS": UIColor(red: 56/255, green: 128/255, blue: 78/255, alpha: 1.0),
		"DEN": UIColor(red: 18/255, green: 32/255, blue: 60/255, alpha: 1.0),
		"PHI": UIColor(red: 45/255, green: 105/255, blue: 175/255, alpha: 1.0),
		"NYK": UIColor(red: 237/255, green: 113/255, blue: 54/255, alpha: 1.0),
		"LAL": UIColor(red: 243/255, green: 188/255, blue: 75/255, alpha: 1.0),
		"GSW": UIColor(red: 244/255, green: 191/255, blue: 75/255, alpha: 1.0),
		"IND": UIColor(red: 242/255, green: 193/255, blue: 70/255, alpha: 1.0),
		"CLE": UIColor(red: 97/255, green: 20/255, blue: 50/255, alpha: 1.0),
		"CHA": UIColor(red: 51/255, green: 118/255, blue: 138/255, alpha: 1.0),
		"TOR": UIColor(red: 188/255, green: 44/255, blue: 69/255, alpha: 1.0),
		"MIL": UIColor(red: 27/255, green: 70/255, blue: 32/255, alpha: 1.0),
		"WAS": UIColor(red: 190/255, green: 42/255, blue: 51/255, alpha: 1.0),
		"HOU": UIColor(red: 221/255, green: 49/255, blue: 69/255, alpha: 1.0),
		"BKN": UIColor(red: 119/255, green: 125/255, blue: 132/255, alpha: 1.0),
		"ATL": UIColor(red: 207/255, green: 72/255, blue: 69/255, alpha: 1.0),
		"CHI": UIColor(red: 189/255, green: 45/255, blue: 69/255, alpha: 1.0),
		"DET": UIColor(red: 23/255, green: 60/255, blue: 160/255, alpha: 1.0),
		"ORL": UIColor(red: 53/255, green: 119/255, blue: 190/255, alpha: 1.0),
		"UTA": UIColor(red: 52/255, green: 80/255, blue: 55/255, alpha: 1.0),
		"SAS": UIColor(red: 193/255, green: 202/255, blue: 203/255, alpha: 1.0),
		"DAL": UIColor(red: 80/255, green: 144/255, blue: 203/255, alpha: 1.0),
		"OKC": UIColor(red: 222/255, green: 93/255, blue: 64/255, alpha: 1.0),
		"MEM": UIColor(red: 98/255, green: 117/255, blue: 165/255, alpha: 1.0),
		"SAC": UIColor(red: 84/255, green: 47/255, blue: 125/255, alpha: 1.0),
		"PHX": UIColor(red: 237/255, green: 107/255, blue: 48/255, alpha: 1.0),
		"LAC": UIColor(red: 214/255, green: 48/255, blue: 67/255, alpha: 1.0),
		"POR": UIColor(red: 159/255, green: 35/255, blue: 43/255, alpha: 1.0),
		"MIN": UIColor(red: 100/255, green: 142/255, blue: 61/255, alpha: 1.0),
		"NOP": UIColor(red: 180/255, green: 155/255, blue: 99/255, alpha: 1.0)
	]
}
