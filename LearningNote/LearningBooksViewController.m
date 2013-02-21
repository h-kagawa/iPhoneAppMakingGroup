//
//  LearningBooksViewController.m
//  LearningNote
//
//  Created by 香川 浩之 on 2013/02/17.
//  Copyright (c) 2013年 香川 浩之. All rights reserved.
//

#import "LearningBooksViewController.h"

@interface LearningBooksViewController ()

@end

@implementation LearningBooksViewController

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

    NSString *urlString = @"http://www.amazon.co.jp/gp/search/?__mk_ja_JP=%83J%83%5E%83J%83i&url=search-alias%3D";
    urlString = [NSString stringWithFormat:@"%@%@", urlString, [self urlencode:@"books"]];
    urlString = [NSString stringWithFormat:@"%@%@", urlString, @"&field-keywords="];

    switch (indexPath.section * 10 + indexPath.row) {
        case 0:
            urlString = [NSString stringWithFormat:@"%@%@",urlString, [self urlencode:@"Objective-C 2.0 徹底解説"]];
            break;
            
        case 1:
            urlString = [NSString stringWithFormat:@"%@%@",urlString, [self urlencode:@"はじめてのiOSアプリプログラミング入門 決定版"]];
            break;
            
        case 2:
            urlString = [NSString stringWithFormat:@"%@%@",urlString, [self urlencode:@"iOSの教科書"]];
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
                                                                 kCFStringEncodingShiftJIS );
    return escapedUrlString;
}

- (NSString *)urldecode:(NSString *)str {
    //decoding
    NSString *decodedUrlString =
    (__bridge NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                                  NULL,
                                                                                  (__bridge CFStringRef) str,
                                                                                  CFSTR(""),
                                                                                  kCFStringEncodingShiftJIS);
    return decodedUrlString;
}

@end
