//
//  ResultList.swift
//  Clicker
//
//  Created by Ruben Granet on 03/08/2022.
//

import SwiftUI

struct ResultListView: View {
    let listResult:[GameResult]
    var body: some View {
        VStack{
            List(listResult){(gameresult:GameResult) in
                HStack{
                    Image(systemName: "flag.filled.and.flag.crossed")
                    Text(gameresult.nickname)
                    Image(systemName: "minus")
                    Text(String(gameresult.score))
                    Image(systemName: "flag.and.flag.filled.crossed")
                    
                }
            }
        }
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(listResult: [GameResult(nickname: "Ruben", score: 12), GameResult(nickname: "Elodie", score: 28)])
            .previewLayout(.sizeThatFits)
    }
}
