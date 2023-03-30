//
//  String+Extension.swift
//  TategakiSample
//
//  Created by 藤治仁 on 2023/03/30.
//

import Foundation

extension String {
    /// 文字を分割して配列として返す
    /// - Parameter size: 分割する文字数
    /// - Returns: 分割後の文字列の配列
    func chunked(into size: Int) -> [String] {
        var result: [String] = []
        var chunk = ""
        
        for (index, char) in self.enumerated() {
            if index % size == 0 && index != 0 {
                result.append(chunk)
                chunk = ""
            }
            chunk.append(char)
        }
        result.append(chunk)
        
        return result
    }
}
