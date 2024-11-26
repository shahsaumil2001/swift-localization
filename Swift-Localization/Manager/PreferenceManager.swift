//
//  PreferenceManager.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 26/11/24.
//

import UIKit

struct UserDefaultsKey {
    static let appLanguage = "appLanguage"
}

class PreferenceManager: NSObject {

    // MARK: - Properties

    static var shared = PreferenceManager()
    let userDefaults = UserDefaults.standard

    // MARK: - set App Language
    var appLanguage: String {
        get {
            let language = userDefaults.value(forKey: UserDefaultsKey.appLanguage) as? String ?? LanguageCode.english
            return language
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKey.appLanguage)
            userDefaults.synchronize()
        }
    }
}
