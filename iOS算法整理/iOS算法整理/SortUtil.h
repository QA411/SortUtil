//
//  SortUtil.h
//  iOS算法整理
//
//  Created by qq on 2017/8/29.
//  Copyright © 2017年 fangxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortUtil : NSObject

#pragma mark - 冒泡排序
+ (void)bubbleSort:(NSMutableArray *)array;
#pragma mark - 选择排序
+ (void)selectSort:(NSMutableArray *)array;
#pragma mark - 插入排序
+ (void)inserSort:(NSMutableArray *)array;
#pragma mark - 快速排序
+ (void)quickSort:(NSMutableArray *)array low:(int)low high:(int)high;


#pragma mark - 堆排序
+ (void)heapsortAsendingOrderSort:(NSMutableArray *)ascendingArr;
#pragma mark - 归并升序排序
+ (void)megerSortAscendingOrderSort:(NSMutableArray *)ascendingArr;
#pragma mark - 希尔排序
+ (void)shellAscendingOrderSort:(NSMutableArray *)ascendingArr;
#pragma mark - 基数排序
+ (void)radixAscendingOrderSort:(NSMutableArray *)ascendingArr;
@end
