//
//  SpikeVideos.h
//  TbvFanExperience
//
//  Created by sworld on 8/6/16.
//  Copyright (c) 2016 sworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GUIDInfo : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* isPermaLink;

@end



@interface MediaContent : NSObject

@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) NSString* medium;
@property (nonatomic, strong) NSString* duration;
@property (nonatomic, strong) NSString* isDefault;
@property (nonatomic, strong) NSString* url;

@end

@interface MediaThumbnail : NSObject

@property (nonatomic, strong) NSString* width;
@property (nonatomic, strong) NSString* height;
@property (nonatomic, strong) NSString* url;

- (NSString*)getThumbnailUrl:(int)width;

@end

@interface MediaPlayer : NSObject

@property (nonatomic, strong) NSString* url;

@end

@interface MediaRating : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* scheme;

@end

@interface MediaCategory : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* scheme;

@end

@interface MediaCredit : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* role;
@property (nonatomic, strong) NSString* scheme;

@end

@interface MediaInfo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* copyright;
@property (nonatomic, strong) NSString* keywords;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) MediaContent* content;
@property (nonatomic, strong) MediaThumbnail* thumbnail;
@property (nonatomic, strong) MediaPlayer* player;
@property (nonatomic, strong) MediaRating* rating;
@property (nonatomic, strong) MediaCategory* category;
@property (nonatomic, strong) MediaCredit* credit;

@end


@interface SpikeVideo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* link;
@property (nonatomic, strong) GUIDInfo* guid;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) NSString* putDate;

@property (nonatomic, strong) MediaInfo* mediagroup;

- (instancetype)initData:(NSDictionary *)dict;

@end





@interface SpikeVideos : NSObject

@property (nonatomic, strong) NSMutableArray* arrayVideos;  // SpikeVideo's array


- (instancetype)initXmlData:(NSString *)xmlData;


@end
