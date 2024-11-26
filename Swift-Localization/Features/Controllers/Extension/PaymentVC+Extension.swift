//
//  PaymentVC+Extension.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 26/11/24.
//

import UIKit

extension PaymentViewController {
    
    ///
    /// The func is `setupStyle` which will setup Style of the UI
    ///  A PaymentViewController's `setupStyle` method
    ///
    func setupStyle() {
        // setup UI
        self.setComponentRoundStyle()
        // init Font
        self.setComponentFontStyle()
        // init color
        self.setComponentColorStyle()
        // init Text
        self.setLocalizationText()
        self.setComponentsDirection()
    }
    ///
    /// The func is `setComponentRoundStyle` which is used to setup initial UI
    ///  A PaymentViewController's `setComponentRoundStyle` method
    ///
    fileprivate func setComponentRoundStyle() {
        self.paymentView.cornerRadius(radius: 20)
        self.bankBgBlurView.cornerRadius(radius: 20)
        self.changeLanguageBgBlurView.cornerRadius(radius: self.changeLanguageBgBlurView.frame.height / 2)
    }
    ///
    /// The func is `setComponentFontStyle` which is used to set Font
    ///  A PaymentViewController's `setComponentFontStyle` method
    ///
    fileprivate func setComponentFontStyle() {
        self.nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        self.priceLabel.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        self.payLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        self.applePayTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.applePayDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.bankTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.bankDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    ///
    /// The func is `setComponentColorStyle` which is used to set Color
    ///  A PaymentViewController's `setComponentColorStyle` method
    ///
    fileprivate func setComponentColorStyle() {
        self.userDetailsView.backgroundColor = .clear
        self.nameLabel.textColor = .appWhite
        self.priceLabel.textColor = .appWhite
        self.payLabel.textColor = .appWhite
        self.paymentView.backgroundColor = .clear
        self.applePayTitleLabel.textColor = .appWhiteWith80Opacity
        self.applePayDescriptionLabel.textColor = .appWhiteWith80Opacity
        self.bankTitleLabel.textColor = .appWhiteWith80Opacity
        self.bankDescriptionLabel.textColor = .appWhiteWith80Opacity
        self.seperatorView.backgroundColor = .gray
        self.applePayImageView.tintColor = .appWhiteWith80Opacity
        self.bankImageView.tintColor = .appWhiteWith80Opacity
        self.changeLanguageButton.tintColor = .appWhite
    }
    ///
    /// The func is `setLocalizationText` which is used to set Text
    ///  A PaymentViewController's `setLocalizationText` method
    ///
    func setLocalizationText() {
        self.nameLabel.text = StringConstants.johnDoe.localized()
        self.priceLabel.text = StringConstants.USD.localized()
        self.payLabel.text = StringConstants.pay.localized()
        self.applePayTitleLabel.text = StringConstants.paywithApplePay.localized()
        self.applePayDescriptionLabel.text = StringConstants.loginAndPayDirectlyFromYourAppleWallet.localized()
        self.bankTitleLabel.text = StringConstants.bankTransfer.localized()
        self.bankDescriptionLabel.text = StringConstants.youCanPayFromYourBankAccount.localized()
    }
}
