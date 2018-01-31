//
//  GroupAnimationViewController.m
//  SKAnimationDemo
//
//  Created by Alexander on 2018/1/31.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController ()

@property (nonatomic,strong)UIView *demoView;


@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
    self.demoView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 - 50, 100, 100)];
    self.demoView.backgroundColor = SKRandomColor;
    [self.view addSubview:self.demoView];
	
	NSArray *menuArr = @[@"组动画一",@"组动画二"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 4 * btn_padding)/3;
	CGFloat btn_h = 35;
	int max_cols = 3;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 222 + i;
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

// 按钮的点击
- (void)btnClick:(UIButton *)btn
{
	
	NSInteger idx = btn.tag - 222;
	switch (idx) {
  case 0:
    {
		[self groupAnimation1];
	}
    break;
  case 1:
    {
		[self groupAnimation2];
	}
    break;


  default:
    break;
}

}

/** 组动画1 */
- (void)groupAnimation1
{
	// 将多个动画放入到一个数组里面去
	// 位移动画
	CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	NSValue *val0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2 - 50)];
	NSValue *val1 = [NSValue valueWithCGPoint:CGPointMake(200, SCREEN_HEIGHT/2 - 50)];
	NSValue *val2 = [NSValue valueWithCGPoint:CGPointMake(200, SCREEN_HEIGHT/2 + 50)];
	NSValue *val3 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2 + 50)];
	NSValue *val4 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2 - 50)];
	keyAnim.values = @[val0,val1,val2,val3,val4];
	
	// 缩放动画
	CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	anim1.duration = 1.0f;
	anim1.repeatCount = MAXFLOAT;
	anim1.fromValue = [NSNumber numberWithFloat:0.8f];
	anim1.toValue = [NSNumber numberWithFloat:2.0f];
	
	// 旋转动画
	CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	anim2.toValue = [NSNumber numberWithFloat:M_PI * 4];
	
	// 将以上的动画全部装进 组动画里面去
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:keyAnim,anim1,anim2, nil];
	group.duration = 2.0f;
	
	[self.demoView.layer addAnimation:group forKey:@"groupAnimation"];
	
	
	
	
	
	
	
	
	
}
/** 组动画2 */
- (void)groupAnimation2
{
	

}




@end
