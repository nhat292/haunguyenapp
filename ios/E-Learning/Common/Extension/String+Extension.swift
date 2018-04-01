//
//  String+Extension.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/15/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func localized(lang: String, tableName: String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: tableName, bundle: bundle!, value: "", comment: "")
    }
    
    var showShortName: String {
        var shortName = ""
        if self.characters.count > 1 {
            let split = self.components(separatedBy: " ")
            if split.count > 1 {
                let firstChar = split[0]
                let sencondChar = split[split.count - 1]
                shortName = firstChar[0] + sencondChar[0]
            } else {
                shortName = self[0] + self[1]
            }
        } else {
            shortName = "\(self)\(self)"
        }
        return shortName.uppercased()
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return self[Range(start ..< end)]
    }
    
    mutating func trimTrailingWhitespace() {
        if let trailingWs = self.range(of: "\\s+$", options: .regularExpression) {
            self.replaceSubrange(trailingWs, with: "")
        }
    }
    
    func toWidthSize(font: UIFont) -> CGSize {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailFinal = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailFinal.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool {
        let PHONE_REGEX = "^0\\d{9,}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    var attributedStringFromHtml: NSAttributedString {
        let attrStr = try! NSAttributedString (
            data: (self.data(using: String.Encoding.unicode, allowLossyConversion: true))!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue, NSForegroundColorAttributeName: UIColor.white],
            documentAttributes: nil)
        return attrStr
    }
    
    var formatToDateOfApp: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormater.date(from: self)
        dateFormater.dateFormat = "dd/MM/yyyy"
        return dateFormater.string(from: date!)
    }
    
    var formatToPostDay: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormater.date(from: self)
        dateFormater.dateFormat = "MMM dd, yyyy"
        return dateFormater.string(from: date!)
    }
    
    var formatToBirthdayDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let date = dateFormater.date(from: self)
        dateFormater.dateFormat = "dd-MMMM-yyyy"
        let formattedDate = dateFormater.string(from: date!)
        let dateSplit = formattedDate.components(separatedBy: "-")
        let day = Int(dateSplit[0])
        let suffix = getDayOfMonthSuffix(n: day!)
        return "\(day!)\(suffix) \(dateSplit[1]) \(dateSplit[2])"
    }
    
    func getDayOfMonthSuffix(n : Int) -> String {
        if n >= 11 && n <= 13 {
            return "th"
        }
        switch n % 10 {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        default:
            return "th"
        }
    }
    
    var removeSuffix: String {
        var stringSplit = self.components(separatedBy: " ")
        var string = stringSplit[0].replacingOccurrences(of: "st", with: "")
        string = string.replacingOccurrences(of: "th", with: "")
        string = string.replacingOccurrences(of: "nd", with: "")
        string = string.replacingOccurrences(of: "rd", with: "")
        return "\(string) \(stringSplit[1]) \(stringSplit[2])"
    }
    
    var formatFromDisplayToDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"
        let date = dateFormater.date(from: self.removeSuffix)
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from: date!)
    }
    
    var isHtmlLink: Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
}
