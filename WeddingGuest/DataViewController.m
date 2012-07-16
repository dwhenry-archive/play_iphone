//
//  DataViewController.m
//  WeddingGuest
//
//  Created by David Henry on 15/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()
-(void)addButton:(NSDictionary*)details top:(int)top;
-(void)addNewWeddingButton:(int)top;
-(void)nothing;
@end

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = @"Upcoming Weddings"; //[self.dataObject description];

    NSArray *detailsArray = self.dataObject;
    
    int top = 60;
    for (NSDictionary *details in detailsArray) {
        [self addButton:details top:top];
        top = top + 50;
    }
    
    [self addNewWeddingButton:top];
}

-(void)addNewWeddingButton:(int)top 
{
    
}
-(void)addButton:(NSDictionary*)details top:(int)top
{

    CGRect  viewRect = CGRectMake(40, top, 240, 40);
    CGRect  weddingRect = CGRectMake(40, 0, 200, 20);
    CGRect  dateRect = CGRectMake(40, 20, 200, 20);

    UIView *view = [[UIView alloc] initWithFrame:viewRect];
    
    UILabel *weddingLabel = [[UILabel alloc] initWithFrame:weddingRect];
    weddingLabel.text = [details objectForKey:@"wedding"];
    [view addSubview:weddingLabel];

    UILabel *dateLabel = [[UILabel alloc] initWithFrame:dateRect];;
    dateLabel.text = [details objectForKey:@"date"];
    dateLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:dateLabel];


//    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://myurl/mypic.jpg"]];
    UIImage *myImage = [UIImage imageWithData: [details objectForKey:@"image"]];

    UIImageView *myImageView = [[UIImageView alloc] initWithImage:myImage];
    
    [myImageView setFrame:CGRectMake(0, 0, 40, 40)];
    
    [view addSubview:myImageView];

//    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://myurl/mypic.jpg"]];
//    cell.image = [UIImage imageWithData: imageData];
//    [imageData release];

    [self.view addSubview:view];
}
- (UIImage *)imageFromURLString:(NSString *)urlString 
{
    NSURL *url = [NSURL URLWithString:urlString];
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
// method that dos nothing.. :)
-(void)nothing
{
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
