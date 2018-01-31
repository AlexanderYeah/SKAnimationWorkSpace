# 组动画  
## 保存一组动画的对象，保存到一组动画对象，所有的动画并发运行。
```  
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:keyAnim,anim1,anim2, nil];  
```  
 有一个属性为animations 是用来保存一组动画对象的NSArray  
 