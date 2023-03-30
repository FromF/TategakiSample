//
//  ContentView.swift
//  TategakiSample
//
//  Created by 藤治仁 on 2023/03/30.
//

import SwiftUI

struct ContentView: View {
    @State var inputText = ""
    @State var tokenTable: [[String]] = []
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .top) {
                ForEach(tokenTable.reversed(), id:\.self) { token in
                    VStack {
                        ForEach(token, id:\.self) { text in
                            Text(text)
                        }
                    }
                }
            }
            .padding()
            .border(Color.green, width: 4)
            Divider()
            TextEditor(text: $inputText)
                .frame(height: 50)
                .border(Color.green, width: 1)
                .onChange(of: inputText, perform: { inputText in
                    tokenTable = []
                    let lines = inputText.chunked(into: 10)
                    for line in lines {
                        var token: [String] = []
                        for char in line[line.startIndex ..< line.endIndex] {
                            token.append(String(char))
                        }
                        tokenTable.append(token)
                    }
                })

            Spacer()
        }
        .padding()
        .onAppear {
            inputText = "もちろん当時に相違顔はよくその病気なたでもを思ってならでがは注文入っでたが、始終にもあるたでないべき。頭をするないのはけっして今からしかるにましましでしょ。"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
