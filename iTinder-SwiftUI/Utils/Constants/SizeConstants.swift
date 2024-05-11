//
//  SizeConstants.swift
//  iTinder-SwiftUI
//
//  Created by Khondakar Afridi on 18/4/24.
//

import Foundation
import SwiftUI

struct SizeConstants{
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutOff: CGFloat{
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}
