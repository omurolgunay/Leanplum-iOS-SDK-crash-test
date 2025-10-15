//
//  Logging.swift
//  LeanplumSDK
//
//  Created by Nikola Zagorchev on 23.12.21.
//  Copyright (c) 2021 Leanplum, Inc. All rights reserved.

/**
 * Swift equivalent of the LPLog C function
 */
enum Log {
    static func info(_ msg: String) {
        let escaped = msg.replacingOccurrences(of: "%", with: "%%")
        LPLogv(.info, escaped, getVaList([]))
    }
    
    static func debug(_ msg: String) {
        let escaped = msg.replacingOccurrences(of: "%", with: "%%")
        LPLogv(.debug, escaped, getVaList([]))
    }
    
    static func error(_ msg: String) {
        let escaped = msg.replacingOccurrences(of: "%", with: "%%")
        LPLogv(.error, escaped, getVaList([]))
    }
}
