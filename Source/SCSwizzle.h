//
//  SCSwizzle.h
//  iScribd
//
//  Created by Jesse Andersen on 9/26/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <Foundation/Foundation.h>

void MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL);
