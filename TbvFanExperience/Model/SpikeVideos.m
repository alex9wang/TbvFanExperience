//
//  SpikeVideos.m
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import "SpikeVideos.h"
#import "XMLDictionary.h"


@implementation GUIDInfo

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"GUIDInfo: %@", dict);
    
    _text       = [dict valueForKey:@"__text"];
    _isPermaLink     = [dict valueForKey:@"_isPermaLink"];
    
    return self;
}

@end

@implementation MediaContent

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaContent: %@", dict);
    
    _type       = [dict valueForKey:@"_type"];
    _medium     = [dict valueForKey:@"_medium"];
    _duration   = [dict valueForKey:@"_duration"];
    _isDefault  = [dict valueForKey:@"_isDefault"];
    _url        = [dict valueForKey:@"_url"];
    
    return self;
}

@end


@implementation MediaThumbnail

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaThumbnail: %@", dict);
    
    _width      = [dict valueForKey:@"_width"];
    _height     = [dict valueForKey:@"_height"];
    _url        = [dict valueForKey:@"_url"];
    
    return self;
}

- (NSString*)getThumbnailUrl:(int)width {
    
    //NSRange startRange  = [_url rangeOfString:@""];
    NSRange endRange    = [_url rangeOfString:@"?"];
    
    NSRange searchRange = NSMakeRange(0, endRange.location);
    NSString *needle = [_url substringWithRange:searchRange];
    
    int oldWidth    = (int)_width.integerValue;
    int oldHeight   = (int)_height.integerValue;
    int height = oldHeight / (oldWidth / width);
    
    NSString *newUrl = [NSString stringWithFormat:@"%@?width=%d&height=%d&crop=true", needle, width, height];
    return newUrl;
}

@end


@implementation MediaPlayer

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaPlayer: %@", dict);
    
    _url     = [dict valueForKey:@"_url"];
    
    return self;
}

@end


@implementation MediaRating

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaRating: %@", dict);
    
    _text       = [dict valueForKey:@"__text"];
    _scheme     = [dict valueForKey:@"_scheme"];
    
    return self;
}

@end


@implementation MediaCategory

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaCategory: %@", dict);
    
    _text       = [dict valueForKey:@"__text"];
    _scheme     = [dict valueForKey:@"_scheme"];
    
    return self;
}

@end


@implementation MediaCredit

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"MediaCredit: %@", dict);
    
    _text       = [dict valueForKey:@"__text"];
    _role       = [dict valueForKey:@"_role"];
    _scheme     = [dict valueForKey:@"_scheme"];
    
    return self;
}

@end


@implementation MediaInfo

- (instancetype)initData:(NSDictionary *)dict {
    
    NSLog(@"MediaInfo: %@", dict);
    
    _title      = [dict valueForKey:@"media:title"];
    _copyright  = [dict valueForKey:@"media:copyright"];
    _keywords   = [dict valueForKey:@"media:keywords"];
    __description  = [dict valueForKey:@"media:description"];
    
    NSDictionary    *subDict = [dict valueForKey:@"media:content"];
    _content    = [[MediaContent alloc] initData:subDict];
    
    subDict     = [dict valueForKey:@"media:thumbnail"];
    _thumbnail  = [[MediaThumbnail alloc] initData:subDict];
    
    subDict     = [dict valueForKey:@"media:player"];
    _player     = [[MediaPlayer alloc] initData:subDict];
    
    subDict     = [dict valueForKey:@"media:rating"];
    _rating     = [[MediaRating alloc] initData:subDict];
    
    subDict     = [dict valueForKey:@"media:category"];
    _category   = [[MediaCategory alloc] initData:subDict];
    
    subDict     = [dict valueForKey:@"media:credit"];
    _credit     = [[MediaCredit alloc] initData:subDict];
    
    return self;
}

@end

@implementation SpikeVideo

- (instancetype)initData:(NSDictionary *)dict {
    
    //NSLog(@"SpikeVideo: %@", dict);
    
    _title  = [dict objectForKey:@"title"];
    _link  = [dict objectForKey:@"link"];
    
    NSDictionary    *guid = [dict objectForKey:@"guid"];
    if (guid != nil) {
        _guid = [[GUIDInfo alloc] initData:guid];
    }
    
    __description = [dict objectForKey:@"description"];
    _putDate = [dict objectForKey:@"putDate"];
    
    NSDictionary *dictMedia = [dict objectForKey:@"media:group"];
    _mediagroup = [[MediaInfo alloc] initData:dictMedia];
    
    return self;
}

@end


@implementation SpikeVideos

- (instancetype)initXmlData:(NSString *)xmlData {
    
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlData];
    //NSLog(@"dictionary: %@", xmlDoc);
    
    NSDictionary *dictChannel  = [xmlDoc valueForKey:@"channel"];
    NSMutableArray *arrVideos  = [dictChannel valueForKey:@"item"];
    
    _arrayVideos = [[NSMutableArray alloc] init];
    for (int i = 0; i < arrVideos.count; i ++) {
        NSDictionary   *dictItem = [arrVideos objectAtIndex:i];
        
        SpikeVideo  *video = [[SpikeVideo alloc] initData:dictItem];
        [_arrayVideos addObject:video];
    }
    
    return self;
}



@end
