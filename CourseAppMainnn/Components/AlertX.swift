//
//  AlertX.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation
import SwiftUI
import AlertX


struct CustomAlertX: View {
    
    var title: String = ""
    var message: String = ""
    
    var body: some View {
        
       return AlertX(title: Text(title), message: Text(message), primaryButton: .default(Text("OK")), secondaryButton: .cancel(Text("Cancel")), theme: .custom(windowColor: .bg, alertTextColor: .white, enableShadow: false, enableRoundedCorners: true, enableTransparency: false, cancelButtonColor: .button, cancelButtonTextColor: .white, defaultButtonColor: .black, defaultButtonTextColor: .white, roundedCornerRadius: 20), animation: .classicEffect())
        
        
        
    }
}

#Preview {
    CustomAlertX()
}



