//
//  MovieDetail.swift
//  SimpleCrud
//
//  Created by Tenzin wangyal on 7/8/22.
//

import SwiftUI

struct MovieDetail: View {
    
    let coreDM: CoreDataManager
    let movie: Movie
    @Binding var needsRefresh: Bool
    @State private var movieName: String = ""

    var body: some View {
        VStack{
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(.roundedBorder)
            Button("Update"){
                if !movieName.isEmpty{
                    movie.title  = movieName
                    coreDM.updateMovie()
                    needsRefresh.toggle()
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(coreDM: CoreDataManager(), movie: Movie(), needsRefresh: .constant(false) )
    }
}
