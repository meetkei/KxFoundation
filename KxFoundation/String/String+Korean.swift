//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

public extension String {
    var koreanUnicodeRange: (Int, Int) {
        return (0xAC00, 0xD7AF)
    }
    
    func chosungOfChar(at index: Int = 0) -> String? {
        guard utf16.count > 0 && index >= 0 && index < utf16.count else { return nil }
        
        let chosungList = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        
        let utf16index = utf16.index(utf16.startIndex, offsetBy: index)
        let code = utf16[utf16index]
        
        if code >= UInt16(koreanUnicodeRange.0) && code <= UInt16(koreanUnicodeRange.1) {
            let unicode = code - UInt16(koreanUnicodeRange.0)
            let chosungIndex = Int(unicode / 21 / 28)
            return chosungList[chosungIndex]
        }
        
        return nil
    }
}
