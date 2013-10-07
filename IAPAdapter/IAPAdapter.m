#import "IAPAdapter.h"

@implementation IAPAdapter

+ (IAPAdapter *)instance {
    static IAPAdapter *instance;
    if (instance == nil) instance = [IAPAdapter new];
    return instance;
}

- (id)init {
    if (self = [super init]) {
        self.testPurchases = [@[] mutableCopy];
    }

    return self;
}

- (BOOL)hasPurchased:(NSString *)productId {
    if ([self.testPurchases count] == 0) {
        return [super hasPurchased:productId];
    }
    else {
        return [self.testPurchases containsObject:productId];
    }
}

- (void)addPurchase:(NSString *)productId {
    [self.testPurchases addObject:productId];
}

- (void)resetPurchases {
    self.testPurchases = [@[] mutableCopy];
}

- (void)purchaseProductForId:(NSString *)productId completion:(PurchaseCompletionBlock)completionBlock error:(ErrorBlock)err {
#if (TARGET_IPHONE_SIMULATOR)
    [self addPurchase: productId];
    completionBlock(NULL);
#else
    [super purchaseProductForId:productId completion:completionBlock error:err];
#endif
}

@end