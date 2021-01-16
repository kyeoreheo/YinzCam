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
        let defaultGameId: String?
        let gameSections: [GameSection]?

        
        enum CodingKeys: String, CodingKey {
            case team = "Team"
            case defaultGameId = "DefaultGameId"
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
            case triCode = "TriCode"
            case fullName = "FullName"
            case name = "Name"
            case city = "City"
            case record = "Record"
            case wins = "Wins"
            case losses = "Losses"
            case winPercentage = "WinPercentage"
        }
    }
    
    struct GameSection: Decodable {
        let heading: String?
        let games: [Game]?

        enum CodingKeys: String, CodingKey {
            case heading = "Heading"
            case games = "Game"
        }

    }
    
    struct Game: Decodable {
        let id: CLongLong?
        let type: String?
        let week: String?
        let label: String?
        let tv: String?
        let radio: String?
        let venue: String?
        let wlt: String?
        let gameState: String?
        let clock: String?
        let quarterShorthand: String?
        let quarter: String?
        let awayScore: String?
        let homeScore: String?
        let down: String?
        let isHome: Bool?
        let schedulHeader: String?
        let isSuperStadium: Bool?
//////        let cardData:
        let date: DateResponse?
        let opponent: Opponent?
        let tickets: Ticket?
        let result: String?
//        let buttons = "Buttons"
        
        enum CodingKeys: String, CodingKey {
            case id = "Id"
            case type = "Type"
            case week = "Week"
            case label = "Label"
            case tv = "TV"
            case radio = "Radio"
            case venue = "Venue"
            case wlt = "WLT"
            case gameState = "GameState"
            case clock = "Clock"
            case quarterShorthand = "QuarterShorthand"
            case quarter = "Quarter"
            case awayScore = "AwayScore"
            case homeScore = "HomeScore"
            case down = "Down"
            case isHome = "IsHome"
            case schedulHeader = "ScheduleHeader"
            case isSuperStadium = "IsSuperStadium"
////            case cardData = "CardData"
            case date = "Date"
            case opponent = "Opponent"
            case tickets = "Tickets"
            case result = "Result"
//            case buttons = "Buttons"
        }
    }
    
    struct DateResponse: Decodable {
        let numeric: String?
        let text: String?
        let time: String?
        let timestamp: String?
        let isTBA: String?
        let isTba: String?
        enum CodingKeys: String, CodingKey {
            case numeric = "Numeric"
            case text = "Text"
            case time = "Time"
            case timestamp = "Timestamp"
            case isTBA = "IsTBA"
            case isTba = "IsTba"
        }
    }
    
    struct Opponent: Decodable {
        let triCode: String?
        let fullName: String?
        let name: String?
        let record: String?
        enum CodingKeys: String, CodingKey {
            case triCode = "TriCode"
            case fullName = "FullName"
            case name = "Name"
            case record = "Record"
        }
    }
    
    struct Ticket: Decodable {
        let hasLink: Bool?
        let label: String?
        let link: String?
        enum CodingKeys: String, CodingKey {
            case hasLink = "HasLink"
            case label = "Label"
            case link = "Link"
        }
    }
    
//    static func fetchSchedule(_ completion: @escaping (Response?) -> Void) {
//        Alamofire.request(baseURL)
//            .responseData { response in
//                let decoder = JSONDecoder()
//                switch response.result {
//
//                case .success(let data):
//                    print(response.result.value)
//                    do {
//                        let result = try decoder.decode(Response.self, from: data)
//                        completion(result)
//                    } catch  let DecodingError.dataCorrupted(context) {
//                        print("DEBUG:- dataCorrupted \(context)")
//                        completion(nil)
//                    } catch let DecodingError.keyNotFound(key, context) {
//                        print("DEBUG:- keyNotFound \(key), \(context)")
//                        completion(nil)
//                    } catch let DecodingError.valueNotFound(value, context) {
//                        print("DEBUG:- valueNotFound \(value), \(context)")
//                        completion(nil)
//                    } catch let DecodingError.typeMismatch(type, context) {
//                        print("DEBUG:- typeMismatch \(type), \(context)")
//                        completion(nil)
//                    } catch {
//                        print("DEBUG:- none of those ")
//                        completion(nil)
//                    }
//                case .failure(_):
//                    completion(nil)
//                }
//            }
//    }
    
    static func fetchLocalSchedule(_ completion: @escaping (GameList?) -> Void) {
        if let path = Bundle.main.path(forResource: "schedule", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = try JSONDecoder().decode(GameList.self, from: data)
                completion(response)
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
        }
    }
}
