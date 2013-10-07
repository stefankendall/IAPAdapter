#import "IAPManager.h"

@interface IAPAdapter : IAPManager
@property(nonatomic, strong) NSMutableArray *testPurchases;

+ (IAPAdapter *)instance;

- (void)addPurchase:(NSString *)productId;

- (void)resetPurchases;

@end