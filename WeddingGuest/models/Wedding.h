//
//  Wedding.h
//  WeddingGuest
//
//  Created by David Henry on 16/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wedding : NSObject
+(NSArray *)build:(NSArray *)weddings;
-(id)initWithDetails:(NSDictionary *)details;
-(NSString *)wedding;
-(NSString *)dateLabel;
-(UIImage *)image;

@property NSDictionary *weddingDetails;

@end
