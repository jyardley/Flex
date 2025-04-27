//
//  RecipeDetail.swift
//  Recipe_Flex_App
//
//  Created by Jeff Yardley on 4/25/25.
//

import Foundation
import SwiftUI
import WebKit

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Cuisine: \(recipe.cuisine)")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                AsyncImage(url: URL(string: "\(String(describing: recipe.photo_url_large))"))
                    .padding()
                Text("~~ The Recipe ~~")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                if recipe.source_url != nil {
                    WebView(url: recipe.source_url!)
                        .frame(height: 600)
                        .padding()
                        .padding()
                } else {
                    Text("Sorry! Recipe Page Not Found!")
                }
                Text("~~ HOW-TO Video ~~")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                if recipe.youtube_url != nil {
                    WebView(url: recipe.youtube_url!)
                        .frame(height: 600)
                        .padding()
                } else {
                    Text("Sorry! Recipe Video Not Found!")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        let request: URLRequest? = URLRequest(url: url)
        if let request = request {
        wkwebView.load(request)
        } else {
            print("URL Cannot be loaded.")
        }
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
