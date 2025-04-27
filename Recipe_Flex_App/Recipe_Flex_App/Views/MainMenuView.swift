//
//  MainMenuView.swift
//  Recipe_Flex_App
//
//  Created by Jeff Yardley on 4/22/25.
//

import SwiftUI

let validDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
let corruptedDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
let emptyDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"

//Make sure we know if the data is loaded or not
var isLoaded: Bool      = false

struct MainMenuView: View {
    @State private var recipeList = RecipeList(recipes: [])
    @State private var dataCorrupted: Bool = false
    @State private var noData: Bool = false
    
    var body: some View {
        if dataCorrupted || noData {
            if dataCorrupted {
                Text("Error: Data Corrupted.")
                Button("Refresh") {
                    isLoaded = false
                    loadData()
                }
            }
            if noData {
                Text("No Recipes Available")
                Button("Refresh") {
                    isLoaded = false
                    loadData()
                }
            }
        } else if noData && dataCorrupted {
            Text("There is an Unknown Error.")
            Button("Refresh") {
                isLoaded = false
                loadData()
            }
        } else if !noData || !dataCorrupted {
            Button("Refresh List") {
                isLoaded = false
                loadData()
            }
            NavigationView{
                if !recipeList.recipes.isEmpty {
                    List(recipeList.recipes) { recipe in
                        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                            VStack() {
                                AsyncImage(url: recipe.photo_url_small!)
                                Text(recipe.name)
                                    .font(.headline)
                                Text(recipe.cuisine)
                                    .font(.footnote)
                            }
                        }
                    }
                    .navigationBarTitle("Recipe List")
                }
                
            }.onAppear(perform: loadData)
        }
    }
    
}





extension MainMenuView {
    func loadData() {
        if isLoaded {
            return
        }
        
        print("Loading Data...")
        guard let url = URL(string: "\(validDataURL)") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
                noData = true
                return
            }
            
            guard data != nil
                else {
                print("No data returned.")
                noData = true
                return
            }
            
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON Response: \(jsonString)")
                }
            }
            
            do {
                let responseObj = try JSONDecoder().decode(RecipeList.self, from: data!)
                DispatchQueue.main.async {
                    self.recipeList = responseObj
                    print("Successfully decoded RecipeList: \(responseObj)")
                    if self.recipeList.recipes.isEmpty {
                       noData = true
                    }
                    isLoaded = true
                } 
            } catch let decodingError as DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    print("Key '\(key)' not found:", context.debugDescription)
                    dataCorrupted = true
                case .typeMismatch(let type, let context):
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    dataCorrupted = true
                case .valueNotFound(let type, let context):
                    print("Value '\(type)' not found:", context.debugDescription)
                    dataCorrupted = true
                case .dataCorrupted(let context):
                    print("Data corrupted:", context.debugDescription)
                    dataCorrupted = true
                @unknown default:
                    print("Unknown error")
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                dataCorrupted = true
            }
            
        }.resume()
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

