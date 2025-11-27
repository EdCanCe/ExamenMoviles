//
//  SudokuAPIService.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Alamofire
import Foundation

class SudokuAPIService {
    static let shared = SudokuAPIService()
    
    func getBoard(url: URL, width: Int, height: Int, difficulty: String) async throws -> Sudoku {
        let parameters: Parameters = [
            "width": width,
            "height": height,
            "difficulty": difficulty
        ]
        
        let headers: HTTPHeaders = [
            "X-Api-Key": "wLVPN1zV08lJYF7uXqgyPw==zVwp6TlVcAO1NLUf"
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate()
        let response = await taskRequest.serializingData().response
                        
        print("Status code: \(response.response?.statusCode ?? 0)")
        if let data = response.data, let str = String(data: data, encoding: .utf8) {
            print("Body: \(str)")
        }
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(Sudoku.self, from: data)
            } catch {
                throw error
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            throw error
        }
    }
}
