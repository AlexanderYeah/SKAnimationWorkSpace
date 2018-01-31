//
//  ViewController.m
//  SKAnimationDemo
//
//  Created by AY on 2018/1/25.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"
#import "BasicAniViewController.h"
#import "KeyFrameViewController.h"
#import "GroupAnimationViewController.h"
#import "TransitionViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSArray *menuArr = @[@"基础动画",@"key动画",@"组动画",@"转场动画",@"Shake",@"Swing",@"Snap",@"Bounce2",@"Expand",@"Hinge",@"Drop"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 5 * btn_padding)/4;
	CGFloat btn_h = 35;
	int max_cols = 4;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 666 + i;
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

		int row = 0;
		int col = i;
		if (i >= max_cols) {
			row = i / max_cols;
			col = i % max_cols;
		}
		
		btn.frame = CGRectMake(btn_padding + col *( btn_w + btn_padding) , btn_padding + row * (btn_h + btn_padding) + 80, btn_w, btn_h);
		
		[self.view addSubview:btn];
		
	}
	

	
}

#pragma mark -  按钮点击
- (void)btnClick:(UIButton *)btn
{
	
	NSInteger idx = btn.tag - 666;

	switch (idx) {
  case 0:
    {
		// Sample1
		BasicAniViewController *basicVC = [[BasicAniViewController alloc]init];
		basicVC.navigationItem.title = @"基础动画";
		basicVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:basicVC animated:YES];
	}
    break;
    case 1:{
		// Sample2
		KeyFrameViewController *keyVC = [[KeyFrameViewController alloc]init];
		keyVC.navigationItem.title = @"KeyFrame动画";
		keyVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:keyVC animated:YES];
	}
	break;
	case 2:{
		GroupAnimationViewController *gpVC = [[GroupAnimationViewController alloc]init];
		gpVC.navigationItem.title = @"组动画";
		gpVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:gpVC animated:YES];
	}
	break;
	case 3:{
		TransitionViewController *tranVC = [[TransitionViewController alloc]init];
		tranVC.view.backgroundColor = [UIColor whiteColor];
		tranVC.title = @"过渡动画";
		[self.navigationController pushViewController:tranVC animated:YES];
	}
	break;
	case 4:{
		
	
	}
	break;
	case 5:{
		
	
	}
	break;
	case 6:{
		
	
	}
	break;
	case 7:{
		
	
	}
	break;
	case 8:{
		
	
	}
	break;
	case 9:{
		
	
	}
	break;
	case 10:{
		;
	
	}
	break;

  default:
    break;
}

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
