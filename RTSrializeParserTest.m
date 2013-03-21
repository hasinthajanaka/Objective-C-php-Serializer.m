//
//  RTSrializeParserTest.m
//  RuvixTel
//
//  Created by Hasintha on 3/21/13.
//  Copyright (c) 2013 Tharindu Madushanka. All rights reserved.
//
#import <GHUnitIOS/GHUnit.h>
#import "RTphpSerilizationParser.h"
#import "RTSerializer.h"

@interface RTSrializeParserTest : GHTestCase{
    RTSerializer *serializer;
}

@end

@implementation RTSrializeParserTest

-(void)setUp{
    serializer=[[RTSerializer alloc]init];
}
-(void)testSerialize{
    NSMutableDictionary *pack=[NSMutableDictionary dictionary];
    [pack setValue:@"id" forKey:@"3"];
    [pack setValue:@"tariffid" forKey:@"152"];
    [pack setValue:@"rgid" forKey:@"1"];
    [pack setValue:@"name" forKey:@"Test"];
    
    NSMutableDictionary *data=[NSMutableDictionary dictionary];
    [data setValue:@"123" forKey:@"username"];
    [data setValue:@"456" forKey:@"password"];
    [data setValue:@"name"forKey:@"name"];
    [data setValue:@"country" forKey:@"country"];
    [data setValue:@"email" forKey:@"email_address"];
    [data setValue:pack forKey:@"package"];
    NSString *str=@"";
    str=[serializer  serialize:data inString:str];
    GHTestLog(@"%@",str);

}

-(void)testDesirialize{
  id object=[serializer deserialize:@"a:1:{i:0;a:4:{s:2:\"id\";s:1:\"3\";s:8:\"tariffid\";s:3:\"152\";s:4:\"rgid\";s:1:\"1\";s:4:\"name\";s:4:\"Test\";}}"];
    GHTestLog(@"%@",object);
}
@end
