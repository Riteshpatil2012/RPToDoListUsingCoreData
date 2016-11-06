//
//  AddViewController.h
//  RPCoreDataToDoLIst
//
//  Created by Student P_08 on 08/10/16.
//  Copyright © 2016 Ritesh Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UITextFieldDelegate>
{
    //UISearchController *localSegment;
    UISegmentedControl *localSegement;
}
@property (strong, nonatomic) IBOutlet UITextField *Firsttext;
@property (strong, nonatomic) IBOutlet UITextField *Secondtext;
@property (strong, nonatomic) IBOutlet UITextField *Thirdtext;
- (IBAction)SaveActionButton:(id)sender;
- (IBAction)CancelActionButton:(id)sender;
- (IBAction)SecondSegment:(id)sender;

@end
