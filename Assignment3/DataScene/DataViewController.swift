//
//  DataViewController.swift
//  Assignment3
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleVC = ""
    var callType = CallType.none
    
    var pokemonDataSource = PokemonsDataSource()
    var universitiesDataSource = UniversitiesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = self.titleVC
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        fetchData()
    }
    
    //MARK: SetupUI
    func setupUI(){
        tableView.delegate = self
        switch callType {
        case .pokemon:
            tableView.dataSource = pokemonDataSource
        case .universities:
            tableView.dataSource = universitiesDataSource
        default:
            print("Can't Setup UI")
        }
    }
    
    //MARK: fetch data
    func fetchData(){
        switch callType{
        case .pokemon:
            NetworkingApi().getPokemonData(completionHandler: {[weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicator.isHidden = true
                strongSelf.tableView.isHidden = false
                strongSelf.pokemonDataSource.data = result.results
                strongSelf.tableView.reloadData()
            })
        case .universities:
            NetworkingApi().getUniversitiesData(completionHandler: {[weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicator.isHidden = true
                strongSelf.tableView.isHidden = false
                strongSelf.universitiesDataSource.data = result
                strongSelf.tableView.reloadData()
                print(result)
            })
        default:
            print("Bad Selection")
        }
    }
}

extension DataViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Clicked", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
