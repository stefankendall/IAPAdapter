IAPAdapter
==========

A small subclass for IAPManager that makes it easy to use with automated testing. Anywhere you would use IAPManager, use IAPAdapter instead.

Usage
------
1.) Get an instance

```objective-c
[IAPAdapter instance]
```

2.) Add purchases for unit testing
```objective-c
[[IAPAdapter instance] addPurchase:@"productId"]

[[IAPAdapter instance] hasPurchased:@"productId"] // true
```

3.) Running in the simulator  
Whenever you try to purchase in the simulator, IAPAdapter will immediately succeed and call your success callback.
