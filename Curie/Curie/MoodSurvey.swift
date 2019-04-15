//
//  MoodSurvey.swift
//  Curie
//
//  Created by Farhan on 4/11/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Foundation

class MoodSurvey: Codable {
    
    var id: Int?
    var survey_id: Int?
    var title: String
    var description: String
    var created_at: String
    var manager_id: Int
    var answers: [String]?

    
    // WHAT api/surveys/surveys/team-member/4 (4 is member id)
//    "id": 1,
//    "title": "Lab11",
//    "description": "How are you",
//    "created_at": "2019-04-05T19:42:28.736Z",
//    "manager_id": 4,
//    "survey_time_stamp": "1554485225.000100",
//    "ex_time": "1 12 * * *"
    
    // What /api/surveys/surveys/survey-id/4 (4 is survey id)
//    "survey_id": 4,
//    "title": "Testing",
//    "description": "Is this working? ",
//    "created_at": "2019-04-11T20:04:18.844Z",
//    "manager_id": 4,
//    "survey_time_stamp": null,
//    "ex_time": "6 12 * * *",
//    "answers": [
//    "funny :joy:",
//    "sad :sob:",
//    "chill :sunglasses:",
//    "tired :skull:"
//    ]
}
