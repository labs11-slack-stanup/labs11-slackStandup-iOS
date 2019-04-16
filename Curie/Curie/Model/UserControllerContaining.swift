//
//  UserControllerContaining.swift
//  Curie
//
//  Created by Farhan on 4/9/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Foundation

protocol UserControllerContaining: class {
    var userController: UserController? { get set }
}
