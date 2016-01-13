//
//  ViewController.m
//  SlideshowApp
//
//  Created by 扇谷真依 on 2016/01/12.
//  Copyright © 2016年 扇谷真依. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIImageView *aImageView;
    NSInteger countNumber;
    NSInteger countNumberNext;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    countNumber = 1;
    [self setupBackground];
    [self setupButtonPrev];
    [self setupButtonNext];
}

-(void)setupBackground{
    aImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    aImageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:aImageView];
}

-(void)setupButtonPrev{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 568);
    [button setImage:[UIImage imageNamed:@"prev.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"prev_on.png"] forState:UIControlStateHighlighted];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeImageUsingStringPrev:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)setupButtonNext{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(280, 0, 40, 568);
    [button setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"next_on.png"] forState:UIControlStateHighlighted];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeImageUsingStringNext:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)changeImageUsingStringPrev:(id)sender{
    countNumber--;
    if (countNumber==0) {
        countNumber = 3;
    } else if (countNumber == -1) {
        countNumber = 2;
    }
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)countNumber]];
}

-(void)changeImageUsingStringNext:(id)sender{
    if (countNumber == 3) {
        countNumber = 1;
    } else {
        countNumber++;
    }
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)countNumber]];
    if (countNumber==3) {
        countNumber = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
