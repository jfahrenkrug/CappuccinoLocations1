@implementation DemoData : CPObject

+ (CPString)exampleJSONString {
    var string = @"[{\"id\": 1, \"latitude\": \"39.099470\", \"longitude\": \"-94.563500\", \"description\": \"Corner of Twelfth and Vine\", \"transportation_kind\": \"\"}, {\"id\": 2, \"latitude\": \"37.802109\", \"longitude\": \"-122.432691\", \"description\": \"Moscone Center West\", \"transportation_kind\": \"S\"}]";
    
    return string;
}

@end