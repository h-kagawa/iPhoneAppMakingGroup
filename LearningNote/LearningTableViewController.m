//
//  LearningTableViewController.m
//  LearningNote
//
//  Created by 香川 浩之 on 2013/02/16.
//  Copyright (c) 2013年 香川 浩之. All rights reserved.
//

#import "LearningTableViewController.h"

@interface LearningTableViewController ()

@end

@implementation LearningTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *urlString = @"http://www.google.com/search?&q=";
    switch (indexPath.section * 10 + indexPath.row) {
        case 0:
            urlString = @"http://www.raywenderlich.com";
            break;
            
        case 1:
            urlString = @"https://developer.apple.com/jp/devcenter/ios/library/japanese.html";
            break;

        case 2:
            urlString = @"http://iphone-tora.sakura.ne.jp/";
            break;
            
        case 10:
            urlString = [NSString stringWithFormat:@"%@%@",urlString, [self urlencode:@"Apple 基本部分まとめ"]];
            break;
        
        case 11:
            urlString = [NSString stringWithFormat:@"%@%@",urlString, [self urlencode:@"Apple 概要説明付き"]];
            break;
                         
        default:
            break;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (NSString *)urlencode:(NSString *)str {
    //encoding
    NSString *escapedUrlString =
        (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                            NULL,
                                                            (__bridge CFStringRef)str,
                                                            NULL,
                                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                            kCFStringEncodingUTF8 );
    return escapedUrlString;
}

- (NSString *)urldecode:(NSString *)str {
    //decoding
    NSString *decodedUrlString =
        (__bridge NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                            NULL,
                                                            (__bridge CFStringRef) str,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8);
    return decodedUrlString;
}

@end
