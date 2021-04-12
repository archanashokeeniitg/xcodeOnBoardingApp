//
//  onboardingView.swift
//  OnboardingScreenEN
//
//  Created by Archana Shokeen on 4/11/21.
//  Copyright © 2021 Archana Shokeen. All rights reserved.
//

import SwiftUI

struct onboardingView: View {
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "first")),
        UIHostingController(rootView: Subview(imageString: "second")),
        UIHostingController(rootView: Subview(imageString: "third")),
        UIHostingController(rootView: Subview(imageString: "fourth")),
    ]
    
    var titles = ["Write Your Stories", "Get Your Cab" , "Get Your Ticket" , "News Update"]
    var Captions = ["Write letters, experiences and everything that comes on your mind at our platform", "Book cab at your comfort whenever you want, schedule or instantly at cheap prices", " Book shows near by your loactions includidg movies and theatres and much more","Always be updated with the trends"]
    
    @State var currentPageIndex = 0
    var body: some View {
        VStack{
            PageViewController(currentPageIndex: $currentPageIndex,  viewControllers: subviews)
        .frame(height: 600)
             Text( titles[currentPageIndex])
                .font(.title)
            Text(Captions[currentPageIndex])
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 300, height: 50, alignment: .leading)
                .lineLimit(nil)
            
            
        
            Button(action: {
                if self.currentPageIndex + 1 == self.subviews.count {
                    self.currentPageIndex = 0
                } else {
                    self.currentPageIndex += 1
                }
            }){
        
           ButtonContent()
        }
                    
        }
    }
}

struct ButtonContent: View {
    var body : some View{
    Image(systemName: "arrow.right")
               .resizable()
                   .foregroundColor(.white)
                       .frame(width : 30, height: 30)
                       .padding()
                       .background(Color.black)
                       .cornerRadius(30)
}
}


struct onboardingView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingView()
    }
}
