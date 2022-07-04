//
//  CatsILikeViewController.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

class CatsILikeViewController: UIViewController {

    let store: UserDefaults = UserDefaults.standard

    @IBOutlet weak var catsILike: UICollectionView!
    var listOfLikedCats = [CatModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        catsILike.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        retrieveLikedCats()
    }

    // MARK: - Get Data from UserDefault

    private func retrieveLikedCats() {
        do {
            let favoriteCats = try store.getObject(forKey: "LikedCats", castTo: [CatModel].self)
            listOfLikedCats = favoriteCats
            catsILike.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
