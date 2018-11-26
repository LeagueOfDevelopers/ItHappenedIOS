//
//  Rating.swift
//  ItHappened
//
//  Created by Victor on 25/11/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation

class Rating {
    //MARK: Initialization
    private var rating : Int
    init(ratingValue:Int) throws {
        if ratingValue>10 || ratingValue<1{
            throw ratingError.IndexOutOfBoundsException("Value of scale out of range")
        }
        self.rating = ratingValue
    }
    //MARK: Functions
    func getRating() -> Int{
        return self.rating
    }
    func setRating(rating: Int) throws{
        if checkRating(rating: rating){
            self.rating = rating
        }
        else{
            throw ratingError.IndexOutOfBoundsException("Value of scale out of range")
        }
    }
    func checkRating(rating: Int) -> Bool{
        if rating > 10 || rating<1{
            return false
        }
        return true
    }
    //MARK: Enumerators
    enum ratingError : Error{
        case IndexOutOfBoundsException(String)
    }
}
