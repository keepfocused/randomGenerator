//
//  QuoteGeneratorController.m
//  randomGenerator
//
//  Created by Admin on 28.08.17.
//  Copyright © 2017 Galiev Danil. All rights reserved.
//

#import "QuoteGeneratorController.h"
#import "QuoteHolder.h"


@interface QuoteGeneratorController ()

@end

@implementation QuoteGeneratorController

- (void)viewDidLoad {
    [super viewDidLoad];



    NSString* path = [[NSBundle mainBundle] pathForResource:@"quotes"
                                                     ofType:@"txt"];


    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];





//    while ([content containsString:@"["]) {
//        content = [content stringByReplacingOccurrencesOfString:@"[" withString:@""];
//    }
//
//    while ([content containsString:@"]"]) {
//        content = [content stringByReplacingOccurrencesOfString:@"]" withString:@""];
//    }

    //NSLog(@"Source txt = %@", content);




    NSArray* splitByLines = [content componentsSeparatedByString:@"\n"];

   // NSLog(@"separated string = %@", splitByLines);

    NSMutableArray* editedText = [NSMutableArray array];

    for (NSString* str in splitByLines) {

    //NSLog(@"first obj = %@",str);

        NSString* tempStr2 = str;

    while (([tempStr2 containsString:@"."] || [tempStr2 containsString:@""""] || [tempStr2 containsString:@","] || [tempStr2 containsString:@"//"] || [tempStr2 containsString:@"("] || [tempStr2 containsString:@")"])) {

            NSString* tempStr = str;

            tempStr = [tempStr stringByReplacingOccurrencesOfString:@"." withString:@""];
            tempStr = [tempStr stringByReplacingOccurrencesOfString:@"," withString:@""];
            tempStr = [tempStr stringByReplacingOccurrencesOfString:@"""" withString:@""];
            tempStr = [tempStr stringByReplacingOccurrencesOfString:@"//" withString:@""];
            tempStr = [tempStr stringByReplacingOccurrencesOfString:@"(" withString:@""];
            tempStr = [tempStr stringByReplacingOccurrencesOfString:@")" withString:@""];

        tempStr2 = tempStr;

            [editedText addObject:tempStr];
        }
   }


    NSString* combinedString = [editedText componentsJoinedByString:@" "];

    //NSLog(@"combined string = %@", combinedString);

    NSArray* singleWords = [combinedString componentsSeparatedByString:@" "];

   // NSLog(@" single words array = %@", singleWords);

    NSMutableArray* tempArray = [[NSMutableArray alloc] init];
    NSMutableArray* repeatedWords = [NSMutableArray array];



    for (NSString* comparingWord in singleWords) {

        if ([tempArray count] > 0) {

            for (NSString* alreadyContainedWord in tempArray) {

                if ([alreadyContainedWord isEqualToString:comparingWord]) {
                    [repeatedWords addObject:comparingWord];
                }
            }

            [tempArray addObject:comparingWord];



        } else [tempArray addObject:comparingWord];

    }

    //NSString* monoString = [repeatedWords componentsJoinedByString:@" "];

    NSMutableArray* sortedArray = [NSMutableArray array];

    sortedArray = [repeatedWords sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    


    NSLog(@"repeated words = %@", sortedArray);









    //NSLog(@"Edited text = %@", editedText);






    //NSArray* splitBySpace = [[splitByLines firstObject] componentsSeparatedByString:@" "];




//    NSMutableArray* editedText = [NSMutableArray array];
//
//    for (NSString* str in splitByLines) {
//        NSString* tempString;
//
//        while ([str containsString:@"["] && [str containsString:@"]"] && [str containsString:@"//"]) {
//
//            tempString = [str stringByReplacingOccurrencesOfString:@"\\" withString:@""];
//            tempString = [str stringByReplacingOccurrencesOfString:@"[" withString:@""];
//            tempString = [str stringByReplacingOccurrencesOfString:@"]" withString:@""];
//            [editedText addObject:tempString];
//        }
//    }
//
//    NSLog(@"new content = %@", editedText);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
