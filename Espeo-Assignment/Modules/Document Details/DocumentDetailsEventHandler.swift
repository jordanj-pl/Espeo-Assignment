//
//  DocumentDetailsEventHandler.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

protocol DocumentDetailsEventHandler : class {

   func viewLoaded()
   func photoLoaded()
   func didDismissError()
   
}
