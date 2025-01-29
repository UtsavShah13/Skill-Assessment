//
//  NetworkManager+API.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//

import Foundation

extension NetworkManager {
    
    func handleError(_ message: String) {
        if !message.isEmpty {
        }
    }
    
    func getMatchDetail1API(complition: @escaping((_ result: MatchDetailResponse?) -> Void)) {
        let apiURL = API.nzin01312019187360.rawValue
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                let list: MatchDetailResponse? = self.decodeObject(fromData: result)
                complition(list)
            } else {
            }
        }
    }
    
    func getMatchDetail2API(complition: @escaping((_ result: MatchDetailResponse?) -> Void)) {
        let apiURL = API.sapk01222019186652.rawValue
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                let list: MatchDetailResponse? = self.decodeObject(fromData: result)
                complition(list)
            } else {
            }
        }
    }
    
    func decodeObject<T: Decodable>(fromData data: Any?) -> T? {
        guard let data = data else { return nil }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .secondsSince1970
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase // This helps with snake_case keys

            let decodedObject = try jsonDecoder.decode(T.self, from: jsonData)
            return decodedObject
        } catch {
            print("Decoding error: \(error)")
            return nil
        }
    }

}
