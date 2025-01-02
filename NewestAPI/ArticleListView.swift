//
//  ArticleListView.swift
//  NewAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var viewState: ViewState
    @State var data = FetchData()
    
    var body: some View {
        ScrollView{
            ForEach(data.response.abilities){ abilites in
                VStack {
                    AsyncImage(url){
                        phase in
                        switch phase {
                        case.empty:
                            ProgressView()
                                .frame(height: 150)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:150)
                        case .failure(_):
                            Image("fnf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                    
                }
                
                
            }
            .task {
                await data.getData()
            }
        }
    }
}
#Preview {
    ArticleListView(viewState: .constant(.articleList))
}
