# SafeLocalizedStringKey

**Convert your `Localizable.strings`:**
```
"pushed_%lld_commits" = "Pushed %lld commits";
```

**Into `LocalizedStringKey` extension:**
```swift
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension LocalizedStringKey {
    /// Pushed `%lld` commits
    static func pushed_lld_commits(_ lld1: Int64) -> LocalizedStringKey {
        return "pushed_\(lld1)_commits"
    }
}
```

**And use it with the implicit member syntax:**
```swift
Text(.pushed_lld_commits(3))
```

**Without losing built-in features powered by SwiftUI:**
```
"%@_ago" = "%@ ago";
```
```swift
Text(.at_ago(.date(date, style: .relative)))
    .environment(\.locale, Locale(identifier: "ko"))
```
