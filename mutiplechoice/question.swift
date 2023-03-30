//
//  question.swift
//  mutiplechoice
//
//  Created by MacbookPro on 2023/1/7.
//

import Foundation

//設question的類別為struct，讓之後讓之後產生東西時可直接使用類別裡的屬性
struct question {
    
    var description: String
    
    var option: [String]
    
    var answers: String
}
