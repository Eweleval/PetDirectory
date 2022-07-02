//
//  AllCatsViewController+Extension.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

extension AllCatsViewController: AllCatsDataDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfCats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllCatsTableViewCell.identifier, for: indexPath) as? AllCatsTableViewCell else { return UITableViewCell() }

        let pet = listOfCats[indexPath.row]

        cell.catName.text = pet.name
        DispatchQueue.main.async {
            let loadedImage = ImageResource()
            loadedImage.requestImage(from: ((URL(string:pet.image?.url ?? "") ?? Link.defaultImageLink)!)) { image in
                cell.catImage.image = image
            }
        }

        cell.selectionStyle = .none
        return cell
    }
    
    func receiveData(_ data: [CatModel]) {
        self.listOfCats = data
        allCatsTableView.reloadData()
    }
}
