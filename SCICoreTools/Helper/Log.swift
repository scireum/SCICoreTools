public struct Log {
    /**
     Logs the messages to the console with extra informations (filename, function and line number) on DEBUG mode
    */
    public static func debug(message: String, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        #if DEBUG
        let className = (fileName as NSString).lastPathComponent
        print("\(message) -> File: \(className), Function: \(functionName), Line: \(lineNumber)")
        #endif
    }
}
