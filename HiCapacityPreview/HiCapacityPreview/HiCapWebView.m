//
//  HiCapWebView.m
//  HiCapacityPreview
//
//  Created by Michael Chinen on 12/03/01.
//  Copyright (c) 2012年 Michael T Chinen. All rights reserved.
//

#import "HiCapWebView.h"

@implementation HiCapWebView
- (void)awakeFromNib
{
// Add any code here that needs to be executed once the windowController has loaded the document's window.
[self setFrameLoadDelegate:self];

}
- (IBAction)takeAndFormatStringURLFrom:(id)sender
{
   NSString* s= [sender stringValue];
   
   //if it doesn't contain :// append http://
   if( [s rangeOfString:@"://" options:NSCaseInsensitiveSearch].location == NSNotFound)
   {
      //if they entered a period at some point it probably is a url, otherwise do a google search
      //the exception is if they have a period and  space it probably is a google search.
      if( [s rangeOfString:@"." options:NSCaseInsensitiveSearch].location == NSNotFound ||
         [s rangeOfString:@" " options:NSCaseInsensitiveSearch].location != NSNotFound )
      {
         //convert to http compatable string ( space -> %20 ) etc
         s = [s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
         s = [NSString stringWithFormat:@"https://ssl.scroogle.org/cgi-bin/nbbwssl.cgi?Gw=%@",s];
      }
      else
      {
         s = [NSString stringWithFormat:@"http://%@",s];
      }
      [sender setStringValue:s];
   }
   
   [self takeStringURLFrom:sender];
}

- (void)webView:(WebView *)sender 
		didStartProvisionalLoadForFrame:
		(WebFrame *)frame

{
    // Only report feedback for the main frame.
    if (frame == [sender mainFrame]){
        NSString *url = [[[
			  [frame provisionalDataSource] 
			  request] URL] absoluteString];
        
	[urlTextField setStringValue:url];
    }
    
}

//end progress
- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{ 
}



@end
