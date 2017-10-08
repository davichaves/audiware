//
//  RecordedAudio.swift
//  Audiware
//
//  Created by Davi Rodrigues Chaves on 2/10/16.
//  Copyright © 2016 davichaves. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var filePathUrl: URL!
    var title: String!
    
    init(_filePathUrl: URL, _title: String) {
        filePathUrl = _filePathUrl;
        title = _title;
    }
}
