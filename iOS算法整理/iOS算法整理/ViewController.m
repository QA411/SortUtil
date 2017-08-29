//
//  ViewController.m
//  iOS算法整理
//
//  Created by qq on 2017/8/29.
//  Copyright © 2017年 fangxian. All rights reserved.
//

#import "ViewController.h"
#import "SortUtil.h"

@interface ViewController ()

@property(nonatomic) NSMutableArray *sortArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _sortArray = [NSMutableArray arrayWithObjects:@8,@2,@12,@7,@3,@7,@4,nil];
    
#warning Swift排序源码可参考 github源码分享地址：https://github.com/lizelu/DataStruct-Swift/tree/master/AllKindsOfSortForiOS
    
}

//MARK: 冒泡排序
- (IBAction)bubbleSort:(id)sender {
    
    NSMutableArray *arr_M = [NSMutableArray arrayWithObjects:@1,@4,@2,@3,@5,nil];
    [SortUtil bubbleSort:arr_M];
}

//MARK: 选择排序
- (IBAction)selectSort:(id)sender {
    
    NSMutableArray *arr_M = [NSMutableArray arrayWithObjects:@1,@4,@2,@3,@5,nil];
    [SortUtil selectSort:arr_M];
}

//MARK: 插入排序
- (IBAction)inserSort:(id)sender {
    NSMutableArray *arr_M = [NSMutableArray arrayWithObjects:@1,@4,@2,@3,@5,nil];
    [SortUtil inserSort:arr_M];
}

//MARK: 快速排序
- (IBAction)quickSort:(id)sender {
    
    [SortUtil quickSort:_sortArray low:0 high:(int)_sortArray.count - 1];
}

//MARK: 堆排序
- (IBAction)heapsortAsendingOrderSort:(id)sender {
    
    [SortUtil heapsortAsendingOrderSort:_sortArray];
}

//MARK: 归并升序排序
- (IBAction)megerSortAscendingOrderSort:(id)sender {
    
    [SortUtil megerSortAscendingOrderSort:_sortArray];
}

//MARK: 希尔排序
- (IBAction)shellAscendingOrderSort:(id)sender {
    
    [SortUtil shellAscendingOrderSort:_sortArray];
}

//MARK: 基数排序
- (IBAction)radixAscendingOrderSort:(id)sender {
    
    [SortUtil radixAscendingOrderSort:_sortArray];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
