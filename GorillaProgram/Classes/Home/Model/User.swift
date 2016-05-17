//
//  User.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/17.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

class User: Model {
    
    
    var age: String?

    var lastName: String?

    var dog: Dog?

    var name: String?

    var books: [Book]?
    

}
class Dog: NSObject {

    var dogName: String?

    var age: String?

}

class Book: NSObject {

    var price: String?

    var bookName: String?

}

