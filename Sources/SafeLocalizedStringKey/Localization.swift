import Swift

struct File {
    
    var functions: [Function]
    
    var content: String {
        #"""
        import SwiftUI
        
        @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
        extension LocalizedStringKey {
        \#(
            functions
                .map(\.content)
                .joined(separator: "\n")
                .split(separator: "\n")
                .map({ "\t" + $0 })
                .joined(separator: "\n")
        )
        }
        """#
    }
}

struct Function {
    
    var localization: Localization
    
    var content: String {
        #"""
        /// \#(comment)
        static func \#(name)(\#(parameters)) -> LocalizedStringKey {
            return "\#(localizedStringKey)"
        }
        """#
    }
    
    var comment: String {
        return localization.value.replacingOccurrences(of: "%lld", with: "`%lld`")
    }
    
    var name: String {
        return localization.key.replacingOccurrences(of: "%lld", with: "lld")
    }
    
    var parameters: String {
        let count = localization.key.components(separatedBy: "%lld").count - 1
        return (0..<count).map({ index in "_ lld\(index + 1): Int64" }).joined(separator: ",")
    }
    
    var localizedStringKey: String {
        var key = localization.key
        var index = 1
        repeat {
            guard let range = key.range(of: "%lld") else {
                break
            }
            key.replaceSubrange(range, with: #"\(lld\#(index))"#)
            index += 1
        } while true
        return key
    }
}

struct Localization {
    
    var key: String
    var value: String
}
