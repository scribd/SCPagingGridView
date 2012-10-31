//
//  SCSwizzle.m
//  iScribd
//
//  Created by Jesse Andersen on 9/26/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import "SCSwizzle.h"
#import </usr/include/objc/objc-class.h>

void MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod = class_getInstanceMethod(c, overrideSEL);
    if(class_addMethod(c, origSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(c, overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}
