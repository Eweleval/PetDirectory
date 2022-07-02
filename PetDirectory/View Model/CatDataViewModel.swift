//
//  CatDataViewModel.swift
//  PetDirectory
//
//  Created by Decagon on 01/07/2022.
//

import UIKit

protocol AllCatsDataDelegate: AnyObject{
    func receiveData(_ data: [CatModel])
}

class AllCatsViewModel {
    
     weak var delegate: AllCatsDataDelegate?
    
    private let urlString: String = Link.catApi
    
    public lazy var catResource: CatResourceProtocol = CatResource(urlString: urlString)
    
    func receiveData() {
        catResource.getCatData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.delegate?.receiveData(listOf)
            case .failure(let error):
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
    }
}
