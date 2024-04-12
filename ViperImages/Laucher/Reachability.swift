//
//  Reachability.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 12/04/24.
//

import Foundation
import SystemConfiguration
import Network
import UIKit

public class Reachability {
    
    static let shared = Reachability()
    
    private init() { }
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
}

class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private var isMonitoring = false
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    private init() {}
    
    func startMonitoring() {
        guard !isMonitoring else { return }
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Internet connected")
                NotificationCenter.default.post(name: .networkStatusDidChange, object: nil, userInfo: ["isConnected": true])
            } else {
                print("There is no Internet conection")
                NotificationCenter.default.post(name: .networkStatusDidChange, object: nil, userInfo: ["isConnected": false])
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        isMonitoring = true
    }
    
    func stopMonitoring() {
        guard isMonitoring else { return }
        monitor.cancel()
        isMonitoring = false
    }
}

extension UIViewController {
    func isConnectedToNetwork() -> Bool {
        return NetworkMonitor.shared.isConnected
    }
}

extension Notification.Name {
    static let networkStatusDidChange = Notification.Name("NetworkStatusDidChange")
}
