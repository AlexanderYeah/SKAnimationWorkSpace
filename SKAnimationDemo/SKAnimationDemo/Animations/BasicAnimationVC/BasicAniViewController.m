//
//  BasicAniViewController.m
//  SKAnimationDemo
//
//  Created by Alexander on 2018/1/26.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "BasicAniViewController.h"

@interface BasicAniViewController ()

/** 示例view */
@property (nonatomic,strong)UIView *demoView;

@end

@implementation BasicAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	self.demoView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2 - 50, 100, 100)];
	self.demoView.backgroundColor = [UIColor brownColor];
	[self.view addSubview:self.demoView];
	
	NSArray *menuArr = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 5 * btn_padding)/4;
	CGFloat btn_h = 35;
	int max_cols = 4;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 333 + i;
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
	
	NSInteger idx = btn.tag - 333;

	switch (idx) {
  case 0:
    {
		// 实例位移动画
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
		// 起始位置
		anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 )];
		anim.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2 + 100, SCREEN_HEIGHT / 2)];
		// 动画时间
		anim.duration = 2.0f;
		//
		anim.removedOnCompletion = NO;
		
		// 动画变化速度
		anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
		// 结束位置
		[self.demoView.layer addAnimation:anim forKey:@"positionAnimation"];
	}
    break;
    case 1:{
    // 透明度动画
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
		anim.fromValue = [NSNumber numberWithFloat:1.0f];
		anim.toValue = [NSNumber numberWithFloat:0.2f];
		anim.duration = 2.0f;
		[self.demoView.layer addAnimation:anim forKey:@"opacityAnimation"];
		
	}
	break;
	case 2:{
	// 缩放动画
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	anim.toValue = [NSNumber numberWithFloat:1.5f];
	anim.duration = 0.3f;
	anim.repeatCount = MAXFLOAT;
	anim.autoreverses = YES;
	[self.demoView.layer addAnimation:anim forKey:@"scaleAnimation"];
	
	}
	break;
	case 3:{
		// 旋转动画
		// 绕着z 轴旋转
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
		anim.toValue = [NSNumber numberWithFloat:M_PI];
		[self.demoView.layer addAnimation:anim forKey:@"rotateAnimation"];
	
	}
	break;
	case 4:{
		// 背景色变化动画
		CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
		anim.toValue = (id)[UIColor greenColor].CGColor;
		anim.duration = 1.0f;
		[self.demoView.layer addAnimation:anim forKey:@"backgroundAnimation"];

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
