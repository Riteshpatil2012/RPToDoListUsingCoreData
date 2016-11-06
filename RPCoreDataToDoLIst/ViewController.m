//
//  ViewController.m
//  RPCoreDataToDoLIst
//
//  Created by Student P_08 on 08/10/16.
//  Copyright © 2016 Ritesh Patil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context=nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tvArray = [[NSMutableArray alloc]init];
    
    smartPhoneArray = [[NSMutableArray alloc]init];
    
    acArray = [[NSMutableArray alloc]init];
    
    //[self.tableview reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (SegmentControl.selectedSegmentIndex == 0) {
        return tvArray.count;
        // NSLog(@"%lu",(unsigned long)tvArray.count);
    }
    else if (SegmentControl.selectedSegmentIndex == 1){
        
        return smartPhoneArray.count;
    }
    else if (SegmentControl.selectedSegmentIndex == 2){
        
        return acArray.count;
    }
    return 0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Device_Cell"];
    
    {
        if (SegmentControl.selectedSegmentIndex == 0) {
            
            NSManagedObjectContext * Tv = [tvArray objectAtIndex:indexPath.row];
            
            cell.Firstlabel.text = [Tv valueForKey:@"model"];
            cell.Secondlabel.text = [Tv valueForKey:@"price"];
            cell.Thirdlabel.text = [Tv valueForKey:@"year"];
            
            NSLog(@"%@",tvArray);
            
            
        }
        
        else if (SegmentControl.selectedSegmentIndex == 1)  {
            
            NSManagedObjectContext *Sp = [smartPhoneArray objectAtIndex:indexPath.row];
            
            cell.Firstlabel.text = [Sp valueForKey:@"name"];
            cell.Secondlabel.text = [Sp valueForKey:@"company"];
            cell.Thirdlabel.text = [Sp valueForKey:@"price"];
        }
        else if (SegmentControl.selectedSegmentIndex == 2)  {
            
            NSManagedObjectContext *Ac = [acArray objectAtIndex:indexPath.row];
            
            cell.Firstlabel.text = [Ac valueForKey:@"model"];
            cell.Secondlabel.text = [Ac valueForKey:@"price"];
            
            cell.Thirdlabel.text =@"";
        }
    }
    return cell;
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self fetchDeviceFromCoreData];
    
}


-(void)fetchDeviceFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (SegmentControl.selectedSegmentIndex == 0) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"TV"];
        
        NSError *error;
        tvArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"error:%@",error.localizedDescription);
        }
        else {
            [self.tableview reloadData];
        }
    }
    else if (SegmentControl.selectedSegmentIndex == 1){
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"SmartPhone"];
        
        NSError *error;
        
        smartPhoneArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"error:%@",error.localizedDescription);
        }
        else {
            [self.tableview reloadData];
        }
        
    }
    
    else if (SegmentControl.selectedSegmentIndex == 2){
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"AC"];
        
        NSError *error;
        
        acArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            
            [self alertWithTitle:@"Fetch Error" message:@"Please Try Again"];
            
            NSLog(@"error:%@",error.localizedDescription);
        }
        else {
            [self.tableview reloadData];
        }
        
    }
    
    
}


- (IBAction)ActionAddBarButton:(id)sender {
    AddViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    
    [self.navigationController pushViewController:addView animated:YES];
    
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(void)deleteEntry:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (SegmentControl.selectedSegmentIndex == 0) {
        
        [context deleteObject:[tvArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            [self fetchDeviceFromCoreData];
            
            [self.tableview reloadData];
        }
        else {
            //show alert
            
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (SegmentControl.selectedSegmentIndex == 1) {
        
        [context deleteObject:[smartPhoneArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            [self fetchDeviceFromCoreData];
            
            [self.tableview reloadData];
            
        }
        else {
            //show alert
            
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (SegmentControl.selectedSegmentIndex == 2) {
        
        [context deleteObject:[acArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self alertWithTitle:@"Deleted!" message:@""];
            
            
            [self fetchDeviceFromCoreData];
            
            [self.tableview reloadData];
            
        }
        else {
            //show alert
            [self alertWithTitle:@"Error" message:@"Please Try Again"];
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
    }
    else{
        
        [self alertWithTitle:@"Can't Delete!" message:@"Please Try Again"];
        
        NSLog(@"alert cannot delete");
        
    }
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

- (IBAction)firstSegment:(id)sender {
    SegmentControl = sender;
    
    if (SegmentControl.selectedSegmentIndex == 0) {
        [self.tableview reloadData];
    }
    else if (SegmentControl.selectedSegmentIndex == 1) {
        [self.tableview reloadData];
    }
    else if (SegmentControl.selectedSegmentIndex == 2) {
        
        [self.tableview reloadData];
    }
}
@end
