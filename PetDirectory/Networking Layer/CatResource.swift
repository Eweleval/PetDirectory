//
//  CatResource.swift
//  PetDirectory
//
//  Created by Decagon on 01/07/2022.
//

import Foundation

protocol CatResourceProtocol{
    func getCatData(completion: @escaping(Result<CatModel, UserError>) -> Void)
}

struct CatResource: CatResourceProtocol {
    private var httpUtility: UtilityService
    private var urlString: String
    
    init(httpUtility: UtilityService = HTTPUtility(),
         urlString: String){
        self.httpUtility = httpUtility
        self.urlString = urlString
    }
    
    func getCatData(completion: @escaping(Result<CatModel, UserError>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        
        httpUtility.performDataTask(url: url, resultType: CatModel.self) { result in
            switch result {
            case .success(let jsonData):
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    debugPrint(jsonData)
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
