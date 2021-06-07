struct Localization {
    
    var key: String
    var value: String
    
    var functionDefinition: String {
        #"""
        @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
        extension LocalizedStringKey {
            /// \#(functionComment)
            static func \#(functionName)(\#(functionParameters)) -> LocalizedStringKey {
                return "\#(localizedStringKey)"
            }
        }
        """#
    }
    
    var functionComment: String {
        return value.replacingOccurrences(of: "%lld", with: "`%lld`")
    }
    
    var functionName: String {
        return key.replacingOccurrences(of: "%lld", with: "lld")
    }
    
    var functionParameters: String {
        let count = key.components(separatedBy: "%lld").count - 1
        return (1...count).map({ index in "_ lld\(index): Int64" }).joined(separator: ",")
    }
    
    var localizedStringKey: String {
        var keyString = key
        var index = 1
        repeat {
            guard let range = keyString.range(of: "%lld") else {
                break
            }
            keyString.replaceSubrange(range, with: #"\(lld\#(index))"#)
            index += 1
        } while true
        return keyString
    }
}
