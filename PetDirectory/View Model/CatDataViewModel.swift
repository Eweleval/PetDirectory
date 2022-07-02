//
//  CatDataViewModel.swift
//  PetDirectory
//
//  Created by Decagon on 01/07/2022.
//

import UIKit

protocol CurrentDataDelegate: AnyObject{
    func receiveData(_ data: CatModel)
}

class CurrentWeatherViewModel {
    
     weak var delegate: CurrentDataDelegate?
    
    private let urlString: String = Link.catApi
    
    public lazy var catResource: CatResourceProtocol = CatResource(urlString: urlString)
    private var catList: CatModel?
    
    func receiveData() {
        catResource.getCatData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.delegate?.receiveData(listOf)
                debugPrint(listOf)
            case .failure(let error):
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
    }
}
