//
//  SpashScreen.swift
//  Recipe_Flex_App
//
//  Created by Jeff Yardley on 4/22/25.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MainMenuView() //Goes to main ticket list
        } else {
            VStack {
                Text("The Recipe App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text("Coded by Jeff Yardley")
                    .font(.none)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

