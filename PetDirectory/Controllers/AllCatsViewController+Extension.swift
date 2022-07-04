//
//  AllCatsViewController+Extension.swift
//  PetDirectory
//
//  Created by Decagon on 02/07/2022.
//

import UIKit

extension AllCatsViewController: UITableViewDataSource, UITableViewDelegate, AllCatsTableViewCellDelegate, AllCatsDataDelegate {
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

        cell.delegate = self
        cell.likedCatInfo = pet
        cell.selectionStyle = .none
        return cell
    }
    
    func receiveData(_ data: [CatModel]) {
        self.listOfCats = data
        allCatsTableView.reloadData()
    }

    func tappedLike(data: CatModel?) {
        guard let data = data else {
            return
        }

        do {
            if store.value(forKey: "LikedCats") == nil {
                try store.saveObject([data], forKey: "LikedCats")
            } else {
            _ = try store.updateObject(
                with: data,
                forKey: "LikedCats",
                castTo: [CatModel].self)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
