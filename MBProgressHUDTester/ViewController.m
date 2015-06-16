//
//  ViewController.m
//  MBProgressHUDTester
//
//  Created by m-nakada on 6/16/15.
//  Copyright (c) 2015 mna. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController () <MBProgressHUDDelegate>
@property (strong, nonatomic) MBProgressHUD *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (IBAction)runTaskAction:(id)sender {
  if (self.progressView) {
    [self.progressView removeFromSuperview], self.progressView = nil;
  }
  
  self.progressView = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  [self.navigationController.view addSubview:self.progressView];
  self.progressView.mode          = MBProgressHUDModeDeterminateHorizontalBar;
  self.progressView.delegate      = self;
  self.progressView.labelText     = NSLocalizedString(@"progress.uploading", nil);
  self.progressView.buttonTitle   = NSLocalizedString(@"progress.cancel", nil);
  self.progressView.progress      = 0.0f;
  self.progressView.dimBackground = YES;
  self.progressView.tag           = 0;
  [self.progressView show:YES];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
  [self.progressView removeFromSuperview], self.progressView = nil;
}

- (void)hudTappedButton:(MBProgressHUD *)hud {
  // Do cancel tasks
  NSLog(@"%s (%d)", __PRETTY_FUNCTION__, __LINE__);
  [hud hide:YES];
}


@end
