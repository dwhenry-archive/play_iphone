//
//  Wedding.m
//  WeddingGuest
//
//  Created by David Henry on 16/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Wedding.h"

@implementation Wedding
@synthesize weddingDetails;

+(NSArray *)build:(NSArray *)weddings 
{
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *details in weddings) {
        Wedding *instance = [[Wedding alloc] initWithDetails:details];
        [results addObject: instance];
    }
    return results;
}
-(id)initWithDetails:(NSDictionary *)details
{
    self.weddingDetails = details;
    return self;
}
-(NSString *)wedding
{
    return [self.weddingDetails objectForKey:@"wedding"];
}
-(NSString *)dateLabel
{
    return [NSString stringWithFormat:@"%@%@", @"On - ", [self.weddingDetails objectForKey:@"date"]];;
}
-(UIImage *)image
{
    return [self imageFromURLString:[weddingDetails objectForKey:@"image_path"]];
}
- (UIImage *)imageFromURLString:(NSString *)urlString 
{
    NSString *urlPath = [NSString stringWithFormat:@"%@/%@", @"http://localhost:3000", urlString];
    
    NSURL *url = [NSURL URLWithString:urlPath];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *result = [NSURLConnection sendSynchronousRequest:request          
                                           returningResponse:&response error:&error];
    //    [self handleError:error];
    UIImage *resultImage = [UIImage imageWithData:(NSData *)result];
    
    NSLog(@"urlString: %@",urlString);
    return resultImage;
}

@end
