import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension LocalizedStringKey {
    
    init<T: _FormatSpecifiable>(_ key: String, arguments: T...) {
        var stringInterpolation = StringInterpolation(literalCapacity: 1, interpolationCount: arguments.count)
        stringInterpolation.appendLiteral(key)
        for argument in arguments {
            stringInterpolation.appendInterpolation(argument, specifier: "")
        }
        self.init(stringInterpolation: stringInterpolation)
    }
}

extension String: _FormatSpecifiable {
    
    public typealias _Arg = String
    
    public var _arg: _Arg { self }
    
    public var _specifier: String { "%@" }
}
