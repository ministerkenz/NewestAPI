//
//  ContentView.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/17/24.
//

import SwiftUI

enum ViewState {
    case articleList, WebView
}

struct ContentView: View {
    @State var viewState: ViewState = .articleList
    @State var articleURL: String = " "
    
    
    var body: some View {
        if viewState == .articleList {
            ArticleListView(viewState: $viewState)
        } else {
            WebViewContainer(viewState: $viewState, articleURL: $articleURL)
        }
        
        }
        
    }


#Preview {
    ContentView()
}
