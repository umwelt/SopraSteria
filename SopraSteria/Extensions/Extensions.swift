//
//  Extensions.swift
//  SopraSteria
//
//  Created by BMGH SRL on 16/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import Foundation


public func Init<Type>(with value : Type, block: (_ object: Type) -> Void) -> Type
{
    block(value)
    return value
}
