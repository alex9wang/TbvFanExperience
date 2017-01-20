

//#define GOOGLE_API_KEY      @"AIzaSyD97fNgDgBszzMu9po36hkPDKCg3rDPCUI"
//#define GOOGLE_API_KEY      @"AIzaSyCLDSZl4y2CfTWwPzJ933jS2X5jOpDFkEI"
#define GOOGLE_API_KEY      @"AIzaSyBeMaQd1BaScFrjr3MpY7ZuUmZV1XqjawU"  //new


#define BELLATORAPPKEY      @"BELLATORAPPKEY"
#define kNumberOfItems      @20


#define PREF [NSUserDefaults standardUserDefaults]

#define Card_Length     16
#define Card_Month      2
#define Card_Year       2
#define Card_CVC_CVV    3

typedef enum
{
    MenuItemWrite = 0,
    MenuItemSearch = 1,
    MenuItemSetup = 2,
    MenuItemAddon = 3,
}SelectedMenuItem;

typedef enum
{
    SocialTypeFacebook = 0,
    SocialTypeTwitter = 1,
    SocialTypeLinkedIn = 2
}SocialType;



#pragma mark -
#pragma mark - APPLICATION NAME

#define APPLICATION_NAME				@"TBV FAN EXPERIENCE"


#pragma mark -
#pragma mark - WS METHODS

#define CONFIG_PATH                 @"http://api.spike.com/feeds/bellator/1.1/config"
#define SCHEDULE_URL                @"http://api.spike.com/feeds/bellator/1.1/promo_schedule"
#define SPONSERSHIP_URL             @"http://api.spike.com/feeds/bellator/1.0/sponsorship?key=%@"
#define VIDEO_PATH                  @"http://api.spike.com/feeds/bellator/1.1/videos"
#define FIGHTER_DETAIL_URL          @"http://api.spike.com/feeds/bellator/1.1/fighter_detail/%@"
#define FIGHTER_PATH                @"http://api.spike.com/feeds/bellator/1.0/fighters?key=%@&numberOfItems=%@&pageNumber=%@"
#define FIGHTER_BIG_LEFT			@"http://1.images.spike.com/images/shows/bellator/app/fighters/%@/left.png?width=%@"
#define FIGHTER_BIG_RIGHT			@"http://1.images.spike.com/images/shows/bellator/app/fighters/%@/right.png?width=%@"
#define FIGHTER_CENTER              @"http://1.images.spike.com/images/shows/bellator/app/fighters/%@/center.png?width=%@"
#define FIGHTER_HEAD_SHOT			@"http://1.images.spike.com/images/shows/bellator/app/fighters/%@/headshot.png?width=%@"



#define ANDROID_VIDEOS_KEY			@"androidVideosFeed"
#define BASE_ADV_URL                @"http://ad.doubleclick.net/ad/spike.nol.app/wap/offdeck/android/apps/bellator/pos=atfsec0=androidsec1=appssec2=bellatorsec3=%sapp=wapenv=livedeck=offdecksz=%sord=%d"
#define BASE_JUMP_URL               @"http://ad.doubleclick.net/jump/spike.nol.app/wap/offdeck/android/apps/bellator/pos=atfsec0=androidsec1=appssec2=bellatorsec3=%sapp=wapenv=livedeck=offdecksz=%sord=%s"
#define CHAT                        @"chat"
#define CONFIG_FILE                 @"Bellator/bellator-config-override.xml"
#define DEFAULT_LIVE_STAT_UPDATE_INTERVAL			@3000
#define DEFAULT_SIZE                @"300x50"
#define FEATURED_TILES_KEY			@"featuredTilesFeed"
#define FIGHTERS                    @"fighters"
#define FIGHTERS_DETAILS_KEY		@"fighterBellatorFeed"
#define FIGHTERS_KEY                @"fightersFeedPaged"
#define FIGHTERS_LANDING_KEY		@"fighterLandingFeed"
#define FIGHTERS_STATS_KEY			@"fighterStatsFeed"

#define FOURTH_JUDGE_DECISION_KEY	@"fourthJudgeDecisionPoint"
#define FUNNEL_POST_URL_KEY			@"funnelPostUrlBase"
#define ITEMS_PER_PAGE              @20
#define LIVE_EVENT_KEY              @"liveEventFeed"
#define LIVE_FIGHT_POST_ENTRY		@"/spike.com/collections/bellator_%s_fight_%s_round_%s/entries"
#define LIVE_FIGHT_TALLIES			@"/spike.com/collections/bellator_%s_fight_%s_round_%s/tallies.json"
#define LIVE_HOME                   @"Livehome"
#define LIVE_STATS_UPDATE_INTERVAL_KEY			@"liveStatsUpdateInterval"
#define MAX_ADV_SERVER              @100000000000L
#define MAX_IMG_SERVER              @4
#define MIN_ADV_SERVER              @0
#define MIN_IMG_SERVER              @1
#define POST_FIGHT_TALLY			@"/spike.com/collections/bellator_%s_fight_of_the_night/tallies.json"
#define POST_FIGHT_TALLY_POST		@"/spike.com/collections/bellator_%s_fight_of_the_night/entries"
#define POST_HOME                   @"Posthome"
#define POST_SEASON                 @"http://www.spike.com/mobile/bellator_off_season"
#define PRE_FIGHT_TALLY             @"/spike.com/collections/bellator_%s_pre_fight/tallies.json"
#define PRE_FIGHT_TALLY_POST		@"/spike.com/collections/bellator_%s_pre_fight/entries"
#define PRE_HOME                    @"Prehome"
#define PRIVACY_POLICY              @"http://www.spike.com/mobile/bellator_privacy"
#define SCHEDULE                    @"schedule"
#define SCHEDULE_KEY                @"scheduleFeedV2"
#define SEASON_DETAILS_KEY			@"seasonDetailsFeed"
#define SEASON_KEY                  @"seasonsFeed"
#define SERVER_TIME_URL             @"http://schedule.mtvnservices.com/api/v1/now.esi"
#define SETTINGS                    @"settings"
#define SHARE_LINK                  @"http://bit.ly/WKuG2O"
#define SPIKE_IMAGES_HOST			@"images.spike.com"
#define SPIKE_IMAGES_URI			@"http://%d.images.spike.com/images/shows/bellator/"
#define SPONSORSHIP_KEY             @"sponsorshipFeed"
#define TERMS_AND_CONDITIONS_KEY	@"termsAndConditionsFeed"
#define TICKETS_URL                 @"ticketsLink"
#define TOURNAMENT                  @"tournament"
#define TOURNAMENT_KEY              @"tournamentDetailFeed"
#define TWEETS_KEY                  @"tweetsFeed"
#define VIDEO                       @"video"

#define shopUrl                     @"http://bellatorshop.com"
#define liveStatsUpdateIntervalInMilisecs			@3000
#define CTA                         NO
#define goVIPUrl                    @"https://bellator.expapp.com/upgrade/desktop?app=true&appId=72&utm_source=Bellator&utm_medium=app"
#define scheduleUrl                 @"http://gc-utility.stage.myomnigon.com/data/danil.goncharov/schedule.xml"
#define liveEventUrl                @"http://gc-utility.stage.myomnigon.com/data/bellator15_record.xml"
#define fightersUrl                 @"http://gc-utility.stage.myomnigon.com/data/danil.goncharov/fighters.xml"
#define fightersLandingUrl			@"http://api.spike.com/feeds/bellator/1.0/fighter_landing?key=BELLATORAPPKEY"
#define fighterStatsUrl             @"http://compustrike.com/new/api/fighter/overall_stats?api_key=383e8ffd19aaee03792691f055a1ab92&fighter_id=%s"
#define featuredTilesUrl			@"http://demo.omnigon.com/qa/bellator/featured.json"
#define seasonsUrl                  @"http://api.spike.com/feeds/1.0/seasons?key=APIKEYTEST"
#define seasonDetailsUrl			@"http://api.spike.com/feeds/bellator/1.0/season_detail/%s?key=BELLATORAPPKEY"
#define termsAndConditionsUrl		@"http://www.spike.com/fragments/mobile/bellator_terms"
#define tweetsUrl                   @"http://tweetriver.com/tomgreenpoint/bellator.json"
#define tournamentUrl               @"http://api.spike.com/mock_feeds/bellator/1.0/tournament/TournamentFeed.xml"
#define ticketsUrl                  @"http://www.bellator.com/tickets"
//#define sponsorshipFeed             @"http://api.spike.com/feeds/bellator/1.0/sponsorship?key=BELLATORAPPKEY"
//#define fourthJudgeDecisionPoint	@"80"




#define SERVICE_URL                 @"http://192.168.1.217"
#define SIGNUP_API                  @"/api/register"
#define SIGNIN_API                  @"/api/login"


#pragma mark -
#pragma mark - Prefences key


#define PREF_IS_LOGIN				@"islogin"
#define PREF_USERNAME				@"username"
#define PREF_PASSWORD				@"password"


#define PREF_DEVICE_TOKEN			@"client_deviceToken"
#define PREF_USER_TOKEN				@"client_usertoken"
#define PREF_USER_ID				@"client_userid"
#define PREF_REQ_ID                 @"client_requestid"
#define PREF_IS_LOGOUT				@"client_islogout"
#define PREF_LOGIN_OBJECT			@"client_loginobject"
#define PREF_IS_WALK_STARTED		@"client_iswalkstarted"
#define PREF_REFERRAL_CODE			@"client_referral_code"
#define PREF_IS_REFEREE				@"client_is_referee"
#define PREF_FARE_AMOUNT			@"client_fare_amount"
#define PRFE_HOME_ADDRESS			@"client_home_address"
#define PREF_WORK_ADDRESS			@"client_work_address"
#define PRFE_FARE_ADDRESS			@"client_fare_address"
#define PRFE_PRICE_PER_DIST			@"client_price_dist"
#define PRFE_PRICE_PER_TIME			@"client_price_time"
#define PRFE_DESTINATION_ADDRESS	@"client_dist_address"
#define PREF_IS_ETA                 @"client_is_eta"
#define PREF_HOME_LATITUDE			@"client_home_latitude"
#define PREF_HOME_LONGITUDE			@"client_home_longitude"
#define PREF_WORK_LATITUDE			@"client_work_latitude"
#define PREF_WORK_LONGITUDE			@"client_work_longitude"



#pragma mark -
#pragma mark - PARAMETER NAME

#define PARAM_EMAIL                 @"email"
#define PARAM_PASSWORD				@"password"
#define PARAM_FIRST_NAME			@"first_name"
#define PARAM_LAST_NAME				@"last_name"
#define PARAM_PHONE                 @"phone"
#define PARAM_PICTURE				@"picture"
#define PARAM_DEVICE_TOKEN			@"device_token"
#define PARAM_DEVICE_TYPE			@"device_type"
#define PARAM_BIO                   @"bio"
#define PARAM_ADDRESS				@"address"
#define PARAM_KEY                   @"key"
#define PARAM_STATE                 @"state"
#define PARAM_COUNTRY				@"country"
#define PARAM_ZIPCODE				@"zipcode"
#define PARAM_LOGIN_BY				@"login_by"
#define PARAM_SOCIAL_UNIQUE_ID		@"social_unique_id"

#define PARAM_NAME                  @"name"
#define PARAM_AGE                   @"age"
#define PARAM_NOTES                 @"notes"
#define PARAM_TYPE                  @"type"
#define PARAM_PAYMENT_OPT			@"payment_mode"
#define PARAM_ID                    @"id"
#define PARAM_TOKEN                 @"token"
#define PARAM_STRIPE_TOKEN			@"payment_token"
#define PARAM_LAST_FOUR				@"last_four"
#define PARAM_REFERRAL_SKIP			@"is_skip"
#define PARAM_OLD_PASSWORD			@"old_password"
#define PARAM_NEW_PASSWORD			@"new_password"

#define PARAM_LATITUDE				@"latitude"
#define PARAM_LONGITUDE				@"longitude"
#define PARAM_DISTANCE				@"distance"
#define PARAM_REQUEST_ID			@"request_id"
#define PARAM_CASH_CARD				@"cash_or_card"
#define PARAM_DEFAULT_CARD			@"default_card_id"
#define PARAM_COMMENT				@"comment"
#define PARAM_RATING				@"rating"
#define PARAM_REFERRAL_CODE			@"referral_code"
#define PARAM_PROMO_CODE			@"promo_code"
#define PARAM_CARD_ID				@"card_id"

#define PARAM_START_TIME			@"start_time"
#define PARAM_TIME_ZONE				@"time_zone"
#define PARAM_MEMBERS				@"members"
#define PARAM_AMOUNT				@"amount"
#define PARAM_EVENT_ID				@"event_id"

//'request' table's fields
#define PARAM_REQUEST_THING_ID      @"thing_id"


// 'Things' table's fields
#define PARAM_THINGS_NAME              @"name"
#define PARAM_THINGS_VALUE             @"value"
#define PARAM_THINGS_SIZE              @"size"
#define PARAM_THINGS_FROM_ADDRESS      @"from_address"
#define PARAM_THINGS_FROM_LATITUDE     @"from_latitude"
#define PARAM_THINGS_FROM_LONGITUDE    @"from_longitude"
#define PARAM_THINGS_TO_ADDRESS        @"to_address"
#define PARAM_THINGS_TO_LATITUDE       @"to_latitude"
#define PARAM_THINGS_TO_LONGITUDE      @"to_longitude"
#define PARAM_THINGS_DISTANCE          @"distance"
#define PARAM_THINGS_EXPIRE_DATE       @"expire_date"
#define PARAM_THINGS_CLIENTID          @"clientid"
#define PARAM_THINGS_DRIVERID          @"driverid"
#define PARAM_THINGS_IMAGE             @"image"
#define PARAM_THINGS_COMMENT           @"comment"

// THLabel Constants
#define kGradientStartColor             [UIColor colorWithRed:0xD0 / 255.0 green:0xD0 / 255.0 blue:0xD0 / 255.0 alpha:1.0]
#define kGradientEndColor               [UIColor colorWithRed:0xA0 / 255.0 green:0xA0 / 255.0 blue:0xA0 / 255.0 alpha:1.0]
#define kShadowColor                    [UIColor blackColor]
#define kShadowOffset                   CGSizeMake(0.0, UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 4.0 : 2.0)
#define kShadowBlur                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 10.0 : 5.0)

// Default Strings
#define kStringUnknown                  @"UNKNOWN"


//#pragma mark
//#pragma mark constant values
//
//#define DETECTING_RANGE                 500
//#define DRIVER_TYPE                     @"3"
//
//
//extern NSDictionary *dictBillInfo;
//extern int is_completed;
//extern int is_dog_rated;
//extern int is_walker_started;
//extern int is_walker_arrived;
//extern int is_started;
//extern NSArray *arrPage;

//extern NSString *strForCurLatitude;
//extern NSString *strForCurLongitude;
