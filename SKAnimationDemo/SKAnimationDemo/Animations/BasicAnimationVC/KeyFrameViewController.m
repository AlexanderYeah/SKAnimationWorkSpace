//
//  KeyFrameViewController.m
//  SKAnimationDemo
//
//  Created by Alexander on 2018/1/29.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()

/** 示例view */
@property (nonatomic,strong)UIView *demoView;

@end

@implementation KeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.demoView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2 - 50, 100, 100)];
	self.demoView.backgroundColor = [UIColor brownColor];
	[self.view addSubview:self.demoView];
	
	NSArray *menuArr = @[@"关键帧",@"路径",@"抖动"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 4 * btn_padding)/3;
	CGFloat btn_h = 35;
	int max_cols = 3;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 999 + i;
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


- (void)btnClick:(UIButton *)btn
{
	NSInteger idx = btn.tag - 999;
	switch (idx) {
  case 0:
    {
		[self keyFrameAnimation];
	}
    break;
  case 1:
    {
		[self pathAnimation];
	}
    break;
  case 2:
    {
		[self shakeAnimation];
	}
    break;

  default:
    break;
}

}

/** keyFrameAnimation 动画*/
- (void)keyFrameAnimation
{
	CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	NSValue *val0 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT/2 - 50)];
	NSValue *val1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 + 50, SCREEN_HEIGHT/2 - 50)];
	NSValue *val2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 + 50, SCREEN_HEIGHT/2 + 50)];
	NSValue *val3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT/2 + 50)];
	NSValue *val4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT/2 - 50)];
	anim.values = [NSArray arrayWithObjects:val0,val1,val2,val3,val4, nil];
	anim.duration = 2.0f;
	// 设置代理 可以检测到动画的开始和结束
	[self.demoView.layer addAnimation:anim forKey:@"keyFrameAnimation"];

}
/**path animation*/
- (void)pathAnimation
{
	CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT/2 - 100, 200, 200)];
	anim.path = path.CGPath;
	anim.duration = 2.0f;
	[self.demoView.layer addAnimation:anim forKey:@"pathAnimation"];

}

/** 抖动效果 */
- (void)shakeAnimation
{
	CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
	NSValue *val0 = [NSNumber numberWithFloat:-M_PI / 180 * 4];
	NSValue *val1 = [NSNumber numberWithFloat:M_PI/180 * 4];
	NSValue *val2 = [NSNumber numberWithFloat:- M_PI / 180 * 4];
	
	anim.values = @[val0,val1,val2];
	anim.repeatCount = MAXFLOAT;
	
	[self.demoView.layer addAnimation:anim forKey:@"shakeAnimation"];
	

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
