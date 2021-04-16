//
//  HomeViewController.swift
//  Assignment3
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pokemonSegue":
            if let vc = segue.destination as? DataViewController{
                vc.titleVC = "Pokemon Data"
                vc.callType = .pokemon
            }
        default:
            if let vc = segue.destination as? DataViewController{
                vc.titleVC = "Universities Data"
                vc.callType = .universities
            }
        }
    }

}
