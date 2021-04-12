//
//  Subview.swift
//  OnboardingScreenEN
//
//  Created by Archana Shokeen on 4/11/21.
//  Copyright © 2021 Archana Shokeen. All rights reserved.
//

import SwiftUI

struct Subview: View {
    var imageString: String
    
    var body: some View {
        Image(imageString)
        .resizable()
            .aspectRatio(contentMode: .fill)
        .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "first")
    }
}
