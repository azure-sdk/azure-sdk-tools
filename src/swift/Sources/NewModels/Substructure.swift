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
import SourceKittenFramework

class Substructure {
    var length: Int64 = -1
    var offset: Int64 = -1
    var diagnosticStage: String = ""
    var substructures = [Substructure]()
    var kind: String = ""
    var nameLength: Int64 = -1
    var nameOffset: Int64 = -1
    var bodyOffset: Int64 = -1
    var bodyLength: Int64 = -1
    var typeName: String = ""
    var accessibility: String = ""
    var name: String = ""

    init(from data: [String: SourceKitRepresentable]) {
        for (key, val) in data {
            switch key {
            case "key.diagnostic_stage":
                diagnosticStage = val as! String
            case "key.offset":
                offset = val as! Int64
            case "key.length":
                length = val as! Int64
            case "key.kind":
                kind = val as! String
            case "key.namelength":
                nameLength = val as! Int64
            case "key.nameoffset":
                nameOffset = val as! Int64
            case "key.bodyoffset":
                bodyOffset = val as! Int64
            case "key.bodylength":
                bodyLength = val as! Int64
            case "key.attributes":
                // TODO: Process this
                continue
            case "key.typename":
                typeName = val as! String
            case "key.accessibility":
                accessibility = val as! String
            case "key.name":
                name = val as! String
            case "key.substructure":
                let array = val as! [SourceKitRepresentable]
                for item in array {
                    let substructure = Substructure(from: item as! [String: SourceKitRepresentable])
                    substructures.append(substructure)
                }
            default:
                fatalError("Unrecognized key \(key)")
            }
        }
    }
}
