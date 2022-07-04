//
//  AllCatsViewController.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

class AllCatsViewController: UIViewController {

    let store: UserDefaults = UserDefaults.standard

    let allCatsModel = AllCatsViewModel()
    var listOfCats = [CatModel]()

    @IBOutlet weak var allCatsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allCatsModel.delegate = self
        allCatsModel.receiveData()
        allCatsTableView.dataSource = self
        allCatsTableView.delegate = self
    }
}
