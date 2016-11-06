//
//  AddViewController.m
//  RPCoreDataToDoLIst
//
//  Created by Student P_08 on 08/10/16.
//  Copyright © 2016 Ritesh Patil. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"

@interface AddViewController ()

@end

@implementation AddViewController




-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    return context;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.Firsttext) {
        [self.Secondtext resignFirstResponder];
        
    }
    else if (textField == self.Thirdtext) {
        
        [self.Thirdtext resignFirstResponder];
    }
    
    
    return YES;
    
}



- (IBAction)FirstTextfield:(id)sender {
}
- (IBAction)SaveActionButton:(id)sender {
    
    NSString *firstField = self.Firsttext.text;
    
    NSString *secondField = self.Secondtext.text;
    
    NSString *thirdField = self.Thirdtext.text;
    
    if (localSegement.selectedSegmentIndex == 0) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                if (thirdField.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:firstField forKey:@"model"];
                    
                    [newDevice setValue:secondField forKey:@"price"];
                    
                    [newDevice setValue:thirdField forKey:@"year"];
                    
                    
                    //                    NSLog(@"%@",firstField);
                    //
                    //                    NSLog(@"%@",secondField);
                    //                    NSLog(@"%@",thirdField);
                    
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                        //   [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
    if (localSegement.selectedSegmentIndex == 1) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                if (thirdField.length>0) {
                    
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"SmartPhone" inManagedObjectContext:context];
                    
                    [newDevice setValue:firstField forKey:@"name"];
                    
                    [newDevice setValue:secondField forKey:@"company"];
                    
                    [newDevice setValue:thirdField forKey:@"price"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Saved");
                        
                        //  [self alertWithTitle:@"Saved!" message:@""];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        
                        [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                        
                        
                    }
                }
            }
        }
    }
    if (localSegement.selectedSegmentIndex == 2) {
        
        if (firstField.length > 0) {
            
            if (secondField.length >0) {
                
                
                NSManagedObjectContext *context = [self managedObjectContext];
                
                NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                
                [newDevice setValue:firstField forKey:@"model"];
                
                [newDevice setValue:secondField forKey:@"price"];
                
                
                
                NSError *error;
                
                if ([context save:&error]) {
                    
                    NSLog(@"Saved");
                    
                    //         [self alertWithTitle:@"Saved!" message:@""];
                    
                    
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    NSLog(@"Unable to save : %@",error.localizedDescription);
                    
                    [self alertWithTitle:@"Unable to Save!" message:@"Please Try Again"];
                    
                    
                }
            }
        }
    }

}

- (IBAction)CancelActionButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)alertWithTitle: (NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [self viewDidLoad];
    }];
    
    [alert addAction:OK];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)SecondSegment:(id)sender {
    localSegement = sender;
    
    if (localSegement.selectedSegmentIndex == 0) {
        
        [self.Thirdtext setHidden:NO];
        
        [_Firsttext setPlaceholder:@"Enter Model:"];
        
        [_Secondtext setPlaceholder:@"Enter Price:"];
        
        [_Thirdtext setPlaceholder:@"Enter Year:"];
        
        
        [self SaveActionButton:sender];
    }
    else if (localSegement.selectedSegmentIndex == 1) {
        
        [self.Thirdtext setHidden:NO];
        
        [_Firsttext setPlaceholder:@"Enter Name:"];
        
        [_Secondtext setPlaceholder:@"Enter Company:"];
        
        [_Thirdtext setPlaceholder:@"Enter Price:"];
        
        [self SaveActionButton:sender];
    }
    else if (localSegement.selectedSegmentIndex == 2) {
        
        [self.Thirdtext setHidden:YES];
        
        
        [_Firsttext setPlaceholder:@"Enter Model:"];
        
        [_Secondtext setPlaceholder:@"Enter Price:"];
        
        
        [self SaveActionButton:sender];
    }
}
@end
