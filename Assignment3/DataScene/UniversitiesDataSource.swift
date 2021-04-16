//
//  UniversitiesDataSource.swift
//  Assignment3
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import UIKit

final class UniversitiesDataSource : NSObject, UITableViewDataSource{
    
    var data : [Universities]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return  UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
        
        
    }
    
    
}
