//
//  ViewController.m
//  D32MacOSXServer
//
//  Created by Rommel Rico on 2/10/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "ViewController.h"

#define MY_SERVICE_TYPE @"_http._tcp."
#define MY_SERVICE_NAME @"com.rommelrico.myservice"
#define MY_SERVICE_PORT 50123

@interface ViewController () <NSNetServiceDelegate>

@property NSNetService *myService;

@property (weak) IBOutlet NSTextField *myServerStatusLabel;
@property (unsafe_unretained) IBOutlet NSTextView *myTextView;

@end

@implementation ViewController

- (IBAction)doClearButton:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myService = [[NSNetService alloc] initWithDomain:@"" type:MY_SERVICE_TYPE name:MY_SERVICE_NAME port:MY_SERVICE_PORT];
    self.myService.delegate = self;
    [self.myService publish];
}

-(void)netServiceDidPublish:(NSNetService *)sender {
    self.myServerStatusLabel.stringValue = @"Service did publish";
}

-(void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    self.myServerStatusLabel.stringValue = @"Service did not publish";
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
