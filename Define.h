//
//  Define.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/13.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#ifndef kitchenOnline_Define_h
#define kitchenOnline_Define_h
#define kUMengKey @"558d15bd67e58eabb600049e"
#define kImageUrl @"http://pic.ecook.cn/web/%@.jpg!s3"
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kMainUrl @"http://www.ecook.cn/public/selectCommentByCidInFloor.shtml?machine=33b9fed4b35973eedef88fb68d619c16&mid=9075589&page=2&sort=asc&version=10.8.0"
#define kArticleDetailUrl @"http://www.ecook.cn/public/selectWeiboById.shtml?id=9075589&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
#define kFirstUrl @"http://www.ecook.cn/public/getHomePageNew.shtml?machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
#define kArticalUrl @"http://www.ecook.cn/public/selectWeiboById.shtml?id=9075589&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
#define kArticalUrl1 @"http://www.ecook.cn/public/selectCommentByCidInFloor.shtml?machine=33b9fed4b35973eedef88fb68d619c16&mid=%@&page=1&sort=asc&version=10.8.0"
//@"http://www.ecook.cn/public/selectCommentByCidInFloor.shtml?machine=33b9fed4b35973eedef88fb68d619c16&mid=9075589&page=1&sort=asc&version=10.8.0"
#define kEssencepostUrl @"http://www.ecook.cn/public/selectWeiboListByIdList.shtml?ids=9134172, 9133401, 9112512, 9109749, 9104042, 9103388, 9103340, 9096545, 9092897, 9091298, 9087581, 9079452, 9078567, 9075576, 9073670, 9068981, 9047683, 9046874, 9046752, 9046162, 9039414, 9039274, 9030608, 9030606, 9030141, 9022603, 9019475, 9018859, 9006987, 9006313, 9003411, 8998117, 8997680, 8997618, 8994450, 8989644, 8988802, 8987600, 8987378, 8987321, 8987198, 8986834, 8986795, 8985264, 8980767, 8979645, 8979279, 8978305, 8976984, 8976398, 8972849, 8970834, 8969507, 8964493, 8950721, 8943151, 8943039, 8942287, 8942095, 8933884, 8933479, 8933345, 8932945, 8932024, 8931932, 8931860, 8931683, 8925659, 8925572, 8925401, 8924828, 8924434, 8924256, 8923642, 8921742, 8915799, 8914134, 8908474, 8908469, 8908114, 8907683, 8906447, 8893925, 8889831, 8883591, 8882621, 8881865, 8876734, 8876686, 8876439, 8876428, 8875707, 8875596, 8875440, 8875334, 8873931, 8869401, 8868031, 8866678,8866331&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
#define kLatestUrl @"http://www.ecook.cn/public/selectWeiboListByIdList.shtml?ids=9154330, 9154317, 9154234, 9154224, 9154206, 9154158, 9154149, 9154102, 9154093, 9154034, 9154026, 9154020, 9153999, 9153972, 9153949, 9153912, 9153888, 9153870, 9153832, 9153752, 9153686, 9153643, 9153487, 9153484, 9153425, 9153420, 9153397, 9153390, 9153378, 9153377, 9153363, 9153356, 9153355, 9153340, 9153164, 9153104, 9153056, 9152914, 9152852, 9152829, 9152672, 9152599, 9152559, 9152463, 9152454, 9152327, 9152300, 9152022, 9151986, 9151956, 9151944, 9151798, 9151734, 9151702, 9151687, 9151618, 9151460, 9151202, 9151180, 9151174, 9151075, 9151048, 9151019, 9150990, 9150953, 9150937, 9150904, 9150830, 9150801, 9150795, 9150755, 9150689, 9150684, 9150679, 9150668, 9150593, 9150587, 9150557, 9150442, 9150413, 9150406, 9150395, 9150350, 9150341, 9150298, 9150090, 9150055, 9149977, 9149929, 9149878, 9149831, 9149763, 9149756, 9149747, 9149742, 9149736, 9149703, 9149693, 9149672, 9149671&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"

#define kFollowUrl @"http://www.ecook.cn/public/selectWeiboListByIdList.shtml?ids=9103340, 9103388, 9092897, 9055610, 9046874, 9046752, 9030141, 8997680, 8997618, 8969507, 8976984, 8907683, 8890231, 8889831, 8852972, 8793217, 8763163, 8752814, 8717824, 8650129, 8650005, 8611573, 8577184, 8517593, 8525732, 8490846, 8460457, 8454835, 8390249, 8342330, 8294154, 8218800, 8218782, 8204656, 8180147, 8142969, 8120671, 8098704, 8094874, 8026872, 7970244, 7958235, 7898876, 7863779, 7812032, 7752946, 7732267, 7663504, 7592922, 7566815, 7504201, 7504119, 7484182, 7442537, 7387682, 7386086, 7378850, 7362331, 7333158, 7296705, 7295108, 7279458, 7272595, 7250265, 7218030, 7191777, 7179129, 7173265, 7172580, 7164158, 7163933, 7146857, 7146068, 7108540, 7107976, 7107780, 7051895, 7050651, 7050078, 6997639, 6976027, 6940857, 6934105, 6895958, 6889377, 6870401, 6834820, 6764710, 6746149, 6738438, 6725018, 6700717, 6676488, 6667137, 6631518, 6630535, 6593035, 6584487, 6557728, 6544584&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"

#define kGottalentUrl @"http://www.ecook.cn/public/getHotPersonList.shtml?machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
#define kMenuDetailUrl @"http://www.ecook.cn/ecookjson/viewServlet?id=%@&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
//9195491
#define kLatesAtticleDetailtUrl @"http://www.ecook.cn/public/selectWeiboById.shtml?id=%@&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"
//8580104
#define kAuthorDetailUrl @"http://www.ecook.cn/public/selectUserWeibo.shtml?frienduid=%@&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0"


#define kRecentPopularUrl @"http://121.40.129.231/public/getRecentPopularIdList.shtml"
#define kRecentPopularUrl1 @"http://121.40.129.231/public/selectRecipeListByIdList.shtml?ids=%@&version=10.8.1&machine=33b9fed4b35973eedef88fb68d619c16 "

#define kTheLatestUrl @"http://www.ecook.cn/public/selectLatestContentIdList.shtml?ids=&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.1"
#define kTheLatestUrl1 @"http://121.40.129.231/public/selectRecipeListByIdList.shtml?ids=%@&version=10.8.1"
#define kCommonUrl @"http://121.40.129.231/public/getHotRecipeWorksIdList.shtml"
#define kCommonUrl1 @"http://121.40.129.231/public/selectRecipeListByIdList.shtml?ids=%@&version=10.8.1"
#define kShareCookingSkillsUrl @"http://121.40.129.231/public/selectWeiboIdList.shtml?id=&machine=33b9fed4b35973eedef88fb68d619c16&mid=&type=hodgepodge_reply&version=10.8.1"
#endif
