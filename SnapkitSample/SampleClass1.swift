//
//  SampleClass1.swift
//  SnapkitSample
//
//  Created by Naren on 06/04/18.
//  Copyright © 2018 naren. All rights reserved.
//

import Foundation
import UIKit

public protocol A {
  func test()
}

protocol B : A {
  
}

class Sample {
  
  func test1(){
    
  }
  
  open func privateFuncTest(){
    
  }
}

class Sample2: Sample {
  var sample = C()
  
  override func test1() {
    let c = sample.sample2
  }
  
  override func privateFuncTest() {
    
  }
}


class C {
  init() {

  }
  private var sample1 = 0
  var sample2 = 0
}

