//
//  MoodAnswers.swift
//  Curie
//
//  Created by Farhan on 4/18/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Foundation

class MoodAnswer: Codable{
    
    var id: Int
    var feeling_text: String
    var created_at: String
    var team_member_id: Int
    var survey_id: Int
    var question: String?
    var title: String?
    
//    "id": 4,
//    "feeling_text": ":skull:",
//    "created_at": "2019-04-17T04:28:09.277Z",
//    "team_member_id": 9,
//    "survey_time_stamp": null,
//    "survey_id": 3
    
}
