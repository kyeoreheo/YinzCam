//
//  API.swift
//  YinzCam
//
//  Created by Kyo on 1/12/21.
//

import Foundation
import Alamofire
import os.log

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
        let gameSections: [GameSection]?
        
        enum CodingKeys: String, CodingKey {
            case team = "Team"
            case gameSections = "GameSection"
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
            case fullName = "-FullName"
            case name = "-Name"
            case city = "-City"
            case record = "-Record"
            case wins = "-Wins"
            case losses = "-Losses"
            case winPercentage = "-WinPercentage"
        }
    }
    
    struct GameSection: Decodable {
        let heading: String
        let games: [Game]
        
        enum CodingKeys: String, CodingKey {
            case heading = "-Heading"
            case games = "Game"
        }

    }
    
    struct Game: Decodable {
//        let id: String?
//        let type: String?
//        let result: String?
//        let home: String?
//        let week: String?
//        let label: String?
//        let venue: String?
//        let wlt: String?
//        let gameState: String?
//        let clock: String?
//        let awayScore: String?
//        let homeScore: String?
//        let down: String?
//        let isHome: String?
//        let schedulHeader: String?
//        let date: DateResponse?
        
//        enum CodingKeys: String, CodingKey {
//            case id = "-Id"
//            case type = "-Type"
//            case result = "-Result"
//            case home = "-Home"
//            case week = "-Week"
//            case label = "-Label"
//            case venue = "-Venue"
//            case wlt = "-WLT"
//            case gameState = "-GameState"
//            case clock = "-Clock"
//            case awayScore = "-AwayScore"
//            case homeScore = "-HomeScore"
//            case down = "-Down"
//            case isHome = "-IsHome"
//            case schedulHeader = "-ScheduleHeader"
//            case date = "Date"
//        }
    }
    
    struct DateResponse: Decodable {
        let numeric: String?
        let text: String?
        let time: String?
        let timestamp: String?
        let isTBA: String?
        let isTba: String?
        enum CodingKeys: String, CodingKey {
            case numeric = "-Numeric"
            case text = "-Text"
            case time = "-Time"
            case timestamp = "-Timestamp"
            case isTBA = "-IsTBA"
            case isTba = "-IsTba"
        }

    }
    
    static func fetchSchedule(_ completion: @escaping (Response?) -> Void) {
        Alamofire.request(baseURL, method: .get)
            .responseData { response in
                let decoder = JSONDecoder()
                switch response.result {
                case .success(let data):
                    print(data.description.debugDescription)
                    do {
                        let result = try decoder.decode(Response.self, from: data)
                        //let a = try decoder.decode(GameSection, from: result)
                        completion(result)
                    } catch  let DecodingError.dataCorrupted(context) {
                        print("DEBUG:- dataCorrupted \(context)")
                        completion(nil)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("DEBUG:- keyNotFound \(key), \(context)")
                        completion(nil)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("DEBUG:- valueNotFound \(value), \(context)")
                        completion(nil)
                    } catch let DecodingError.typeMismatch(type, context) {
                        print("DEBUG:- typeMismatch \(type), \(context)")
                        completion(nil)
                    } catch {
                        print("DEBUG:- none of those ")
                        completion(nil)
                    }
                case .failure(_):
                    completion(nil)
                }
            }
    }
}
