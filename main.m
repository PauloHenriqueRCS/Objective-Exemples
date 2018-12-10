#import <Foundation/Foundation.h>


@interface Fibonacci  : NSObject  
-(void)generateFibonnaciSeries;
@end

@implementation Fibonacci
-(void)generateFibonnaciSeries
{
    NSMutableArray *mArray = [NSMutableArray new];
    NSNumber *fibNum1 = [NSNumber numberWithDouble:1];
    NSNumber *fibNum2 = [NSNumber numberWithDouble:1];
    [mArray addObject:fibNum1];
    [mArray addObject:fibNum2];
    
    for (int i=2; i<20; i++)
        [mArray addObject:[NSNumber numberWithDouble:[[mArray objectAtIndex:i-1] doubleValue] +[[mArray objectAtIndex:i-2] doubleValue]]];
    NSLog(@"%@",mArray);
}
@end

@interface MergeSort  : NSObject
-(NSArray *)mergeSort:(NSArray *)unsortedArray;
-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr;
@end

@implementation MergeSort 
-(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if ([unsortedArray count] < 2)
        return unsortedArray;
    long middle = ([unsortedArray count]/2);   
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, ([unsortedArray count] - middle));
    NSArray *rightArr = [unsortedArray subarrayWithRange:right];
    NSArray *leftArr = [unsortedArray subarrayWithRange:left];
    //Or iterate through the unsortedArray and create your left and right array
    //for left array iteration starts at index =0 and stops at middle, for right array iteration starts at midde and end at the end of the unsorted array
    NSArray *resultArray =[self merge:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
    return resultArray;
}

-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count])
    {
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue])
            [result addObject:[leftArr objectAtIndex:left++]];
        else
            [result addObject:[rightArr objectAtIndex:right++]];
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}
@end


@interface InsertionSort : NSObject
-(NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray;
@end

@implementation InsertionSort 
-(NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray
{
    long count = unsortedDataArray.count;
    int i,j,insertionSortCount=0;
    for (i=1; i<count;i++)     
    {         
        j=i;
        while(j>0 && [[unsortedDataArray objectAtIndex:(j-1)] intValue] > [[unsortedDataArray objectAtIndex:j] intValue])
        {
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            j=j-1;
            insertionSortCount++;
        }
    }
    return unsortedDataArray;
}
@end

int main(void){
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    Fibonacci *fib = [[Fibonacci alloc]init];
    NSLog(@"Fibonacci");
    fib.generateFibonnaciSeries;
    
    NSArray *dArray =@[@101, @201, @301,@121,@11,@123,@21,@14,@32,@76,@89,@987,@65];
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:dArray];

    MergeSort *ss = [[MergeSort alloc] init];
    NSArray *mergeSortArray = [ss mergeSort:dataArray];
    
    InsertionSort *is = [[InsertionSort alloc] init];
    NSArray *insertSortArray = [is insertionSort:dataArray];
    
    NSLog(@"InsertionSort");
    NSLog(@"%@", insertSortArray);
   
    NSLog(@"MergeSort");
    NSLog(@"%@", mergeSortArray);

 
   
    [pool release];
    return 0;
}