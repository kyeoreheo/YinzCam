//
//  API.swift
//  YinzCam
//
//  Created by Kyo on 1/12/21.
//

import Foundation
import Alamofire

class API {
    static let baseURL = "http://files.yinzcam.com.s3.amazonaws.com/iOS/interviews/ScheduleExercise/schedule.json"
    
    struct Response: Decodable {
        let gameList: GameList?
        enum CodingKeys: String, CodingKey {
            case gameList = "GameList"
        }
    }
    struct GameList: Decodable {
        let team: Team?
        enum CodingKeys: String, CodingKey {
            case team = "Team"
        }
    }
    
    struct Team: Decodable {
        let triCode: String?
        let fullName: String?
        let name: String?
        let city: String?
        let record: String?
        let wins: String?
        let losses: String?
        let winPercentage: String?
        
        enum CodingKeys: String, CodingKey {
            case triCode = "-TriCode"
            case fullName = "-FulllName"
            case name = "-Name"
            case city = "-City"
            case record = "-Record"
            case wins = "-Wins"
            case losses = "-Losses"
            case winPercentage = "-WinPercentage"
        }
    }
    
    static func fetchSchedule(_ completion: @escaping (Response?) -> Void) {
        Alamofire.request(baseURL, method: .get)
            .responseData { response in
                let decoder = JSONDecoder()
                switch response.result {
                case .success(let data):
                    do {
                        let result = try decoder.decode(Response.self, from: data)
                        completion(result)
                    } catch {
                        completion(nil)
                    }
                case .failure(_):
                    completion(nil)
                }
            }
    }
}
