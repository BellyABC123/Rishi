//
//  ImageKeyFinder.m
//  Rishi
//
//  Created by Abhineet Prasad on 23/09/13.
//
//

#import "ImageKeyFinder.h"

@implementation ImageKeyFinder

static NSDictionary* imageDictionary = nil;

+(NSDictionary*)getImageDictionary{
    if(!imageDictionary){
        ImageKey imKey ;
        imKey.enumShade = EnumShadeDark;
        imKey.enumSide = EnumSideLeft;
        imKey.uiControlState = UIControlStateDisabled;
       return [NSDictionary dictionaryWithObject:@"hello" forKey:&imKey];
    }
}

+(NSString*)getImagePath:(ImageKey *)imagekey{
    [imageDictionary objectForKey:&imagekey];
}

@end
