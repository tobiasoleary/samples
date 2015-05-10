//
//  Random.swift
//
//  Created by Allen Jørgen Tobias O'Leary on 4/8/15.
//  Copyright (c) 2015 Tobias O'Leary. All rights reserved.
//

import Foundation


class Random {
    
    
    static let firstNames = ["Tora", "Shasta", "Camelia", "Gertrudis", "Charita", "Donita", "Debbra", "Shaquana", "Tommy", "Shara", "Ignacia", "Cassondra", "Melynda", "Lisette", "Herman", "Rhoda", "Farah", "Tim", "Tonette", "Johnathon", "Debroah", "Britni", "Charolette", "Kyoko", "Eura", "Nevada", "Lasandra", "Alpha", "Mirella", "Kristel", "Yolande", "Nelle", "Kiley", "Liberty", "Jettie", "Zoe", "Isobel", "Sheryl", "Emerita", "Hildegarde", "Launa", "Tanesha", "Pearlie", "Julianna", "Toi", "Terina", "Collin", "Shamika", "Suzette", "Tad"]
    
    static let lastNames = ["Austen", "Kenton", "Blomker", "Demars", "Bibbs", "Eoff", "Alcantara", "Swade", "Klinefelter", "Riese", "Smades", "Fryson", "Altobelli", "Deleeuw", "Beckner", "Valone", "Tarbox", "Shumate", "Tabone", "Kellam", "Dibiase", "Fasick", "Curington", "Holbrook", "Sulzer", "Bearden", "Siren", "Kennedy", "Dulak", "Segers", "Roark", "Mauck", "Horsman", "Montreuil", "Leyva", "Veltz", "Roldan", "Denlinger", "James", "Oriley", "Cistrunk", "Rhodes", "Mcginness", "Gallop", "Constantine", "Niece", "Sabine", "Vegter", "Sarnicola", "Towler"]
    
    class func dateBeforeToday(numberOfDaysBefore days: Int = 365) -> NSDate {
        
        let randomDaysInSeconds = Double(Random.int(min: 0, max: 365)) * 24.0 * 60.0 * 60.0
        let randomHoursInSeconds = Double(Random.int(min: 1, max: 23)) * 60 * 60
        let randomMinutesInSeconds = Double(Random.int(min: 1, max: 59)) * 60
        let randomSecondsInSeconds = Double(Random.int(min: 1, max: 59))
        
        var randomTimeInterval = randomDaysInSeconds + randomHoursInSeconds + randomMinutesInSeconds + randomSecondsInSeconds
        
        let randomDate = NSDate(timeIntervalSinceNow: -1.0*randomTimeInterval)
        
        return randomDate
    }
    
    class func bool() -> Bool {
        return  Random.int(range:0...1) == 0 ? true : false
    }
    
    class func double(#min: Double, max: Double) -> Double {
        var normalizedRandomDouble = Double(arc4random()) / Double(UInt32.max)
        return (normalizedRandomDouble * (max - min)) + min
    }
    
    
    class func int(#min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32((max+1)-min))) + min
    }
    
    class func int(#range: Range<Int>) -> Int {
        return int(min: range.startIndex, max: range.endIndex)
    }
    
    class func selectElement<T>(#array: [T]) -> T {
        return array[int(range: 0..<array.count)]
    }
    
    
    class func paragraphs(#numberOfParagraphs: Int) -> String {
        
        var randomParagraphs = NSMutableString()
        for i in 0..<numberOfParagraphs {
            randomParagraphs.appendString(Random.paragraph(numberOfSentences: Random.int(min: 2, max: 7)))
            randomParagraphs.appendString("\n")
        }
        return String(randomParagraphs)
        
    }
    
    class func paragraph(#numberOfSentences: Int) -> String {
        
        var randomParagraph = NSMutableString()
        for i in 0..<numberOfSentences {
            randomParagraph.appendString(Random.sentence(numberOfStrings:Random.int(min: 3, max: 8)))
            randomParagraph.appendString(" ")
        }
        return String(randomParagraph)
    }
    
    class func sentence(#numberOfStrings: Int) -> String {
        var randomSentence = NSMutableString()
        for i in 0..<numberOfStrings-1 {
            if i > 0 {
                randomSentence.appendString(Random.string(numberOfCharacters: Random.int(min: 1, max: 16)).lowercaseString)
            } else {
                randomSentence.appendString(Random.string(numberOfCharacters: Random.int(min: 1, max: 16)).capitalizedString)
            }
            
            randomSentence.appendString(" ")
        }
        randomSentence.appendString(Random.string(numberOfCharacters: Random.int(min: 1, max: 16)))
        randomSentence.appendString(".")
        
        return String(randomSentence)
    }
    
    class func string(#numberOfCharacters : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyz"
        let lettersLength: Int = letters.length
        var randomString : NSMutableString = NSMutableString(capacity: numberOfCharacters)
        
        for i in 0..<numberOfCharacters {
            let randIndex = Random.int(min: 0, max:lettersLength-1)
            let characterValue: unichar = letters.characterAtIndex(randIndex)
            
            randomString.appendFormat("%C", characterValue)
        }
        
        return String(randomString)
    }
    
    
    class func firstName() -> String {
        return Random.selectElement(array: Random.firstNames)
    }
    
    class func lastName() -> String {
        return Random.selectElement(array: Random.lastNames)
    }
    
    class func avatarImageURL() -> String {
        let avatarImageSize = Random.int(min: 40, max: 285)
        return "http://api.adorable.io/avatars/\(avatarImageSize)/\(Random.firstName().lowercaseString).\(Random.lastName().lowercaseString)@gmail.png"
    }
    
    class func imageURL() -> String {
        
        let imageWidth = Random.int(min:120, max:1080)
        let imageHeight = Random.int(min:120, max:1080)
        
        return "http://lorempixel.com/g/\(imageWidth)/\(imageHeight)/"
    }
    
}