//
//  Copyright © 2023 Iterable. All rights reserved.
//

import Foundation

class EmptyEmbeddedMessagingManager: IterableEmbeddedMessagingManagerProtocol {
    func addUpdateListener(_ listener: IterableEmbeddedMessagingUpdateDelegate) {
        
    }
    
    func removeUpdateListener(_ listener: IterableEmbeddedMessagingUpdateDelegate) {
        
    }
    
    func getMessages() -> [IterableEmbeddedMessage] {
        return []
    }
    
    func start() {
        
    }
}
