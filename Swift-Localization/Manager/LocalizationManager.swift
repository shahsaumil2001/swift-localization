//
//  LocalizationManager.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 26/11/24.
//

import UIKit

struct LanguageCode {
    static let english = "en"
    static let arabic = "ar"
    static let spanish = "es"
    static let french = "fr"
    static let chinese = "zh-Hans"
}
enum Language {
    case english
    case arabic
    case spanish
    case french
    case chinese
    
    var code: String {
        switch self {
        case .english:
            return LanguageCode.english
        case .arabic:
            return LanguageCode.arabic
        case .spanish:
            return LanguageCode.spanish
        case .french:
            return LanguageCode.french
        case .chinese:
            return LanguageCode.chinese
        }
    }
    
    var name: String {
        switch self {
        case .english:
            return StringConstants.english.localized()
        case .arabic:
            return StringConstants.arabic.localized()
        case .spanish:
            return StringConstants.spanish.localized()
        case .french:
            return StringConstants.french.localized()
        case .chinese:
            return StringConstants.chinese.localized()
        }
    }

}

class LocalizationManager {
    
    static let shared = LocalizationManager()
    ///
    /// The extension is `isRTL` which is used to determine direction of the application from current language
    /// A UIApplication extension's `isRTL` method
    ///
    class func isRTL() -> Bool {
        let appLanguage = self.getCurrentAppLaguage()
        if appLanguage == Language.arabic.code {
          return true
        } else {
           return false
        }
    }
    ///
    /// The extension is `getCurrentAppLaguage` which is used to fetch current app language
    /// A UIApplication extension's `getCurrentAppLaguage` method
    ///
    class func getCurrentAppLaguage() -> String {
        return PreferenceManager.shared.appLanguage
    }
}
extension String {
    ///
    /// The extension is `localized` which is used to localize string
    /// A String extension's `localized` method
    ///
    func localized() -> String {
        let selectedLanguage = PreferenceManager.shared.appLanguage
        let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle(path: path!)!, value: self, comment: self)

    }
}
