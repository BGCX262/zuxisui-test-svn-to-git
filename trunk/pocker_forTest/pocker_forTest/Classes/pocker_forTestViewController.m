

#import "pocker_forTestViewController.h"
#import "PkButton.h"
#import "PGToast.h"
#import "PockerGroup.h"
#import "ValueInputView.h"
#define MAIN_ALERT	101
#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR] autorelease]
@implementation pocker_forTestViewController
@synthesize imgv;
@synthesize array;
@synthesize value;
@synthesize okArray;
@synthesize noArray;


int i=0;
int m=0;
int  mTime;

NSString *type=@"ht";
//NSString *name = @"Chase";
- (void)passValue:(NSString *)value
{
	self.value.text = value;
	NSLog(@"the get value is %@", value);
}

- (IBAction)buttonClick:(id)sender
{
	NSLog(@"TTTTTS");
	ValueInputView *valueView = [[ValueInputView alloc] initWithNibName:@"ValueInputView" bundle:[NSBundle mainBundle]];
	valueView.delegate = self; // 把两个VC关联起来！
	[self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
	[self presentModalViewController:valueView animated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);		
}

NSArray *allSubviews(UIView *aView)
{
	NSArray *results = [aView subviews];
	for (UIView *eachView in [aView subviews])
	{
		NSArray *riz = allSubviews(eachView);
		if (riz) results = [results arrayByAddingObjectsFromArray:riz];
	}
	return results;
}
int start=0;
-(void) segmentAction: (UISegmentedControl *) sender
{
	// Update the label with the segment number
	NSLog(@"index is %d",sender.selectedSegmentIndex + 1);
	if(sender.selectedSegmentIndex==0){
		if(start==0) {
			[self StartTimer];
			[self jiequNineCards ];
			start=1;
		}
		
	}else if(sender.selectedSegmentIndex==1){
		[self postCards ];
	}else if(sender.selectedSegmentIndex==2){
	
		[self passCard ];
		[self jiequNineCards ];
		[self jump];
	}
	//UILabel *label = (UILabel *)[self.view viewWithTag:101];
	//[label setText:[NSString stringWithFormat:@"%0d", sender.selectedSegmentIndex + 1]];
}
-(IBAction)lookOk{

}

-(IBAction)lookNo{
	UIViewController *InforController;
	InforController= [[UIViewController alloc] initWithNibName:@"infoViewController" bundle:nil];
	//InforController= [[UIViewController alloc] initWithNibName:@"hh" bundle:nil];
	[self.navigationController pushViewController:InforController animated:YES];
}
-(void)jump{	
	
	UIViewController *InforController;
	InforController= [[UIViewController alloc] initWithNibName:@"infoViewController" bundle:nil];
	//InforController= [[UIViewController alloc] initWithNibName:@"hh" bundle:nil];
	[self.navigationController pushViewController:InforController animated:YES];
}
-(void)removeObjectInarray//删除桌面上的牌
{
	
	//NSLog(@"index is %d",[index intValue]); 
	for(UIView * myview in [self.view subviews])
	{
		if(myview.center.y == 140)
		{
			NSLog(@"disappear== %@",[myview currentTitle]);
			 

			[UIView beginAnimations:@"animationID1" context:nil];
			[UIView setAnimationDuration:.3f];
			myview.frame=CGRectMake(myview.center.x, myview.center.y, 0, 0);
			[UIView commitAnimations];
			
		}
	}
	}
-(void)aniForpostCards:(UIView *)myview//出牌动画
{
	
	NSLog(@"测试出牌的动画");
	[UIView beginAnimations:@"animationID1" context:nil];
	[UIView setAnimationDuration:.3f];
	myview.frame=CGRectMake(myview.center.x, 100, 50, 80);
	[UIView commitAnimations];
	NSLog(@"the tag of myview is %d",myview.tag);
	//NSNumber *m=[NSNumber numberWithInteger:myview.tag];
	
	
	
}
-(IBAction)postCards//点击捡九
{
	
	
	int total=0;
	int remainder=0;
	
	total=[self checkTotal];
	NSLog(@"total===%d",total);

	remainder=total%10;
    NSLog(@"求余数===%d",remainder);

	if(total==0){
		[self showAlert:@"还没有开始发牌！"];
	}else if(remainder==9){
		[self showAlert:@"正确，继续努力！"];
		UILabel *rightlabel  = (UILabel *)[self.view viewWithTag:121];
		[self sendToArray:total];
		rightlabel.text=[NSString stringWithFormat:@"%d", [rightlabel.text intValue]+1];
		[self passCard ];
		[self jiequNineCards ];
		
	}else{
		//noArray
		
		[self sendToArray:total];
		UILabel *wronglabel  = (UILabel *)[self.view viewWithTag:122];
		wronglabel.text=[NSString stringWithFormat:@"%d", [wronglabel.text intValue]+1];
		[self passCard ];
		[self jiequNineCards ];
		
	
	}
		//[self showAlert:@"错误，您脑袋不够灵光啊！"];
		
	
}
/**
**将获取后的放到数组中保存
**
*/

- (void) sendToArray:(NSInteger *)paramValue
		
{
	
	if (noArray==nil) {
		NSLog(@"is null init");
		noArray=[[NSMutableArray alloc] init];
	}else{
		NSLog(@"not not null");
	}
	
	if (okArray==nil) {
		NSLog(@"is null init");
		okArray=[[NSMutableArray alloc] init];
	}else{
		NSLog(@"not not null");
	}
	PockerGroup *_pockerGroup ;
	int sign=0;
	for(UIView * myview in [self.view subviews]){
	
	//NSLog(@"check button .y====%f",myview.center.y);
	if(myview.center.y==103.5){
		sign++;
		if(_pockerGroup==nil){
		_pockerGroup= [[PockerGroup alloc]init];
			NSLog(@"PockerGroup init");
		}else{
			NSLog(@"PockerGroup have init");
		}
		PkButton *pButton=myview;
		if (sign==1) {
			[_pockerGroup setOneNum:[pButton pkNum]];
			[_pockerGroup setOneType:[pButton pkType]];
		}else if (sign==2) {
			[_pockerGroup setTwoNum:[pButton pkNum]];
			[_pockerGroup setTwoType:[pButton pkType]];
		}else if (sign==3) {
			[_pockerGroup setThreeNum:[pButton pkNum]];
			[_pockerGroup setThreeType:[pButton pkType]];
		}	 
		
	}
	}	
	if(paramValue==9){
			NSLog(@"sddd");
			[okArray addObject:_pockerGroup];
			NSLog(@"okArray count=%d",okArray.count);
	}else {
			
			[noArray addObject:_pockerGroup];
			NSLog(@"noArray count=%d",noArray.count);
			
	}
  
	
}
-(int)checkTotal
{
	NSLog(@"checkTotal===");
	int total=0;
	Boolean hadChupai=false;
	for(UIView * myview in [self.view subviews]){
		
		//NSLog(@"check button .y====%f",myview.center.y);
		if(myview.center.y==103.5){
			PkButton *pButton=myview;
			total=total+pButton.pkNum;
			
		}
	}
	
	return total;
}
-(IBAction)passCard//give up card
{
	
	//NSLog(@"first count===%d",[array count]);
	for(UIView * myview in [self.view subviews])
	{
		if(myview.center.y == 103.5)
		{
			//NSLog(@"disappear== %@",[myview currentTitle]);
			

			[UIView beginAnimations:@"animationID1" context:nil];
			[UIView setAnimationDuration:.5f];
			myview.frame=CGRectMake(myview.center.x, myview.center.y, 10, 10);
			[UIView commitAnimations];
			//NSLog(@"数组中剔除前count===%d",[array count]);
			//[array removeObjectAtIndex:0];
			//NSLog(@"数组中剔除前count===%d",[array count]);
			
			//NSLog(@"myview titile== %@",[myview currentTitle]);
			UIImage *image = [myview currentBackgroundImage];
			[myview removeFromSuperview];

			
			//[myview removeFromSuperview];
		}
	}
	//NSLog(@"end===%d",[array count]);
	//[array removeObjectAtIndex:51];
	//[array removeObjectAtIndex:50];
	//[array removeObjectAtIndex:49];
	///NSLog(@"coun0000000000000");
	
	
}

-(Boolean)checkStart//初始化牌局
{
	//NSLog(@"checkStart===");

	Boolean hadChupai=false;
	for(UIView * myview in [self.view subviews]){
		
		//NSLog(@"check button .y====%f",myview.center.y);
		if(myview.center.y==103.5){

			return true;
		}
	}

	return hadChupai;
}

- (void)StartTimer

{
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAdvanced:) userInfo:nil repeats:YES];	
	//repeats设为YES时每次 invalidate后重新执行，如果为NO，逻辑执行完后计时器无效
	
}

- (void)timerAdvanced:(NSTimer *)timer//这个函数将会执行一个循环的逻辑

{
	


		//[timer invalidate];
		//[self StartTimer];
	
	mTime++;
	//NSLog(@"cmTime====%d",mTime);
	int svalue=mTime/60;
	
	int yvalue=mTime%60;
	//NSLog(@"商数====%d",svalue);
	//NSLog(@"余数====%d",yvalue);
	UILabel *label = (UILabel *)[self.view viewWithTag:120];
	NSMutableString *mstr;
	mstr=[NSMutableString stringWithString:[NSString stringWithFormat:@"%0d", svalue]]; //初始化可变字符串
	[mstr appendString:@":"];
	
	if(yvalue<10){
		[mstr appendString:@"0"];
		[mstr appendString:[NSString stringWithFormat:@"%0d", yvalue]];
	}else{
		[mstr appendString:[NSString stringWithFormat:@"%0d", yvalue]];
	}
		
	[label setText:mstr];

}
- (void) showAlert: (NSString *) message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	//av.tag = MAIN_ALERT;
    [av show];
}

-(IBAction)jiequNineCards//get front two card back one card
{
	
	Boolean check=false;
	check=[self checkStart];
	//NSLog(@"jiequNineCards===%i",check);
	
	if(check==true){
		NSLog(@"未执行"); 
		[self showAlert:@"游戏已经开始，快让你的大脑运行起来吧！"];
	}else{
		m=0;
		for(int i=0;i<3&& 0<[self.array count];i++){
		if(i==0||i==1) {
			//NSLog(@"前2== %d",i);
			PkButton *myview=[self.array objectAtIndex:[self.array count]-1];
			//NSLog(@"btn.center.y is %f",myview.center.y);
			//NSLog(@"前2currentTitle== %@",[myview currentTitle]);
			//NSLog(@"前2type=== %@",myview.pkType);
			//NSLog(@"前2pkNum=== %d",myview.pkNum);
			[self autoPutCard:myview];
			[array removeObjectAtIndex:[self.array count]-1];
			m++;
			
			}else{
			PkButton *myview=[self.array objectAtIndex:0];
			//NSLog(@"btn.center.y is %f",myview.center.y);
			//NSLog(@"后1== %@",[myview currentTitle]);
			//NSLog(@"后1type=== %@",myview.pkType);
			//NSLog(@"后1pkNum=== %d",myview.pkNum);
			[self autoPutCard:myview];
			[array removeObjectAtIndex:0];
			m++;
		}
		}
	}
}

-(void)autoPutCard:(id)sender//点击对应的牌时产生的事件
{
	NSLog(@"m===%d",m);

	PkButton *btn=(UIButton *)sender;
	NSLog(@"btn.center.y%d",btn.center.y);
	if(btn.center.y!=140)
	{
		//NSLog(@"tag is :%d",btn.tag);
		//NSLog(@"btn.center.y is %f",btn.center.y);
		//NSLog(@"btn.center.x is %f",btn.center.x);
		float offset=30;
		[UIView beginAnimations:@"animationID1" context:nil];
		[UIView setAnimationDuration:.3f];
		
		//if(btn.center.y==390)
		if(btn.center.y==220)
		{
			btn.frame=CGRectMake(200+m*offset, btn.center.y-170,72, 107);
			//NSLog(@"type=== %@",btn.pkType);
			//NSString type=btn.pkType;
			int num=btn.pkNum;
			type=btn.pkType;
			//NSLog(@"pkNum=== %d",btn.pkNum);
			//NSLog(@"pkType=== %@",btn.pkType);
			NSMutableString *mstr;
			mstr=[NSMutableString stringWithString:type]; //初始化可变字符串  
			NSString *ValueString = [NSString stringWithFormat:@"%d", num];
			
			[mstr appendString:ValueString];
			[mstr appendString:@".png"];
			//NSLog(@"选中的图片path== %@",mstr);
			[btn setBackgroundImage:[UIImage imageNamed:mstr] forState:UIControlStateNormal];
			//NSLog(@"equal y");
			//NSLog(@"btn11.center.y is %f",btn.center.y);
			//NSLog(@"btn.center.x is %f",btn.center.x);
		}
		

		[UIView commitAnimations];
	}
}
-(void)cardsHit:(id)sender//点击对应的牌时产生的事件
{
	/*
	UIButton *btn=(UIButton *)sender;
	if(btn.center.y!=140)
	{
		NSLog(@"tag is :%d",btn.tag);
		NSLog(@"btn.center.y is %f",btn.center.y);
		NSLog(@"btn.center.x is %f",btn.center.x);
		[UIView beginAnimations:@"animationID1" context:nil];
		[UIView setAnimationDuration:.3f];
		NSLog(@"change the frame of the hitted btn");
		//if(btn.center.y==390)
		if(btn.center.y==230)
		{
			btn.frame=CGRectMake(btn.center.x, btn.center.y-80, 50, 80);
			NSLog(@"equal y");
			NSLog(@"btn.center.y is %f",btn.center.y);
			NSLog(@"btn.center.x is %f",btn.center.x);
		}
		else {
			btn.frame=CGRectMake(btn.center.x-45, btn.center.y+10, 40, 60);
			NSLog(@"btn.center.y is %f",btn.center.y);
			NSLog(@"btn.center.x is %f",btn.center.x);
		}
		
		[UIView commitAnimations];
	}
	 */
}
-(void)layOutCards
{
	
}
-(void)removeOrgCards//当发牌结束时删除发牌的图片
{
	[UIView beginAnimations:@"animationID1" context:nil];
	[UIView setAnimationDuration:.9f];
	[UIView setAnimationRepeatAutoreverses:NO];
	imgv.frame=CGRectMake(45, 400, 0, 0);
	[UIView commitAnimations];
}
-(void)aniForsendcards:(UIView *)myview//出牌动画
{
	//NSLog(@"aniForsendcards %@",[myview currentTitle]);
	//float offset=10;
		float offset=5;
		i++;
		[UIView beginAnimations:@"animationID" context:nil];
		[UIView setAnimationDuration:0.5f];
		[UIView setAnimationRepeatAutoreverses:NO];
		myview.frame=CGRectMake(350-i*offset, 180, 50, 80);
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:myview cache:YES];
		[UIView commitAnimations];
		//[NSThread sleepForTimeInterval:0.15];
	
	if(i==52)
		[self removeOrgCards];
	
}

-(void)sendCards//出牌
{
	array=[[NSMutableArray alloc] init];
	/*for(int i=0;i<19;i++)
	{		
		UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		btn.frame=CGRectMake(3, 360, 50, 80);
		//[btn setTitle:@"A"];
		//[btn setTitle:@"A" forState:UIControlStateNormal];

		[btn setBackgroundImage:[UIImage imageNamed:@"poker2.jpg"] forState:UIControlStateNormal];
		[btn setTag:i];
		[btn addTarget:self action:@selector(cardsHit:) forControlEvents:UIControlEventTouchUpInside];
		[array addObject:btn];
		[self.view addSubview:btn];
		[btn release];
		
		
	}*/
	//type=ht
	NSMutableString *mstr;
	NSMutableString *picPath;
	type=@"h";	 
	for(int i=1;i<14;i++)
	 {	
	 mstr=[NSMutableString stringWithString:type]; //初始化可变字符串 
	 
     NSString *ValueString = [NSString stringWithFormat:@"%d", i];

	 [mstr appendString:ValueString]; 
	 [mstr appendString:@".png"];
    // NSLog(@"mstr %@",mstr);
	 //UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	 //NSLog(@"i  %d",i);
	  //PkButton *btn=[[PkButton alloc] init];
	 PkButton *btn =[PkButton buttonWithType:UIButtonTypeCustom];
	 [btn setPkNum:i]; 
	
	 [btn setPkType:type]; 
	  //NSLog(@"type=== %@",btn.pkType);
	  //NSLog(@"pkNum=== %d",btn.pkNum);
		 
	 btn.frame=CGRectMake(3, 180, 55, 80);
	 //[btn setTitle:mstr forState:UIControlStateNormal];
	 
	 [btn setBackgroundImage:[UIImage imageNamed:@"bj.png"] forState:UIControlStateNormal];
	 //[btn setTag:mstr];
	 //[btn setTag:i];
	 [btn addTarget:self action:@selector(cardsHit:) forControlEvents:UIControlEventTouchUpInside];
	 [array addObject:btn];
	 //[self.view addSubview:btn];
	 //[btn release];
	 }
	
	type=@"f";	 
	for(int i=1;i<14;i++)
	{	
		mstr=[NSMutableString stringWithString:type]; //初始化可变字符串  
		NSString *ValueString = [NSString stringWithFormat:@"%d", i];
		
		[mstr appendString:ValueString]; 
		[mstr appendString:@".png"];
		//NSLog(@"mstr %@",mstr);
		//UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		PkButton *btn =[PkButton buttonWithType:UIButtonTypeCustom];
		[btn setPkNum:i]; 
		[btn setPkType:type]; 
		btn.frame=CGRectMake(3, 180, 50, 80);
		//[btn setTitle:mstr forState:UIControlStateNormal];
		
		[btn setBackgroundImage:[UIImage imageNamed:@"bj.png"] forState:UIControlStateNormal];
		//[btn setTag:mstr];
		[btn addTarget:self action:@selector(cardsHit:) forControlEvents:UIControlEventTouchUpInside];
		[array addObject:btn];
		//[self.view addSubview:btn];
		//[btn release];
	}
	type=@"c";	 
	for(int i=1;i<14;i++)
	{	
		mstr=[NSMutableString stringWithString:type]; //初始化可变字符串  
		NSString *ValueString = [NSString stringWithFormat:@"%d", i];
		
		[mstr appendString:ValueString];
		[mstr appendString:@".png"];
		//NSLog(@"mstr %@",mstr);
		//UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		PkButton *btn =[PkButton buttonWithType:UIButtonTypeCustom];
		[btn setPkNum:i]; 
		[btn setPkType:type]; 
		btn.frame=CGRectMake(3, 180, 50, 80);
		//[btn setTitle:mstr forState:UIControlStateNormal];
		
		[btn setBackgroundImage:[UIImage imageNamed:@"bj.png"] forState:UIControlStateNormal];
		//[btn setTag:mstr];
		[btn addTarget:self action:@selector(cardsHit:) forControlEvents:UIControlEventTouchUpInside];
		[array addObject:btn];
		//[self.view addSubview:btn];
		//[btn release];
	}
	type=@"b";	 
	for(int i=1;i<14;i++)
	{	
		mstr=[NSMutableString stringWithString:type]; //初始化可变字符串  
		NSString *ValueString = [NSString stringWithFormat:@"%d", i];
		
		[mstr appendString:ValueString]; 
		[mstr appendString:@".png"];
		//NSLog(@"mstr %@",mstr);
		//UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
		PkButton *btn =[PkButton buttonWithType:UIButtonTypeCustom];
		[btn setPkNum:i]; 
		[btn setPkType:type]; 
		
		btn.frame=CGRectMake(3, 180, 50, 80);
		//[btn setTitle:mstr forState:UIControlStateNormal];
		
		[btn setBackgroundImage:[UIImage imageNamed:@"bj.png"] forState:UIControlStateNormal];
		//[btn setTag:mstr];
		[btn addTarget:self action:@selector(cardsHit:) forControlEvents:UIControlEventTouchUpInside];
		[array addObject:btn];
		//[self.view addSubview:btn];
		//[btn release];
	}
	[self sortRandom];
	for(UIView *myview in array){
		
		//NSLog(@"myview currentTitle %@",[myview currentTitle]);
		[self performSelector:@selector(aniForsendcards:) withObject:myview afterDelay:1.0f];
	
	}
}


-(void)gameInit//初始化牌局
{
	
	imgv=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	imgv.contentMode= UIViewContentModeScaleToFill;
	imgv.frame=CGRectMake(3, 180, 50, 80);
	[self.view addSubview:imgv];
	
	
	//hidden button
	UIButton *hiddeanBtn = (UIButton *)[self.view viewWithTag:126];
	CGRect hiddenframe = hiddeanBtn.frame;
	
	hiddenframe.origin.x= 450;
	hiddenframe.origin.y= 15;
	hiddeanBtn.frame = hiddenframe;
	//hiddeanBtn.backgroudColor = [UIColor clearColor];	
	//hiddeanBtn.backgroudColor = [UIColorclearColor];
	//正确的统计
	UILabel *rightLable = (UILabel *)[self.view viewWithTag:121];
	CGRect frame = rightLable.frame;
	frame.origin.x= 440;
	frame.origin.y= 15;
	rightLable.frame = frame;
	
	//错误统计
	
	
	UILabel *wronglabel  = (UILabel *)[self.view viewWithTag:122];
	CGRect framew = wronglabel.frame;
	framew.origin.x= 430;
	framew.origin.y= 50;
	wronglabel.frame=framew;
	
	
	UIImage *myImage = [UIImage imageNamed:@"ok.png"]; 
	UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(410, 10, 30, 30)];
    imageview.image=myImage;
    [self.view addSubview:imageview];
	
	
	UIImage *wrImage = [UIImage imageNamed:@"wrong.png"]; 
	UIImageView *wrongimageview =[[UIImageView alloc] initWithFrame:CGRectMake(410, 50, 30, 30)];
    wrongimageview.image=wrImage;
    [self.view addSubview:wrongimageview];
	
	
	
	
}
-(void)sortRandom//初始化牌局
{
	/*for(UIView *myview in array){
		int value = (arc4random() % 52) + 1; 
		NSLog(@"x %d",value);
	}*/
	for(int i = 0,j=[array count]; i < j; i++)
	{		
		//int value = (arc4random() % 52) + 1; 
		//NSLog(@"x %d",value);	
		int m = (arc4random() % j);
		//NSLog(@"i=== %d",i);
		//NSLog(@"m=== %d",m);
		if(m!=j && m!=i){
			[array exchangeObjectAtIndex:i withObjectAtIndex: m];
			//[self exchangeSubviewAtIndex:i withSubviewAtIndex:m];//交换两个视图的位置
		}

		//[self swapWithData:data index1:m index2:i];

	}
	int k=0;
	for(UIButton *myview in array){
		k++;
		//[myview setTag:k];
		//NSLog(@"x %@",[myview currentTitle]);
		//UIButton *btn
		[self.view addSubview:myview];

	}
	//NSLog(@"yyyyyyyyyyyyyyyy");
	/*for(UIView * myview in [self.view subviews])
	{
		
			NSLog(@"ddddddddddddddr== %@",[myview currentTitle]);
			//[myview removeFromSuperview];
		
	}
	NSLog(@"vvvvvvvvvvvv");*/
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"_viewDidLoad______");
    [super viewDidLoad];
	self.view = [[[NSBundle mainBundle] loadNibNamed:@"pocker_forTestViewController" owner:self options:nil] lastObject];
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"开始", @"捡九", @"放弃", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar; 
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	#define TESTWITHMOMENTARY		1
	
	#if TESTWITHMOMENTARY == 1
		segmentedControl.momentary = YES;
	#else
		segmentedControl.momentary = NO;
		segmentedControl.selectedSegmentIndex = 0;
	#endif
	
	CFShow(allSubviews(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	[self gameInit];
	[self sendCards];
	
}
-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
	NSNumber *tmp = [aData objectAtIndex:index1];
	[aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
	[aData replaceObjectAtIndex:index2 withObject:tmp];
}







- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[imgv release];
}

@end

