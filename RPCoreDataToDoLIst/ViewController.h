//
//  ViewController.h
//  RPCoreDataToDoLIst
//
//  Created by Student P_08 on 08/10/16.
//  Copyright © 2016 Ritesh Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *tvArray;
    NSMutableArray *smartPhoneArray;
    NSMutableArray *acArray;
    UISegmentedControl *SegmentControl;
}

- (IBAction)ActionAddBarButton:(id)sender;
- (IBAction)firstSegment:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

