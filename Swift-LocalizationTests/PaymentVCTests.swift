//
//  PaymentVCTests.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 29/11/24.
//

import XCTest
@testable import Swift_Localization

class PaymentVCTests: XCTestCase {

    var paymentVC: PaymentViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        paymentVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? PaymentViewController
        paymentVC.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        paymentVC = nil
    }

    func testPayment_WhenCreated_HasOutletsAreConnected() throws {
        // Arrange
        
        // Change Language
        _ = try XCTUnwrap(paymentVC.changeLanguageView, "changeLanguageView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.changeLanguageBgBlurView, "changeLanguageBgBlurView does not have a referencing outlet")
        // UserDetail
        _ = try XCTUnwrap(paymentVC.backgroundImageView, "backgroundImageView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.userDetailsView, "userDetailsView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.payLabel, "payLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.priceLabel, "priceLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.nameLabel, "nameLabel does not have a referencing outlet")
        // Payment View - Apple Pay
        _ = try XCTUnwrap(paymentVC.paymentView, "paymentView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.applePayImageView, "applePayImageView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.applePayTitleLabel, "applePayTitleLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.applePayDescriptionLabel, "applePayDescriptionLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.seperatorView, "seperatorView does not have a referencing outlet")
        // Payment View - Bank Transfer
        _ = try XCTUnwrap(paymentVC.bankImageView, "bankImageView does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.bankTitleLabel, "bankTitleLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.bankDescriptionLabel, "bankDescriptionLabel does not have a referencing outlet")
        _ = try XCTUnwrap(paymentVC.bankBgBlurView, "bankBgBlurView does not have a referencing outlet")
    }
    
    func testPayment_WhenCreated_HasChangeLanguageButtonAndAction() throws {
        // Arrange
        let changeLanguageButton: UIButton = try XCTUnwrap(paymentVC.changeLanguageButton, "Change Language button does not have a referencing outlet")

        // Act
        let changeLanguageButtonActions = try XCTUnwrap(changeLanguageButton.actions(forTarget: paymentVC, forControlEvent: .touchUpInside), "Change Language button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(changeLanguageButtonActions.count, 1)
        XCTAssertEqual(changeLanguageButtonActions.first, "showLanguageOptionsSheet:", "There is no action with a name showLanguageOptionsSheet assigned to Change Language button")
    }
    
    func testPayment_ShowLanguageOptionsSheet_languageTitles() {
        // Arrange
        PreferenceManager.shared.appLanguage = Language.english.code // Mock current language
        
        // Act
        paymentVC.showLanguageOptionsSheet(self)
        
        // Assert
        let alertController = paymentVC.presentedViewController as? UIAlertController
        let languageNames = [
            StringConstants.tickMark + Language.english.name,
            Language.arabic.name,
            Language.spanish.name,
            Language.french.name,
            Language.chinese.name
        ]
        
        for (index, action) in alertController?.actions.enumerated() ?? [].enumerated() {
            if index < 5 { // Skip dismiss action
                XCTAssertEqual(action.title, languageNames[index])
            }
        }
    }
    
    func testPayment_ChangeAppLanguageUpdatesLanguageCode() {
        // Arrange
        let mockLanguage = Language.arabic // Mock current language
        
        // Act
        paymentVC.changeAppLanguage(language: mockLanguage)
        
        // Assert
        XCTAssertEqual(PreferenceManager.shared.appLanguage, mockLanguage.code)
    }
    
    func testPayment_ChangeAppLanguagePersistsLanguageCode() {
        // Arrange
        let mockLanguage = Language.english // Mock current language
        
        // Act
        paymentVC.changeAppLanguage(language: mockLanguage)
        
        // Assert
        let savedLanguageCode = PreferenceManager.shared.appLanguage
        XCTAssertEqual(savedLanguageCode, mockLanguage.code)
    }
}
