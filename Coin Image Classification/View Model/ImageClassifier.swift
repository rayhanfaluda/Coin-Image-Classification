//
//  ImageClassifier.swift
//  Coin Image Classification
//
//  Created by Rayhan Faluda on 24/02/22.
//

import SwiftUI
import SwiftyJSON

class ImageClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    let path = Bundle.main.path(forResource: "cat_to_name", ofType: "json")!
    
    var imageClass: String? {
        let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let json = JSON(parseJSON: jsonString!)
        return json["\(classifier.results ?? "0")"].stringValue
    }
    
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
