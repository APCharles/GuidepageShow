//
//  GuidePageController.m
//  GuidepageDemo
//
//  Created by 安鹏 on 16/6/20.
//  Copyright © 2016年 安鹏. All rights reserved.
//

#import "GuidePageController.h"
#import "ViewController.h"
#define MAINSCREEN [UIScreen mainScreen].bounds

#define IMAGECOUNT 3

@interface GuidePageController ()<UIScrollViewDelegate>

@property(strong, nonatomic) UIPageControl *page;
@property(strong, nonatomic) UIScrollView *scrollView;


@property (nonatomic, assign) int index;
@end

@implementation GuidePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,MAINSCREEN.size.width , MAINSCREEN.size.height)];
    scroll.pagingEnabled = YES ;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.bounces = NO;
    scroll.delegate = self;
    [self.view addSubview:scroll];
    self.scrollView = scroll;
    
    for (int i = 0; i < IMAGECOUNT; i++) {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(MAINSCREEN.size.width * i, 0, MAINSCREEN.size.width, MAINSCREEN.size.height)];
        image.userInteractionEnabled = YES;
        NSString *imageName = [NSString stringWithFormat:@"引导页%d", i + 1];
        image.image = [UIImage imageNamed:imageName];
        
        /**
         *  在最后一张引导页图片上加一个按钮，进行跳转操作
         */
        if (i == 2) {
            
            image.userInteractionEnabled = YES;
            UIButton *btn = [[UIButton alloc] init];
            btn.backgroundColor = [UIColor clearColor];
            btn.frame = CGRectMake(45, 410, 300, 400);
        
            [btn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
            [image addSubview:btn];
            
            
        }
        
        [scroll addSubview:image];
        
        
    }
    
    scroll.contentSize = CGSizeMake(IMAGECOUNT * MAINSCREEN.size.width, 0);
    
    
    UIPageControl *page = [[UIPageControl alloc] init];
    page.numberOfPages = IMAGECOUNT;
    page.backgroundColor = [UIColor redColor];
    page.center = CGPointMake(MAINSCREEN.size.width * 0.5 , MAINSCREEN.size.height * 0.9);
    page.currentPageIndicatorTintColor = [UIColor colorWithRed:189/255.0 green:289/255.0 blue:189/255.0 alpha:1];
    page.pageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:page];
    self.page = page;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    int a =  (int)(scrollView.contentOffset.x / MAINSCREEN.size.width + 0.5);


    self.page.currentPage =   (int)(scrollView.contentOffset.x / MAINSCREEN.size.width + 0.5);
    
 
    
}

- (void)startClick{
    
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[ViewController alloc ]init];;
}

@end
