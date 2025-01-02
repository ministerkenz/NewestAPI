//
//  WebViewContainer.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState : ViewState
    @Binding var articleURL: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), articleURL: .constant(" "))
}
