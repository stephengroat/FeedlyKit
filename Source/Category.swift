//
//  Category.swift
//  MusicFav
//
//  Created by Hiroki Kumamoto on 1/10/15.
//  Copyright (c) 2015 Hiroki Kumamoto. All rights reserved.
//

import SwiftyJSON

public final class Category: Equatable, Hashable,
                             ResponseObjectSerializable, ResponseCollectionSerializable,
                             ParameterEncodable {
    public let id:    String
    public let label: String

    public class func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> [Category] {
        let json = JSON(representation)
        return json.arrayValue.map({ Category(json: $0) })
    }

    required public convenience init?(response: NSHTTPURLResponse, representation: AnyObject) {
        let json = JSON(representation)
        self.init(json: json)
    }

    init(json: JSON) {
        id    = json["id"].stringValue
        label = json["label"].stringValue
    }

    public var hashValue: Int {
        get { return id.hashValue }
    }

    func toParameters() -> [String : AnyObject] {
        return ["id": id, "label": label]
    }
}

public func ==(lhs: Category, rhs: Category) -> Bool {
    return lhs.id == rhs.id
}


