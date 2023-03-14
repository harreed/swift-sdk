//
//  Copyright © 2023 Iterable. All rights reserved.
//

import Foundation

@objc public protocol IterableEmbeddedMessagingManagerProtocol {
    func start()
    
    func getMessages() -> [IterableEmbeddedMessage]
    
    func addUpdateListener(_ listener: IterableEmbeddedMessagingUpdateDelegate)
    func removeUpdateListener(_ listener: IterableEmbeddedMessagingUpdateDelegate)
}
