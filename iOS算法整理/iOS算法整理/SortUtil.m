//
//  SortUtil.m
//  iOS算法整理
//
//  Created by qq on 2017/8/29.
//  Copyright © 2017年 fangxian. All rights reserved.
//

#import "SortUtil.h"

@implementation SortUtil

#pragma mark - 冒泡排序
+ (void)bubbleSort:(NSMutableArray *)array{
    
    //遍历`数组的个数`次
    /*
     i = 0 的时候，j的相邻两个位置都要比较排一下位置：  第1次i循环冒泡出arr_M中最小的
     
     j = 0 的时候：arr_M = 41235
     j = 1 的时候：arr_M = 42135
     j = 2 的时候：arr_M = 42315
     j = 3 的时候：arr_M = 42351
     
     i = 1;         第2次i循环冒泡出剩余最小的  以此类推
     ……  ……
     */
    for (int i = 0; i < array.count; ++i) {
        
        //遍历数组的每一个`索引`（不包括最后一个,因为比较的是j+1）
        for (int j = 0; j < array.count-1 - i; ++j) {
            
            //根据索引的`相邻两位`进行`比较`
            if (array[j] < array[j+1]) {
                
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            
        }
    }
    NSLog(@"冒泡排序：%@",array);
}

#pragma mark - 选择排序
+ (void)selectSort:(NSMutableArray *)array{
    for (int i=0; i<array.count; i++) {
        
        for (int j=i+1; j<array.count; j++) {
            
            if (array[i]<array[j]) {
                
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
                
            }
        }
    }
    NSLog(@"选择排序：%@",array);
}

#pragma mark - 插入排序
+ (void)inserSort:(NSMutableArray *)array{
    for (int i = 0; i < array.count; i++) {
        NSNumber *temp = array[i];
        int j = i-1;
        
        while (j >= 0 && [array[j] compare:temp] == NSOrderedDescending) {
            [array replaceObjectAtIndex:j+1 withObject:array[j]];
            j--;
        }
        [array replaceObjectAtIndex:j+1 withObject:temp];
        NSLog(@"插入排序排序中:%@",array);
    }
}

#pragma mark - 快速排序
+ (void)quickSort:(NSMutableArray *)array low:(int)low high:(int)high
{
    if(array == nil || array.count == 0 || low >= high){
        NSLog(@"注意快速排序条件");
        return;
    }
    
    //取中值
    int middle = low + (high - low)/2;
    NSNumber *prmt = array[middle];
    int i = low;
    int j = high;
    
    //开始排序，使得left<prmt 同时right>prmt
    while (i <= j) {
        //        while ([array[i] intValue] < [prmt intValue]) {
        //该行与下一行作用相同
        
        while ([array[i] compare:prmt] == NSOrderedAscending) {
            i++;
        }
        //        while ([array[j] intValue] > [prmt intValue]) {
        //该行与下一行作用相同
        
        while ([array[j] compare:prmt] == NSOrderedDescending) {
            j--;
        }
        
        if(i <= j){
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            j--;
        }
        NSLog(@"快速排序排序中:%@",array);
    }
    if (low < j) {
        [self quickSort:array low:low high:j];
    }
    if (high > i) {
        [self quickSort:array low:i high:high];
    }
}

#pragma mark - 堆排序
+ (void)heapsortAsendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSInteger endIndex = ascendingArr.count - 1;
    ascendingArr = [self heapCreate:ascendingArr];
    while (endIndex >= 0) {
        //        NSLog(@"将list[0]:\%@与list[\(endIndex)]:\%@交换", ascendingArr[0], ascendingArr[endIndex]);
        NSNumber *temp = ascendingArr[0];
        ascendingArr[0] = ascendingArr[endIndex];
        ascendingArr[endIndex] = temp;
        endIndex -= 1;
        ascendingArr = [self heapAdjast:ascendingArr withStartIndex:0 withEndIndex:endIndex + 1];
    }
    NSLog(@"堆排序结果：%@", ascendingArr);
}

+ (NSMutableArray *)heapCreate:(NSMutableArray *)array
{
    NSInteger i = array.count;
    while (i > 0) {
        array = [self heapAdjast:array withStartIndex:i - 1 withEndIndex:array.count];
        i -= 1;
    }
    return array;
}

+ (NSMutableArray *)heapAdjast:(NSMutableArray *)items withStartIndex:(NSInteger)startIndex withEndIndex:(NSInteger)endIndex
{
    NSNumber *temp = items[startIndex];
    NSInteger fatherIndex = startIndex + 1;
    NSInteger maxChildIndex = 2 * fatherIndex;
    while (maxChildIndex <= endIndex) {
        if (maxChildIndex < endIndex && [items[maxChildIndex - 1] floatValue] < [items[maxChildIndex] floatValue]) {
            maxChildIndex++;
        }
        if ([temp floatValue] < [items[maxChildIndex - 1] floatValue]) {
            items[fatherIndex - 1] = items[maxChildIndex - 1];
        } else {
            break;
        }
        fatherIndex = maxChildIndex;
        maxChildIndex = fatherIndex * 2;
    }
    items[fatherIndex - 1] = temp;
    return items;
}

#pragma mark - 归并升序排序
+ (void)megerSortAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
    for (NSNumber *num in ascendingArr) {
        NSMutableArray *subArray = [NSMutableArray array];
        [subArray addObject:num];
        [tempArray addObject:subArray];
    }
    while (tempArray.count != 1) {
        NSInteger i = 0;
        while (i < tempArray.count - 1) {
            tempArray[i] = [self mergeArrayFirstList:tempArray[i] secondList:tempArray[i + 1]];
            [tempArray removeObjectAtIndex:i + 1];
            
            i++;
        }
    }
    NSLog(@"归并升序排序结果：%@", ascendingArr);
}

+ (NSArray *)mergeArrayFirstList:(NSArray *)array1 secondList:(NSArray *)array2 {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSInteger firstIndex = 0, secondIndex = 0;
    while (firstIndex < array1.count && secondIndex < array2.count) {
        if ([array1[firstIndex] floatValue] < [array2[secondIndex] floatValue]) {
            [resultArray addObject:array1[firstIndex]];
            firstIndex++;
        } else {
            [resultArray addObject:array2[secondIndex]];
            secondIndex++;
        }
    }
    while (firstIndex < array1.count) {
        [resultArray addObject:array1[firstIndex]];
        firstIndex++;
    }
    while (secondIndex < array2.count) {
        [resultArray addObject:array2[secondIndex]];
        secondIndex++;
    }
    return resultArray.copy;
}

#pragma mark - 希尔排序 升序
+ (void)shellAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSMutableArray *buckt = [self createBucket];
    NSNumber *maxnumber = [self listMaxItem:ascendingArr];
    NSInteger maxLength = numberLength(maxnumber);
    for (int digit = 1; digit <= maxLength; digit++) {
        // 入桶
        for (NSNumber *item in ascendingArr) {
            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
            NSMutableArray *mutArray = buckt[baseNumber];
            [mutArray addObject:item];
        }
        NSInteger index = 0;
        for (int i = 0; i < buckt.count; i++) {
            NSMutableArray *array = buckt[i];
            while (array.count != 0) {
                NSNumber *number = [array objectAtIndex:0];
                ascendingArr[index] = number;
                [array removeObjectAtIndex:0];
                index++;
            }
        }
    }
    NSLog(@"希尔升序排序结果：%@", ascendingArr);
}

+ (NSMutableArray *)createBucket {
    NSMutableArray *bucket = [NSMutableArray array];
    for (int index = 0; index < 10; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [bucket addObject:array];
    }
    return bucket;
}

+ (NSNumber *)listMaxItem:(NSArray *)list {
    NSNumber *maxNumber = list[0];
    for (NSNumber *number in list) {
        if ([maxNumber integerValue] < [number integerValue]) {
            maxNumber = number;
        }
    }
    return maxNumber;
}

NSInteger numberLength(NSNumber *number) {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    return string.length;
}

+ (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit {
    if (digit > 0 && digit <= numberLength(number)) {
        NSMutableArray *numbersArray = [NSMutableArray array];
        NSString *string = [NSString stringWithFormat:@"%ld", [number integerValue]];
        for (int index = 0; index < numberLength(number); index++) {
            [numbersArray addObject:[string substringWithRange:NSMakeRange(index, 1)]];
        }
        NSString *str = numbersArray[numbersArray.count - digit];
        return [str integerValue];
    }
    return 0;
}

#pragma mark - 基数排序  升序
+ (void)radixAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSMutableArray *buckt = [self createBucket];
    NSNumber *maxnumber = [self listMaxItem:ascendingArr];
    NSInteger maxLength = numberLength(maxnumber);
    for (int digit = 1; digit <= maxLength; digit++) {
        // 入桶
        for (NSNumber *item in ascendingArr) {
            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
            NSMutableArray *mutArray = buckt[baseNumber];
            [mutArray addObject:item];
        }
        NSInteger index = 0;
        for (int i = 0; i < buckt.count; i++) {
            NSMutableArray *array = buckt[i];
            while (array.count != 0) {
                NSNumber *number = [array objectAtIndex:0];
                ascendingArr[index] = number;
                [array removeObjectAtIndex:0];
                index++;
            }
        }
    }
    NSLog(@"基数升序排序结果：%@", ascendingArr);
}
@end
