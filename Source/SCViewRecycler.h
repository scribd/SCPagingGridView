//
//  SCViewRecycler.h
//  iScribd
//
//  Created by Jesse Andersen on 9/26/12.
//  Copyright (c) 2012 Scribd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCViewRecycler : NSObject

- (id)initWithViewClass:(Class)klass;
- (id)generateView;
- (void)clearCache;

@end
