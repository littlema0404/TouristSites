//
//  Kingfisher+Wrapper.swift
//  TouristSites
//
//  Created by littlema on 2019/10/30.
//  Copyright © 2019 littema. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    static let kfSemaphore = DispatchSemaphore(value: 10)
    
    func loadFrom(url: String) {
        guard let realUrl = URL(string: url) else { return }
        
        if UIImageView.kfSemaphore.wait(timeout: .distantFuture) == .success {
            self.kf.setImage(with: realUrl)
            UIImageView.kfSemaphore.signal()
        }
    }
}
