//
//  PaymentViewController.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 26/11/24.
//

import UIKit

class PaymentViewController: UIViewController {
    
    // MARK:- Outlets -
    @IBOutlet weak var backgroundImageView: UIImageView!
    // Change Language components
    @IBOutlet weak var changeLanguageView: UIView!
    @IBOutlet weak var changeLanguageButton: UIButton!
    @IBOutlet weak var changeLanguageBgBlurView: UIVisualEffectView!
    // User Details View
    @IBOutlet weak var userDetailsView: UIView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    // Payment View - Apple Pay
    @IBOutlet weak var paymentView: UIStackView!
    @IBOutlet weak var applePayImageView: UIImageView!
    @IBOutlet weak var applePayTitleLabel: UILabel!
    @IBOutlet weak var applePayDescriptionLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    // Payment View - Bank Transfer
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankTitleLabel: UILabel!
    @IBOutlet weak var bankDescriptionLabel: UILabel!
    @IBOutlet weak var bankBgBlurView: UIVisualEffectView!
    
    // MARK:- View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        self.setupStyle()
    }
    
    // MARK:- Action -
    @IBAction func showLanguageOptionsSheet(_ sender: Any) {        
        // define actionSheet
        let alert = UIAlertController(
            title: StringConstants.appName.localized(),
            message: StringConstants.selectLanguage.localized(),
            preferredStyle: .actionSheet
        )
        // define options
        let languages: [(code: String, name: String, language: Language)] = [
            (Language.english.code, Language.english.name, .english),
            (Language.arabic.code, Language.arabic.name, .arabic),
            (Language.spanish.code, Language.spanish.name, .spanish),
            (Language.french.code, Language.french.name, .french),
            (Language.chinese.code, Language.chinese.name, .chinese)
        ]
        // add actions for options
        for language in languages {
            let title = PreferenceManager.shared.appLanguage == language.code
            ? StringConstants.tickMark + language.name
            : language.name
            
            let action = UIAlertAction(title: title, style: .default) { _ in
                self.changeAppLanguage(language: language.language)
            }
            alert.addAction(action)
        }
        // dismiss action
        alert.addAction(UIAlertAction(
            title: StringConstants.dismiss.localized(),
            style: .cancel,
            handler: nil
        ))
        // present actionsheet
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK:- Functions -
    ///
    /// The func is `changeAppLanguage` which is used to change the language
    ///  A PaymentViewController's `changeAppLanguage` method
    ///
    fileprivate func changeAppLanguage(language: Language) {
        // Update selected language code in User Default
        PreferenceManager.shared.appLanguage = language.code
        // Update UI
        self.setLocalizationText()
        self.setComponentsDirection()
    }
    ///
    /// The func is `setComponentsDirection` which is used to set the direction of the components as per RTL/LTR
    ///  A PaymentViewController's `setComponentsDirection` method
    ///
    func setComponentsDirection() {
        if LocalizationManager.isRTL() {
            //for RTL
            self.backgroundImageView.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            self.changeLanguageView.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            self.userDetailsView.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            self.paymentView.transform = CGAffineTransformMakeScale(-1.0, 1.0)
        } else {
            //for LTR
            self.backgroundImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.changeLanguageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.userDetailsView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.paymentView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
    }
}
