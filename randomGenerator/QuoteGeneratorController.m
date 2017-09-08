//
//  QuoteGeneratorController.m
//  randomGenerator
//
//  Created by Admin on 28.08.17.
//  Copyright © 2017 Galiev Danil. All rights reserved.
//

#import "QuoteGeneratorController.h"
#import "QuoteHolder.h"
#import "WordData.h"


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

    NSMutableArray* arrayWithWordData = [NSMutableArray array];

    NSLog(@"tracer before cycle");

    


    for (int i = 0; i < [sortedArray count]; i++) {

        int count = 0;


        if ([[sortedArray objectAtIndex:i] isEqualToString:[sortedArray objectAtIndex:i + 1 ]]) {
            count = count + 1;
        } else {

            WordData* word = [[WordData alloc] init];
            word.word = [sortedArray objectAtIndex:i - 1];
            word.repeatsCount = count;
            [arrayWithWordData addObject:word];
            count = 0;


        }







//        if (i + 1 < [sortedArray count]) {
//
//            WordData* word = [[WordData alloc] init];
//            word.repeatsCount = 0;
//
//            if ([[sortedArray objectAtIndex:i] isEqualToString:[sortedArray objectAtIndex:i + 1]]) {
//                word.word = [sortedArray objectAtIndex:i];
//                word.repeatsCount += 1;
//
//            } else {
//
//
//                [arrayWithWordData addObject:word];
//                word = nil;
//
//            }
//            
//        }

        }




    NSLog(@"tracer before");



    //NSLog(@"repeated words = %@", sortedArray);

    //NSLog(@"wordData array = %@", arrayWithWordData);


    NSLog(@"tracer after");

    for (WordData* word in arrayWithWordData) {

        NSLog(@" %@ : %ld", word.word, (long)word.repeatsCount);
    }













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
