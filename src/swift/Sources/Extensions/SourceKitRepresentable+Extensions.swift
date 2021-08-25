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

enum SourceKitKey: String {
    case kind = "key.kind"
    case name = "key.name"
    case typeName = "key.typename"
    case accessibility = "key.accessibility"
    case attributes = "key.attributes"
    case substructure = "key.substructure"
    case nameOffset = "key.nameoffset"
    case nameLength = "key.namelength"
    case bodyOffset = "key.bodyoffset"
    case bodyLength = "key.bodylength"
    case offset = "key.offset"
    case length = "key.length"
}

extension Dictionary where Key == String, Value == SourceKitRepresentable {
    var kind: String? {
        return value(forKey: .kind) as? String
    }

    var substructure: [[String: SourceKitRepresentable]]? {
        return value(forKey: .substructure) as? [[String: SourceKitRepresentable]]
    }

    var accessibility: String? {
        return value(forKey: .accessibility) as? String
    }

    var name: String? {
        return value(forKey: .name) as? String
    }

    var attributes: [SourceKitRepresentable]? {
        return value(forKey: .attributes) as? [SourceKitRepresentable]
    }

    func value(forKey: SourceKitKey) -> SourceKitRepresentable? {
        for (key, val) in self {
            if key == forKey.rawValue {
                return val
            }
        }
        return nil
    }

    func processChildren() -> [APIViewConvertible] {
        var children = [APIViewConvertible]()
        guard let substructures = substructure else { return children }
        for structure in substructures {
            guard let kind = structure.kind else { fatalError("Expected kind but didn't find one") }
            switch kind {
            case "source.lang.swift.decl.class":
                children.append(ClassModel(from: structure))
            case "source.lang.swift.decl.struct":
                let test = "best"
            case "source.lang.swift.decl.protocol":
                let test = "best"
            case "source.lang.swift.decl.extension":
                let test = "best"
            case "source.lang.swift.decl.enum":
                children.append(EnumModel(from: structure))
            case "source.lang.swift.decl.var.instance":
                children.append(VariableModel(from: structure))
            case "source.lang.swift.decl.function.method.instance",
                 "source.lang.swift.decl.function.method.static",
                 "source.lange.swift.decl.function.free":
                children.append(FunctionModel(from: structure))
            case "source.lang.swift.decl.function.subscript":
                let test = "best"
            case "source.lang.swift.decl.typealias":
                let test = "best"
            case "source.lang.swift.decl.enumcase":
                guard structure.substructure!.count == 1 else { fatalError("Unexpectedly found more than one bundle of enum cases") }
                children.append(EnumCaseModel(from: structure.substructure![0]))
            case "source.lang.swift.decl.var.parameter":
                children.append(ParameterModel(from: structure))
            case "source.lang.swift.decl.generic_type_param":
                let test = "best"
            case "source.lang.swift.expr.call",
                 "source.lang.swift.syntaxtype.comment.mark":
                continue
            default:
                SharedLogger.warn("Unsupported kind: \(kind)")
            }
        }
        return children
    }

    // TODO: Implement attributes
    func processAttributes() -> [APIViewConvertible] {
        var values = [APIViewConvertible]()
        guard let attributes = self.attributes else { return values }
        for attribute in attributes {
            switch attribute {
            default:
                continue
                // SharedLogger.warn("Unsupported attribute: \(attribute)")
            }
        }
        return values
    }

}
