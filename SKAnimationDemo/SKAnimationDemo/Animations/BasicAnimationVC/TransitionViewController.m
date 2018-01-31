//
//  TransitionViewController.m
//  SKAnimationDemo
//
//  Created by Alexander on 2018/1/31.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

/** */
@property (nonatomic,strong)UIView *demoView;
/** */
@property (nonatomic,strong)UILabel *demoLabel;
/** */
@property (nonatomic,assign)NSInteger index;


@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	_index = 0;
	
	self.demoView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 + 50, 100, 100)];
    self.demoView.backgroundColor = SKRandomColor;
    [self.view addSubview:self.demoView];
	
	
	_demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_demoView.frame)/2-10, CGRectGetHeight(_demoView.frame)/2-20, 50, 50)];
    _demoLabel.textAlignment = NSTextAlignmentCenter;
    _demoLabel.font = [UIFont systemFontOfSize:40];
    [_demoView addSubview:_demoLabel];
	
    [self changeView:YES];
	
	
	
	NSArray *menuArr = @[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 4 * btn_padding)/3;
	CGFloat btn_h = 35;
	int max_cols = 3;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 777 + i;
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
	
	NSInteger idx = btn.tag - 777;

	switch (idx) {
  case 0:
    {
		//fade
		[self fadeAnimation];

	}
    break;
    case 1:{
		// Sample2

	}
	break;
	case 2:{

	}
	break;
	case 3:{

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

- (void)fadeAnimation
{

	[self changeView:YES];
	CATransition *anim = [CATransition animation];
	anim.type = kCATransitionFade;
	anim.subtype = kCATransitionFromRight;
	anim.duration = 1.0f;
	[self.demoView.layer addAnimation:anim forKey:@"fadeAnimation"];
}



/**
 *   设置view的值
 */
-(void)changeView : (BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    _demoView.backgroundColor = [colors objectAtIndex:_index];
    _demoLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
