// --------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the ""Software""), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// --------------------------------------------------------------------------

import Foundation

enum Accessibility: String {

    case `public` = "public"
    case `open` = "open"
    case `internal` = "internal"
    case `private` = "private"
    case `fileprivate` = "fileprivate"

    init?(rawValue value: String) {
        switch value {
        case "public", "source.lang.swift.accessibility.public":
            self = .public
        case "open", "source.lang.swift.accessibility.open":
            self = .open
        case "internal", "source.lang.swift.accessibility.internal":
            self = .internal
        case "private", "source.lang.swift.accessibility.private":
            self = .private
        case "fileprivate", "source.lang.swift.accessibility.fileprivate":
            self = .fileprivate
        default:
            return nil
        }
    }
}
