//
//  HiCapWebView.h
//  HiCapacityPreview
//
//  Created by Michael Chinen on 12/03/01.
//  Copyright (c) 2012年 Michael T Chinen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
@interface HiCapWebView : WebView
{
    IBOutlet NSTextField *urlTextField;
}
- (IBAction)takeAndFormatStringURLFrom:(id)sender;
@end
