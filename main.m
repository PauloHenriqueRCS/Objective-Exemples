#import <Foundation/Foundation.h>

int arraySum (int array[], int n){
  int sum = 0, *ptr;
  int *arrayEnd = array + n;
  
  for (ptr = array; ptr < arrayEnd; ++ptr)
  sum += *ptr;

  return (sum);
}

@interface RandN : NSObject
- (NSInteger) getRandomNumberFrom:(NSInteger)lowNumber
  to:(NSInteger)upperNumber;
@end

@implementation RandN
- (NSInteger) getRandomNumberFrom:(NSInteger)lowNumber
  to:(NSInteger)upperNumber {
  NSInteger a = arc4random_uniform(lowNumber) + upperNumber;
  return a;
}
@end

int main (int argc, const char *argv[]){
	 NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   // arc4random_uniform(5) + 5
     int arraySum (int array[], int n);
     int values[10] = {3,7,-9,3,6,-1,7,9,1,-5};
     NSLog(@"The sum is %i", arraySum(values,10));
   [pool drain];
	return 0;
}