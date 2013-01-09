//
//  Verb.h
//  IrregularVerbs
//
//  Created by Rafa Barberá Córdoba on 08/01/13.
//  Copyright (c) 2013 Oswaldo Rubio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verb : NSObject<NSCoding>

@property (nonatomic,strong) NSString *simple;
@property (nonatomic,strong) NSString *past;
@property (nonatomic,strong) NSString *participle;
@property (nonatomic,strong) NSString *translation;

@property (nonatomic) BOOL failed;
@property (nonatomic) float responseTime;
@property (nonatomic) float frequency;

-(id)initFromDictionary:(NSDictionary *)dictonary;
-(void)addNewResponseTime:(float)rt;
@end
