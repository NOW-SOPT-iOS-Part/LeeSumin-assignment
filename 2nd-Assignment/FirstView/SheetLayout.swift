//
//  SheetViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/17/24.
//

import UIKit

func setSheetLayout(for viewController: UIViewController) {
    viewController.modalPresentationStyle = .pageSheet
    
    let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
    let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0

        return UIScreen.main.bounds.height * 0.5 - safeAreaBottom
    }
    
    if let sheet = viewController.sheetPresentationController {
        sheet.detents = [customDetent]
        sheet.prefersGrabberVisible = true
    }
}

