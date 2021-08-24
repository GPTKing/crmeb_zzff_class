--
-- 表的结构 `eb_article`
--

CREATE TABLE `eb_article` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章管理ID',
  `cid` varchar(255) DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `author` varchar(255) DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `synopsis` varchar(255) DEFAULT NULL COMMENT '文章简介',
  `label` varchar(2000) DEFAULT '[]' COMMENT '标签',
  `share_title` varchar(255) DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) DEFAULT NULL COMMENT '文章分享简介',
  `visit` int(25) DEFAULT '0' COMMENT '浏览次数',
  `sort` int(10) UNSIGNED DEFAULT '0' COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '状态',
  `add_time` varchar(255) DEFAULT NULL COMMENT '添加时间',
  `hide` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否隐藏',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员id',
  `mer_id` int(10) UNSIGNED DEFAULT '0' COMMENT '商户id',
  `is_hot` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否轮播图(小程序)',
  `consult_image` varchar(255) DEFAULT NULL COMMENT '活动咨询图片',
  `consult_type` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '活动咨询类型 1 图片 2视屏',
  `is_consult` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否活动咨询',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章管理表';

--
-- 转存表中的数据 `eb_article`
--

INSERT INTO `eb_article` (`id`, `cid`, `title`, `author`, `image_input`, `synopsis`, `label`, `share_title`, `share_synopsis`, `visit`, `sort`, `url`, `status`, `add_time`, `hide`, `admin_id`, `mer_id`, `is_hot`, `is_banner`, `consult_image`, `consult_type`, `is_consult`, `is_show`) VALUES
(1, '1', '不忘初心，逐梦前行 | 众邦科技2021战略年会成功举办', NULL, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/5bcb5202102041054465661.jpg', '众邦科技2021战略年会成功举办', '[\"\\u7a0b\\u5e8f\\u5458\"]', NULL, NULL, 112, 0, NULL, NULL, '1612143328', 0, 0, 0, 0, 0, NULL, 0, 0, 1),
(2, '2', '定制开发一套知识付费系统需要注意些什么', 'admin', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/56c60202103261539229569.png', '定制开发一套知识付费系统需要注意事项注意些什么', '[\"\\u70ed\\u95e8\\u65b0\\u95fb\"]', NULL, NULL, 129, 0, NULL, 1, '1605172204', 0, 0, 0, 0, 0, NULL, 0, 0, 1),
(3, '2', 'CRMEB知识付费系统v1.4.4功能使用详解', 'admin', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/419c1202103261546222179.png', 'CRMEB知识付费系统功能详解', '[\"\\u529f\\u80fd\\u66f4\\u65b0\"]', NULL, NULL, 270, 0, NULL, 1, '1605172204', 0, 0, 0, 0, 0, NULL, 0, 0, 1),
(4, '2', 'CRMEB知识付费系统v1.4.4功能更新发布！', NULL, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6cd69202103301204279962.png', 'CRMEB知识付费系统v1.4.4功能更新发布！', '[\"\\u529f\\u80fd\\u66f4\\u65b0\"]', NULL, NULL, 371, 0, NULL, NULL, '1617076408', 0, 0, 0, 0, 0, NULL, 0, 0, 1),
(5, '2', '2021年知识付费行业市场变化及前景分析', NULL, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/23ae3202103301431474280.png', '2021年知识付费行业市场变化及前景分析', '[\"\\u884c\\u4e1a\\u524d\\u666f\"]', NULL, NULL, 312, 0, NULL, NULL, '1617079382', 0, 0, 0, 0, 0, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_article_category`
--

CREATE TABLE `eb_article_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章分类标题',
  `intr` varchar(255) DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章分类图片',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1删除0未删除',
  `add_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类表';

--
-- 转存表中的数据 `eb_article_category`
--

INSERT INTO `eb_article_category` (`id`, `pid`, `title`, `intr`, `image`, `status`, `sort`, `is_del`, `add_time`, `hidden`) VALUES
(1, 0, '众邦科技', '官方新闻', '', 1, 0, 0, '1602262563', 0),
(2, 0, 'CRMEB知识付费', '', '', 1, 0, 0, '1617070976', 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_article_content`
--

CREATE TABLE `eb_article_content` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章id',
  `content` text COMMENT '文章内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容表';

--
-- 转存表中的数据 `eb_article_content`
--

INSERT INTO `eb_article_content` (`nid`, `content`) VALUES
(1, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/5bcb5202102041054465661.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;在过去的2020年，疫情使得人们的日常生活以及工作方式都有了不同程度的变化，年会亦是如此，无法到豪华绚丽的酒店隆重举办，无法像往年一样在外欢聚，似乎年会也失去了往日的色彩，但这一切阻碍在众邦人的眼中都不是阻挡我们前行的的借口，2021年1月30日一场特殊的年会正在悄悄酝酿！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;律回春晖渐，万象始更新。2021年1月30日下午14时，一场众邦小伙伴齐心协力共同策划的以《不忘初心，逐梦前行》为主题的2021战略年会正式拉开帷幕，公司全体员工一起动手将运营中心装点的色彩斑斓，并精心排练准备了各类小节目，与公司总经理及中高层管理人员齐聚一堂，总结过去一年取得的成绩，谋划新一年的发展方向。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;一段饱含激情充满奋进的开场视频，正式拉开了年会的序幕，这段视频充满了众邦人对未来的期许，怀着这样的期许我们也许下了豪言壮语！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;生活不相信眼泪，更无法后退，不经历风雨，如何能见彩虹，没有人能随随便便成功，年会开场全体众邦人合唱一曲真心英雄，因为我们都是灿烂星空下绽放的《真心英雄》！&lt;/span&gt;&lt;/p&gt;&lt;section&gt;&lt;/section&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/c9207202102041058598383.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;CRMEB全员合唱真心英雄&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4f4bf202102041100168902.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;众邦科技总经理许荣耀致辞&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;总经理在致辞中说：“面对疫情的肆虐，全体众邦人勇于开拓创新，通过全体人员的不懈努力和辛勤付出，均取得了不错的成绩，团队快速扩大，运营中心成立，产品线进一步丰富等都有全体员工辛勤的汗水。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;武汉疫情，我们第一时间向湖北捐赠100套单商户系统，及时开源知识付费系统助力各教育机构渡过难关，充分展示着众邦人的社会担当和感恩之心，利益他人，回报社会将是众邦科技的主旋律，我们也一定会不忘初心，逐梦前行！”&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/93b8b202102041100149019.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;众邦科技副总经理徐斗明总结2020年工作及2021年工作部署&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/54904202102041100159868.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;众邦科技研发中心总监郑路汇报总结研发部2020年相关工作&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a7c73202102041100155529.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;众邦科技行政部经理梁海涛演讲&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/eb8d6202102041100155286.jpg&quot; alt=&quot;图片&quot; class=&quot;&quot;/&gt;&lt;/p&gt;&lt;section&gt;&lt;section&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;颁奖典礼&lt;/span&gt;&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;鼓励先进，表彰优秀，众邦科技秉承“利他，感恩、学习”的核心价值观，重视人才发展，积极储备人才，鼓励优秀员工，为员工发展创造宽阔的就业环境，本次年会上特别设立了未来之星奖、伯乐奖、进步之星奖、披星戴月奖、精益生产奖、艺术创造奖、协作之星奖、最懂用户奖、质量守护奖、中坚力量奖、功勋提名奖、一星功勋奖、二星功勋奖、三星功勋奖，这一系列的奖项基本覆盖了公司各个部门的员工，让每一个人都产生集体荣誉感和归属感！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/df026202102041100166984.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;多商户项目组风采展示&lt;/span&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/feac1202102041100153820.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;单商户项目组风采展示&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0de84202102041100159672.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;知识付费项目组风采展示&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/78872202102041100159606.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(127, 127, 127); font-size: 12px;&quot;&gt;Java项目组风采展示&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;rich_pages &quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/002e9202102041100161959.jpg&quot; alt=&quot;图片&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 12px; color: rgb(127, 127, 127);&quot;&gt;运营小组风采展示&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/850ff202102041103459825.jpg&quot;/&gt;&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;2021不忘初心，逐梦前行，众邦科技将继续努力，开拓创新，以全新的姿态、新的努力，谱写新的篇章！相信2021年的众邦将会百尺竿头更进一步，在激烈的市场竞争中成为佼佼者，赢得美好未来！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(38, 38, 38); font-size: 14px;&quot;&gt;最后，在此向所有关注支持CRMEB成长的用户表示衷心的感谢，并给大家拜个早年，祝大家新春愉快，工作顺利，身体健康，合家幸福，万事如意！&lt;/span&gt;&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(2, '&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;根据知识付费最新的行业分析报告称，我国有知识付费意愿的用户在近两年已暴涨了3倍！很多内容创作者、培训机构都开始搭建自己的知识付费系统，实现内容变现！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;那么基于微信公众号开发一套知识付费系统需要注意哪些事项呢？开发一套完善的知识付费系统，对于不懂技术的用户来说，可能感觉很陌生；首先可以查看CRMEB知识付费的演示站；CRMEB知识付费系统功能包含直播授课、视频点播、付费音频、付费图文、付费会员、分销、实物商品商城等，已经非常完善，能够满足99%的市场用户需求；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;懂技术完全可以购买源码搭建安装即可使用；不懂技术也没关系，CRMEB官方提供付费安装服务（联系客服）；或者自己找懂技术的朋友协助暗转搭建（有详细的系统安装视频、文档教程）。如果想基于CRMEB知识付费系统进行定制开发，就需要找专业技术团队开发（推荐联系CRMEB技术服务商）；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4a241202103301129579272.png&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;如果找第三方公司二次开发，需要注意些什么呢？我总结有以下几点：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;1、尽可能详细的整理出开发需求：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;无在开发系统之前，一定好整理好开发需求；无论是自己技术开发，还是找第三方技术公司开发，前期的需求整理非常重要；要把能考虑到的需求都尽可能详细的整理出来；如果能做出原型是最好的；开发需求越详细、越清楚，对方报价及开发周期估算也会越准确；开发过程中走的弯路越少！也避免上线后发现功能和自己预想的不一致而返工；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;2、选择靠谱的开发团队：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;选择开发团队的原则是：能选公司就不选个人，能选当地公司就不选外地公司，预算充足就不要贪便宜；说的再好也要实地考察；看团队实力、看项目案例、看服务态度；不要口头承诺，必须签订开发合同，附详细开发需求、开发周期、维护周期、违约条款；技术公司也是要生存的，尽量不要拼命压价，到最后没了服务。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;3、开发技术选型：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;为什么要基于CRMEB知识付费系统二开？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;任何项目都要考虑开发周期和项目预算。如果完全从零开始，自己搭框架开发，成本肯定很高（99%的开发团队都不会从零搭框架帮你开发）；为了减少重复造轮子，建议选用功能相近的成熟系统二开；能够大大节约开发周期，减少开发成本。源代码选择方面首先源码功能要能满足你的需求（一定要选择开源支持二次开的系统），其次是要购买正版源码，不要用盗版系统；一方面是防止后期会出现版权纠纷；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;CRMEB知识付费系统代码开源，二开更加方便；系统上线以来，不断更新迭代优化，赢得了大量用户好评；系统稳定、具有超高性价比；获得开源中国2020年“优秀gitee组织”称号。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;4、服务器及域名：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;搭建小程序或者公众号都会用到服务器；服务器、域名都建议尽量自己购买（这个不懂技术也能搞定），这样就算后期和技术公司合作的不愉快或者其他原因无法正常提供技术服务，也可以自己管理项目（或者重新找技术公司托管）；源代码在自己服务器上，就算开发者跑路、失联，重新找技术团队也能保证项目继续运行；很多二开公司建议用他们的服务器，原因一：后期可以收你的维护费，服务器费用是硬性开支，收费合理；原因二：用他的服务器，万一出现合作不愉快或者其他纠纷，你拿不到任何东西，只能赔了夫人又折兵；当然这些都是为了防患于未然，自己购买服务器会更放心；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(3, '&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;前端首页&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;前端首页顶部banner图可在后台【系统设置&amp;gt;首页设置&amp;gt;首页轮播图】中更换；图片尺寸：750*365 px&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;首页金刚区导航一排默认展示5个，导航默认可关联一级课程分类；在后台【系统设置&amp;gt;首页设置&amp;gt;导航设置】中配置，分类图标尺寸：100100px；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;首页内容展示区域可在后台【系统设置&amp;gt;首页设置&amp;gt;热门推荐】中配置，每个模块可设置是否在首页展示，展示样式有左右滑动、宫图、大图三种样式；在首页的展示位置可进行排序编辑；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;首页底部菜单在后台【系统设置&amp;gt;首页设置&amp;gt;底部菜单】中配置；可自由设置底部菜单、修改菜单图标、及跳转路径；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;线上课程&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;添加素材：添加课程前，现在后台【课程管理&amp;gt;素材管理&amp;gt;素材列表】中添加素材；素材分为：图文素材、音频素材、视频素材三种类型；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;课程专题：课程专题分为视频专题、音频专题、图文专题；编辑好专题信息后，从素材库中选择需要添加的素材内容（图文、音频、视频素材都可以混合选择生成专题）；设置好专题价格后，就可以上架专题课程了；&lt;br/&gt;课程专栏：所有专题可以通过专栏形式进行课程打包，后台添加专栏时，可以把相关专题添加到同一个专栏下，用户购买该专栏，就可以学习专栏下的所有专题了；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;拼团活动&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;后台添加专题、专栏课程是，可以设置是否开启拼团；参与拼团的课程，用户可以发起拼团，邀请好友参与享受团购价购买课程；也可以直接参团，享受团购价；后台可设置拼团补齐比例（例如：后台设置了8人团，补齐比例设置为60%，在拼团结束之前算上团长仅有4人参与拼团，此时自动补齐人数为：8 x 60% = 4.8人，取整数4，则自动补齐4人，拼团成功）；拼团时间截止，拼团未成团用户，将原路退回支付金额，拼团失败；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;在线支付&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;在线支付用户可以选择微信支付、支付宝支付（后台需配置支付宝支付才显示支付宝支付功能）、余额支付&lt;br/&gt;用户余额额支付，余额需要系统后台手动充值；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;赠送课程&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;用户购买课程可以自己购买，也可以选择赠送好友；自己购买的课程只能自己观看，需要赠送朋友的课程，需要点击“送朋友”按钮购买；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;商城系统&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;商城系统可以将课程所配套或者先关的教辅材料、书籍上架销售；不需要商城系统的，后台可以关闭前端相应的商城入口；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;直播互动&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;直播采用采用 OBS Studio软件进行直播推流 ；直播配置请参考帮助文档：&lt;/span&gt;&lt;span style=&quot;text-decoration: underline; font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;a href=&quot;http://help.crmeb.net/crmeb_zsff/1514745&quot; target=&quot;_blank&quot; style=&quot;text-decoration: underline; font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;http://help.crmeb.net/crmeb_zsff/1514745&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;直播带货&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;开启直播间时，可以选择“直播带货”，添加需要带卖的课程专题或者商城产品；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;直播打赏&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;添加打赏礼物：在后台【直播管理&amp;gt;礼物设置】中，选择添加礼物图片、金额、数量；用户在直播间内观看直播，可以选择相应数量礼物进行打赏；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;虚拟币购买：购买礼物需要使用系统虚拟币进行购买；在后台【财务管理&amp;gt;充值配置】中，可以设置虚拟币换算RMB比例、虚拟币名称（金币、金豆等）、虚拟币图标等；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;分销推广&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;分销类型：系统默认分销模式有指定人分销、人人分销两种模式；开启指定人分销，只有在用户管理中，开启“推广员”权限的用户，才有分销权，没有分销权限的用户个人中心不展示“推广中心”按钮；开启人人分销，所有注册用户都可以参与分销，获得相应佣金；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;分销返佣：v1.4.4之前系统，仅在用户购买课程后，给上级返佣；一级返佣比例是指用户购买后，根据用户实际购买课程金额乘返佣比例给直接推广返佣；二级返佣比例是指给间接推广人的返佣比例；&lt;br/&gt;佣金提现：推广员佣金达到后台设置的最低提现金额后，可以申请佣金提现；后台通过【财务管理&amp;gt;财务操作&amp;gt;提现申请】中，查看申请提现用户；核对佣金金额后，给予通过，并通过用户提供的收款信息，线下转账给推广员；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;分享海报&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;在线客服&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;通过后台【系统管理&amp;gt;客服管理】从用户列表中添加客服（需要添加的客服必须关注公众号）；用户通过前台咨询客服，客服微信公众号会收到模板消息提醒，点开模板消息可以回复用户咨询内容；后台可以通过客服管理查看客服聊天记录；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;打卡签到&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;线下报名&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;线下活动是通过后台添加活动报名，用户前台可以在线填写报名信息，参与下线活动；在后台【营销中心&amp;gt;活动管理】中添加报名活动，活动可以选择付费活动或者免费活动；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;会员充值&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;针对线下用户，可以通过后台给用户充值余额（用户端无在线充值功能），用过购买课程可以通过余额进行支付；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;地址管理&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;用户购买实物商品时，需要填写收货地址；收货地址可以手动填写，系统也可以自动获取到用户的微信收货地址；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;云存储&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;音视频加密&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;系统免费升级&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 0em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;购买商业版的用户，将提供终身免费升级服务；每个版本跟新均提供免费升级包并附相关升级教程；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(4, '&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;CRMEB知识付费v1.4.4功能更新主要结合用户的意见反馈，针对前端页面样式进行优化升级；新增新闻内容、素材内容推荐首页功能。微信端强制绑定手机号后太新增开关，购买会员参与分销返佣等功能；&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;更新时间：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;2020.3.26&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;更新后完整包大小：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;82.4M&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;详细更新内容如下：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;一、功能更新&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 1.前端个人中心样式更改为九宫格样式，增加开关按钮，可自定义设置是否显示。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 2.后台系统配置&amp;gt;首页配置增加新闻简报设置，前端增加新闻推荐模块，可自定义排序、显示开关。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 3.后台营销中心&amp;gt;拼团管理增加拼团列表，可自由设置、编辑拼团活动，前端增加拼团模块，可自定义排序、显&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;示开关。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 4.新增会员分销功能，推广购买会员返佣单独设置。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 5.系统首页活动模块，后台增加开关按钮，可自由设置是否显示。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 6.系统商城功能商品主图、轮播图图片更改为正方形图片（原商品图片也可适配）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 7.前端快捷操作悬浮按钮，后台增加开关按钮，可自定义设置开关。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 8.后台课程管理&amp;gt;课程分类及素材分类显示二级菜单内容，可操作编辑。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 9.增加素材推荐首页功能，后台可编辑素材推荐至首页（仅限免费素材），可关联素材所在的专栏/专题，前台用户可通过浏览免费素材，购买关联的专题/专栏，完成学习完整的专题/专栏。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp;&amp;nbsp;10.微信登录强制绑定手机号，后台增加开关按钮，可设置绑定/不绑定。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;二、功能优化&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 1.公众号图文管理样式优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 2.前端直播页面黑屏问题优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 3.前端商城列表默认获取第一个分类内容问题优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 4.后台配置分类页面删除按钮无法点击问题优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 5.前端课程分类列表搜索功能部分安卓手机无法搜索问题优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 6.前端拼团流程页面样式整体优化，页面更美观，交互更流畅。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 7.前端个人中心&amp;gt;会员页面样式优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&amp;nbsp; &amp;nbsp; 8.用户管理不能用手机号搜索功能优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;我们的每一点进步都离不开您的支持；感谢您为我们提出的每一个建议！&lt;br/&gt;心之所向，素履以往！我们初心不变，与您一起同行！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;'),
(5, '&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;2016年被称为“知识付费元年”。在互联网快速发展的时代，知识付费成为引领积极向上的网络文化和全民学习内容变现的产物。其本质就是把知识变成产品或服务，以实现商业价值。经过5年的快速发展，知识付费从付费问答发展成为集内容付费、知识短视频、直播授课等涵盖职业教育、个人IP变现、K12教育等各个领域。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;自2015年开始，知识付费用户规模呈高速增长态势，其中2017年知识付费用户为1.88亿人，2019年知识付费用户规模达3.56亿人，2020年知识付费用户规模突破4亿达4.18人。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/052d8202103301429511879.png&quot;/&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;近几年，大众愈发重视自我知识涉及的宽度及深度，人们对知识付费的接受度和认可度不断提高。具相关机构调查数据显示，26.6%的用户对知识付费行业发展前景持非常乐观的态度，43.5%的用户持比较乐观的态度，知识付费形式符合目前快节奏生活中用户群体对学习提升的需求，具有一定的刚需性，随着移动支付技术的发展和整个社会对知识的迫切需求，知识付费市场不断扩大，用户逐渐养成知识付费的消费习惯。&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/11cb5202103301430176182.png&quot;/&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;当然有市场就会有竞争，早期的野蛮生长时代，是以知乎、分答、在行等为代表的平台竞争。后来大批内容创作者通过不断的经营积累打造个人ip，需要搭建自己的自媒体平台。催生了一批知识付费互联网行业创业者。CRMEB知识付费系统就是专为内容创作者打造的一款以付费图文、付费视频、付费音频、直播授课、直播打赏、直播带货、付费会员、课程分销等为一体的知识付费系统。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;作为知识付费的内容创作者，为何要从平台内容创作转向打造自己的自媒体平台呢？其实这就和互联网电商行业一样，电商卖家从最早入住淘宝、京东等电商平台到逐渐开始转向搭建自己的电商系统。知识付费内容创作者前期需要借助平台进行引流，积累用户及个人行业知名度，也就是打造个人ip。并且知识付费内容创作者更多都是针对某个单一领域或者行业进行内容创作，相对用户更加精准。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px; color: rgb(38, 38, 38);&quot;&gt;当个人ip形成，在某一个圈子里形成一定影响力后，依靠平台引流以经不是重点，而重点变成如何将影响力做大，打造竞争壁垒。这个时候，打造自己的知识付费系统就变的更加重要了。随着知识付费市场逐渐走向成熟，未来越来月多的内容创作者会选择自己搭建知识付费系统，将公域流量转向私域流量；通过不断积累形成更具专业性、特色鲜明的知识付费内容体系。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;br/&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `eb_cache`
--

CREATE TABLE `eb_cache` (
  `key` varchar(32) NOT NULL,
  `result` text COMMENT '缓存数据',
  `add_time` int(10) DEFAULT '0' COMMENT '缓存时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录缓存';

-- --------------------------------------------------------

--
-- 表的结构 `eb_event_registration`
--

CREATE TABLE `eb_event_registration` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '电话',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `signup_start_time` int(50) NOT NULL DEFAULT '0' COMMENT '报名开始时间',
  `signup_end_time` int(50) NOT NULL DEFAULT '0' COMMENT '报名结束时间',
  `start_time` int(50) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(50) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `detail` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `number` int(10) NOT NULL DEFAULT '0' COMMENT '人数',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `activity_rules` varchar(3000) DEFAULT NULL COMMENT '活动规则',
  `content` varchar(5000) DEFAULT NULL COMMENT '活动详情',
  `pay_type` int(2) NOT NULL DEFAULT '0' COMMENT '是否免费',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `member_pay_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '会员支付状态（0:免费1:付费）',
  `member_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `write_off_code` varchar(255) NOT NULL DEFAULT '' COMMENT '核销码',
  `restrictions` tinyint(2) NOT NULL DEFAULT '0' COMMENT '限购',
  `is_fill` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否填写资料',
  `qrcode_img` varchar(255) DEFAULT NULL COMMENT '群聊二维码',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(50) NOT NULL DEFAULT '1' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动报名表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_event_sign_up`
--

CREATE TABLE `eb_event_sign_up` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `trade_no` varchar(64) NOT NULL DEFAULT '' COMMENT '支付宝支付,支付宝交易订单号',
  `uid` int(10) NOT NULL DEFAULT '0',
  `user_info` varchar(3072) NOT NULL DEFAULT '' COMMENT '报名信息',
  `activity_id` int(10) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付价格',
  `paid` int(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(50) DEFAULT '0' COMMENT '支付时间',
  `pay_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态（0:未核销1:已核销）',
  `write_off_code` varchar(255) DEFAULT NULL COMMENT '核销二维码',
  `is_del` tinyint(2) NOT NULL DEFAULT '0',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户报名表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_express`
--

CREATE TABLE `eb_express` (
  `id` mediumint(11) UNSIGNED NOT NULL COMMENT '快递公司id',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递公司表';

--
-- 转存表中的数据 `eb_express`
--

INSERT INTO `eb_express` (`id`, `code`, `name`, `sort`, `is_show`) VALUES
(1, 'LIMINWL', '利民物流', 1, 1),
(2, 'XINTIAN', '鑫天顺物流', 1, 1),
(3, 'henglu', '恒路物流', 1, 1),
(4, 'klwl', '康力物流', 1, 1),
(5, 'meiguo', '美国快递', 1, 1),
(6, 'a2u', 'A2U速递', 1, 1),
(7, 'benteng', '奔腾物流', 1, 1),
(8, 'ahdf', '德方物流', 1, 1),
(9, 'timedg', '万家通', 1, 1),
(10, 'ztong', '智通物流', 1, 1),
(11, 'xindan', '新蛋物流', 1, 1),
(12, 'bgpyghx', '挂号信', 1, 1),
(13, 'XFHONG', '鑫飞鸿物流快递', 1, 1),
(14, 'ALP', '阿里物流', 1, 1),
(15, 'BFWL', '滨发物流', 1, 1),
(16, 'SJWL', '宋军物流', 1, 1),
(17, 'SHUNFAWL', '顺发物流', 1, 1),
(18, 'TIANHEWL', '天河物流', 1, 1),
(19, 'YBWL', '邮联物流', 1, 1),
(20, 'SWHY', '盛旺货运', 1, 1),
(21, 'TSWL', '汤氏物流', 1, 1),
(22, 'YUANYUANWL', '圆圆物流', 1, 1),
(23, 'BALIANGWL', '八梁物流', 1, 1),
(24, 'ZGWL', '振刚物流', 1, 1),
(25, 'JIAYU', '佳宇物流', 1, 1),
(26, 'SHHX', '昊昕物流', 1, 1),
(27, 'ande', '安得物流', 1, 1),
(28, 'ppbyb', '贝邮宝', 1, 1),
(29, 'dida', '递达快递', 1, 1),
(30, 'jppost', '日本邮政', 1, 1),
(31, 'intmail', '中国邮政', 96, 1),
(32, 'HENGCHENGWL', '恒诚物流', 1, 1),
(33, 'HENGFENGWL', '恒丰物流', 1, 1),
(34, 'gdems', '广东ems快递', 1, 1),
(35, 'xlyt', '祥龙运通', 1, 1),
(36, 'gjbg', '国际包裹', 1, 1),
(37, 'uex', 'UEX', 1, 1),
(38, 'singpost', '新加坡邮政', 1, 1),
(39, 'guangdongyouzhengwuliu', '广东邮政', 1, 1),
(40, 'bht', 'BHT', 1, 1),
(41, 'cces', 'CCES快递', 1, 1),
(42, 'cloudexpress', 'CE易欧通国际速递', 1, 1),
(43, 'dasu', '达速物流', 1, 1),
(44, 'pfcexpress', '皇家物流', 1, 1),
(45, 'hjs', '猴急送', 1, 1),
(46, 'huilian', '辉联物流', 1, 1),
(47, 'huanqiu', '环球速运', 1, 1),
(48, 'huada', '华达快运', 1, 1),
(49, 'htwd', '华通务达物流', 1, 1),
(50, 'hipito', '海派通', 1, 1),
(51, 'hqtd', '环球通达', 1, 1),
(52, 'airgtc', '航空快递', 1, 1),
(53, 'haoyoukuai', '好又快物流', 1, 1),
(54, 'hanrun', '韩润物流', 1, 1),
(55, 'ccd', '河南次晨达', 1, 1),
(56, 'hfwuxi', '和丰同城', 1, 1),
(57, 'Sky', '荷兰', 1, 1),
(58, 'hongxun', '鸿讯物流', 1, 1),
(59, 'hongjie', '宏捷国际物流', 1, 1),
(60, 'httx56', '汇通天下物流', 1, 1),
(61, 'lqht', '恒通快递', 1, 1),
(62, 'jinguangsudikuaijian', '京广速递快件', 1, 1),
(63, 'junfengguoji', '骏丰国际速递', 1, 1),
(64, 'jiajiatong56', '佳家通', 1, 1),
(65, 'jrypex', '吉日优派', 1, 1),
(66, 'jinchengwuliu', '锦程国际物流', 1, 1),
(67, 'jgwl', '景光物流', 1, 1),
(68, 'pzhjst', '急顺通', 1, 1),
(69, 'ruexp', '捷网俄全通', 1, 1),
(70, 'jmjss', '金马甲', 1, 1),
(71, 'lanhu', '蓝弧快递', 1, 1),
(72, 'ltexp', '乐天速递', 1, 1),
(73, 'lutong', '鲁通快运', 1, 1),
(74, 'ledii', '乐递供应链', 1, 1),
(75, 'lundao', '论道国际物流', 1, 1),
(76, 'mailikuaidi', '麦力快递', 1, 1),
(77, 'mchy', '木春货运', 1, 1),
(78, 'meiquick', '美快国际物流', 1, 1),
(79, 'valueway', '美通快递', 1, 1),
(80, 'nuoyaao', '偌亚奥国际', 1, 1),
(81, 'euasia', '欧亚专线', 1, 1),
(82, 'pca', '澳大利亚PCA快递', 1, 1),
(83, 'pingandatengfei', '平安达腾飞', 1, 1),
(84, 'pjbest', '品骏快递', 1, 1),
(85, 'qbexpress', '秦邦快运', 1, 1),
(86, 'quanxintong', '全信通快递', 1, 1),
(87, 'quansutong', '全速通国际快递', 1, 1),
(88, 'qinyuan', '秦远物流', 1, 1),
(89, 'qichen', '启辰国际物流', 1, 1),
(90, 'quansu', '全速快运', 1, 1),
(91, 'qzx56', '全之鑫物流', 1, 1),
(92, 'qskdyxgs', '千顺快递', 1, 1),
(93, 'runhengfeng', '全时速运', 1, 1),
(94, 'rytsd', '日益通速递', 1, 1),
(95, 'ruidaex', '瑞达国际速递', 1, 1),
(96, 'shiyun', '世运快递', 1, 1),
(97, 'sfift', '十方通物流', 1, 1),
(98, 'stkd', '顺通快递', 1, 1),
(99, 'bgn', '布谷鸟快递', 1, 1),
(100, 'jiahuier', '佳惠尔快递', 1, 1),
(101, 'pingyou', '小包', 1, 1),
(102, 'yumeijie', '誉美捷快递', 1, 1),
(103, 'meilong', '美龙快递', 1, 1),
(104, 'guangtong', '广通速递', 1, 1),
(105, 'STARS', '星晨急便', 1, 1),
(106, 'NANHANG', '中国南方航空股份有限公司', 1, 1),
(107, 'lanbiao', '蓝镖快递', 1, 1),
(109, 'baotongda', '宝通达物流', 1, 1),
(110, 'dashun', '大顺物流', 1, 1),
(111, 'dada', '大达物流', 1, 1),
(112, 'fangfangda', '方方达物流', 1, 1),
(113, 'hebeijianhua', '河北建华物流', 1, 1),
(114, 'haolaiyun', '好来运快递', 1, 1),
(115, 'jinyue', '晋越快递', 1, 1),
(116, 'kuaitao', '快淘快递', 1, 1),
(117, 'peixing', '陪行物流', 1, 1),
(118, 'hkpost', '香港邮政', 1, 1),
(119, 'ytfh', '一统飞鸿快递', 1, 1),
(120, 'zhongxinda', '中信达快递', 1, 1),
(121, 'zhongtian', '中天快运', 1, 1),
(122, 'zuochuan', '佐川急便', 1, 1),
(123, 'chengguang', '程光快递', 1, 1),
(124, 'cszx', '城市之星', 1, 1),
(125, 'chuanzhi', '传志快递', 1, 1),
(126, 'feibao', '飞豹快递', 1, 1),
(127, 'huiqiang', '汇强快递', 1, 1),
(128, 'lejiedi', '乐捷递', 1, 1),
(129, 'lijisong', '成都立即送快递', 1, 1),
(130, 'minbang', '民邦速递', 1, 1),
(131, 'ocs', 'OCS国际快递', 1, 1),
(132, 'santai', '三态速递', 1, 1),
(133, 'saiaodi', '赛澳递', 1, 1),
(134, 'jingdong', '京东快递', 1, 1),
(135, 'zengyi', '增益快递', 1, 1),
(136, 'fanyu', '凡宇速递', 1, 1),
(137, 'fengda', '丰达快递', 1, 1),
(138, 'coe', '东方快递', 1, 1),
(139, 'ees', '百福东方快递', 1, 1),
(140, 'disifang', '递四方速递', 1, 1),
(141, 'rufeng', '如风达快递', 1, 1),
(142, 'changtong', '长通物流', 1, 1),
(143, 'chengshi100', '城市100快递', 1, 1),
(144, 'feibang', '飞邦物流', 1, 1),
(145, 'haosheng', '昊盛物流', 1, 1),
(146, 'yinsu', '音速速运', 1, 1),
(147, 'kuanrong', '宽容物流', 1, 1),
(148, 'tongcheng', '通成物流', 1, 1),
(149, 'tonghe', '通和天下物流', 1, 1),
(150, 'zhima', '芝麻开门', 1, 1),
(151, 'ririshun', '日日顺物流', 1, 1),
(152, 'anxun', '安迅物流', 1, 1),
(153, 'baiqian', '百千诚国际物流', 1, 1),
(154, 'chukouyi', '出口易', 1, 1),
(155, 'diantong', '店通快递', 1, 1),
(156, 'dajin', '大金物流', 1, 1),
(157, 'feite', '飞特物流', 1, 1),
(159, 'gnxb', '国内小包', 1, 1),
(160, 'huacheng', '华诚物流', 1, 1),
(161, 'huahan', '华翰物流', 1, 1),
(162, 'hengyu', '恒宇运通', 1, 1),
(163, 'huahang', '华航快递', 1, 1),
(164, 'jiuyi', '久易快递', 1, 1),
(165, 'jiete', '捷特快递', 1, 1),
(166, 'jingshi', '京世物流', 1, 1),
(167, 'kuayue', '跨越快递', 1, 1),
(168, 'mengsu', '蒙速快递', 1, 1),
(169, 'nanbei', '南北快递', 1, 1),
(171, 'pinganda', '平安达快递', 1, 1),
(172, 'ruifeng', '瑞丰速递', 1, 1),
(173, 'rongqing', '荣庆物流', 1, 1),
(174, 'suijia', '穗佳物流', 1, 1),
(175, 'simai', '思迈快递', 1, 1),
(176, 'suteng', '速腾快递', 1, 1),
(177, 'shengbang', '晟邦物流', 1, 1),
(178, 'suchengzhaipei', '速呈宅配', 1, 1),
(179, 'wuhuan', '五环速递', 1, 1),
(180, 'xingchengzhaipei', '星程宅配', 1, 1),
(181, 'yinjie', '顺捷丰达', 1, 1),
(183, 'yanwen', '燕文物流', 1, 1),
(184, 'zongxing', '纵行物流', 1, 1),
(185, 'aae', 'AAE快递', 1, 1),
(186, 'dhl', 'DHL快递', 1, 1),
(187, 'feihu', '飞狐快递', 1, 1),
(188, 'shunfeng', '顺丰速运', 92, 1),
(189, 'spring', '春风物流', 1, 1),
(190, 'yidatong', '易达通快递', 1, 1),
(191, 'PEWKEE', '彪记快递', 1, 1),
(192, 'PHOENIXEXP', '凤凰快递', 1, 1),
(193, 'CNGLS', 'GLS快递', 1, 1),
(194, 'BHTEXP', '华慧快递', 1, 1),
(195, 'B2B', '卡行天下', 1, 1),
(196, 'PEISI', '配思货运', 1, 1),
(197, 'SUNDAPOST', '上大物流', 1, 1),
(198, 'SUYUE', '苏粤货运', 1, 1),
(199, 'F5XM', '伍圆速递', 1, 1),
(200, 'GZWENJIE', '文捷航空速递', 1, 1),
(201, 'yuancheng', '远成物流', 1, 1),
(202, 'dpex', 'DPEX快递', 1, 1),
(203, 'anjie', '安捷快递', 1, 1),
(204, 'jldt', '嘉里大通', 1, 1),
(205, 'yousu', '优速快递', 1, 1),
(206, 'wanbo', '万博快递', 1, 1),
(207, 'sure', '速尔物流', 1, 1),
(208, 'sutong', '速通物流', 1, 1),
(209, 'JUNCHUANWL', '骏川物流', 1, 1),
(210, 'guada', '冠达快递', 1, 1),
(211, 'dsu', 'D速快递', 1, 1),
(212, 'LONGSHENWL', '龙胜物流', 1, 1),
(213, 'abc', '爱彼西快递', 1, 1),
(214, 'eyoubao', 'E邮宝', 1, 1),
(215, 'aol', 'AOL快递', 1, 1),
(216, 'jixianda', '急先达物流', 1, 1),
(217, 'haihong', '山东海红快递', 1, 1),
(218, 'feiyang', '飞洋快递', 1, 1),
(219, 'rpx', 'RPX保时达', 1, 1),
(220, 'zhaijisong', '宅急送', 1, 1),
(221, 'tiantian', '天天快递', 99, 1),
(222, 'yunwuliu', '云物流', 1, 1),
(223, 'jiuye', '九曳供应链', 1, 1),
(224, 'bsky', '百世快运', 1, 1),
(225, 'higo', '黑狗物流', 1, 1),
(226, 'arke', '方舟速递', 1, 1),
(227, 'zwsy', '中外速运', 1, 1),
(228, 'jxy', '吉祥邮', 1, 1),
(229, 'aramex', 'Aramex', 1, 1),
(230, 'guotong', '国通快递', 1, 1),
(231, 'jiayi', '佳怡物流', 1, 1),
(232, 'longbang', '龙邦快运', 1, 1),
(233, 'minhang', '民航快递', 1, 1),
(234, 'quanyi', '全一快递', 1, 1),
(235, 'quanchen', '全晨快递', 1, 1),
(236, 'usps', 'USPS快递', 1, 1),
(237, 'xinbang', '新邦物流', 1, 1),
(238, 'yuanzhi', '元智捷诚快递', 1, 1),
(239, 'zhongyou', '中邮物流', 1, 1),
(240, 'yuxin', '宇鑫物流', 1, 1),
(241, 'cnpex', '中环快递', 1, 1),
(242, 'shengfeng', '盛丰物流', 1, 1),
(243, 'yuantong', '圆通速递', 97, 1),
(244, 'jiayunmei', '加运美物流', 1, 1),
(245, 'ywfex', '源伟丰快递', 1, 1),
(246, 'xinfeng', '信丰物流', 1, 1),
(247, 'wanxiang', '万象物流', 1, 1),
(248, 'menduimen', '门对门', 1, 1),
(249, 'mingliang', '明亮物流', 1, 1),
(250, 'fengxingtianxia', '风行天下', 1, 1),
(251, 'gongsuda', '共速达物流', 1, 1),
(252, 'zhongtong', '中通快递', 100, 1),
(253, 'quanritong', '全日通快递', 1, 1),
(254, 'ems', 'EMS', 1, 1),
(255, 'wanjia', '万家物流', 1, 1),
(256, 'yuntong', '运通快递', 1, 1),
(257, 'feikuaida', '飞快达物流', 1, 1),
(258, 'haimeng', '海盟速递', 1, 1),
(259, 'zhongsukuaidi', '中速快件', 1, 1),
(260, 'yuefeng', '越丰快递', 1, 1),
(261, 'shenghui', '盛辉物流', 1, 1),
(262, 'datian', '大田物流', 1, 1),
(263, 'quanjitong', '全际通快递', 1, 1),
(264, 'longlangkuaidi', '隆浪快递', 1, 1),
(265, 'neweggozzo', '新蛋奥硕物流', 1, 1),
(266, 'shentong', '申通快递', 95, 1),
(267, 'haiwaihuanqiu', '海外环球', 1, 1),
(268, 'yad', '源安达快递', 1, 1),
(269, 'jindawuliu', '金大物流', 1, 1),
(270, 'sevendays', '七天连锁', 1, 1),
(271, 'tnt', 'TNT快递', 1, 1),
(272, 'huayu', '天地华宇物流', 1, 1),
(273, 'lianhaotong', '联昊通快递', 1, 1),
(274, 'nengda', '港中能达快递', 1, 1),
(275, 'LBWL', '联邦物流', 1, 1),
(276, 'ontrac', 'onTrac', 1, 1),
(277, 'feihang', '原飞航快递', 1, 1),
(278, 'bangsongwuliu', '邦送物流', 1, 1),
(279, 'huaxialong', '华夏龙物流', 1, 1),
(280, 'ztwy', '中天万运快递', 1, 1),
(281, 'fkd', '飞康达物流', 1, 1),
(282, 'anxinda', '安信达快递', 1, 1),
(283, 'quanfeng', '全峰快递', 1, 1),
(284, 'shengan', '圣安物流', 1, 1),
(285, 'jiaji', '佳吉物流', 1, 1),
(286, 'yunda', '韵达快运', 94, 1),
(287, 'ups', 'UPS快递', 1, 1),
(288, 'debang', '德邦物流', 1, 1),
(289, 'yafeng', '亚风速递', 1, 1),
(290, 'kuaijie', '快捷速递', 98, 1),
(291, 'huitong', '百世快递', 93, 1),
(293, 'aolau', 'AOL澳通速递', 1, 1),
(294, 'anneng', '安能物流', 1, 1),
(295, 'auexpress', '澳邮中国快运', 1, 1),
(296, 'exfresh', '安鲜达', 1, 1),
(297, 'bcwelt', 'BCWELT', 1, 1),
(298, 'youzhengguonei', '挂号信', 1, 1),
(299, 'xiaohongmao', '北青小红帽', 1, 1),
(300, 'lbbk', '宝凯物流', 1, 1),
(301, 'byht', '博源恒通', 1, 1),
(302, 'idada', '百成大达物流', 1, 1),
(303, 'baitengwuliu', '百腾物流', 1, 1),
(304, 'birdex', '笨鸟海淘', 1, 1),
(305, 'bsht', '百事亨通', 1, 1),
(306, 'dayang', '大洋物流快递', 1, 1),
(307, 'dechuangwuliu', '德创物流', 1, 1),
(308, 'donghanwl', '东瀚物流', 1, 1),
(309, 'dfpost', '达方物流', 1, 1),
(310, 'dongjun', '东骏快捷物流', 1, 1),
(311, 'dindon', '叮咚澳洲转运', 1, 1),
(312, 'dazhong', '大众佐川急便', 1, 1),
(313, 'decnlh', '德中快递', 1, 1),
(314, 'dekuncn', '德坤供应链', 1, 1),
(315, 'eshunda', '俄顺达', 1, 1),
(316, 'ewe', 'EWE全球快递', 1, 1),
(317, 'fedexuk', 'FedEx英国', 1, 1),
(318, 'fox', 'FOX国际速递', 1, 1),
(319, 'rufengda', '凡客如风达', 1, 1),
(320, 'fandaguoji', '颿达国际快递', 1, 1),
(321, 'hnfy', '飞鹰物流', 1, 1),
(322, 'flysman', '飞力士物流', 1, 1),
(323, 'sccod', '丰程物流', 1, 1),
(324, 'farlogistis', '泛远国际物流', 1, 1),
(325, 'gsm', 'GSM', 1, 1),
(326, 'gaticn', 'GATI快递', 1, 1),
(327, 'gts', 'GTS快递', 1, 1),
(328, 'gangkuai', '港快速递', 1, 1),
(329, 'gtsd', '高铁速递', 1, 1),
(330, 'tiandihuayu', '华宇物流', 1, 1),
(331, 'huangmajia', '黄马甲快递', 1, 1),
(332, 'ucs', '合众速递', 1, 1),
(333, 'huoban', '伙伴物流', 1, 1),
(334, 'nedahm', '红马速递', 1, 1),
(335, 'huiwen', '汇文配送', 1, 1),
(336, 'nmhuahe', '华赫物流', 1, 1),
(337, 'hangyu', '航宇快递', 1, 1),
(338, 'minsheng', '闽盛物流', 1, 1),
(339, 'riyu', '日昱物流', 1, 1),
(340, 'sxhongmajia', '山西红马甲', 1, 1),
(341, 'syjiahuier', '沈阳佳惠尔', 1, 1),
(342, 'shlindao', '上海林道货运', 1, 1),
(343, 'shunjiefengda', '顺捷丰达', 1, 1),
(344, 'subida', '速必达物流', 1, 1),
(345, 'bphchina', '速方国际物流', 1, 1),
(346, 'sendtochina', '速递中国', 1, 1),
(347, 'suning', '苏宁快递', 1, 1),
(348, 'sihaiet', '四海快递', 1, 1),
(349, 'tianzong', '天纵物流', 1, 1),
(350, 'chinatzx', '同舟行物流', 1, 1),
(351, 'nntengda', '腾达速递', 1, 1),
(352, 'sd138', '泰国138', 1, 1),
(353, 'tongdaxing', '通达兴物流', 1, 1),
(354, 'tlky', '天联快运', 1, 1),
(355, 'youshuwuliu', 'UC优速快递', 1, 1),
(356, 'ueq', 'UEQ快递', 1, 1),
(357, 'weitepai', '微特派快递', 1, 1),
(358, 'wtdchina', '威时沛运', 1, 1),
(359, 'wzhaunyun', '微转运', 1, 1),
(360, 'gswtkd', '万通快递', 1, 1),
(361, 'wotu', '渥途国际速运', 1, 1),
(362, 'xiyoute', '希优特快递', 1, 1),
(363, 'xilaikd', '喜来快递', 1, 1),
(364, 'xsrd', '鑫世锐达', 1, 1),
(365, 'xtb', '鑫通宝物流', 1, 1),
(366, 'xintianjie', '信天捷快递', 1, 1),
(367, 'xaetc', '西安胜峰', 1, 1),
(368, 'xianfeng', '先锋快递', 1, 1),
(369, 'sunspeedy', '新速航', 1, 1),
(370, 'xipost', '西邮寄', 1, 1),
(371, 'sinatone', '信联通', 1, 1),
(372, 'sunjex', '新杰物流', 1, 1),
(373, 'yundaexus', '韵达美国件', 1, 1),
(374, 'yxwl', '宇鑫物流', 1, 1),
(375, 'yitongda', '易通达', 1, 1),
(376, 'yiqiguojiwuliu', '一柒物流', 1, 1),
(377, 'yilingsuyun', '亿领速运', 1, 1),
(378, 'yujiawuliu', '煜嘉物流', 1, 1),
(379, 'gml', '英脉物流', 1, 1),
(380, 'leopard', '云豹国际货运', 1, 1),
(381, 'czwlyn', '云南中诚', 1, 1),
(382, 'sdyoupei', '优配速运', 1, 1),
(383, 'yongchang', '永昌物流', 1, 1),
(384, 'yufeng', '御风速运', 1, 1),
(385, 'yamaxunwuliu', '亚马逊物流', 1, 1),
(386, 'yousutongda', '优速通达', 1, 1),
(387, 'yishunhang', '亿顺航', 1, 1),
(388, 'yongwangda', '永旺达快递', 1, 1),
(389, 'ecmscn', '易满客', 1, 1),
(390, 'yingchao', '英超物流', 1, 1),
(391, 'edlogistics', '益递物流', 1, 1),
(392, 'yyexpress', '远洋国际', 1, 1),
(393, 'onehcang', '一号仓', 1, 1),
(394, 'ycgky', '远成快运', 1, 1),
(395, 'lineone', '一号线', 1, 1),
(396, 'ypsd', '壹品速递', 1, 1),
(397, 'vipexpress', '鹰运国际速递', 1, 1),
(398, 'el56', '易联通达物流', 1, 1),
(399, 'yyqc56', '一运全成物流', 1, 1),
(400, 'zhongtie', '中铁快运', 1, 1),
(401, 'ZTKY', '中铁物流', 1, 1),
(402, 'zzjh', '郑州建华快递', 1, 1),
(403, 'zhongruisudi', '中睿速递', 1, 1),
(404, 'zhongwaiyun', '中外运速递', 1, 1),
(405, 'zengyisudi', '增益速递', 1, 1),
(406, 'sujievip', '郑州速捷', 1, 1),
(407, 'zhichengtongda', '至诚通达快递', 1, 1),
(408, 'zhdwl', '众辉达物流', 1, 1),
(409, 'kuachangwuliu', '直邮易', 1, 1),
(410, 'topspeedex', '中运全速', 1, 1),
(411, 'otobv', '中欧快运', 1, 1),
(412, 'zsky123', '准实快运', 1, 1),
(413, 'donghong', '东红物流', 1, 1),
(414, 'kuaiyouda', '快优达速递', 1, 1),
(415, 'balunzhi', '巴伦支快递', 1, 1),
(416, 'hutongwuliu', '户通物流', 1, 1),
(417, 'xianchenglian', '西安城联速递', 1, 1),
(418, 'youbijia', '邮必佳', 1, 1),
(419, 'feiyuan', '飞远物流', 1, 1),
(420, 'chengji', '城际速递', 1, 1),
(421, 'huaqi', '华企快运', 1, 1),
(422, 'yibang', '一邦快递', 1, 1),
(423, 'citylink', 'CityLink快递', 1, 1),
(424, 'meixi', '美西快递', 1, 1),
(425, 'acs', 'ACS', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_grade`
--

CREATE TABLE `eb_grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '年级名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级列表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_learning_records`
--

CREATE TABLE `eb_learning_records` (
  `id` int(12) NOT NULL,
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT 'uid',
  `special_id` int(12) NOT NULL DEFAULT '0' COMMENT '专题id',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题学习记录';

-- --------------------------------------------------------

--
-- 表的结构 `eb_lecturer`
--

CREATE TABLE `eb_lecturer` (
  `id` int(10) NOT NULL,
  `lecturer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '讲师名称',
  `lecturer_head` varchar(255) NOT NULL DEFAULT '' COMMENT '讲师头像',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT '讲师标签',
  `explain` varchar(255) DEFAULT '' COMMENT '讲师说明',
  `introduction` text COMMENT '简介',
  `curriculum` int(5) NOT NULL DEFAULT '0' COMMENT '课程数量',
  `study` int(10) NOT NULL DEFAULT '0' COMMENT '学习人数',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` int(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_del` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讲师表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_barrage`
--

CREATE TABLE `eb_live_barrage` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '给谁发送',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型，1=文本，2=图片，3=语音',
  `barrage` varchar(3000) NOT NULL DEFAULT '' COMMENT '评论内容',
  `live_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播间id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送评论时间',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1= 显示，0=隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间弹幕';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_gift`
--

CREATE TABLE `eb_live_gift` (
  `id` int(10) UNSIGNED NOT NULL,
  `live_gift_name` varchar(255) NOT NULL DEFAULT '' COMMENT '礼物名称',
  `live_gift_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '礼物价格（虚拟货币）',
  `live_gift_num` varchar(255) NOT NULL DEFAULT '0' COMMENT '赠送数量列表',
  `live_gift_show_img` varchar(255) NOT NULL DEFAULT '' COMMENT '礼物图标',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` int(2) NOT NULL DEFAULT '1' COMMENT '显示',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼物列表';

--
-- 转存表中的数据 `eb_live_gift`
--

INSERT INTO `eb_live_gift` (`id`, `live_gift_name`, `live_gift_price`, `live_gift_num`, `live_gift_show_img`, `sort`, `is_show`, `add_time`) VALUES
(1, '鲜花', '2.00', '[\"1\",\"5\",\"66\",\"520\",\"999\",\"1314\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/da616202007011009436251.png', 0, 1, 1603850176),
(2, '爱心', '1.00', '[\"1\",\"5\",\"10\",\"20\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/5a2d520200701101025960.png', 0, 1, 1603850176),
(3, '气球', '6.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\",\"999\",\"1314\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0c648202007011012055342.png', 0, 1, 1603850176),
(4, '皇冠', '20.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/82d4c202007011013025359.png', 0, 1, 1603850176),
(5, '奖杯', '15.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1caae202007011013442033.png', 0, 1, 1603850176),
(6, '锦鲤', '30.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/226e5202007011015051008.png', 0, 1, 1603850176),
(7, '嘉年华', '50.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/22c8e202007011017537720.png', 0, 1, 1603850176),
(8, '粉笔', '5.00', '[\"1\",\"5\",\"10\",\"20\",\"66\",\"99\",\"520\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/96ea420200701101917287.png', 0, 1, 1603850176);

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_goods`
--

CREATE TABLE `eb_live_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `live_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播间id',
  `special_name` varchar(100) NOT NULL DEFAULT '' COMMENT '课程名称',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0:专题，1：商品',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` int(10) NOT NULL DEFAULT '0' COMMENT '销量',
  `fake_sales` int(10) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间带货表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_honoured_guest`
--

CREATE TABLE `eb_live_honoured_guest` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '嘉宾用户id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '嘉宾类型 0=助教，1=讲师',
  `wechat_name` varchar(64) DEFAULT NULL COMMENT '微信昵称',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '嘉宾别昵称',
  `live_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播间id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加事件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间嘉宾';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_playback`
--

CREATE TABLE `eb_live_playback` (
  `id` int(11) UNSIGNED NOT NULL,
  `stream_name` varchar(255) NOT NULL DEFAULT '' COMMENT '直播间号',
  `playback_name` varchar(255) DEFAULT '' COMMENT '回放名称',
  `playback_url` varchar(255) NOT NULL DEFAULT '' COMMENT '回放地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `is_show` int(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `RecordId` varchar(37) NOT NULL DEFAULT '' COMMENT '直播间回放设置ID',
  `is_record` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否设置回放',
  `sort` int(2) DEFAULT '0' COMMENT '排序',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '删除',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间回放';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_reward`
--

CREATE TABLE `eb_live_reward` (
  `id` int(11) UNSIGNED NOT NULL,
  `live_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '直播间id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `gift_id` int(11) NOT NULL DEFAULT '0' COMMENT '礼物id',
  `gift_name` varchar(100) NOT NULL DEFAULT '' COMMENT '礼物名称',
  `gift_price` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '虚拟货币价格',
  `gift_num` int(11) NOT NULL DEFAULT '0' COMMENT '礼物数量',
  `total_price` int(11) NOT NULL DEFAULT '0' COMMENT '总虚拟货币价格',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '打赏时间',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1= 显示，0=隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间礼物打赏表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_live_studio`
--

CREATE TABLE `eb_live_studio` (
  `id` int(11) NOT NULL,
  `stream_name` varchar(32) NOT NULL DEFAULT '' COMMENT '直播间号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `live_title` varchar(255) NOT NULL DEFAULT '' COMMENT '直播间标题',
  `live_image` varchar(255) NOT NULL DEFAULT '' COMMENT '直播间封面',
  `start_play_time` varchar(30) NOT NULL DEFAULT '0' COMMENT '每日开播时间',
  `stop_play_time` varchar(30) NOT NULL DEFAULT '0' COMMENT '每日停播时间',
  `live_introduction` varchar(3000) NOT NULL DEFAULT '' COMMENT '直播间简介',
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联专题id',
  `online_user_num` int(11) NOT NULL DEFAULT '0' COMMENT '在线人数',
  `online_num` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟在线人数',
  `studio_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '直播间密码',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开播提醒',
  `remind_time` int(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开播前提醒时间（分钟）',
  `auto_phrase` varchar(255) NOT NULL DEFAULT '' COMMENT '进入直播间自动回复',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_recording` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否录制直播间',
  `is_play` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否正在开播',
  `recording` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否录制进行中',
  `record_time` int(11) NOT NULL DEFAULT '0' COMMENT '录制开始时间',
  `is_playback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回放',
  `playback_record_id` varchar(1000) NOT NULL DEFAULT '' COMMENT '回放RecordId',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间';

--
-- 转存表中的数据 `eb_live_studio`
--

INSERT INTO `eb_live_studio` (`id`, `stream_name`, `uid`, `live_title`, `live_image`, `start_play_time`, `stop_play_time`, `live_introduction`, `special_id`, `online_user_num`, `online_num`, `studio_pwd`, `is_remind`, `remind_time`, `auto_phrase`, `add_time`, `is_del`, `is_recording`, `is_play`, `recording`, `record_time`, `is_playback`, `playback_record_id`, `sort`) VALUES
(10, '95292930', 0, '测试直播123', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/5ab3f202002111454479193.jpg', '2020-05-10 17:23:13', '2020-05-10 19:03:13', '测试直播123', 52, 0, 100, '', 1, 60, '欢迎进入小小飞的直播', 1582023314, 0, 1, 0, 0, 0, 0, '896b3f08-9348-4691-b302-fbc22085f267', 0),
(11, '62110228', 0, '直播测试666', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/99cb7202002111757434673.jpg', '2020-05-09 19:03:29', '2020-07-27 19:05:29', '直播测试666', 53, 0, 0, '123456', 0, 0, '欢迎来到直播间', 1582118064, 0, 1, 0, 0, 0, 0, '', 0),
(12, '83983260', 0, '语文学习技巧', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '2020-02-22 14:40:30', '14:42:30', '语文学习技巧', 54, 0, 0, '', 0, 0, '', 1582180941, 0, 1, 0, 0, 0, 1, '', 0),
(13, '15353990', 0, 'xxx', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e56f5202002201232449146.jpg', '2020-02-21 01:35:11', '01:45:11', 'xxx', 55, 0, 1000, '', 0, 0, 'xxx', 1582220245, 0, 1, 0, 0, 0, 1, '', 0),
(14, '16592282', 0, 'hover', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f4313202002201232435004.jpg', '2020-04-03 16:57:47', '2020-04-30 17:07:47', '11', 56, 0, 0, '123456', 0, 0, '1', 1582777857, 0, 1, 0, 0, 0, 1, '', 0),
(15, '65320530', 0, '测试直播', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', '2020-02-28 17:00:07', '18:40:07', '直播简介', 57, 0, 0, '123', 0, 0, '自动回复', 1582880542, 0, 1, 0, 0, 0, 1, '', 0),
(16, '16655398', 0, '1。', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '2020-03-02 21:49:38', '21:50:38', '235555', 58, 0, 5002, '666', 1, 10, '1', 1583157034, 0, 1, 0, 0, 0, 1, '', 0),
(17, '85160312', 0, '抖音分享', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/94120202003201005365388.jpg', '2020-03-26 11:08:02', '2020-03-28 23:08:02', '考题下载地址看回复。', 60, 0, 3, '', 0, 0, '考题下载地址：https://pan.baidu.com/s/1t6xsy8LatcGe8hdE1dmhxA 提取码: a138', 1584670688, 0, 1, 0, 0, 0, 0, '', 0),
(18, '68288335', 0, '71花姐房产课', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6a2e5202008190947084244.png', '2020-03-24 17:45:46', '2020-03-24 18:15:46', '71花姐房产课', 61, 0, 500, '', 1, 600, '花姐房产课', 1585043329, 0, 1, 0, 0, 0, 1, '', 0),
(19, '62202303', 0, '与文化及', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/db0fb202003111706459194.jpg', '2020-03-25 22:46:50', '2020-03-25 23:37:50', '直播我最爱', 62, 0, 0, '33', 1, 0, '来吧来吧不是罪', 1585147710, 0, 1, 0, 0, 0, 0, '', 0),
(20, '83115196', 0, '谢清波', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/db0fb202003111706459194.jpg', '2020-04-05 20:43:56', '2020-04-05 20:53:56', '谢清波', 63, 0, 879, '123', 0, 0, '欢迎光临', 1586090897, 0, 1, 0, 0, 0, 1, '', 10),
(21, '39815290', 0, 'vvvvv111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/94120202003201005365388.jpg', '2020-04-08 17:31:59', '2020-04-08 17:33:59', 'vvvvvvv', 64, 0, 5555, '', 0, 0, '欢迎000', 1586338456, 0, 0, 0, 0, 0, 0, '', 20),
(22, '56066122', 0, 'AAAAAAA', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/db0fb202003111706459194.jpg', '2020-05-04 15:37:58', '2020-05-04 16:37:58', '测测谁', 65, 0, 9999, '123456', 1, 10, '回复 z', 1586342359, 0, 1, 0, 0, 0, 1, '', 60),
(23, '15581508', 0, '语文12', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '2020-04-14 18:31:39', '2020-04-14 19:31:39', '12', 66, 0, 0, '', 0, 0, '14', 1586860416, 0, 1, 0, 0, 0, 0, '', 0),
(24, '95862623', 0, 'test111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/34285202002171340371181.gif', '2020-04-26 13:28:39', '2020-04-26 13:58:39', 'test111', 67, 0, 0, '', 0, 0, 'test111', 1587879026, 0, 1, 0, 0, 0, 0, '', 0),
(25, '56006005', 0, '测试', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/94120202003201005365388.jpg', '2020-04-26 15:57:49', '2020-05-03 14:37:49', '测试', 68, 0, 0, '', 0, 0, '你好', 1587886855, 0, 1, 0, 0, 0, 0, '', 0),
(26, '63199331', 0, '国学大讲堂', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f4313202002201232435004.jpg', '2020-04-29 14:30:51', '2020-04-29 15:30:51', '国学大讲堂', 69, 0, 10, '', 1, 30, '国学大讲堂', 1588141176, 0, 1, 0, 0, 0, 0, '', 0),
(27, '81032080', 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/32379202002201232449232.jpg', '2020-04-30 15:35:55', '2020-04-30 15:36:55', '小学二年级语文', 70, 0, 0, '', 1, 30, '小学二年级语文', 1588145928, 0, 1, 0, 0, 0, 0, '', 0),
(28, '86358861', 0, '李飞3', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '2020-05-04 14:30:13', '2020-05-04 16:21:13', '李飞', 71, 0, 0, '', 0, 0, '李飞', 1588573884, 0, 1, 0, 0, 0, 0, '', 0),
(29, '81022500', 0, '张老师的议论文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/db0fb202003111706459194.jpg', '2020-05-06 09:14:16', '2020-05-06 10:04:16', '张老师的议论文', 72, 0, 0, '', 0, 0, '欢迎来到张老师的议论文', 1588727890, 0, 1, 0, 0, 0, 0, '', 0),
(30, '88812212', 0, '666', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '2020-05-07 12:07:08', '2020-05-07 12:12:08', '666', 73, 0, 0, '', 0, 0, '666', 1588824540, 0, 1, 0, 0, 0, 0, '', 0),
(31, '61925500', 0, '1231231', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/94120202003201005365388.jpg', '2020-05-09 17:30:55', '2020-05-09 19:10:55', '123123', 74, 0, 0, '', 0, 0, '123123', 1589016344, 0, 1, 0, 0, 0, 0, '', 0),
(32, '25301905', 0, '1111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/94120202003201005365388.jpg', '2020-05-09 19:30:04', '2020-05-09 21:10:04', '1111', 75, 0, 0, '', 0, 0, '1111', 1589023790, 0, 0, 0, 0, 0, 0, '', 0),
(33, '56310320', 0, '测试的1111', '', '2020-05-11 11:49:52', '2020-05-11 12:01:52', '测试的1111', 76, 0, 0, '22', 0, 0, '测试的1111', 1589169077, 0, 0, 0, 0, 0, 0, '', 0),
(34, '93062565', 0, '12345601', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/887d9202002201232157812.jpg', '2020-06-04 22:39:32', '2020-06-05 01:39:32', '国语在线课程直播', 80, 0, 1000, '12345602', 0, 0, '欢迎来到国语在线课程直播间', 1589246620, 1, 1, 0, 0, 0, 1, '9f219585-466e-4695-84c9-356e2adb2c2f', 0),
(35, '61956050', 0, '如何以最快的速度提升英语成绩', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3ec76202002201232442683.jpg', '2021-02-04 12:01:33', '2021-02-04 12:11:33', '掌握生单词\n盲狙听力', 86, 0, 100, '123', 0, 0, '英语必备技巧', 1590462239, 0, 1, 0, 0, 0, 1, '20395874-45f7-41aa-a572-cd0e57882b73', 0),
(36, '31506528', 0, '我们如何拿下美国', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '2020-05-28 16:50:17', '2020-05-28 17:50:17', '我们如何拿下美国', 87, 0, 0, '', 0, 0, '我们如何拿下美国', 1590655312, 1, 1, 0, 0, 0, 0, '', 0),
(37, '96165060', 0, '用编程语言探索科学奥秘，数据科学与机器学习详细攻略', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/81612202006111151071568.jpeg', '2021-01-08 12:40:37', '2021-01-08 14:20:37', '重视这件事，满分数学赢中考', 92, 0, 12, '123', 1, 5, '满分数学', 1591849468, 0, 1, 0, 0, 0, 1, '0831e824-de6a-4e81-b24e-32ee9bd79c06', 0),
(38, '51615801', 0, '中考考前辅导应战高考必备技能', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/2f84c202006111225232093.jpeg', '2020-08-29 10:34:30', '2020-08-30 19:54:30', '中考考前辅导应战高考必备技能222222', 93, 0, 20000, '123', 1, 30, '中考考前辅导应战高考必备技能121', 1591849674, 1, 1, 0, 0, 0, 1, 'e5fdaec8-8f39-4324-ba55-73e906984a8d', 0),
(39, '12500226', 0, '考研冲刺政治类学科 直播教学课程', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/766a5202006111235491248.jpeg', '2020-07-23 17:32:11', '2020-07-23 18:32:11', ' 直播教学课程', 94, 0, 1020, '', 0, 0, '考研冲刺政治类学科 直播教学课程', 1591850605, 1, 0, 0, 0, 0, 0, '', 0),
(40, '95999262', 0, '两节课领悟物理训练法，在线课堂测验', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9c4f9202008131026306270.jpg', '2021-01-08 14:17:01', '2021-01-08 15:58:01', '如何突破物理教学中的难点的几种\n方法一、明确教学难点的内涵\n 方法 二、明确产生教学难点的原因 \n1、相关的准备知识不充分造成难点 \n2、前概念的干扰造成难点 \n3、知识的负迁移造成难点', 97, 0, 0, '123', 1, 2, '两节课领悟物理训练法，学物理，不再难', 1599721861, 0, 0, 0, 0, 0, 0, '', 0),
(41, '35960523', 0, '上课了', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4ae72202008191104029858.png', '2020-10-15 13:14:35', '2020-10-18 01:14:35', '日语教学', 102, 0, 0, '', 1, 10, '欢迎欢迎', 1602663436, 1, 0, 0, 0, 0, 0, '', 0),
(42, '58608603', 0, 'demo', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fb139202008190947097424.png', '2020-10-15 10:09:16', '2020-10-15 11:49:16', '111111111111', 103, 0, 1, '', 0, 0, '', 1602727881, 1, 0, 0, 0, 0, 0, '', 0),
(43, '68219808', 0, '化学 ', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '2020-10-19 14:12:12', '2020-10-19 14:22:12', '一起嗨皮', 104, 0, 0, '', 0, 0, '一起嗨皮', 1603088267, 1, 0, 0, 0, 0, 0, '', 0),
(44, '25502190', 0, '1111111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '2020-10-20 10:14:20', '2020-10-20 10:18:20', 'xxxxxx', 105, 0, 0, '', 1, 1, 'hhh', 1603160245, 1, 1, 0, 0, 0, 0, '', 0),
(45, '62652503', 0, '测试12', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/76eb9202009111609475901.jpg', '2020-10-20 12:06:27', '2020-10-20 12:51:27', '测试', 106, 0, 0, '', 1, 2, '测试', 1603166895, 1, 0, 0, 0, 0, 0, '', 0),
(46, '96062961', 0, 'asc', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '2020-10-20 15:03:17', '2020-10-20 15:53:17', 'asc', 107, 0, 0, '', 0, 0, 'asc', 1603177457, 1, 1, 0, 0, 0, 0, '', 0),
(47, '91520566', 0, 'asc', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '2020-10-20 15:03:17', '2020-10-20 15:53:17', 'asc', 108, 0, 0, '', 0, 0, 'asc', 1603177544, 1, 0, 0, 0, 0, 0, '', 0),
(48, '99658396', 0, '教你小学语文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '2020-10-21 20:12:51', '2020-10-21 20:24:51', 'test', 111, 0, 0, '', 0, 0, 'hi', 1603282495, 1, 1, 0, 0, 0, 0, '', 0),
(49, '51681103', 0, '小学测试直播', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8f3a5202009111607564577.jpg', '2020-10-22 14:15:05', '2020-10-22 19:15:05', '小学测试直播', 112, 0, 0, '', 1, 0, '小学测试直播', 1603347471, 1, 1, 0, 0, 0, 0, '', 0),
(50, '62288351', 0, '123', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/49d71202011011952212391.jpg', '2020-11-05 10:00:00', '2020-11-05 12:00:00', '123', 116, 0, 0, '', 1, 10, '123', 1604429416, 1, 1, 0, 0, 0, 0, '', 0),
(51, '52061028', 0, '888', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7844c20201027111954536.png', '2020-11-06 17:24:19', '2020-11-06 17:54:19', '888', 121, 0, 0, '', 0, 0, '888', 1604654765, 1, 1, 0, 0, 0, 0, '', 0),
(52, '22089190', 0, '1小时教会你文章内容归纳的高分技能!', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0568a20200813093454715.jpg', '2020-11-14 23:42:20', '2020-11-14 23:43:20', '1小时教会你文章内容归纳的高分技能!', 127, 0, 1000, '', 1, 4, '文章内容归纳', 1605368612, 1, 1, 0, 0, 0, 0, '', 0);


--
-- 表的结构 `eb_live_user`
--

CREATE TABLE `eb_live_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `live_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播间id',
  `add_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '首次浏览ip',
  `last_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '历史访问id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '首次访问时间',
  `last_time` int(11) NOT NULL DEFAULT '0' COMMENT '历史访问时间',
  `visit_num` int(11) NOT NULL DEFAULT '0' COMMENT '访问次数',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线 1=在线，0=下线',
  `is_ban` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁言，1=禁言，0=自由',
  `is_open_ben` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁止进入直播间 1=禁止，0=自由',
  `ban_time` int(11) NOT NULL DEFAULT '0' COMMENT '禁言时间',
  `open_ben_time` int(11) NOT NULL DEFAULT '0' COMMENT '禁止进入直播间时间',
  `is_follow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播间用户管理';

-- --------------------------------------------------------

--
-- 表的结构 `eb_member_card`
--

CREATE TABLE `eb_member_card` (
  `id` int(11) UNSIGNED NOT NULL,
  `card_batch_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '卡批次id',
  `card_number` varchar(200) NOT NULL DEFAULT '' COMMENT '卡号',
  `card_password` char(12) NOT NULL DEFAULT '' COMMENT '密码',
  `use_uid` int(11) NOT NULL DEFAULT '0' COMMENT '使用用户',
  `use_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '卡状态：0：冻结；1：激活',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_member_card_batch`
--

CREATE TABLE `eb_member_card_batch` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '批次名称',
  `total_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '生成卡数量',
  `use_day` int(11) UNSIGNED NOT NULL DEFAULT '7' COMMENT '体验天数',
  `use_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '使用',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否生效,控制此批次所有卡0：不生效；1：生效',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码图路径',
  `remark` varchar(502) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员卡批次表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_member_record`
--

CREATE TABLE `eb_member_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `oid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户uid',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '区别 0:购买 1:会员卡',
  `code` varchar(255) DEFAULT NULL COMMENT '卡号',
  `price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `purchase_time` int(50) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员购买时间',
  `is_free` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否免费',
  `is_permanent` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否永久',
  `overdue_time` int(50) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员过期时间',
  `validity` varchar(10) DEFAULT '0' COMMENT '有效期',
  `add_time` int(50) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员购买记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_member_ship`
--

CREATE TABLE `eb_member_ship` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '会员类别(1:普通会员)',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '会员名称',
  `vip_day` int(10) NOT NULL DEFAULT '0' COMMENT '会员时间(天)',
  `original_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠后价格',
  `is_permanent` int(2) NOT NULL DEFAULT '0' COMMENT '是否永久',
  `is_publish` int(2) NOT NULL DEFAULT '1' COMMENT '是否发布',
  `is_free` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否免费',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序倒序',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '删除',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员管理表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_phone_user`
--

CREATE TABLE `eb_phone_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户id,不关联为0',
  `grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '年级id',
  `new_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `add_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '添加ip',
  `pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `spread_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广员id',
  `is_promoter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_time` int(11) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `last_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁止,0=禁止,1=开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机号码注册用户表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_recommend`
--

CREATE TABLE `eb_recommend` (
  `id` int(11) NOT NULL,
  `typesetting` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=大图,2=宫图,3=小图,4=纯图,5=固定',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义跳转路径',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型0=专题,1=新闻,2=直播,3=自定义跳转,4=商品,5=热门直播,6=讲师,7=活动,8=拼团,9=菜单,10=素材',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `relation_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '关联id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=前端首页推荐 1=首页导航 2=个人中心菜单',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '年级id',
  `show_count` int(11) NOT NULL DEFAULT '0' COMMENT '展示多少个',
  `is_promoter` int(2) NOT NULL DEFAULT '0' COMMENT '是否需要推广权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐';

--
-- 转存表中的数据 `eb_recommend`
--

INSERT INTO `eb_recommend` (`id`, `typesetting`, `title`, `link`, `type`, `number`, `relation_ids`, `add_time`, `icon`, `image`, `sort`, `is_fixed`, `is_show`, `grade_id`, `show_count`, `is_promoter`) VALUES
(17, 1, '课程推荐', '', 0, 0, '', 1581402048, '', '', 0, 0, 1, 1, 10, 0),
(18, 0, '小学', '', 0, 0, '', 1581415908, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/34176202008191447346762.png', '', 10, 1, 1, 4, 0, 0),
(20, 0, '高中', '', 0, 0, '', 1581416083, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/01ccc202008191450103239.png', '', 8, 1, 1, 2, 0, 0),
(21, 0, '少儿编程', '', 0, 0, '', 1581416143, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b101120200819145017271.png', '', 7, 1, 1, 1, 0, 0),
(22, 0, '绘画', '', 0, 0, '', 1581416164, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6f8ce202008191450353008.png', '', 6, 1, 1, 5, 0, 0),
(23, 0, '公考', '', 0, 0, '', 1581416198, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/2593c202008191450273923.png', '', 5, 1, 1, 6, 0, 0),
(24, 0, '小语种', '', 0, 0, '', 1581416219, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b461d202008191451235187.png', '', 4, 1, 1, 7, 0, 0),
(25, 0, '考研', '', 0, 0, '', 1581416246, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/032d4202008191450437213.png', '', 3, 1, 1, 8, 0, 0),
(26, 2, '精品课程', '', 0, 0, '', 1581417034, '', '', 9, 0, 1, 4, 100, 0),
(27, 0, '我的课程', '/wap/special/grade_list.html', 3, 0, '', 1581502207, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/31685202008190947085097.png', '', 2, 1, 1, 0, 0, 0),
(28, 0, '我的收藏', '/wap/special/grade_list/type/1.html', 3, 0, '', 1581502283, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d17f620200819094709564.png', '', 1, 1, 1, 0, 0, 0),
(30, 2, '热销商品', '', 4, 0, '', 1581921700, '', '', 7, 0, 1, 4, 10, 0),
(31, 4, '在线直播', '', 0, 0, '', 1582180461, '', '', 10, 0, 1, 4, 10, 0),
(32, 5, '热门直播', '', 5, 0, '', 0, '', '', 10, 0, 1, 0, 0, 0),
(35, 0, '签到打卡', '/wap/my/sign_in', 3, 0, '', 1615539490, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1041b202103121654522618.png', '', 11, 2, 1, 0, 0, 0),
(37, 0, '推广中心', '/wap/spread/spread', 3, 0, '', 1615539616, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68fe1202103121654539278.png', '', 9, 2, 1, 0, 0, 1),
(40, 0, '我的赠送', '/wap/my/my_gift', 3, 0, '', 1615539728, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68d0e202103121654545242.png', '', 6, 2, 1, 0, 0, 0),
(41, 0, '我的余额', '/wap/my/bill_detail', 3, 0, '', 1615539761, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e3997202103121654544341.png', '', 5, 2, 1, 0, 0, 0),
(42, 0, '充值金币', '/wap/special/recharge_index', 3, 0, '', 1615539804, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/38d11202103121654528899.png', '', 4, 2, 1, 0, 0, 0),
(44, 0, '关于我们', '/wap/my/about_us', 3, 0, '', 1615539868, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d86d1202103121654532734.png', '', 2, 2, 1, 0, 0, 0),
(45, 0, '咨询客服', '/wap/service/service_list', 3, 0, '', 1615539906, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68aea202103121654546990.png', '', 1, 2, 1, 0, 0, 0),
(46, 0, '行业新闻', '', 1, 0, '', 1618912870, '', '', 0, 0, 1, 0, 4, 0),
(47, 2, '名师推荐', '', 10, 0, '', 1618912947, '', '', 0, 0, 1, 0, 4, 0),
(48, 0, '我的签到', 'http://kaiyuan.crmeb.net/wap/my/sign_in.html', 3, 0, '', 1618972526, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/64da4202104211033014264.png', '', 0, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_recommend_banner`
--

CREATE TABLE `eb_recommend_banner` (
  `id` int(11) NOT NULL,
  `recommend_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐id',
  `pic` varchar(300) NOT NULL DEFAULT '' COMMENT '图片链接',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐banner';

--
-- 转存表中的数据 `eb_recommend_banner`
--

INSERT INTO `eb_recommend_banner` (`id`, `recommend_id`, `pic`, `url`, `sort`, `is_show`, `add_time`) VALUES
(6, 26, 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/10f3d202002111757429313.jpg', '#', 0, 1, 1581924394);

-- --------------------------------------------------------

--
-- 表的结构 `eb_recommend_relation`
--

CREATE TABLE `eb_recommend_relation` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型0=专题,1=新闻,2=直播,3=自定义跳转,4=商品,5=热门直播,6=讲师,7=活动,8=拼团,9=菜单,10=素材',
  `recommend_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐id',
  `link_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主页推荐关联表';

--
-- 转存表中的数据 `eb_recommend_relation`
--

INSERT INTO `eb_recommend_relation` (`id`, `type`, `recommend_id`, `link_id`, `sort`, `add_time`) VALUES
(111, 0, 31, 1, 0, 1588047108),
(112, 0, 26, 2, 0, 1588047166),
(113, 0, 17, 3, 0, 1588047184),
(114, 0, 26, 3, 0, 1588047194),
(115, 0, 17, 4, 0, 1588047207),
(116, 0, 26, 5, 0, 1588047333),
(117, 0, 17, 5, 0, 1588047341),
(118, 1, 46, 8, 0, 1618912884),
(119, 1, 46, 7, 0, 1618912890),
(120, 1, 46, 3, 0, 1618912895),
(121, 1, 46, 2, 0, 1618912901),
(122, 10, 47, 66, 0, 1618912968),
(123, 10, 47, 61, 0, 1618912978),
(124, 10, 47, 58, 0, 1618912989),
(125, 10, 47, 52, 0, 1618913000),
(126, 0, 26, 134, 0, 1618913041),
(127, 0, 26, 132, 0, 1618913047),
(128, 0, 26, 131, 0, 1618913054),
(129, 0, 26, 130, 0, 1618913061),
(130, 0, 17, 126, 0, 1618913394),
(131, 0, 17, 114, 0, 1618913400),
(132, 1, 46, 1, 0, 1618968697);

-- --------------------------------------------------------

--
-- 表的结构 `eb_routine_access_token`
--

CREATE TABLE `eb_routine_access_token` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '小程序access_token表ID',
  `access_token` varchar(256) NOT NULL DEFAULT '' COMMENT 'openid',
  `stop_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序access_token表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_routine_form_id`
--

CREATE TABLE `eb_routine_form_id` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '表单ID表ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `form_id` varchar(32) NOT NULL DEFAULT '' COMMENT '表单ID',
  `stop_time` int(11) UNSIGNED DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '状态1 未使用 2不能使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单id表记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_routine_template`
--

CREATE TABLE `eb_routine_template` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '模板id',
  `tempkey` char(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信模板';

--
-- 转存表中的数据 `eb_routine_template`
--

INSERT INTO `eb_routine_template` (`id`, `tempkey`, `name`, `content`, `tempid`, `add_time`, `status`) VALUES
(1, '16172', '直播开播提醒', '直播名称{{thing5.DATA}}\n开播时间{{time2.DATA}}', 'TnX4gJF1WqAxuYxOkhlqWZyhgNGnQtmKlfn8vi_vHR0', '1617846740', 1),
(2, '5275', '拼团进度通知', '商品名称{{thing1.DATA}}\n已拼人数{{number6.DATA}}\n温馨提醒{{thing4.DATA}}', 'r2ehtNIsXchmOKLUuhg5DC96O-2-xKkLyI88q640aus', '1617846791', 1),
(3, '4533', '开团成功提醒', '商品名称{{thing5.DATA}}\n开团价格{{amount4.DATA}}\n成团人数{{thing7.DATA}}\n开团时间{{date1.DATA}}', 'hl-2ZYOmw6mBFW36bXngGuEgPskdLmMAeYEhJvsEIfI', '1617846868', 1),
(4, '6271', '订单支付成功通知', '订单编号{{character_string1.DATA}}\n订单金额{{amount3.DATA}}\n支付时间{{time2.DATA}}\n备注{{thing6.DATA}}', '065lubx3Gg6zkSdQULmA91VmfvC7nd7a5tEmA_5aU5Y', '1617846920', 1),
(5, '4534', '拼团失败通知', '商品名称{{thing1.DATA}}\n商品金额{{amount8.DATA}}\n退款金额{{amount5.DATA}}', 'ndgwreIddk1Bi4p5eJGvkxxy9aBpj1LIU_k3T0Dbj7I', '1617846971', 1),
(6, '3098', '拼团成功通知', '订单号{{character_string10.DATA}}\n商品名称{{thing7.DATA}}\n备注{{thing9.DATA}}', 'y2i2_uYAK8LYc1kCXKXeCIKsnHPjo9MnGuepRrAr7k0', '1617847017', 1),
(7, '4148', '账户余额变动提醒', '变动类型{{thing8.DATA}}\n时间{{date4.DATA}}\n变动金额{{amount1.DATA}}\n账户余额{{amount2.DATA}}\n备注{{thing5.DATA}}', 'jVIfUXIWkdinesHaFsSHDAvkkDgOO1mO9_7PLUM8gm8', '1617847076', 1),
(8, '1451', '退款通知', '订单编号{{character_string7.DATA}}\n下单时间{{time8.DATA}}\n退款金额{{amount3.DATA}}', 'tAYhnrZ3FEH_yOCvLfRRK42DiEh97UQn2P_8qCOlrn8', '1617847129', 1),
(9, '3510', '收货提醒通知', '订单编号{{character_string9.DATA}}\n商品名称{{thing2.DATA}}\n确认收货时间{{date8.DATA}}', 'bZiuqzZv7fyfgQ6_oilWpKp3XZSbs-4ufYsQIxRws64', '1617847219', 1),
(10, '3637', '订单发货通知', '订单号{{character_string2.DATA}}\n快递公司{{thing4.DATA}}\n快递单号{{character_string5.DATA}}', 'PVHY84-y5jGdbL5tPsnVybk9OXDI8F_Jhyyv4Z7X22A', '1617847273', 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_search`
--

CREATE TABLE `eb_search` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词名',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词搜索设置';

--
-- 转存表中的数据 `eb_search`
--

INSERT INTO `eb_search` (`id`, `name`, `add_time`) VALUES
(29, '语文', 1581476333),
(30, '数学', 1581476338),
(31, '英语', 1581476343);

-- --------------------------------------------------------

--
-- 表的结构 `eb_search_history`
--

CREATE TABLE `eb_search_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索内容',
  `add_time` int(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史搜索';

-- --------------------------------------------------------

--
-- 表的结构 `eb_sign_poster`
--

CREATE TABLE `eb_sign_poster` (
  `id` int(11) UNSIGNED NOT NULL,
  `sign_time` int(50) UNSIGNED NOT NULL DEFAULT '0' COMMENT '签到时间',
  `poster` varchar(255) DEFAULT NULL COMMENT '分享海报',
  `sign_talk` varchar(255) DEFAULT NULL COMMENT '签到语录',
  `sort` int(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(50) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到海报';

-- --------------------------------------------------------

--
-- 表的结构 `eb_sms_code`
--

CREATE TABLE `eb_sms_code` (
  `id` int(5) NOT NULL COMMENT 'id',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '谁发送的',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '验证码',
  `last_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '过期时间',
  `is_use` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否已使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `eb_special`
--

CREATE TABLE `eb_special` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `subject_id` int(11) NOT NULL DEFAULT '0' COMMENT '科目id',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属管理者id',
  `lecturer_id` int(11) DEFAULT '0' COMMENT '讲师ID',
  `type` tinyint(2) NOT NULL DEFAULT '6' COMMENT '专题类型1：图文专题；2：音频专题；3：视频专题；4：直播专题；5：专栏；6：其他专题',
  `abstract` varchar(1000) NOT NULL DEFAULT '' COMMENT '简介',
  `phrase` varchar(2000) NOT NULL DEFAULT '' COMMENT '短语',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `label` varchar(1000) NOT NULL DEFAULT '' COMMENT '标签',
  `banner` varchar(2000) NOT NULL DEFAULT '' COMMENT 'banner图',
  `poster_image` varchar(255) NOT NULL DEFAULT '' COMMENT '海报',
  `service_code` varchar(255) NOT NULL DEFAULT '' COMMENT '客服二维码',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_live` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为直播',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pink_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '拼团价格',
  `is_pink` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启拼团',
  `pink_number` int(11) NOT NULL DEFAULT '0' COMMENT '拼团人数',
  `pink_strar_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团开始时间',
  `pink_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团结束时间',
  `pink_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时间',
  `is_fake_pink` tinyint(1) NOT NULL DEFAULT '0' COMMENT '虚拟拼团是否开启',
  `fake_pink_number` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟拼团人数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `fake_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `browse_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付类型',
  `member_pay_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员支付类型0：免费，1付费',
  `member_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `link` varchar(512) NOT NULL DEFAULT '' COMMENT '音频视频专题链接'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题';

--
-- 转存表中的数据 `eb_special`
--

INSERT INTO `eb_special` (`id`, `title`, `subject_id`, `admin_id`, `lecturer_id`, `type`, `abstract`, `phrase`, `image`, `label`, `banner`, `poster_image`, `service_code`, `is_show`, `is_del`, `is_live`, `money`, `pink_money`, `is_pink`, `pink_number`, `pink_strar_time`, `pink_end_time`, `pink_time`, `is_fake_pink`, `fake_pink_number`, `sort`, `sales`, `fake_sales`, `browse_count`, `add_time`, `pay_type`, `member_pay_type`, `member_money`, `link`) VALUES
(51, '功能测试', 16, 0, 0, 1, '功能测试', '功能测试', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/9d76920200212180711743.png', '[\"\\u6d4b\\u8bd5\",\"24\\u8282\"]', '[\"http:\\/\\/testcrmeb.oss-cn-beijing.aliyuncs.com\\/9d76920200212180711743.png\"]', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7809f202002111801111378.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/bd2ef202002111519022660.jpg', 1, 1, 0, '200.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1581674470, 1, 1, '0.00', ''),
(80, '12345601', 15, 0, 0, 4, '国语在线课程直播', '国语在线课程', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/887d9202002201232157812.jpg', '[\"\\u56fd\\u8bed\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/78cdd20200220123244525.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/32095202002111804187328.jpg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1570, 1589246620, 2, 0, '0.00', ''),
(86, '如何以最快的速度提升英语成绩', 14, 0, 3, 4, '掌握生单词\n盲狙听力', '英语必备技巧', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/252a7202102051439145861.jpg', '[\"\\u5199\\u4f5c\\u80fd\\u529b\",\"\\u9898\\u76ee\\u542c\\u529b\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/252a7202102051439145861.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/2f6dd202102051439124401.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a90f420210331144458422.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '0.00', '50.00', 0, 10, 0, 0, 24, 1, 1, 7, 0, 0, 3312, 1590462239, 0, 0, '0.00', ''),
(87, '我们如何拿下美国', 13, 0, 0, 4, '我们如何拿下美国', '我们如何拿下美国', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '[\"\\u554a\\u65af\\u8482\\u82ac\",\"\\u7684\\u7b49\\u7b49\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/744f3202002201232457195.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 1590655312, 0, 0, '0.00', ''),
(92, '用编程语言探索科学奥秘，数据科学与机器学习详细攻略', 12, 6, 0, 4, '重视这件事，满分数学赢中考', '数据科学与机器学习详细攻略', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4a002202102051439139927.jpg', '[\"\\u6ee1\\u5206\\u6570\\u5b66\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/4a002202102051439139927.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/b3f4c202102051439113750.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a32e2202103311444593633.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1772820210204112506468.jpg', 1, 0, 0, '0.00', '49.00', 0, 3, 0, 0, 28, 1, 10, 8, 0, 0, 5359, 1591849468, 0, 0, '0.00', ''),
(93, '中考考前辅导应战高考必备技能', 11, 0, 0, 4, '中考考前辅导应战高考必备技能222222', '中考考前辅导应战高考必备技能00000', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/2f84c202006111225232093.jpeg', '[\"\\u9ad8\\u8003\",\"\\u6bcf\\u665a8\\u70b9\\u76f4\\u64ad\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/2f84c202006111225232093.jpeg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/000c0202006111059448593.jpeg', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2526, 1591849674, 0, 0, '0.00', ''),
(94, '考研冲刺政治类学科 直播教学课程', 10, 0, 0, 4, ' 直播教学课程', '考研冲刺政治类学科 直播教学课程', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/766a5202006111235491248.jpeg', '[\"\\u8003\\u7814\\u51b2\\u523a\",\"\\u76f4\\u64ad\\u8bfe\\u7a0b\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/766a5202006111235491248.jpeg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/000c0202006111059448593.jpeg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 728, 1591850604, 0, 0, '0.00', ''),
(95, '测试', 9, 0, 1, 3, '测试', '测试短语', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9c4f9202008131026306270.jpg', '[\"\\u6d4b\\u8bd5\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/f2421202008131029443601.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/867ac202008131029437663.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/c0980202008131017418057.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b09d0202006151207503716.jpeg', 1, 1, 0, '0.50', '0.30', 0, 3, 0, 0, 24, 1, 1, 0, 0, 5, 2336, 1597999983, 1, 1, '0.02', ''),
(97, '两节课领悟物理训练法，在线课堂测验', 8, 0, 4, 4, '如何突破物理教学中的难点的几种\n方法一、明确教学难点的内涵\n 方法 二、明确产生教学难点的原因 \n1、相关的准备知识不充分造成难点 \n2、前概念的干扰造成难点 \n3、知识的负迁移造成难点', '两节课领悟物理训练法', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/141c6202102051506022453.jpg', '[\"\\u9ad8\\u5206\\u7269\\u7406\",\"\\u6ee1\\u5206\\u6280\\u5de7\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/141c6202102051506022453.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68923202103311444588033.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '3.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 9, 0, 0, 2561, 1599721861, 1, 1, '1.00', ''),
(98, '音频测试1', 7, 0, 2, 2, '音频测试', '音频测试', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9c4f9202008131026306270.jpg', '[\"\\u97f3\\u9891\\u6d4b\\u8bd5\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/9c4f9202008131026306270.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/7a470202008131026304274.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1f323202008131017359479.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b09d0202006151207503716.jpeg', 1, 1, 0, '2.00', '1.00', 0, 3, 0, 0, 24, 1, 1, 0, 0, 0, 659, 1599811376, 1, 0, '0.00', ''),
(99, '初入职场老师教你10个常见的面试问题，助你节节高升', 6, 0, 0, 3, '解题技巧', '解题技巧', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/da482202102051439146544.jpg', '[\"\\u89e3\\u9898\\u6280\\u5de7\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/da482202102051439146544.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '123.00', '40.00', 0, 3, 1616688000, 1619712000, 12, 1, 1, 2, 0, 4, 3237, 1600411248, 1, 1, '100.00', ''),
(100, '职场风雨，变幻莫测，专业分析职场人的第一堂沟通课', 5, 0, 0, 2, '化学30天提分冲刺', '化学30天提分冲刺', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/2d4ea202102051439143072.jpg', '[\"\\u63d0\\u5206\\u51b2\\u523a\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/2d4ea202102051439143072.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a32e2202103311444593633.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '12.00', '50.00', 0, 3, 0, 0, 24, 1, 2, 0, 0, 0, 312, 1600411383, 1, 0, '0.00', ''),
(101, '物理高分不是梦，初二物理培训班，打好基础轻松学物理', 6, 0, 4, 1, '初二物理基础巩固', '初二物理基础巩固', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/603ea202102051501544536.jpg', '[\"\\u57fa\\u7840\\u5de9\\u56fa\",\"\\u7269\\u7406\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/c37f2202102041655194133.png\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fe172202103311437166009.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '46.00', '88.00', 0, 3, 1616688000, 1619712000, 24, 1, 10, 0, 0, 100, 831, 1600411935, 1, 0, '0.00', ''),
(102, '上课了', 7, 0, 0, 4, '日语教学', '上课上课', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4ae72202008191104029858.png', '[\"\\u4e0a\\u8bfe\\u54e6\",\"\\u5b89\\u5b89\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/f2421202008131029443601.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/867ac202008131029437663.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f939b202002201114298263.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 59, 1602663435, 0, 0, '0.00', ''),
(103, 'demo', 8, 0, 0, 4, '111111111111', '1111111111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fb139202008190947097424.png', '[\"1111\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d17f620200819094709564.png\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dfdee202008190947099676.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dfdee202008190947099676.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1602727881, 0, 0, '0.00', ''),
(104, '化学 ', 9, 0, 0, 4, '一起嗨皮', '一起嗨皮', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '[\"\\u5927\\u4ed9\",\"\\u674e\\u767d\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/4ae72202008191104029858.png\",\"http:\\/\\/crmeb-dev.oss-cn-beijing.aliyuncs.com\\/b0ba2202010171623597946.jpg\"]', 'http://crmebzsff.oss-cn-shanghai.aliyuncs.com/aec25202010151823069977.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d890c202008251645337998.jpg', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 34, 1603088267, 0, 0, '0.00', ''),
(105, '1111111', 10, 0, 0, 4, 'xxxxxx', '!!!111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '[\"qq\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/8f3a5202009111607564577.jpg\"]', 'http://crmeb-dev.oss-cn-beijing.aliyuncs.com/b0ba2202010171623597946.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4ae72202008191104029858.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 1603160245, 0, 0, '0.00', ''),
(106, '测试12', 11, 0, 0, 4, '测试', '测试', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/76eb9202009111609475901.jpg', '[\"\\u518c\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/76eb9202009111609475901.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/76eb9202009111609475901.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9b585202008190947093964.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 1603166895, 0, 0, '0.00', ''),
(107, 'asc', 12, 0, 0, 4, 'asc', 'asc', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '[\"asc\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/1f323202008131017359479.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6a2e5202008190947084244.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e4d3c202008190947086915.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 127, 1603177457, 0, 0, '0.00', ''),
(108, 'asc', 13, 0, 0, 4, 'asc', 'asc', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '[\"asc\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/1f323202008131017359479.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6a2e5202008190947084244.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e4d3c202008190947086915.png', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 1603177544, 0, 0, '0.00', ''),
(111, '教你小学语文', 14, 0, 0, 4, 'test', 'test', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/86d3d202010171626094183.jpg', '[\"test\"]', '[\"http:\\/\\/crmeb-dev.oss-cn-beijing.aliyuncs.com\\/b0ba2202010171623597946.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6a2e5202008190947084244.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d890c202008251645337998.jpg', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1603282495, 0, 0, '0.00', ''),
(112, '小学测试直播', 15, 0, 0, 4, '小学测试直播', '小学测试直播', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8f3a5202009111607564577.jpg', '[\"\\u5c0f\\u5b66\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/fb139202008190947097424.png\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/459e3202008190947098800.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4ae72202008191104029858.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 231, 1603347471, 0, 0, '0.00', ''),
(113, '动效设计全能实战班，每个人都是灵魂设计师', 16, 0, 3, 1, '趣味英语100句', '趣味英语100句', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ef780202102051439162430.jpg', '[\"\\u8da3\\u5473\\u82f1\\u8bed\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/ef780202102051439162430.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/74c85202103311437156925.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '20.00', '8.00', 0, 5, 1616688000, 1619712000, 48, 1, 10, 0, 0, 235, 1496, 1603717133, 1, 0, '0.00', ''),
(114, '零基础入门用专业软件搭建任务管理系统 知识付费系统', 15, 0, 0, 5, '通过直播、在线付费视频、音频、图文等多种内容形式，结合分销推广、课程专题、课程推荐、拼团等方式助力内容营销，快速实现内容变现', '赋能开发者，提速企业数字化', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b3c1520210205143915824.jpg', '[\"\\u4e13\\u680f\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/b3c1520210205143915824.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a90f420210331144458422.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '32.00', '9.90', 0, 2, 1616688000, 1619712000, 24, 1, 10, 0, 0, 0, 3090, 1603718226, 1, 1, '3.00', ''),
(116, '123', 14, 0, 0, 4, '123', '123', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/49d71202011011952212391.jpg', '[\"123\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/49d71202011011952212391.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/49d71202011011952212391.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9b585202008190947093964.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 62, 1604429416, 0, 0, '0.00', ''),
(118, '白居易诗全集', 13, 0, 0, 1, '白居易诗全集', '白居易诗全集', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/30951202010271115351696.png', '[\"12\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d17f620200819094709564.png\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f3d29202010271119182403.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d890c202008251645337998.jpg', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1604566496, 0, 0, '0.00', ''),
(121, '888', 12, 0, 0, 4, '888', '888', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7844c20201027111954536.png', '[\"888\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/7844c20201027111954536.png\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7844c20201027111954536.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7844c20201027111954536.png', 0, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 14, 1604654765, 0, 0, '0.00', ''),
(126, '托福考前冲刺班名师讲解十天完成自我突破', 11, 0, 0, 5, '快速提分、解题思路', '轻松通过托福考试\n', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/966de202102051439159849.jpg', '[\"\\u65e5\\u8bed\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/44910202002201232149124.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/9f41f202002201232146791.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dc6dd202103311226582269.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0ed0d202012041137596591.png', 1, 0, 0, '99.00', '88.00', 0, 4, 0, 0, 24, 1, 20, 0, 0, 0, 930, 1605319214, 1, 0, '0.00', ''),
(127, '1小时教会你文章内容归纳的高分技能!', 10, 0, 3, 4, '1小时教会你文章内容归纳的高分技能!', '文章内容归纳', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0024b202102051450053773.jpg', '[\"\\u521d\\u4e2d\\u8bed\\u6587\",\"\\u6587\\u7ae0\\u5185\\u5bb9\\u5f52\\u7eb3\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/0024b202102051450053773.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/12ce3202102041121337140.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1772820210204112506468.jpg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 6, 0, 0, 1969, 1605368612, 0, 0, '0.00', ''),
(128, '高考必备指南，英语四六级考试逆袭攻略，学英语找CRMEB知识付费', 9, 0, 4, 3, '答卷技巧', '答卷技巧', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7a4eb202102051439158891.jpg', '[\"\\u7b54\\u5377\\u6280\\u5de7\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/7a4eb202102051439158891.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/66b0b202102041626325843.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 0, 1, 0, '8.00', '4.00', 0, 3, 0, 0, 28, 1, 1, 0, 0, 0, 199, 1610077613, 1, 1, '6.00', ''),
(129, '轻松掌握多国语言，托福雅思助你完成出国留学梦', 9, 0, 0, 3, '托福雅思助你完成出国梦', '女神七宝茶', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b3f4c202102051439113750.jpg', '[\"\\u5973\\u795e\\u4e03\\u5b9d\\u8336\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/b3f4c202102051439113750.jpg\",\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d688b20210205143912253.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dc6dd202103311226582269.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 882, 1614680528, 0, 0, '0.00', ''),
(130, '少儿英语学习，听说读写四项基本能力', 8, 0, 4, 1, '少儿英语学习，听说读写四项基本能力', '少儿英语学习，听说读写四项基本能力', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dbb3a202103301518057631.jpg', '[\"\\u6570\\u5b66\\u8bfe\\u5802\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/dbb3a202103301518057631.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/156f8202103311437155549.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '9.90', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 55, 1617088925, 1, 1, '8.90', ''),
(131, '幼少儿英语阅读训练方法', 7, 0, 3, 1, '幼少儿英语阅读训练方法', '幼少儿英语阅读训练方法', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4bd802021033015112352.jpg', '[\"\\u6570\\u5b66\\u8bad\\u7ec3\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/4bd802021033015112352.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/5acf2202103311437167287.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '19.00', '12.80', 0, 2, 1618416000, 1622390400, 24, 1, 1, 0, 0, 0, 269, 1617089039, 1, 1, '18.00', ''),
(132, '高中语文词汇成语古诗阅读', 6, 0, 2, 1, '高中语文词汇词根', '高中语文词汇词根', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ed3ba202103301511237923.jpg', '[\"\\u9605\\u8bfb\\u65b9\\u6cd5\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/ed3ba202103301511237923.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7cfa3202103311437168888.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4c36a202102041418105988.jpg', 1, 0, 0, '99.00', '0.01', 0, 3, 1617033600, 1619712000, 24, 1, 1, 0, 0, 0, 192, 1617089270, 1, 1, '88.00', ''),
(133, '不忘初心，逐梦前行2020年众邦科技年会', 5, 0, 1, 3, '不忘初心，逐梦前行 | 众邦科技2021战略年会成功举办', '不忘初心，逐梦前行 | 众邦科技2021战略年会成功举办', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e424520210330154635980.jpg', '[\"\\u4f17\\u90a6\\u5e74\\u4f1a\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/e424520210330154635980.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fe172202103311437166009.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 85, 1617090465, 0, 0, '0.00', ''),
(134, '写作提升突破', 5, 0, 3, 1, '1小时教会你文章内容归纳的高分技能!', '文章内容归纳', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0024b202102051450053773.jpg', '[\"\\u5c0f\\u5b66\\u8bed\\u6587\",\"\\u6587\\u7ae0\\u5f52\\u7eb3\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/267f3202002201232144167.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 862, 1617090559, 0, 0, '0.00', ''),
(135, '面向未来的教育方式', 6, 0, 0, 2, '面向未来的教育方式', '面向未来的教育方式', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/883d0202103301610344021.jpg', '[\"\\u672a\\u6765\\u6559\\u80b2\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/883d0202103301610344021.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68923202103311444588033.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/81ddb2021033016104942.jpg', 1, 0, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 64, 1617092462, 0, 0, '0.00', ''),
(136, '要培养出富有创造力的学生', 7, 0, 2, 2, '要培养出富有创造力的学生', '要培养出富有创造力的学生', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/18080202103301616003225.jpg', '[\"\\u521b\\u9020\\u80fd\\u529b\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/18080202103301616003225.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/cc8bf202103311437164863.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b0ba2202102051657251479.png', 1, 0, 0, '9.99', '8.00', 0, 3, 1618416000, 1622390400, 24, 1, 1, 0, 0, 0, 169, 1617092549, 1, 1, '8.99', ''),
(137, '1111', 8, 0, 4, 1, '2222', '111', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', '[\"\\u5927\\u5927\\u5927\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/75824202103311437161428.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1618545351, 0, 0, '0.00', ''),
(138, 'sss', 9, 0, 4, 1, 'aaaa', 'aaaa', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a32e2202103311444593633.jpg', '[\"sss\"]', '[\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/a32e2202103311444593633.jpg\"]', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/75824202103311437161428.jpg', 1, 1, 0, '0.00', '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1618545575, 0, 0, '0.00', '');


--
-- 表的结构 `eb_special_barrage`
--

CREATE TABLE `eb_special_barrage` (
  `id` int(11) NOT NULL,
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id 0=全部可用',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户图像',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '动作类型 1=开团，2=参团',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示，默认显示',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='专题弹幕';

--
-- 转存表中的数据 `eb_special_barrage`
--

INSERT INTO `eb_special_barrage` (`id`, `special_id`, `nickname`, `avatar`, `action`, `sort`, `is_show`, `add_time`) VALUES
(24, 0, '666', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/6b85d202002111757421971.jpg', 1, 0, 1, 1582011509),
(25, 0, '666', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/6b85d202002111757421971.jpg', 1, 0, 1, 1582011520),
(26, 0, 'yy', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7f0bd202002111757435432.jpg', 1, 0, 1, 1582018672);

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_buy`
--

CREATE TABLE `eb_special_buy` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `column_id` int(11) DEFAULT '0' COMMENT '是专栏下专题时显示专栏ID',
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '获得方式:0=支付获得,1=拼团获得,2=领取礼物获得,3=赠送'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题获得记录';

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_content`
--

CREATE TABLE `eb_special_content` (
  `id` int(11) NOT NULL,
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专栏id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专栏内容关联表';

--
-- 转存表中的数据 `eb_special_content`
--

INSERT INTO `eb_special_content` (`id`, `special_id`, `add_time`, `content`) VALUES
(45, 45, 1581401647, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(46, 46, 1581404545, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(47, 47, 1581405126, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(48, 48, 1581415485, '&lt;p&gt;&lt;img src=&quot;http://testcrmeb.oss-cn-beijing.aliyuncs.com/7809f202002111801111378.jpg&quot;/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://testcrmeb.oss-cn-beijing.aliyuncs.com/fiGXiG7CTkixmPRNJG.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(49, 49, 1581415680, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(50, 50, 1581417733, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(51, 51, 1581674470, '&lt;p&gt;测试&lt;/p&gt;'),
(52, 52, 1582023314, '&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/RNa86XX25czCt8HhGB.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(53, 53, 1582118064, '&lt;p&gt;&lt;img src=&quot;http://testcrmeb.oss-cn-beijing.aliyuncs.com/7809f202002111801111378.jpg&quot;/&gt;&lt;/p&gt;'),
(54, 54, 1582180941, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg&quot;/&gt;&lt;/p&gt;'),
(55, 55, 1582220245, '&lt;p&gt;xxxxxx&lt;br/&gt;&lt;/p&gt;'),
(56, 56, 1582777857, '&lt;p&gt;11111&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/mMtYnBsmkeewmxa86b.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(57, 57, 1582880542, '&lt;p&gt;&lt;span style=&quot;color: rgb(103, 106, 108); font-family: &amp;quot;open sans&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 13px; text-align: right; background-color: rgb(255, 255, 255);&quot;&gt;直播简介&lt;/span&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg&quot;/&gt;&lt;/p&gt;'),
(58, 58, 1583157034, '&lt;p&gt;111111111&lt;/p&gt;'),
(59, 59, 1584670147, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/yfyQMWy4jYrCBXJ5pW.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;熔断是什么？&lt;/p&gt;'),
(60, 60, 1584670688, '&lt;p&gt;11&lt;/p&gt;'),
(61, 61, 1585043329, '&lt;p&gt;71花姐房产课&lt;/p&gt;'),
(62, 62, 1585147710, '&lt;p&gt;韦森么&lt;/p&gt;'),
(63, 63, 1586090897, '&lt;p&gt;直播测试&lt;/p&gt;'),
(64, 64, 1586338456, '&lt;p&gt;测试&lt;/p&gt;'),
(65, 65, 1586342359, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/teWQ6nbHpkAwf24ijs.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;测测&lt;br/&gt;&lt;/p&gt;'),
(66, 66, 1586860416, '&lt;p&gt;是的是的所&lt;/p&gt;'),
(67, 67, 1587879026, '&lt;p&gt;test111test111test111test111&lt;/p&gt;'),
(68, 68, 1587886855, '&lt;p&gt;测试&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://v.douyin.com/wFpCVE/&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(69, 69, 1588141176, '&lt;p&gt;吃的是&lt;/p&gt;'),
(70, 70, 1588145928, '&lt;p&gt;小学二年级语文&lt;/p&gt;'),
(71, 71, 1588573884, '&lt;p&gt;李飞&lt;/p&gt;'),
(72, 72, 1588727890, '&lt;p&gt;张老师的议论文张老师的议论文张老师的议论文张老师的议论文张老师的议论文张老师的议论文&lt;/p&gt;'),
(73, 73, 1588824540, '&lt;p&gt;666&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://jx.7639616.com/?url=https://cn6.18787000118.com/hls/20200423/371b633439baf6c0816797177c025c14/index.m3u8&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(74, 74, 1589016344, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://v.youku.com/v_show/id_XNDY2NjI2MzE5Mg==.html&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;123123&lt;br/&gt;&lt;/p&gt;'),
(75, 75, 1589023790, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://67587.liveplay.myqcloud.com/live/111.flv&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;111&lt;/p&gt;'),
(76, 76, 1589169077, '&lt;p&gt;佛挡杀佛大幅度&lt;/p&gt;'),
(77, 77, 1589195304, '&lt;p&gt;123&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://1300629834.vod2.myqcloud.com/f0ba3c2dvodsh1300629834/143ccb475285890803736238140/a1ijArsmphoA.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dtWp5iChpXJnFi23hX.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(78, 78, 1589195508, '&lt;p&gt;图文专题图文专题图文专题图文专题图文专题图文专题图文专题图文专题图文专题图文专题图文专题&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ce99d202002201232432554.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f4313202002201232435004.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(79, 79, 1589195820, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fdf00202006111116423569.jpeg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;字母A开头&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Academic year：组成学年的单位，如：学期、学季等。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Academic advisor：由学校中之教授或职员担任，帮助学生学业问题之顾问。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Accreditation：资格认可。申请学校时应特别注意所申请的学校是否被有关机关认可。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Admission：入学许可。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Advanced placement：申请美国大学时，可经由考试或转学分(transfer credit)而直接进入大一、 大二、大三或大四。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Advanced standing：同Advanced placement。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Associate degree：副学士学位。为高中毕业后所上的两年制社区大学(Community College)或两年制学院(Two-year College)所发给的学位。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Audit：旁听。没有学分、考试，但要求费用与正式生相同。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;strong&gt;字母B开头&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Bachelor&amp;#39;s degree： 学士学位。由四年制大学毕业所取得的学位。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Baccalaureate degree： 学士学位。由四年制大学毕业所取得的学位。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Bursar： 学校之财务及会计部门。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Bulletin: 布告、公告。通常学校课程介绍目录也叫bulletin.&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;strong&gt;字母C开头&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Campus： 校园，校区&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Candidate notification date： 学校公布其对于学生申请结果的决定的日期。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-family: &amp;quot;Microsoft YaHei&amp;quot;, SimSun, arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　Candidate reply date： 回函期限。大部份学校会指定的一个日期，此日之前学生必须通知学校是否要入学。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(80, 80, 1589246620, '&lt;p&gt;国语在线课程直播&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/HrZEEQrMpipW25i3TH.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(81, 81, 1589247357, '&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;空间与图形是小学数学基础知识的一部分，也是初中数学的重要组成部分。几何图形中最基本的图形就是点、线、面、体，点动形成线，线动形成面，面动形成体。而小学数学中所学的一些基本几何图形的周长公式、面积公式、体积公式是探究几何的基础，也是初中进步探究相关几何图形的必备工具。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/65029202006111114191953.jpeg&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;div class=&quot;img-container&quot; style=&quot;margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;数量单位与我们生活息息相关，不会单位换算可能会给生活带来极大的不方面。当然单位换算也是我们小学数学中的一个重点内容，在初中数学的学习过程中，单位的换算也是经常考到的一个知识点。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d7f3e202006111114223245.jpeg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;计算是中小学数学的基础，也是研究数学的必备基础。说到计算我们就要清楚基本的运算顺序和相关的运算法则，分数的运算法则是小学生比较容易混淆的一个知识点，但是在初一数学有理数的运算中却经常用到，所以一定要熟练掌握。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(82, 82, 1589247505, '&lt;p&gt;专栏专题&lt;/p&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/HrZEEQrMpipW25i3TH.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(83, 83, 1590051562, '&lt;p&gt;开始&lt;/p&gt;'),
(84, 84, 1590193222, '&lt;p&gt;视频&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/NEprZFhn2QkK6sdstS.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(85, 85, 1590208547, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d1e27202006111121359948.jpeg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/46a4d202006111125352465.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/91755202006111125356985.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/57fea202006111125368149.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/14132202006111125368057.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(86, 86, 1590462239, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/709a220210204120459397.png&quot;/&gt;&lt;/p&gt;'),
(87, 87, 1590655312, '&lt;p&gt;啊斯蒂芬&lt;/p&gt;'),
(88, 88, 1590682103, '&lt;p&gt;杀的发送到发送到发斯蒂芬&lt;/p&gt;'),
(89, 89, 1591846081, '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d1e27202006111121359948.jpeg&quot;/&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d1e27202006111121359948.jpeg&quot; width=&quot;730&quot; height=&quot;761&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/46a4d202006111125352465.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/91755202006111125356985.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/57fea202006111125368149.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/14132202006111125368057.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://v.youku.com/v_show/id_XNDExOTU3NDg0MA==.html&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(90, 90, 1591846315, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3ea00202006111129417100.jpeg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;我们从小学习我们的母语汉语时是从听、说开始的，所以小编认为初学英语入门自学也要从听和说开始。小编建议大家初学英语时可以结合着英语录音学习，跟着录音一起读。这时大家先不用了解所读的英文是什么意思，最主要的是练习英语发音。经过一段时间的练习之后，我们就能培养出一定的英语语感，接着就可以进入下一阶段的学习了。当然，发音练习也不要停下来。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;词汇是英语的根基，如果词汇量不足，那么，肯定是学不好英语的。要想更快地积累词汇，大家最好是能学会英语音标，学会了音标后很多单词我们只要会读就能将它拼写出来。另外，小编建议大家最好是每天都抽出一小段时间来积累单词，一次背几个单词就可以，只要大家能长期坚持，我们的词汇量会越来越丰富。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;读英语文章是一个可以帮助我们全面提升英语水平的好方法，现在网络这么发达，我们即使不到书店去买书，在网络上同样可以找到很多英语文章。读文章时我们可以认识更多的单词，可以学会很多俗语、语法知识。如果我们阅读文章的时候读出声来，阅读还能培养我们的英语语感。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(91, 91, 1591846909, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b3b48202006111136289788.jpeg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 当前提升教学质量整体上是以牺牲学生休息时间、加重学业负担来实现的，这样的教学质量更多的是重考试分数，而轻习惯、能力、创造力培养。我们要更新教育教学质量观，树立全面发展、聚焦核心素养、增进人的现代化的教育质量观。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 如何让学生快乐学，就数学学科而言戴老师概括为：首先，要想办法让学生喜欢你；其次，让学生体验数学本身的魅力，从而喜欢数学；其三，努力把复杂的知识变简单，把高深的数理变简单，把枯燥的知识变有趣。真正能做到这三点，对教师自身的品格和专业素养有较高的要求。要让学生轻松学、快乐学、智慧学，须通过教师的教学艺术与教学智慧，变学生被动学为主动学、变枯燥地学为有趣地学，提高课堂教学效率。为了达到简单教数学之目的，必须坚持主体性、趣味性、简约性原则，遵循教学的规律、学生认知的规律和学生成长的规律。注重因材施教，不要盲目跟风，戴老师的案例中指出了跟风的弊端，杜郎口、洋思中学的课堂教学模式风靡全国，按照他们的模式教学，可能会走入另一个极端。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 因为各个学校学生、教师、历史沿革、文化背景等都不相同，我们要有清醒的认识，遵循教育教学规律，取其精华结合实际为我所用，方能取得实效。在标准和环节分析中，更重视聚焦课堂教学核心内容，留给学生更多的时间去思考、实践，让学生有深度的感受和体验，切忌教师过度“导航”。对于课堂作业的设计戴老师认为在 “量”上做减法与加法，在质上做乘法，突出针对性、层次性，形式上突出多样性、变通性，一题多练，一题多变。反思我们的日常作业很少做这样的思考与实践，以完成课本、练习册、补充习题册、口算本上的习题为主，原因有多方面的，有教师层面的，有学校层面的，也有社会层面的，如果不把上述几种作业做好，家长首先是不理解不同意的，学校工作也不便于统一管理，上级部门检查会认为工作不到位。今后的教学中，可以在现有的工作基础上逐步展开尝试。关于作业的批改，深有同感。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 戴老师通过课内及时改、快速的改、学生批改等方式，来提高批改效率，增强练习与复习的针对性和实效性，形成了较为系统的做法，值得学习借鉴。这样的课堂，教师教得简单，学生学得实在。简单教数学如何达成？戴老师做了较为详细的阐述。有几点感受颇深。第一，要有准备地教。不能凭经验上课，把更多的时间放在课前准备——研究教材、研究学生、研究课堂，走向专业发展的道路上。正如成尚荣先生所言：经验是可贵的，但也是可怕的；优秀教师要从高地走向高峰，就要不断地超越自己，从某种意义上说，优秀是卓越的敌人。&lt;/p&gt;');
INSERT INTO `eb_special_content` (`id`, `special_id`, `add_time`, `content`) VALUES
(92, 92, 1591849468, '&lt;p style=&quot;white-space: normal;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 76, 65); font-size: 40px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;01&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; color: rgb(255, 76, 65); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/数学式/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(86, 86, 86); font-size: 15px;&quot;&gt;在较复杂的运算中，因不注意运算顺序或者不合理使用运算律，致使运算出现错误。常见陷阱是在实数的运算中符号层层相扣。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;要求随机或者在某个范围内代入求值时，注意所代值必须要使式子有意义，常见陷阱是候选值里有一个会使分母为零。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;注意分式运算中的通分不要与分式方程计算中的去分母混淆。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱4：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(86, 86, 86); font-size: 15px;&quot;&gt;非负数的性质：若几个非负数的和为0，则每个式子都为0；&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;常见非负数有：绝对值，非负数的算术平方根，完全平方式。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱5：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;五个基本数的混合运算：0指数，基本三角函数，绝对值，负指数，二次根式的化简，这些需牢记。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱6：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;科学计数法中，精确度和有效数字的概念要清楚。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 76, 65); font-size: 40px; letter-spacing: 1px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0２&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; color: rgb(255, 76, 65); letter-spacing: 1px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/方程（组）与不等式（组）/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;运用等式性质解方程时，切记等式两边不能直接约去含有未知数的公因式，必须要考虑约去的含有未知数的公因式为零的情形。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;常在考查不等式的题目时候埋设关于性质3的陷阱，许多人因忘记改变符号的方向而导致结果出错。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;关于一元二次方程中求某参数的取值范围的题目中，埋设二次项系数包含参数这一陷阱，易忽视二次项系数不为0导致出错。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱4：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;解分式方程时，首要步骤是去分母，分数相当于括号，易忘记最后对根的检验，导致运算结果出错。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱5：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;关于一元一次不等式组有解无解的条件，易忽视相等的情况；利用函数图象求不等式的解集和方程的解时，注意端点处的取值。&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; text-align: center; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 76, 65); font-size: 40px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0３&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; color: rgb(255, 76, 65); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/函数/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;关于函数自变量的取值范围埋设陷阱。注意：①分母≠0，二次根式的被开方数≥0，0指数幂的底数≠0；②实际问题中许多自变量的取值不能为负数。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;根据一次函数的性质（或者实际问题、动点问题等）判断函数的图象出错，一次函数图象性质与k、b之间的关系掌握不到位。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;二次函数y=ax2+bx+c的图象位置和参数a，b，c的关系。常在选择题中的压轴题来考查。&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱4：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;在有些函数或方程的表述形式上埋设陷阱，如表述为“函数y=ax2+bx+c”，这里因为没有特别注明是二次函数，所以一定要注意当a=0的情况，如表述为“方程ax2+bx+c=0”，则该方程不一定为一元二次方程，故还要考虑当a=0的情况。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱5：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;在关于二次函数的应用题中，常见陷阱是当y取得最值时，自变量x不在其范围内。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱6：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;根据反比例函数性质比较大小时，要注意看两点是否在同一分支上，若不在同一分支上，则直接利用正负情况比较大小；若在同一分支上，则利用增减性判断；若末明确点所在象限，要分类讨论。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 40px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0４&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/三角形/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;br/&gt;&lt;br/&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;三角形三边之间的不等关系，注意其中的“任何两边”。最短距离的方法。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;在论证三角形全等、三角形相似等问题时，对应点或者对应边容易出错。注意边边角（SSA）不能证两个三角形全等。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;关于等腰三角形的陷阱比较多，并且几乎每年必考，如在解决仅告诉某三角形是等腰三角形，而没有具体说明哪两条边是腰、那两个角是底角的计算与证明问题时，注意需分类讨论。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱4：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;运用勾股定理及其逆定理计算线段的长、证明线段的数量关系、解决与面积有关的问题以及简单的实际问题时，注意先确定直角或者斜边，如不能确定，需分类讨论。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱5：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;涉及三角形面积时，确定底边对应的高容易出错（特别拿钝角三角形为陷阱诱导考生出错）。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 40px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0５&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/四边形&lt;/strong&gt;&lt;/span&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(16, 179, 184); font-size: 17px;&quot;&gt;/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65); font-size: 15px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1&lt;/strong&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;平行四边形的性质和判定，如何灵活、恰当地应用。如利用性质“一组对边平行且相等的四边形是平行四边形”时，注意“同一组对边”这个关键词。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;常通过条件中没有给出图形这一方法埋设陷阱，大家要善于利用已知条件画出所有可能的情形，当题目中有不确定的已知条件时，要注意分类讨论。防止在解题过程中只看到一种情形，要注意全面考虑。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;四边形中的翻折、平移、旋转、剪拼等动手操作性问题，注意其中的不变与变化。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 40px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0６&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/圆/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;对弧、弦、圆周角等概念理解不深刻，特别是弦所对的圆周角有两种情况要特别注意，两条弦之间的距离也要考虑两种情况。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;考查圆与圆的位置关系时，相切有内切和外切两种情况，包括相交也存在两圆圆心在公共弦同侧和异侧两种情况，许多人容易忽视其中的一种情况。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱3：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;圆周角定理是重点，同弧（等弧）所对的圆周角相等，直径所对的圆周角是直角，90度的圆周角所对的弦是直径，一条弧所对的圆周角等于它所对的圆心角的一半。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 40px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;０７&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/对称图形/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;图形的轴对称或旋转问题，要充分运用其性质解题，即运用图形的“不变性”，如在轴对称和旋转中角的大小不变，线段的长短不变。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;将轴对称与全等混淆，关于直线对称与关于轴对称混淆。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 40px; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;0８&lt;/strong&gt;&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 17px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;/统计与概率/&lt;/strong&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱1：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;求概率的方法：&lt;br/&gt;&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;（1）简单事件；&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;（2）两步以及两步以上的简单事件求概率的方法：利用树状或者列表表示各种等可能的情况与事件的可能性的比值；&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; color: rgb(86, 86, 86); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif;&quot;&gt;（3）复杂事件求概率的方法运用频率估算概率。&lt;/span&gt;&lt;/section&gt;&lt;section&gt;&lt;br/&gt;&lt;/section&gt;&lt;section&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; color: rgb(255, 76, 65);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;陷阱2：&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;判断是否公平的方法是判断概率是否相等，注意频率与概率的联系与区别。&lt;/span&gt;&lt;/section&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 15px; color: rgb(86, 86, 86);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(93, 93, 1591849674, '&lt;p&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;高考，是大部分高中生进入大学的必经之路。每年高考后都会伴随着很多的离别不舍和欢声啼语。它意味着你们人生中一段旅程的结束，即将开启你们的另一段崭新旅程！&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　你们即将踏入高考的战场，随着考试的临近，很多人都开始慌了起来。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　你们从小就被老师或者父母灌输着这样的一种思想：&lt;/span&gt;&lt;br/&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/2f84c202006111225232093.jpeg&quot;/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　唯有考上大学、考一个好一点的大学甚至是名牌大学，你未来的人生才会前途无量、未来的道路上才会走万丈光芒、才不枉你幸苦寒窗苦读十几载……&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　但或许是老师或者父母强加给你的一种思想，在你的潜意识中，你把它奉为了一种准则在你们很多人心中，根本就没有想过：你为什么要参加高考、为什么要考大学、要考一个什么样的大学？&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　你们大多数人现在每天除了完成课堂的任务，就是按自己划定的任务去紧张地复习着。还有一小部分人，根本就没有想过高考这回事，他们在这三年间的某一天对学习已经厌倦，或者是已经处于混日子状态，过一天算一天。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　对于你们现在的处境，概括出来就差不多是上面这两种情况，但不管是哪一种情况，你们都有一个共同的目标，就是等待着高考的那一天到来。不管是哪一种情况，都建议大家：做好当下，想想未来！&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　千里之行，始于足下。不管你们现在基础怎样，复习得怎么样，可以说基本已成型。在你们之中，有的感到紧张迷茫、有的浮躁学不进去、有的根本就没有学的自主意识。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(85, 89, 95); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;　　对于这些情况，你们得：静下心来，想想将来。然后尽自己最大的努力，调整心态。背背必考的和古诗词、物理化学公式、英语单词好句、画画题、做做套卷找找感觉。&lt;/span&gt;&lt;/p&gt;'),
(94, 94, 1591850604, '&lt;p&gt;考研冲刺线上授课&amp;nbsp; 考研冲刺线上授课谁家可靠&amp;nbsp; 大连考研冲刺线上授课谁家可靠&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/766a5202006111235491248.jpeg&quot;/&gt;&lt;/p&gt;&lt;p&gt;对于某些成绩一般或者有点偏科的同学来说，自己的复习当然重要，但是如果能够有老师的指导那一定是事半功倍，拓普考研辅导班的老师多是有着丰富考研辅导经验的老师，对于考研科目的知识了如指掌、重点难点要点考点都能够指点给大家，还有一些考研经验、方法技巧对同学们来说很有用处。对于那些想考名校的同学来说，大家的基础一般都比较好，如果能够自己制定比较完整合理的计划并认真执行下去，一般考上不会有大问题，但症结在于同学们想考的是名校，这个难度是肯定要升上去的，因此还是有部分同学会选报辅导班，尤其是一些强化班冲刺班类的，借助老师的帮助向高分冲刺。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(95, 95, 1597999983, '&lt;p&gt;asdfasdf&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(96, 96, 1599186999, '&lt;p&gt;测试小学英语1&lt;br/&gt;&lt;/p&gt;'),
(97, 97, 1599721861, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/5af4f202102041430079456.png&quot;/&gt;&lt;/p&gt;'),
(98, 98, 1599811376, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/867ac202008131029437663.jpg&quot;/&gt;&lt;/p&gt;'),
(99, 99, 1600411248, '&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/SPDfMcyT5YR6bEacGw.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(100, 100, 1600411383, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/wW7kTRFi3BWjEBKJRT.mp3&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(101, 101, 1600411935, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/jAZPYBiGXPcBjCx3xz.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(102, 102, 1602663436, '&lt;p&gt;ddd啥啥啥&lt;/p&gt;'),
(103, 103, 1602727881, '&lt;p&gt;123123&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `eb_special_content` (`id`, `special_id`, `add_time`, `content`) VALUES
(104, 104, 1603088267, '&lt;p&gt;阿萨达&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/a27jbdA6eKXKikmehB.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(105, 105, 1603160245, '&lt;p&gt;xxxxx&lt;/p&gt;'),
(106, 106, 1603166895, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/76eb9202009111609475901.jpg&quot;/&gt;&lt;/p&gt;'),
(107, 107, 1603177457, '&lt;p&gt;scscscs&lt;/p&gt;'),
(108, 108, 1603177544, '&lt;p&gt;scscscs&lt;/p&gt;'),
(109, 109, 1603180257, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/EEis2GNBJBtNfRd2Zy.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.123&lt;/span&gt;&lt;/p&gt;'),
(110, 110, 1603248756, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;https://pan.baidu.com/s/1T1a6V4Xp6DWxA8Zfb_lLww&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(111, 111, 1603282495, '&lt;p&gt;fdsfdsfdd&lt;/p&gt;'),
(112, 112, 1603347471, '&lt;p&gt;小学测试直播&lt;/p&gt;'),
(113, 113, 1603717133, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/zjp3E44W4MXEWGDZxF.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(114, 114, 1603718226, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4b36f202102070935343220.jpg&quot;/&gt;&lt;/p&gt;'),
(115, 115, 1604334316, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/nwewZbkwCYMKGZEWGN.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(116, 116, 1604429416, '&lt;p&gt;123&lt;/p&gt;'),
(117, 117, 1604465378, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ctCjwKnH8F3XPi5eMr.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(118, 118, 1604566496, '&lt;p&gt;《白居易诗全集》&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;皇帝嗣宝历，元和三年冬。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;自冬及春暮，不雨旱(左火右三虫)(左火右三虫)。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;上心念下民，惧岁成灾凶。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;遂下罪己诏，殷勤告万邦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;帝曰予一人，继天承祖宗。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;忧勤不遑宁，夙夜心忡忡。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;元年诛刘辟，一举靖巴邛。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;二年戮李(钅奇)，不战安江东。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;顾惟眇眇德，遽有巍巍功。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;或者天降(珍左换氵)，无乃儆予躬？&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;上思答天戒，下思致时邕。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;莫如率其身，慈和与俭恭。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;乃命罢进献，乃命赈饥穷。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;宥死降五刑，已责宽三农。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;宫女出宣徽，厩马减飞龙。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;庶政靡不举，皆出自宸衷。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;奔腾道路人，伛偻田野翁。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;欢呼相告报，感泣涕沾胸。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;顺人人心悦，先天天意从。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;诏下才七日，和气生冲融。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;凝为悠悠云，散作习习风。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;昼夜三日雨，凄凄复蒙蒙。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;万心春熙熙，百谷青(艹凡)(艹凡)。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;人变愁为喜，岁易俭为丰。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;乃知王者心，忧乐与众同。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;皇天与后土，所感无不通。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;冠佩何锵锵，将相及王公。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;蹈舞呼万岁，列贺明庭中。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;小臣诚愚陋，职忝金銮宫。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;稽首再三拜，一言献天聪：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;君以明为圣，臣以直为忠；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;敢贺有其始，亦愿有其终。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;读张籍古乐府&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;张君何为者？业文三十春。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;尤工乐府诗，举代少其伦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;为诗意如何？六义互铺陈。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;风雅比兴外，未尝著空文。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;读君学仙诗，可讽放佚君。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;读君董公诗，可诲贪暴臣。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;读君商女诗，可感悍妇仁。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;读君勤齐诗，可劝薄夫敦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;上可裨教化，舒之济万民。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;下可理情性，卷之善一身。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;始从青衿岁，迨此白发新。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;日夜秉笔吟，心苦力亦勤。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;时无采诗官，委弃如泥尘。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;恐君百岁后，灭没人不闻。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;愿藏中秘书，百代不湮沦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;愿播内乐府，时得闻至尊。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;言者志之苗，行者文之根。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;所以读君诗，亦知君为人。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;如何欲五十，官小身贱贫。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;病眼街西住，无人行到门。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(119, 119, 1604594166, '&lt;div style=&quot;font-family: &amp;quot;lucida Grande&amp;quot;, Verdana, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color:#333333;font-family:苹方-简, Helvetica Neue, Helvetica, Hiragino Sans GB, STXihei, 华文细黑, Segoe UI, Arial, Microsoft YaHei, 微软雅黑, SimSun, sans-serif&quot;&gt;凭证装订&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;font-family: &amp;quot;lucida Grande&amp;quot;, Verdana, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color:#333333;font-family:苹方-简, Helvetica Neue, Helvetica, Hiragino Sans GB, STXihei, 华文细黑, Segoe UI, Arial, Microsoft YaHei, 微软雅黑, SimSun, sans-serif&quot;&gt;&lt;a href=&quot;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282591431823.mp4&quot; target=&quot;_blank&quot; style=&quot;outline: none; cursor: pointer; color: rgb(30, 84, 148);&quot;&gt;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282591431823.mp4&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;font-family: &amp;quot;lucida Grande&amp;quot;, Verdana, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color:#333333;font-family:苹方-简, Helvetica Neue, Helvetica, Hiragino Sans GB, STXihei, 华文细黑, Segoe UI, Arial, Microsoft YaHei, 微软雅黑, SimSun, sans-serif&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;font-family: &amp;quot;lucida Grande&amp;quot;, Verdana, &amp;quot;Microsoft YaHei&amp;quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;div&gt;&lt;span style=&quot;color: rgb(51, 51, 51);&quot;&gt;票种核定&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;a href=&quot;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282344222833.mp4&quot; target=&quot;_blank&quot; style=&quot;outline: none; cursor: pointer; color: rgb(30, 84, 148);&quot;&gt;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282344222833.mp4&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282591431823.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282344222833.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(120, 120, 1604595085, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/iwT7KW5cmfnmrdn3Tk.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6hbD4ZFzNZGAHnNT4M.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282591431823.mp4票种核定http://cloud.video.taobao.com/play/u/2219392776/p/1/e/6/t/1/282344222833.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;'),
(121, 121, 1604654765, '&lt;p&gt;888&lt;/p&gt;'),
(122, 122, 1604852111, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/RwbcwYxD6AtFR3zKJr.mp4&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;23&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;12323123456&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;'),
(123, 123, 1605101854, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/KXA2dxNGyeMX3nW4A2.mp3&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;是发送到发撒的发生是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发是发送到发撒的发生的发阿士大夫撒地方撒地方是否达士大夫撒旦发.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;我要测试&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;我要测试&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;'),
(124, 124, 1605102052, '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;div&gt;&lt;video style=&quot;width: 100%&quot; src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/x2ihShX8cYzJ32tZjF.mp3&quot; class=&quot;video-ue&quot; controls=&quot;controls&quot;&gt;&lt;/video&gt;&lt;/div&gt;&lt;p&gt;&lt;span style=&quot;color:white&quot;&gt;.&lt;span style=&quot;color: white; background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;水电费水电费水&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0); color: white;&quot;&gt;阿士大夫撒打发士大夫撒地方&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0); color: white;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0); color: white;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0); color: white;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color: rgb(0, 0, 0); color: white;&quot;&gt;电费&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;'),
(125, 125, 1605145743, '&lt;p&gt;测试西语课程内容1&lt;/p&gt;'),
(126, 126, 1605319214, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/cb51d202103301112066634.jpg&quot;/&gt;&lt;/p&gt;'),
(127, 127, 1605368612, '&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;初中语文专题课&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;来啦!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;1小时教会你&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;文章内容归纳&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;高分技能&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;带你&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;分析&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;考情&lt;/span&gt;,了解&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;出题方式&lt;/span&gt;、&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答题技巧&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;你想听的应有尽有~&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;听语文学院派大师&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;帮你开启初中语文提分攻坚战！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://5b0988e595225.cdn.sohucs.com/images/20181026/f2d6ad72728c44ad82dcf7e348f92374.jpeg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;初中语文专题课&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;1小时教会你&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;文章内容归纳&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;高分技能！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;主讲人：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;时间:&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;10月26日晚20:30--21:30&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;两小儿辩学&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;一小儿问：&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;初中什么学科最幸福?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰：&lt;/span&gt;语文！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;对曰：&lt;/span&gt;何故？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰：&lt;/span&gt;上课就是听故事，考试就是看故事，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;偶尔作文就是编故事，学习就是故事，还不幸福？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;对曰：&lt;/span&gt;学习就是故事，但是故事看完，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;如何归纳总结就是事故了，幸福何在？尽是烦恼！不信你瞧：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【本文讲了一个_________________________的故事】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【文章第三段讲的是_______________________的事】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请用简要的语言概括本文的主要内容】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据文章内容补全文章情节】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据文章内容写出作者情感或心理变化】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据主要内容补写情节和情感】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;：这有何难？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;且看喜鹊学堂语文大咖，如何用1小时教会你&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;【文章内容归纳】&lt;/span&gt;的高分技能！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;三大人群轻松掌握&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初一轻松学&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初二熟练用&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初三斩高分&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;四大亮点解决问题&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;系统梳理文章情节&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;透彻把握文章情感&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;精准分析命题趋势&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;深度研究命题特点&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;五大绝招快速提分&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有重点的讲&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有目的的练&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有对经典例题的剖析&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有对历年真题的突破&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;更有答题技巧的独家密授！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(128, 128, 1610077613, '&lt;p&gt;答卷技巧&lt;/p&gt;'),
(129, 129, 1614680528, '&lt;p&gt;女神七宝茶&lt;/p&gt;'),
(130, 130, 1617088925, '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/aab8d202103301511493834.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);&quot;&gt;对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(131, 131, 1617089039, '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/92bd7202103301511323954.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);&quot;&gt;对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(132, 132, 1617089270, '&lt;p&gt;&lt;img src=&quot;http://cremb-zsff.oss-cn-beijing.aliyuncs.com/720bd202103301511241384.jpg&quot;/&gt;&lt;/p&gt;&lt;div class=&quot;para&quot; style=&quot;font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;三步通晓法&lt;/div&gt;&lt;div class=&quot;para&quot; style=&quot;font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;第一步是“粗读”。这个阶段主要完成三个任务： 1 、了解文章体裁、作者、出处以及写作年月、背景等。 2 、查工具书弄懂生字、生词的表面意思。 3 、捕捉段落主句，迅速准确地从全局上把握文章的中心和主旨。如《挖荠菜》一文是通过挖荠菜、吃荠菜的不同感受的叙写，表现两代人之间的不同心态以及作者的希望。&lt;/div&gt;&lt;div class=&quot;para&quot; style=&quot;font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;第二步是“细读”。这个阶段要解决三个问题：一是找出表现中心思想所选用的材料。如《挖荠菜》一文，为表现主题所选用的材料是： 1 、“馋丫头”; 2 、被赶下水; 3 、挖吃荠菜; 4 、怀念荠菜; 5 、带领孩子们挖荠菜。二是掌握文章的结构布局。如《挖荠菜》是运用夹叙夹议表达主题的写法。&lt;/div&gt;&lt;div class=&quot;para&quot; style=&quot;font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;第三步是“精读”。这是对文章的品读咀嚼、欣赏吸收。这个阶段主要完成两个任务： 1 、研究文章写法手法对表现主题的作用; 2 、掌握绝妙之处，摘抄背诵优美段落。仍以《挖荠菜》为例，这个阶段就应当仔细分析作者为什么采用对比的表现手法?采用夹叙夹议的表达方法对表现主题有什么作用?还应探讨作者以“馋”字落笔有什么好处，最后还要对文章的警句、点睛之笔摘抄、赏析和背诵。&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(133, 133, 1617090465, '&lt;p&gt;&lt;span style=&quot;color: rgb(40, 40, 40); font-family: &amp;quot;PingFang SC&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, &amp;quot;微软雅黑,Arial&amp;quot;, sans-serif; letter-spacing: 2px; text-align: justify; text-indent: 32px; background-color: rgb(249, 249, 249);&quot;&gt;律回春晖渐，万象始更新。2021年1月30日下午14时，一场众邦小伙伴齐心协力共同策划的以《不忘初心，逐梦前行》为主题的2021战略年会正式拉开帷幕，公司全体员工一起动手将运营中心装点的色彩斑斓，并精心排练准备了各类小节目，与公司总经理及中高层管理人员齐聚一堂，总结过去一年取得的成绩，谋划新一年的发展方向。&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `eb_special_content` (`id`, `special_id`, `add_time`, `content`) VALUES
(134, 134, 1617090559, '&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;初中语文专题课&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;来啦!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;1小时教会你&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;文章内容归纳&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;高分技能&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;带你&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;分析&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;考情&lt;/span&gt;,了解&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;出题方式&lt;/span&gt;、&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答题技巧&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;你想听的应有尽有~&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;听语文学院派大师&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;帮你开启初中语文提分攻坚战！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://5b0988e595225.cdn.sohucs.com/images/20181026/f2d6ad72728c44ad82dcf7e348f92374.jpeg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;初中语文专题课&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;1小时教会你&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;文章内容归纳&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;的&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;高分技能！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;主讲人：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;时间:&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;10月26日晚20:30--21:30&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;两小儿辩学&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;一小儿问：&lt;/span&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;初中什么学科最幸福?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰：&lt;/span&gt;语文！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;对曰：&lt;/span&gt;何故？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰：&lt;/span&gt;上课就是听故事，考试就是看故事，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;偶尔作文就是编故事，学习就是故事，还不幸福？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;对曰：&lt;/span&gt;学习就是故事，但是故事看完，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;如何归纳总结就是事故了，幸福何在？尽是烦恼！不信你瞧：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【本文讲了一个_________________________的故事】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【文章第三段讲的是_______________________的事】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请用简要的语言概括本文的主要内容】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据文章内容补全文章情节】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据文章内容写出作者情感或心理变化】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;【请根据主要内容补写情节和情感】&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;答曰&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;：这有何难？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;且看喜鹊学堂语文大咖，如何用1小时教会你&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;【文章内容归纳】&lt;/span&gt;的高分技能！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;三大人群轻松掌握&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初一轻松学&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初二熟练用&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;初三斩高分&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;四大亮点解决问题&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;系统梳理文章情节&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;透彻把握文章情感&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;精准分析命题趋势&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;深度研究命题特点&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;◆&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;五大绝招快速提分&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有重点的讲&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有目的的练&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有对经典例题的剖析&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;有对历年真题的突破&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0.63em; margin-bottom: 1.8em; border: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &amp;quot;PingFang SC&amp;quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;更有答题技巧的独家密授！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),
(135, 135, 1617092462, '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);&quot;&gt;《面向未来的教育》的目标读者是回答了&amp;quot;要培养出富有创造力的学生，我们教育者该怎么做&amp;quot;的问题。作者在第一部分提出，教育领域的创新不是设备、具体方法的更新，而应该是思维方式的转变，因此教育者要在学校塑造&amp;quot;创新型思维模式&amp;quot;。第二部分、第三部分是本书最核心的内容，为教育者提供了奠定创新基础、释放创新潜能的9大方案，帮助教育者从具体处入手，建设创新校园。第四部分则是总结和反思，探讨我们的创新教育究竟该何去何从。&lt;/span&gt;&lt;/p&gt;'),
(136, 136, 1617092549, '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);&quot;&gt;《面向未来的教育》的目标读者是回答了&amp;quot;要培养出富有创造力的学生，我们教育者该怎么做&amp;quot;的问题。作者在第一部分提出，教育领域的创新不是设备、具体方法的更新，而应该是思维方式的转变，因此教育者要在学校塑造&amp;quot;创新型思维模式&amp;quot;。第二部分、第三部分是本书最核心的内容，为教育者提供了奠定创新基础、释放创新潜能的9大方案，帮助教育者从具体处入手，建设创新校园。第四部分则是总结和反思，探讨我们的创新教育究竟该何去何从。&lt;/span&gt;&lt;/p&gt;'),
(137, 137, 1618545351, '&lt;p&gt;dddd&lt;/p&gt;'),
(138, 138, 1618545575, '&lt;p&gt;qqqq&lt;/p&gt;');

--
-- 表的结构 `eb_special_course`
--

CREATE TABLE `eb_special_course` (
  `id` int(11) NOT NULL,
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `course_name` varchar(100) NOT NULL DEFAULT '' COMMENT '课程名称',
  `is_show` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否上架',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程(1.1版本后废弃)';

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_record`
--

CREATE TABLE `eb_special_record` (
  `id` int(11) NOT NULL,
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '再次访问时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习记录';

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_relation`
--

CREATE TABLE `eb_special_relation` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=专题,1=图文',
  `link_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型,1=收藏,2=点赞',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文专题点赞收藏';

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_source`
--

CREATE TABLE `eb_special_source` (
  `id` int(11) NOT NULL,
  `special_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '专题id',
  `source_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '素材id(task表id)',
  `pay_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:免费，1：付费',
  `play_count` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '课程光看次数',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='素材专题关联表';

--
-- 转存表中的数据 `eb_special_source`
--

INSERT INTO `eb_special_source` (`id`, `special_id`, `source_id`, `pay_status`, `play_count`, `sort`, `add_time`) VALUES
(1, 2, 2, 1, 0, 0, 1588045424),
(2, 2, 1, 0, 0, 0, 1588045424),
(3, 3, 4, 0, 0, 0, 1588046472),
(4, 3, 3, 0, 0, 0, 1588046472),
(5, 4, 6, 1, 0, 0, 1588046648),
(6, 4, 5, 0, 0, 0, 1588046648),
(7, 5, 4, 0, 0, 0, 1588046788),
(8, 5, 2, 0, 0, 0, 1588046788),
(9, 5, 3, 0, 0, 0, 1588046788);

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_subject`
--

CREATE TABLE `eb_special_subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `pic` varchar(255) DEFAULT '' COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示,1=显示,0=隐藏',
  `grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程分类列表';

--
-- 转存表中的数据 `eb_special_subject`
--

INSERT INTO `eb_special_subject` (`id`, `name`, `pic`, `sort`, `is_show`, `grade_id`, `add_time`, `is_del`) VALUES
(1, '小学', '', 0, 1, 0, 1618470289, 0),
(2, '初中', '', 0, 1, 0, 1618470299, 0),
(3, '高中', '', 0, 1, 0, 1618470306, 0),
(4, '大学', '', 0, 1, 0, 1618470313, 0),
(5, '语文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/15c59202104151509555157.jpeg', 0, 1, 1, 1618470617, 0),
(6, '数学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4230e202104151510076554.jpeg', 0, 1, 1, 1618470638, 0),
(7, '初中语文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/15c59202104151509555157.jpeg', 0, 1, 2, 1618470672, 0),
(8, '初中数学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4230e202104151510076554.jpeg', 0, 1, 2, 1618470687, 0),
(9, '初中化学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/24f0b202104151509382120.jpeg', 0, 1, 2, 1618470703, 0),
(10, '高中语文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/15c59202104151509555157.jpeg', 0, 1, 3, 1618470727, 0),
(11, '高中数学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4230e202104151510076554.jpeg', 0, 1, 3, 1618470741, 0),
(12, '高中生物', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f7e8e202104151509483381.jpeg', 0, 1, 3, 1618470762, 0),
(13, '高中化学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/24f0b202104151509382120.jpeg', 0, 1, 3, 1618470777, 0),
(14, '高等数学', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4230e202104151510076554.jpeg', 0, 1, 4, 1618470800, 0),
(15, '大学语文', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/15c59202104151509555157.jpeg', 0, 1, 4, 1618470820, 0),
(16, '编程', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/6132f202104151510019168.jpeg', 0, 1, 4, 1618470836, 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_task`
--

CREATE TABLE `eb_special_task` (
  `id` int(11) NOT NULL,
  `coures_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id（1.1版本后废弃）',
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '素材标题',
  `content` text COMMENT '内容',
  `detail` text COMMENT '简介',
  `type` tinyint(1) NOT NULL DEFAULT '6' COMMENT '素材类型',
  `pid` int(12) DEFAULT '0' COMMENT '素材分类',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否付费,0=免费,1=付费',
  `link` varchar(1024) NOT NULL DEFAULT '' COMMENT '链接',
  `image` varchar(200) NOT NULL DEFAULT '0' COMMENT '封面图',
  `abstract` varchar(2048) NOT NULL DEFAULT '' COMMENT '摘要',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `play_count` int(11) NOT NULL DEFAULT '0' COMMENT '播放量',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=下架,1=上架',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `live_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播ID，0=普通（1.1版本后废弃）',
  `videoId` varchar(512) DEFAULT NULL COMMENT '视频ID',
  `file_name` varchar(512) DEFAULT NULL COMMENT '视频/音频名称',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题-素材';

--
-- 转存表中的数据 `eb_special_task`
--

INSERT INTO `eb_special_task` (`id`, `coures_id`, `special_id`, `title`, `content`, `detail`, `type`, `pid`, `is_pay`, `link`, `image`, `abstract`, `sort`, `play_count`, `is_del`, `is_show`, `add_time`, `edit_time`, `live_id`, `videoId`, `file_name`, `file_type`) VALUES
(1, 0, 0, '图文素材1', '<p>我是图文素材1内容</p>', '<p>我是图文素材1简介</p>', 1, 1, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/32379202002201232449232.jpg', '', 1, 2, 0, 1, 1588042168, 0, 0, '', '', ''),
(2, 0, 0, '图文素材2', '<p>我是图文素材2内容</p>', '<p>我是图文素材2简介</p>', 1, 1, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/32379202002201232449232.jpg', '', 2, 0, 0, 1, 1588042210, 0, 0, '', '', ''),
(3, 0, 0, '音频素材一', '<p><br/></p><div><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4\" class=\"video-ue\" controls=\"controls\"></audio></div><p>音频</p>', '<p>我是音频素材1简介</p>', 2, 2, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0620e202002201232446695.jpg', '', 1, 0, 0, 1, 1588043711, 0, 0, '', '', ''),
(4, 0, 0, '音频素材二', '<p><br/></p><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4\" class=\"video-ue\" controls=\"controls\"></audio><p>我是音频素材内容</p>', '<p>我是音频素材二简介</p>', 2, 2, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e56f5202002201232449146.jpg', '', 2, 0, 0, 1, 1588043762, 0, 0, '', '', ''),
(5, 0, 0, '视频素材一', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p>我是视频素材一内容</p>', '<p>我是视频素材一简介</p>', 3, 3, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3ec76202002201232442683.jpg', '', 1, 0, 0, 1, 1588043857, 0, 0, '', '', ''),
(6, 0, 0, '视频素材二', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p>我是视频素材2内容</p>', '<p>我是视频素材2简介</p>', 3, 3, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/W8rykksS4m6ZtYp27E.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/78cdd20200220123244525.jpg', '', 2, 0, 0, 1, 1588043914, 0, 0, '', '', ''),
(7, 0, 0, '漫漫看', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/14f0e20210419104834136.png\"/></p>', '<p>漫漫看</p>', 1, 5, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/14f0e20210419104834136.png', '', 0, 0, 0, 1, 1618801513, 0, 0, '', '', ''),
(48, 0, 0, '视频素材2', '<p><br/></p><div><video style=\"width: 100%\" src=\"https://outin-e4d0e030ecf811eaa7ba00163e1c955c.oss-cn-shanghai.aliyuncs.com/sv/3c4aa891-175d445a23a/3c4aa891-175d445a23a.mp4?Expires=1605587735&OSSAccessKeyId=LTAI8bKSZ6dKjf44&Signature=qOohs3CqLRIe3zR%2FG8OmNwGCDVk%3D\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>测试测试测试<br/></p>', 3, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e56f5202002201232449146.jpg', '', 0, 1418, 0, 1, 1589195156, 0, 0, 'feb177c37ad24037901a45971222bd49', 'f8518db6-5e47-4d6a-b6a6-652b946bbf1a.mp4', 'video/mp4'),
(51, 0, 0, '图文素材2', '<p>图文素材2图文素材2<img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8ab46202002201232152644.jpg\"/></p>', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9d6dd202103301139194378.jpg\"/></p>', 1, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b3c1520210205143915824.jpg', '', 0, 883, 0, 1, 1589195434, 0, 0, '', '', ''),
(52, 0, 0, '音频素材11555', '<p><br/></p><div><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/mskGDH27WWS3fywd44.mp3\" class=\"video-ue\" controls=\"controls\"></audio></div><p><span style=\"color:white\">.</span></p>', '&lt;p&gt;音频素材1音频素材1音频素材1&lt;br/&gt;&lt;/p&gt;', 2, 0, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/mskGDH27WWS3fywd44.mp3', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/887d9202002201232157812.jpg', '', 0, 661, 0, 1, 1589195697, 0, 0, '', '', ''),
(53, 0, 0, '音频素材2', '<p><br/></p><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/n85MtG2FbjM7GY5QWe.mp4\" class=\"video-ue\" controls=\"controls\"></audio><p>音频素材2</p>', '<p>音频素材2音频素材2音频素材2</p>', 2, 0, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/n85MtG2FbjM7GY5QWe.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8ab46202002201232152644.jpg', '', 0, 168, 0, 1, 1589195734, 0, 0, '', '', ''),
(55, 0, 0, '视频素材3', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/B8pRc4ftnTyYGBYzMX.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>这是一套非常实用的教程！</p>', 3, 0, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/B8pRc4ftnTyYGBYzMX.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/7a470202008131026304274.jpg', '', 0, 569, 0, 1, 1590681922, 0, 0, '', '', ''),
(57, 0, 0, '音频素材3', '<p><br/></p><div><audio style=\"width: 100%\" src=\"https://outin-e4d0e030ecf811eaa7ba00163e1c955c.oss-cn-shanghai.aliyuncs.com/sv/49274c54-17481a3dbe0/49274c54-17481a3dbe0.mp3?Expires=1599908356&OSSAccessKeyId=LTAI8bKSZ6dKjf44&Signature=44N1EM4QP9gdAbxptPypd0B5rcI%3D\" class=\"video-ue\" controls=\"controls\"></audio></div><p><span style=\"color:white\">.</span></p>', '<p>测试测试</p>', 2, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9c4f9202008131026306270.jpg', '', 0, 43, 0, 1, 1599902848, 0, 0, 'da8995b5bdb04559b3155c038c14fa8f', '???-????.mp3', 'audio/mpeg'),
(58, 0, 0, '图文素材', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1b0cb202002201232145135.jpg\"/></p>', '<p>图文素材图文素材图文素材图文素材图文素材图文素材图文素材图文素材图文素材<img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1b0cb202002201232145135.jpg\"/></p>', 1, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/267f3202002201232144167.jpg', '', 0, 252, 0, 1, 1600411508, 0, 0, '', '', ''),
(59, 0, 0, '图文素材1', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9f41f202002201232146791.jpg\"/></p>', '<p>撒打算大<img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9f41f202002201232146791.jpg\"/></p>', 1, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9f41f202002201232146791.jpg', '', 0, 49, 0, 1, 1600411667, 0, 0, '', '', ''),
(60, 0, 0, '视频素材4', '<p><br/></p><div><video style=\"width: 100%\" src=\"https://outin-e4d0e030ecf811eaa7ba00163e1c955c.oss-cn-shanghai.aliyuncs.com/sv/5f887eb-174bdd66fa7/5f887eb-174bdd66fa7.mp4?Expires=1617078608&OSSAccessKeyId=LTAI8bKSZ6dKjf44&Signature=5CviMns%2BRVGYRWMqk%2FckOa5LS8g%3D\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4bb352021033011251140.jpg\"/><br/></p><p><br/></p>', 3, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8e691202011121103005962.jpeg', '', 0, 142, 0, 1, 1600912805, 0, 0, '9e6dfd2c1a334ef0afcbe5abf1f96d64', 'f8518db6-5e47-4d6a-b6a6-652b946bbf1a.mp4', 'video/mp4'),
(61, 0, 0, '视频素材5', '<p><br/></p><div><video style=\"width: 100%\" src=\"https://outin-e4d0e030ecf811eaa7ba00163e1c955c.oss-cn-shanghai.aliyuncs.com/sv/2631b3f1-1751fae1e90/2631b3f1-1751fae1e90.mp4?Expires=1605587764&OSSAccessKeyId=LTAI8bKSZ6dKjf44&Signature=A%2BTDdX8BNS1kbPOzchWLCa4rfEE%3D\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>视频素材</p>', 3, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/73402202011121129463260.jpeg', '', 0, 112, 0, 1, 1602554316, 0, 0, '271ae94d24d842ac891db9c3cb5a22e6', 'f8518db6-5e47-4d6a-b6a6-652b946bbf1a.mp4', 'video/mp4'),
(62, 0, 0, '视频素材6', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fDRR65e5aHRXnhf6Wx.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>阿的说法</p>', 3, 0, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/fDRR65e5aHRXnhf6Wx.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d8c56202008131026304195.jpg', '', 0, 44, 0, 1, 1602749016, 0, 0, '', '', ''),
(65, 0, 0, '音频素材', '<p><br/></p><div><audio style=\"width: 100%\" src=\"https://outin-e4d0e030ecf811eaa7ba00163e1c955c.oss-cn-shanghai.aliyuncs.com/sv/af0c4b7-175c0244da6/af0c4b7-175c0244da6.mp3?Expires=1605250006&OSSAccessKeyId=LTAI8bKSZ6dKjf44&Signature=i73m0bvuRT2662RFIxLbOCpyh70%3D\" class=\"video-ue\" controls=\"controls\"></audio></div><p><span style=\"color:white\">.</span></p>', '<p>音频声音<br/></p>', 2, 0, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/463b4202011131347194614.png', '', 0, 97, 0, 1, 1605246462, 0, 0, '34d22aa3624d47049acb08b79d56ed07', '11066.mp3', 'audio/mpeg'),
(66, 0, 0, '七宝茶', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/rGEz2pR3tGC8ZaYXPP.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>七宝茶</p>', 3, 0, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/rGEz2pR3tGC8ZaYXPP.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/b3c1520210205143915824.jpg', '', 0, 292, 0, 1, 1614680449, 0, 0, '', '', ''),
(67, 0, 0, '2020年众邦科技年会视屏', '<p><br/></p><div><video style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/pBdhwW4skkDTGATHmQ.mp4\" class=\"video-ue\" controls=\"controls\"></video></div><p><span style=\"color:white\">.</span></p>', '<p>2020年众邦科技年会，不忘初心，逐梦前行。<br/></p>', 3, 3, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/pBdhwW4skkDTGATHmQ.mp4', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8dfc2202103301031331430.jpg', '', 0, 42, 0, 1, 1617071570, 0, 0, '', '', ''),
(68, 0, 0, '高中英语词汇词根', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/720bd202103301511241384.jpg\"/></p><div class=\"index-module_textWrap_3ygOc\" style=\"font-family: arial; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\"><span class=\"bjh-p\">少儿英语学习，听说读写四项基本能力，阅读占据重要的位置；我们学习语言，就是为了打开知识大门，增加阅读才会获取更多的见识，所以培养孩子阅读习惯，不仅是为了增加知识，更主要是维持英语学习效果。当孩子放学之后，阅读英语的教材和课外读物，培养浓厚的兴趣，对英语的积累有很大帮助作用；比看动画片效果要好。阅读过程要关注的是故事情节，故事情节要看句子的意思，句子能不能读的通，要看词汇和语法能不能有效合理的应用，在阅读的过程中可以发声，也可以默读；发声阅读也就是朗读，是不仅增加语感和发音技巧，激活英语细胞，增加口语表达能力；有的纯书面化的阅读课本要默读，有的带有口语化的课本内容要朗读。就像我们平时喜欢看书，书里的内容只要一提起来就能有共同的话题，而英语也是这样，教孩子阅读，就是增加知识量的储备，提升阅读能力，也是为了学习好英语做好扎实的一步。</span></p></div><div class=\"index-module_textWrap_3ygOc\" style=\"margin-top: 22px; font-family: arial; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify;\"><span class=\"bjh-p\">孩子读不懂英语读物怎么办？要看孩子为什么读不懂，是阅读能力还达不到，还是英文读物太难，还是内容表达太生涩和隐晦，单词和句子都认识，但是内容连贯起来就不太知道表达什么意思了；就像读汉语书籍，有的生动有趣的故事情节，读上去很顺畅；有的读起来跟文言文一样，虽然字都认识，但是读不懂。所以选择合适的英文读物，对阅读起着重要作用；就相当于给孩子选择合适的培训机构一样，只有合适的才是好的。还是要回归到如何给孩子选择教材上，读物和教材不同，教材是培训机构用于培训的课本，老师和孩子通用，主要作用是老师讲，小朋友在课本上学，根据听到的，看到的来加深授课效果；而课外的读物，可以扩大阅读量，有趣的故事情节，绘声绘色的图案。不必一定要小朋友每天要读多少，根据兴趣，引导孩子去阅读，来找到阅读的感觉，开卷有益，学会阅读，更要教会孩子理解阅读的内容。</span></p></div><p><br/></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">少儿英语学习，听说读写四项基本能力，阅读占据重要的位置；我们学习语言，就是为了打开知识大门，增加阅读才会获取更多的见识</span></p>', 1, 1, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ed3ba202103301511237923.jpg', '', 0, 0, 0, 1, 1617088547, 0, 0, '', '', ''),
(69, 0, 0, '幼少儿英语阅读训练方法', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/92bd7202103301511323954.jpg\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。</span></p>', 1, 1, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/4bd802021033015112352.jpg', '', 0, 0, 0, 1, 1617088638, 0, 0, '', '', ''),
(70, 0, 0, '少儿英语学习，听说读写四项基本能力', '<p><img src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/aab8d202103301511493834.jpg\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">对于启蒙阶段的孩子，可以用图片和图文并茂的读物，针对不同年龄段的孩子，选择正规的教材和读物尤为重要，阅读方法恰当，一般培训机构都会有比较好的指导，会根据孩子的具体情况来培养阅读习惯；阅读切忌心浮气躁，让孩子在轻松愉快的环境中阅读。读起来生动有趣，有收获，如果能够阅读之后给家长或者其他小朋友讲小故事，那效果就更好了；阅读过程尽量带着英语思维去读，什么是英语思维呢？就是不去想汉语意思，理解的基础是英语句子和文字；而不是通过汉语的逻辑思维去想。这个过程需要不断的锻炼，很多时候教孩子的时候，往往把单词和汉语直接对应，这样阅读的时候想的都是英译汉。对英语的学习，还是停留在翻译上，不能脱离了汉语语境来真正阅读英语。</span></p>', 1, 1, 0, '', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/dbb3a202103301518057631.jpg', '', 0, 218, 0, 1, 1617088717, 0, 0, '', '', ''),
(71, 0, 0, '面向未来的教育方式', '<p><br/></p><div><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/AzZRT6P2jsetdXwnsk.mp3\" class=\"video-ue\" controls=\"controls\"></audio></div><p><span style=\"color:white\">.</span></p>', '<p><span style=\"color: rgb(18, 18, 18); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: rgb(255, 255, 255);\">尽可能培养孩子阅读的兴趣。亲子阅读无疑是教育培养孩子的最重要而有效的方式，我觉得对于很小的宝宝来说，都没有之一吧。与孩子一起阅读绘本、看图说话，让孩子对书感兴趣。</span></p>', 2, 2, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/AzZRT6P2jsetdXwnsk.mp3', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/883d0202103301610344021.jpg', '', 0, 22, 0, 1, 1617092002, 0, 0, '', '', ''),
(72, 0, 0, '要培养出富有创造力的学生，我们教育者该怎么做', '<p><br/></p><div><audio style=\"width: 100%\" src=\"http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f5PtHG7nbb6YQhPRBD.mp3\" class=\"video-ue\" controls=\"controls\"></audio></div><p><span style=\"color:white\">.</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">《面向未来的教育》的目标读者是回答了&quot;要培养出富有创造力的学生，我们教育者该怎么做&quot;的问题。作者在第一部分提出，教育领域的创新不是设备、具体方法的更新，而应该是思维方式的转变，因此教育者要在学校塑造&quot;创新型思维模式&quot;。第二部分、第三部分是本书最核心的内容，为教育者提供了奠定创新基础、释放创新潜能的9大方案，帮助教育者从具体处入手，建设创新校园。第四部分则是总结和反思，探讨我们的创新教育究竟该何去何从。</span></p>', 2, 2, 0, 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f5PtHG7nbb6YQhPRBD.mp3', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/18080202103301616003225.jpg', '', 0, 2, 0, 1, 1617092223, 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_task_category`
--

CREATE TABLE `eb_special_task_category` (
  `id` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '上级ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类标题',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(50) DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='素材分类';

--
-- 转存表中的数据 `eb_special_task_category`
--

INSERT INTO `eb_special_task_category` (`id`, `pid`, `title`, `sort`, `is_del`, `add_time`) VALUES
(1, 0, '图文', 0, 0, 1612496006),
(2, 0, '音频', 0, 0, 1612496017),
(3, 0, '视频', 0, 0, 1612496023);

-- --------------------------------------------------------

--
-- 表的结构 `eb_special_watch`
--

CREATE TABLE `eb_special_watch` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'uid',
  `special_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题ID',
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '素材ID',
  `viewing_time` int(50) DEFAULT '0' COMMENT '观看时间',
  `add_time` int(50) DEFAULT '0' COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户观看素材时间';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_bargain`
--

CREATE TABLE `eb_store_bargain` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '砍价产品ID',
  `product_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联产品ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价活动名称',
  `image` varchar(150) NOT NULL DEFAULT '' COMMENT '砍价活动图片',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) UNSIGNED DEFAULT NULL COMMENT '库存',
  `sales` int(11) UNSIGNED DEFAULT NULL COMMENT '销量',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '砍价产品轮播图',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '砍价开启时间',
  `stop_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '砍价结束时间',
  `store_name` varchar(255) DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) UNSIGNED DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户每次砍价的次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text COMMENT '砍价详情',
  `give_integral` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '反多少积分',
  `info` varchar(255) DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '成本价',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10,2) UNSIGNED DEFAULT NULL COMMENT '邮费',
  `rule` text COMMENT '砍价规则',
  `look` int(11) UNSIGNED DEFAULT '0' COMMENT '砍价产品浏览量',
  `share` int(11) UNSIGNED DEFAULT '0' COMMENT '砍价产品分享量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='砍价表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_bargain_user`
--

CREATE TABLE `eb_store_bargain_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '用户参与砍价表ID',
  `uid` int(11) UNSIGNED DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) UNSIGNED DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8,2) DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) UNSIGNED DEFAULT NULL COMMENT '参与时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户参与砍价表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_bargain_user_help`
--

CREATE TABLE `eb_store_bargain_user_help` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '砍价用户帮助表ID',
  `uid` int(11) UNSIGNED DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) UNSIGNED DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) UNSIGNED DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) UNSIGNED DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='砍价用户帮助表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_cart`
--

CREATE TABLE `eb_store_cart` (
  `id` bigint(8) UNSIGNED NOT NULL COMMENT '购物车表ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `product_attr_unique` varchar(16) NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品数量',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为立即购买',
  `combination_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼团id',
  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '砍价id',
  `integral_id` int(11) DEFAULT '0' COMMENT '积分id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_category`
--

CREATE TABLE `eb_store_category` (
  `id` mediumint(11) NOT NULL COMMENT '商品分类表ID',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `pid` mediumint(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `cate_name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` mediumint(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` varchar(128) NOT NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_combination`
--

CREATE TABLE `eb_store_combination` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品id',
  `mer_id` int(10) UNSIGNED DEFAULT '0' COMMENT '商户id',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐图',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '轮播图',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `attr` varchar(255) NOT NULL DEFAULT '' COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '参团人数',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` varchar(128) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `mer_use` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否包邮1是0否',
  `postage` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `description` text COMMENT '拼团内容',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼团开始时间',
  `stop_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼团结束时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼图产品成本',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团产品表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_combination_attr`
--

CREATE TABLE `eb_store_combination_attr` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL DEFAULT '' COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_combination_attr_result`
--

CREATE TABLE `eb_store_combination_attr_result` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `result` text COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上次修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性详情表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_combination_attr_value`
--

CREATE TABLE `eb_store_combination_attr_value` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `suk` varchar(128) NOT NULL DEFAULT '' COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_coupon`
--

CREATE TABLE `eb_store_coupon` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '优惠券表ID',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_coupon_issue`
--

CREATE TABLE `eb_store_coupon_issue` (
  `id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL COMMENT '优惠券添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券前台领取表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_coupon_issue_user`
--

CREATE TABLE `eb_store_coupon_issue_user` (
  `uid` int(10) DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) DEFAULT NULL COMMENT '领取时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券前台用户领取记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_coupon_user`
--

CREATE TABLE `eb_store_coupon_user` (
  `id` int(11) NOT NULL COMMENT '优惠券发放记录id',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '兑换的项目id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `coupon_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '优惠券的面值',
  `use_min_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券创建时间',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券结束时间',
  `use_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '使用时间',
  `type` varchar(32) NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券发放记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_order`
--

CREATE TABLE `eb_store_order` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '订单ID',
  `trade_no` varchar(50) NOT NULL DEFAULT '' COMMENT '支付宝支付,支付宝交易订单号',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `user_phone` varchar(18) NOT NULL DEFAULT '' COMMENT '用户电话',
  `user_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `cart_id` varchar(256) NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单类别 （0:课程订单 1:会员订单）',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员期限ID',
  `total_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单商品总数',
  `total_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `total_postage` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `pay_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `deduction_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `coupon_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(11) UNSIGNED DEFAULT '0' COMMENT '支付时间',
  `pay_type` varchar(32) NOT NULL DEFAULT 'weixin' COMMENT '支付方式',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待取货；1：配送中；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) UNSIGNED DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_application_time` int(11) DEFAULT NULL COMMENT '退款申请时间',
  `mark` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `unique` char(32) NOT NULL DEFAULT '' COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商户ID',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `is_channel` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '支付渠道(0微信公众号1微信小程序)',
  `pink_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团有效时间',
  `combination_id` int(11) UNSIGNED DEFAULT '0' COMMENT '拼团产品id',
  `pink_id` int(11) UNSIGNED DEFAULT '0' COMMENT '开团id',
  `seckill_id` int(11) UNSIGNED DEFAULT NULL COMMENT '秒杀产品id',
  `bargain_id` int(11) UNSIGNED DEFAULT NULL COMMENT '砍价产品id',
  `integral_id` int(11) UNSIGNED DEFAULT NULL,
  `pay_postage` decimal(8,2) DEFAULT '0.00' COMMENT '邮费',
  `delivery_name` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `delivery_type` varchar(255) DEFAULT NULL COMMENT '物流类型',
  `delivery_id` varchar(64) DEFAULT '' COMMENT '快递单号',
  `gain_integral` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '消费赚取积分',
  `use_integral` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '使用积分',
  `back_integral` decimal(8,2) UNSIGNED DEFAULT NULL COMMENT '给用户退了多少积分',
  `is_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为礼物订单',
  `gift_count` int(11) NOT NULL DEFAULT '0' COMMENT '领取次数',
  `is_receive_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为领取的礼物订单',
  `gift_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '购买礼物order_id',
  `link_pay_uid` int(11) NOT NULL DEFAULT '0' COMMENT '通过连接购买所属用户',
  `gain_gold_num` int(11) NOT NULL DEFAULT '0' COMMENT '消费赚取虚拟币',
  `spread_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_order_cart_info`
--

CREATE TABLE `eb_store_order_cart_info` (
  `oid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单id',
  `cart_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '购物车id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cart_info` text COMMENT '购买东西的详细信息',
  `unique` char(32) NOT NULL DEFAULT '' COMMENT '唯一id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单购物详情表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_order_status`
--

CREATE TABLE `eb_store_order_status` (
  `oid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=外面订单,1=跑腿订单',
  `change_type` varchar(32) NOT NULL DEFAULT '' COMMENT '操作类型',
  `change_message` varchar(256) NOT NULL DEFAULT '' COMMENT '操作备注',
  `change_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_pink`
--

CREATE TABLE `eb_store_pink` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '拼团产品类型0=商品,1=专题',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id 生成',
  `order_id_key` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单id  数据库',
  `total_num` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '购买商品个数',
  `total_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '购买总金额',
  `cid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼团产品id',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '产品id',
  `people` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拼图总人数',
  `price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '拼团产品单价',
  `add_time` varchar(24) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` varchar(24) NOT NULL DEFAULT '0',
  `k_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否退款 0未退款 1已退款',
  `is_false` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为虚拟拼团',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态1进行中2已完成3未完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_pink_false`
--

CREATE TABLE `eb_store_pink_false` (
  `id` int(11) NOT NULL,
  `pink_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(225) NOT NULL DEFAULT '' COMMENT '头像',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟参团人员';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product`
--

CREATE TABLE `eb_store_product` (
  `id` mediumint(11) NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(128) NOT NULL DEFAULT '' COMMENT '商品图片',
  `slider_image` varchar(512) NOT NULL DEFAULT '' COMMENT '轮播图',
  `store_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `store_info` varchar(256) NOT NULL DEFAULT '' COMMENT '商品简介',
  `keyword` varchar(256) NOT NULL DEFAULT '' COMMENT '关键字',
  `cate_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '分类id',
  `price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `vip_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `ot_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `postage` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `unit_name` varchar(32) NOT NULL DEFAULT '' COMMENT '单位名',
  `give_gold_num` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '获得虚拟币',
  `free_shipping` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '满几件包邮',
  `sort` smallint(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` mediumint(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` mediumint(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `member_pay_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否免费0:免费 1:付费',
  `description` text COMMENT '产品描述',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `mer_use` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '获得积分',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `is_seckill` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '砍价状态 0未开启 1开启',
  `ficti` mediumint(11) DEFAULT '100' COMMENT '虚拟销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product_attr`
--

CREATE TABLE `eb_store_product_attr` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL DEFAULT '' COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product_attr_result`
--

CREATE TABLE `eb_store_product_attr_result` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `result` text COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上次修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性详情表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product_attr_value`
--

CREATE TABLE `eb_store_product_attr_value` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `suk` varchar(128) NOT NULL DEFAULT '' COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '属性金额',
  `vip_price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '会员金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product_relation`
--

CREATE TABLE `eb_store_product_relation` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) NOT NULL DEFAULT '' COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品点赞和收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_product_reply`
--

CREATE TABLE `eb_store_product_reply` (
  `id` int(11) NOT NULL COMMENT '评论ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `oid` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `unique` char(32) NOT NULL DEFAULT '' COMMENT '唯一id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `reply_type` varchar(32) NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务分数',
  `packing_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包装分数',
  `mer_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商家评价',
  `delivery_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送速度分数',
  `comment` varchar(512) NOT NULL DEFAULT '' COMMENT '评论内容',
  `pics` text COMMENT '评论图片',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `merchant_reply_content` varchar(300) NOT NULL DEFAULT '' COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '管理员回复时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_seckill`
--

CREATE TABLE `eb_store_seckill` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '商品秒杀产品表id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品id',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐图',
  `images` varchar(1000) NOT NULL DEFAULT '' COMMENT '轮播图',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本',
  `ot_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '原价',
  `give_integral` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '返多少积分',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) NOT NULL DEFAULT '' COMMENT '单位名',
  `postage` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `description` text COMMENT '内容',
  `start_time` varchar(128) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` varchar(128) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` varchar(128) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品秒杀产品表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_seckill_attr`
--

CREATE TABLE `eb_store_seckill_attr` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL DEFAULT '' COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀商品属性表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_seckill_attr_result`
--

CREATE TABLE `eb_store_seckill_attr_result` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `result` text COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上次修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀商品属性详情表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_seckill_attr_value`
--

CREATE TABLE `eb_store_seckill_attr_value` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品ID',
  `suk` varchar(128) NOT NULL DEFAULT '' COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀商品属性值表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_service`
--

CREATE TABLE `eb_store_service` (
  `id` int(11) NOT NULL COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客服uid',
  `avatar` varchar(250) NOT NULL DEFAULT '' COMMENT '客服头像',
  `notify` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '代理名称',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0隐藏1显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_service_log`
--

CREATE TABLE `eb_store_service_log` (
  `id` int(11) NOT NULL COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `msn` text COMMENT '消息内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '接收人uid',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) DEFAULT '0' COMMENT '是否提醒过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服用户对话记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_store_visit`
--

CREATE TABLE `eb_store_visit` (
  `id` int(10) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品浏览分析表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_admin`
--

CREATE TABLE `eb_system_admin` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT '后台管理员表ID',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '后台管理员账号',
  `pwd` char(32) NOT NULL DEFAULT '' COMMENT '后台管理员密码',
  `real_name` varchar(16) NOT NULL DEFAULT '' COMMENT '后台管理员姓名',
  `roles` varchar(128) NOT NULL DEFAULT '' COMMENT '后台管理员权限(menus_id)',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '前端登录电话号码',
  `last_ip` varchar(16) DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) UNSIGNED DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '后台管理员添加时间',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '后台管理员级别',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

--
-- 转存表中的数据 `eb_system_admin`
--

INSERT INTO `eb_system_admin` (`id`, `account`, `pwd`, `real_name`, `roles`, `phone`, `last_ip`, `last_time`, `add_time`, `login_count`, `level`, `status`, `is_del`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1', '', '36.44.34.18', 1618971842, 1618908305, 0, 0, 1, 0),
(2, 'demo', '6b94a88632e2577a60f64520998d11c9', '演示账号', '4', '', '36.44.34.18', 1618969498, 1618968592, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_attachment`
--

CREATE TABLE `eb_system_attachment` (
  `att_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '分类id',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件管理表';

--
-- 转存表中的数据 `eb_system_attachment`
--

INSERT INTO `eb_system_attachment` (`att_id`, `name`, `att_dir`, `satt_dir`, `att_size`, `att_type`, `pid`, `time`) VALUES
(23, 'dff8b202002111344407490.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/dff8b202002111344407490.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/dff8b202002111344407490.png', '0', 'image/jpg', 4, 1581399880),
(24, '4e0a9202002111413415852.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/4e0a9202002111413415852.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/4e0a9202002111413415852.jpg', '0', 'image/jpg', 5, 1581401621),
(25, '5ab3f202002111454479193.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/5ab3f202002111454479193.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/5ab3f202002111454479193.jpg', '0', 'image/jpg', 0, 1581404087),
(26, 'bd2ef202002111519022660.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/bd2ef202002111519022660.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/bd2ef202002111519022660.jpg', '0', 'image/jpg', 6, 1581405542),
(27, '12017202002111757416996.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/12017202002111757416996.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/12017202002111757416996.png', '0', 'image/jpg', 0, 1581415061),
(28, 'fb05a202002111757415258.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/fb05a202002111757415258.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/fb05a202002111757415258.png', '0', 'image/jpg', 0, 1581415061),
(29, '022b1202002111757413298.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/022b1202002111757413298.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/022b1202002111757413298.png', '0', 'image/jpg', 0, 1581415061),
(30, '8cf7c202002111757418051.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/8cf7c202002111757418051.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/8cf7c202002111757418051.png', '0', 'image/jpg', 0, 1581415061),
(31, 'a3248202002111757415453.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/a3248202002111757415453.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/a3248202002111757415453.png', '0', 'image/jpg', 0, 1581415061),
(32, '37e3a202002111757417776.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/37e3a202002111757417776.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/37e3a202002111757417776.png', '0', 'image/jpg', 0, 1581415062),
(33, 'ccb10202002111757423753.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/ccb10202002111757423753.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/ccb10202002111757423753.jpg', '0', 'image/jpg', 0, 1581415062),
(34, 'abbe8202002111757429842.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/abbe8202002111757429842.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/abbe8202002111757429842.png', '0', 'image/jpg', 0, 1581415062),
(35, '10f3d202002111757429313.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/10f3d202002111757429313.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/10f3d202002111757429313.jpg', '0', 'image/jpg', 0, 1581415062),
(36, 'e20b0202002111757424191.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/e20b0202002111757424191.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/e20b0202002111757424191.png', '0', 'image/jpg', 0, 1581415062),
(37, '55bd0202002111757421468.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/55bd0202002111757421468.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/55bd0202002111757421468.png', '0', 'image/jpg', 0, 1581415062),
(38, '6b85d202002111757421971.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/6b85d202002111757421971.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/6b85d202002111757421971.jpg', '0', 'image/jpg', 0, 1581415062),
(39, '7d68920200211175742320.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7d68920200211175742320.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7d68920200211175742320.png', '0', 'image/jpg', 0, 1581415062),
(40, '09bd3202002111757426798.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/09bd3202002111757426798.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/09bd3202002111757426798.png', '0', 'image/jpg', 0, 1581415063),
(41, '7f0bd202002111757435432.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7f0bd202002111757435432.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7f0bd202002111757435432.jpg', '0', 'image/jpg', 0, 1581415063),
(42, '99cb7202002111757434673.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/99cb7202002111757434673.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/99cb7202002111757434673.jpg', '0', 'image/jpg', 0, 1581415063),
(43, '7c54d202002111757589056.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7c54d202002111757589056.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7c54d202002111757589056.png', '0', 'image/jpg', 0, 1581415078),
(44, '8b0be202002111757582367.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/8b0be202002111757582367.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/8b0be202002111757582367.jpg', '0', 'image/jpg', 0, 1581415078),
(45, '5ae6f202002111757583267.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/5ae6f202002111757583267.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/5ae6f202002111757583267.jpg', '0', 'image/jpg', 0, 1581415078),
(46, '67c04202002111757584709.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/67c04202002111757584709.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/67c04202002111757584709.jpg', '0', 'image/jpg', 0, 1581415079),
(47, '7809f202002111801111378.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7809f202002111801111378.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/7809f202002111801111378.jpg', '0', 'image/jpg', 0, 1581415271),
(48, '32095202002111804187328.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/32095202002111804187328.jpg', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/32095202002111804187328.jpg', '0', 'image/jpg', 0, 1581415458),
(49, '9ec16202002121807113099.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/9ec16202002121807113099.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/9ec16202002121807113099.png', '0', 'image/jpg', 0, 1581502031),
(50, '9d76920200212180711743.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/9d76920200212180711743.png', 'http://testcrmeb.oss-cn-beijing.aliyuncs.com/9d76920200212180711743.png', '0', 'image/jpg', 0, 1581502031),
(51, '34285202002171340371181.gif', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/34285202002171340371181.gif', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/34285202002171340371181.gif', '0', 'image/jpg', 6, 1581918037),
(52, 'd6c57202002171744271971.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d6c57202002171744271971.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d6c57202002171744271971.png', '0', 'image/jpg', 6, 1581932667),
(53, '68244202002171745063469.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68244202002171745063469.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/68244202002171745063469.jpg', '0', 'image/jpg', 6, 1581932714),
(54, 'f939b202002201114298263.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f939b202002201114298263.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f939b202002201114298263.png', '0', 'image/jpg', 0, 1582168469),
(74, '267f3202002201232144167.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/267f3202002201232144167.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/267f3202002201232144167.jpg', '0', 'image/jpg', 0, 1582173134),
(75, '1b0cb202002201232145135.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1b0cb202002201232145135.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/1b0cb202002201232145135.jpg', '0', 'image/jpg', 0, 1582173134),
(76, '9f41f202002201232146791.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9f41f202002201232146791.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9f41f202002201232146791.jpg', '0', 'image/jpg', 0, 1582173134),
(77, '44910202002201232149124.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/44910202002201232149124.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/44910202002201232149124.jpg', '0', 'image/jpg', 0, 1582173135),
(78, '3e9f4202002201232159295.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3e9f4202002201232159295.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3e9f4202002201232159295.jpg', '0', 'image/jpg', 0, 1582173135),
(79, '8ab46202002201232152644.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8ab46202002201232152644.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/8ab46202002201232152644.jpg', '0', 'image/jpg', 0, 1582173135),
(80, '887d9202002201232157812.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/887d9202002201232157812.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/887d9202002201232157812.jpg', '0', 'image/jpg', 0, 1582173135),
(81, '9547920200220123215506.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9547920200220123215506.jpg', '0', 'image/jpg', 0, 1582173135),
(82, '85d12202002201232152250.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/85d12202002201232152250.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/85d12202002201232152250.jpg', '0', 'image/jpg', 0, 1582173136),
(83, '9a0d1202002201232324402.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/9a0d1202002201232324402.jpg', '0', 'image/jpg', 0, 1582173154),
(84, 'd41c7202002201232431520.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d41c7202002201232431520.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d41c7202002201232431520.jpg', '0', 'image/jpg', 0, 1582173163),
(85, 'f4313202002201232435004.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f4313202002201232435004.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/f4313202002201232435004.jpg', '0', 'image/jpg', 0, 1582173163),
(86, 'ce99d202002201232432554.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ce99d202002201232432554.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/ce99d202002201232432554.jpg', '0', 'image/jpg', 0, 1582173164),
(87, '78cdd20200220123244525.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/78cdd20200220123244525.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/78cdd20200220123244525.jpg', '0', 'image/jpg', 0, 1582173164),
(88, '3ec76202002201232442683.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3ec76202002201232442683.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3ec76202002201232442683.jpg', '0', 'image/jpg', 0, 1582173164),
(89, 'e56f5202002201232449146.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e56f5202002201232449146.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/e56f5202002201232449146.jpg', '0', 'image/jpg', 0, 1582173164),
(90, '0620e202002201232446695.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0620e202002201232446695.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/0620e202002201232446695.jpg', '0', 'image/jpg', 0, 1582173164),
(91, '32379202002201232449232.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/32379202002201232449232.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/32379202002201232449232.jpg', '0', 'image/jpg', 0, 1582173165),
(92, '744f3202002201232457195.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/744f3202002201232457195.jpg', '0', 'image/jpg', 0, 1582173165),
(94, '20362202002201412303972.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/20362202002201412303972.jpg', '0', 'image/jpg', 0, 1582179150),
(95, '3d0ca202104211025257636.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3d0ca202104211025257636.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3d0ca202104211025257636.png', '0', 'image/jpg', 0, 1618971925),
(96, 'd62ea202104211031259444.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d62ea202104211031259444.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d62ea202104211031259444.jpg', '0', 'image/jpg', 0, 1618972286),
(97, '64da4202104211033014264.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/64da4202104211033014264.png', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/64da4202104211033014264.png', '0', 'image/jpg', 0, 1618972381),
(98, 'd73c2202104211036264679.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d73c2202104211036264679.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/d73c2202104211036264679.jpg', '0', 'image/jpg', 0, 1618972586),
(99, '3f36b202104211036429955.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3f36b202104211036429955.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/3f36b202104211036429955.jpg', '0', 'image/jpg', 0, 1618972603),
(100, 'bf614202104211036578670.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/bf614202104211036578670.jpg', 'http://cremb-zsff.oss-cn-beijing.aliyuncs.com/bf614202104211036578670.jpg', '0', 'image/jpg', 0, 1618972617);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_attachment_category`
--

CREATE TABLE `eb_system_attachment_category` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) NOT NULL DEFAULT '' COMMENT '分类目录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件分类表';

--
-- 转存表中的数据 `eb_system_attachment_category`
--

INSERT INTO `eb_system_attachment_category` (`id`, `pid`, `name`, `enname`) VALUES
(4, 0, '导航图标', ''),
(5, 0, '专题主图', ''),
(6, 0, '公众号图', '');

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_broadcast`
--

CREATE TABLE `eb_system_broadcast` (
  `id` int(10) NOT NULL,
  `domain_name` varchar(255) NOT NULL DEFAULT '' COMMENT '域名',
  `cname` varchar(255) DEFAULT NULL COMMENT 'CNAME',
  `live_domain_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'liveVideo：播流域名 liveEdge：边缘推流域名\n',
  `region` varchar(255) NOT NULL DEFAULT '' COMMENT '直播域名单元化信息',
  `scope` varchar(255) NOT NULL DEFAULT '' COMMENT '加速域名 domestic（默认值）：国内 overseas：海外 global：全球\n',
  `domain_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态 offline:停止 online:正常运行 configuring:配置中',
  `auth_key1` varchar(255) DEFAULT NULL COMMENT '主KEY',
  `push_domain` varchar(255) DEFAULT NULL COMMENT '绑定的推流域名',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT '对象存储oss桶名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播配置表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_bucket`
--

CREATE TABLE `eb_system_bucket` (
  `id` int(10) UNSIGNED NOT NULL,
  `bucket_name` varchar(255) NOT NULL DEFAULT '' COMMENT '存储空间名称',
  `endpoint` varchar(255) NOT NULL DEFAULT '' COMMENT '区域',
  `domain_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bucket域名',
  `creation_time` varchar(255) NOT NULL DEFAULT '' COMMENT '创建时间',
  `is_use` int(2) NOT NULL DEFAULT '0' COMMENT '是否使用0:未使用 1:上传使用 2:直播使用',
  `is_del` int(5) NOT NULL DEFAULT '0' COMMENT '删除',
  `add_time` int(50) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='储存空间';

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_config`
--

CREATE TABLE `eb_system_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '配置id',
  `menu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型(文本框,单选按钮...)',
  `input_type` varchar(20) DEFAULT 'input' COMMENT '表单类型',
  `config_tab_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分类id',
  `parameter` varchar(255) DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) DEFAULT NULL COMMENT '规则',
  `width` int(10) UNSIGNED DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) UNSIGNED DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '配置名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

--
-- 转存表中的数据 `eb_system_config`
--

INSERT INTO `eb_system_config` (`id`, `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES
(1, 'site_name', 'text', 'input', 1, '', 0, 'required:true', 100, 0, '\"\\u77e5\\u8bc6\\u4ed8\\u8d39\"', '网站名称', '网站名称', 0, 1),
(2, 'site_url', 'text', 'input', 1, '', 0, 'required:true,url:true', 100, 0, '\"http:\\/\\/kaiyuan.crmeb.net\"', '网站地址', '网站地址', 0, 1),
(3, 'site_logo', 'upload', 'input', 1, '', 1, '', 0, 0, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d6c57202002171744271971.png\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', 0, 1),
(4, 'site_phone', 'text', 'input', 22, '', 0, '', 100, 0, '\"\"', '联系电话', '联系电话', 0, 1),
(5, 'seo_title', 'text', 'input', 22, '', 0, 'required:true', 100, 0, '\"\"', 'SEO标题', 'SEO标题', 0, 1),
(6, 'site_email', 'text', 'input', 22, '', 0, 'email:true', 100, 0, '\"\"', '联系邮箱', '联系邮箱', 0, 1),
(7, 'site_qq', 'text', 'input', 22, '', 0, 'qq:true', 100, 0, '\"\"', '联系QQ', '联系QQ', 0, 1),
(9, 'close_system', 'radio', 'input', 1, '0=开启\n1=关闭', 0, '', 0, 0, '\"0\"', '关闭后台', '关闭后台', 0, 2),
(13, 'wechat_appid', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\"\"', 'AppID', 'AppID', 0, 1),
(14, 'wechat_appsecret', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\"\"', 'AppSecret', 'AppSecret', 0, 1),
(15, 'wechat_token', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\"\"', '微信验证TOKEN', '微信验证TOKEN', 0, 1),
(16, 'wechat_encode', 'radio', 'input', 2, '0=明文模式\n1=兼容模式\n2=安全模式', 0, '', 0, 0, '\"0\"', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', 0, 1),
(17, 'wechat_encodingaeskey', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\"\"', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', 0, 1),
(18, 'wechat_share_img', 'upload', 'input', 3, '', 1, '', 0, 0, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/68244202002171745063469.jpg\"', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', 0, 1),
(19, 'wechat_qrcode', 'upload', 'input', 2, '', 1, '', 0, 0, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d62ea202104211031259444.jpg\"', '公众号二维码', '您的公众号二维码', 0, 1),
(21, 'wechat_share_title', 'text', 'input', 3, '', 0, 'required:true', 100, 0, '\"\\u77e5\\u8bc6\\u4ed8\\u8d39\"', '微信分享标题', '微信分享标题', 0, 1),
(22, 'wechat_share_synopsis', 'textarea', 'input', 3, '', 0, '', 100, 5, '\"\\u77e5\\u8bc6\\u4ed8\\u8d39\"', '微信分享简介', '微信分享简介', 0, 1),
(25, 'pay_weixin_mchid', 'text', 'input', 4, '', 0, '', 100, 0, '\"\"', 'Mchid', '受理商ID，身份标识', 0, 1),
(26, 'pay_weixin_client_cert', 'upload', 'input', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', 0, 1),
(27, 'pay_weixin_client_key', 'upload', 'input', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', 0, 1),
(28, 'pay_weixin_key', 'text', 'input', 4, '', 0, '', 100, 0, '\"\"', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', 0, 1),
(29, 'pay_weixin_open', 'radio', 'input', 4, '1=开启\n0=关闭', NULL, NULL, 0, 0, '1', '开启', '是否启用微信支付', 0, 2),
(31, 'store_postage', 'text', 'input', 10, '', 0, 'number:true,min:0', 100, 0, '\"12\"', '邮费基础价', '商品邮费基础价格,最终金额为(基础价 + 商品1邮费 + 商品2邮费)', 0, 1),
(32, 'store_free_postage', 'text', 'input', 5, '', 0, 'number:true,min:-1', 100, 0, '\"200\"', '满额包邮', '商城商品满多少金额即可包邮', 0, 1),
(33, 'offline_postage', 'radio', 'input', 10, '0=不包邮\n1=包邮', 0, '', 0, 0, '\"1\"', '线下支付是否包邮', '用户选择线下支付时是否包邮', 0, 1),
(34, 'integral_ratio', 'text', 'input', 11, '', 0, 'number:true', 100, 0, '\"0.01\"', '积分抵用比例', '积分抵用比例(1积分抵多少金额)', 0, 1),
(35, 'site_service_phone', 'text', 'input', 22, '', 0, '', 100, 0, '\"\"', '客服电话', '客服联系电话', 0, 1),
(45, 'site_store_admin_uids', 'text', 'input', 5, '', 0, '', 100, 0, '\"4\"', '管理员用户ID', '管理员用户ID,用于接收商城订单提醒，到微信用户中查找编号，多个英文‘,’隔开', 0, 1),
(46, 'system_express_app_code', 'text', 'input', 10, '', 0, '', 100, 0, '\"dbc3c1426efe44fdb6c0aa04c52a4ca9\"', '快递查询密钥', '阿里云快递查询接口密钥购买地址：https://market.aliyun.com/products/57126001/cmapi011120.html', 0, 1),
(47, 'main_business', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', 0, 0),
(48, 'vice_business', 'text', 'input', 2, '', 0, 'required:true', 100, 0, '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', 0, 0),
(49, 'store_brokerage_ratio', 'text', 'input', 9, NULL, NULL, 'required:true,min:0,max:100,number:true', 100, 0, '\"60\"', '一级推广人返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 9, 1),
(50, 'wechat_first_sub_give_coupon', 'text', 'input', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '首次关注赠送优惠券ID', '首次关注赠送优惠券ID,0为不赠送', 0, 1),
(51, 'store_give_con_min_price', 'text', 'input', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"0.01\"', '消费满多少赠送优惠券', '消费满多少赠送优惠券,0为不赠送', 0, 1),
(52, 'store_order_give_coupon', 'text', 'input', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '消费赠送优惠劵ID', '消费赠送优惠劵ID,0为不赠送', 0, 1),
(54, 'sx_sign_min_int', 'text', 'input', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '签到奖励最低积分', '签到奖励最低积分', 0, 1),
(55, 'sx_sign_max_int', 'text', 'input', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"5\"', '签到奖励最高积分', '签到奖励最高积分', 0, 1),
(57, 'about_us', 'upload', 'input', 22, '', 1, '', 0, 0, '\"\"', '关于我们', '系统的标识', 0, 1),
(58, 'replenishment_num', 'text', 'input', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"20\"', '待补货数量', '产品待补货数量低于多少时，提示补货', 0, 1),
(59, 'routine_appId', 'text', 'input', 7, '', 0, '', 100, 0, '\"\"', 'appId', '小程序appID', 0, 1),
(60, 'routine_appsecret', 'text', 'input', 7, '', 0, '', 100, 0, '\"\"', 'AppSecret', '小程序AppSecret', 0, 1),
(61, 'api', 'text', 'input', 2, '', 0, '', 100, 0, '\"\\/wap\\/wechat\\/serve\"', '接口地址', '微信接口例如：http://www.abc.com/wap/wechat/serve', 0, 1),
(62, 'paydir', 'textarea', 'input', 4, '', 0, '', 100, 5, '\"\\/wap\\/special\\/details\\n\"', '配置目录', '支付目录配置系统不调用提示作用', 0, 1),
(73, 'routine_logo', 'upload', 'input', 7, '', 1, '', 0, 0, '\"\"', '小程序logo', '小程序logo', 0, 1),
(74, 'routine_name', 'text', 'input', 7, '', 0, '', 100, 0, '\"\\u8f66\\u8054\\u76df\\u65b0\\u80fd\\u6e90\"', '小程序名称', '小程序名称', 0, 1),
(76, 'routine_style', 'text', 'input', 7, '', 0, '', 100, 0, '\"#FFFFFF\"', '小程序风格', '小程序颜色', 0, 1),
(77, 'store_stock', 'text', 'input', 22, '', 0, '', 100, 0, '\"1\"', '警戒库存', '警戒库存提醒值', 0, 1),
(85, 'stor_reason', 'textarea', 'input', 5, '', 0, '', 100, 8, '\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86=\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26=\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd=\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86=\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27=\\u5176\\u5b83\\u539f\\u56e0\"', '退货理由', '配置退货理由，一行一个理由', 0, 1),
(87, 'store_brokerage_two', 'text', 'input', 9, NULL, NULL, 'required:true,min:0,max:100,number:true', 100, 0, '\"30\"', '二级推广人返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 8, 1),
(88, 'store_brokerage_statu', 'radio', 'input', 9, '1=指定分销\n2=人人分销', 0, '', 0, 0, '\"2\"', '分销模式', '人人分销默认每个人都可以分销，制定人分销后台制定人开启分销', 10, 1),
(89, 'pay_routine_appid', 'text', 'input', 14, '', 0, 'required:true', 100, 0, '\"\"', 'Appid', '小程序Appid', 0, 1),
(90, 'pay_routine_appsecret', 'text', 'input', 14, '', 0, 'required:true', 100, 0, '\"\"', 'Appsecret', '小程序Appsecret', 0, 1),
(91, 'pay_routine_mchid', 'text', 'input', 14, '', 0, 'required:true', 100, 0, '\"\"', 'Mchid', '商户号', 0, 1),
(92, 'pay_routine_key', 'text', 'input', 14, '', 0, 'required:true', 100, 0, '\"\"', 'Key', '商户key', 0, 1),
(93, 'pay_routine_client_cert', 'upload', 'input', 14, '', 3, '', 0, 0, '[\"\\/public\\/uploads\\/config\\/file\\/5c12fb7b9ebc5.pem\"]', '小程序支付证书', '小程序支付证书', 0, 1),
(94, 'pay_routine_client_key', 'upload', 'input', 14, '', 3, '', 0, 0, '[\"\\/public\\/uploads\\/config\\/file\\/5c12fb7eb8897.pem\"]', '小程序支付证书密钥', '小程序支付证书密钥', 0, 1),
(95, 'log_cycle', 'text', 'input', 22, '', 0, '', 100, 0, '\"\"', '系统日志', '系统日志保存时间单位天', 0, 1),
(96, 'sign_in_integral', 'radio', 'input', 11, '1=开启\n0=关闭', NULL, NULL, NULL, NULL, '\"0\"', '签到送积分', '签到送积分显示开关', 0, 1),
(97, 'give_integral', 'radio', 'input', 11, '1=开启\n0=关闭', NULL, NULL, NULL, NULL, '\"0\"', '邀请好友赠送积分', '邀请好友赠送积分显示开关', 0, 1),
(98, 'share_integral', 'radio', 'input', 11, '1=开启\n0=关闭', NULL, NULL, NULL, NULL, '\"0\"', '分享商品送积分', '分享商品送积分开关', 0, 1),
(114, 'user_extract_bank', 'textarea', 'input', 5, NULL, NULL, NULL, 100, 6, '\"\\u62db\\u5546\\u94f6\\u884c=\\u5efa\\u8bbe\\u94f6\\u884c=\\u519c\\u4e1a\\u94f6\\u884c\"', '提现银行', '提现银行', 0, 1),
(116, 'index_recommend_url', 'upload', 'input', 15, NULL, 1, NULL, NULL, NULL, '[\"\\/public\\/uploads\\/config\\/image\\/5c1ef9f2594ea.png\"]', '主页推荐图', '主页推荐图', 0, 1),
(117, 'hot_food', 'upload', 'input', 15, NULL, 1, NULL, NULL, NULL, '\"\"', '热销菜品', '热销菜品', 0, 1),
(118, 'welcome_url', 'upload', 'input', 15, NULL, 1, NULL, NULL, NULL, '[\"\\/public\\/uploads\\/config\\/image\\/5c29e37db77e8.jpg\"]', '最受欢迎', '热销菜品', 0, 1),
(119, 'praise_part', 'text', 'input', 7, NULL, NULL, '', 100, NULL, '\"5\"', '用户给商户好评加分', '用户给商户好评加分', 0, 1),
(120, 'praise_bad_part', 'text', 'input', 7, NULL, NULL, '', 100, NULL, '\"8\"', '用户给商户差评减分分', '用户给商户好评加分', 0, 1),
(130, 'extract_min_money', 'text', 'input', 9, NULL, NULL, NULL, 100, NULL, '\"1\"', '提现最低金额', '提现最低金额', 0, 1),
(132, 'smsSignName', 'text', 'input', 17, NULL, NULL, '', 100, NULL, '\"CEMEB\\u77e5\\u8bc6\\u4ed8\\u8d39\"', '短信签名', '短信签名', 0, 1),
(133, 'accessKeyId', 'text', 'input', 18, NULL, NULL, NULL, 100, NULL, '\"\"', '阿里云AccessKeyId', '阿里云AccessKeyId', 0, 1),
(134, 'accessKeySecret', 'text', 'input', 18, NULL, NULL, NULL, 100, NULL, '\"\"', '阿里云AccessKeySecret', '阿里云AccessKeySecret', 0, 1),
(135, 'smsTemplateCode', 'text', 'input', 17, NULL, NULL, '', 100, NULL, '\"\"', '短信模板ID', '短信模板ID', 0, 1),
(140, 'spread_poster_url', 'upload', 'input', 9, NULL, 1, NULL, NULL, NULL, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/20362202002201412303972.jpg\"', '推广人海报', '推广人海报', 0, 1),
(143, 'alipay_app_id', 'text', 'input', 16, NULL, NULL, '', 100, NULL, '\"\"', '蚂蚁金服appid', '蚂蚁金服appid', 0, 1),
(144, 'alipay_private_key', 'text', 'input', 16, NULL, NULL, '', 100, NULL, '\"\"', '蚂蚁金服key', '蚂蚁金服key', 0, 1),
(145, 'alipay_public_key', 'text', 'input', 16, NULL, NULL, '', 100, NULL, '\"\"', '蚂蚁金服公钥', '蚂蚁金服公钥', 0, 1),
(146, 'promoter_content', 'textarea', 'input', 9, NULL, NULL, NULL, 100, 8, '\"\"', '推广细则', '推广细则', 0, 2),
(147, 'promoter_guide', 'textarea', 'input', 9, NULL, NULL, NULL, 100, 8, '\"\"', '推荐指引', '推荐指引', 0, 1),
(154, 'open_barrage', 'radio', 'input', 1, '1=开启\n0=关闭', NULL, NULL, 100, NULL, '\"1\"', '专题虚拟弹幕开关', '专题虚拟弹幕开关', 0, 1),
(155, 'barrage_show_time', 'text', 'input', 22, NULL, NULL, NULL, 100, NULL, '\"5\"', '专题弹幕停留时间', '专题弹幕停留时间 单位秒计算', 0, 1),
(164, 'uploadUrl', 'text', 'input', 19, NULL, NULL, '', 100, NULL, '\"\"', '空间域名 Domain', '空间域名 Domain', 0, 1),
(165, 'OssBucket', 'text', 'input', 19, NULL, NULL, '', 100, NULL, '\"\"', '存储空间名称', '存储空间名称,又称桶名', 0, 1),
(166, 'end_point', 'text', 'input', 19, NULL, NULL, '', 100, NULL, '\"oss-cn-beijing.aliyuncs.com\"', 'EndPoint（地域节点）', 'EndPoint（地域节点）', 0, 1),
(168, 'home_logo', 'upload', 'input', 1, NULL, 1, NULL, NULL, NULL, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/3d0ca202104211025257636.png\"', '移动端课程分类LOGO', '移动端课程分类LOGO', 0, 1),
(169, 'aliyun_live_rtmpLink', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '推流地址', '推流地址', 0, 1),
(170, 'aliyun_live_playLike', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '播放地址', '播放地址', 0, 1),
(171, 'aliyun_live_push_key', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '推流主key', '推流主key', 0, 1),
(172, 'aliyun_live_play_key', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '播放主key', '播放主key', 0, 1),
(173, 'aliyun_live_appName', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '直播应用名', '直播应用名(只能为英文数字组合)', 0, 1),
(174, 'aliyun_live_oss_bucket', 'text', 'input', 21, NULL, NULL, '', 100, NULL, '\"\"', '直播录制OSS桶名', '直播录制OSS桶名', 0, 1),
(175, 'aliyun_live_end_point', 'text', 'input', 21, NULL, NULL, NULL, 100, NULL, '\"oss-cn-shenzhen.aliyuncs.com\"', '直播录制OssEndpoint', '直播录制OssEndpoint地域节点', 0, 1),
(176, 'gold_rate', 'text', 'input', 23, NULL, NULL, 'number:rue', 100, NULL, '\"10\"', '人民币与金币换算率', '充值人民币和金币的换算概率，默认：1元人民币=10系统虚拟金币', 0, 1),
(177, 'gold_name', 'text', 'input', 23, NULL, NULL, NULL, 100, NULL, '\"\\u91d1\\u5e01\"', '虚拟货币名称', '虚拟货币名称（如，金币，水滴，鲜花等）', 0, 1),
(178, 'gold_image', 'upload', 'input', 23, NULL, 1, NULL, NULL, NULL, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/61d9d202006181439471781.png\"', '虚拟货币图标', '虚拟货币图标', 0, 1),
(179, 'single_gold_coin', 'text', 'input', 23, NULL, NULL, '', 100, NULL, '1', '单次签到虚拟币数', '每次签到用户可以获得的虚拟币数（默认为金币）', 0, 1),
(180, 'sign_default_poster', 'upload', 'input', 1, NULL, 1, NULL, NULL, NULL, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/20362202002201412303972.jpg\"', '签到分享海报[690*590]', '签到默认海报（没有签到海报时默认显示此图）', 0, 1),
(181, 'balance_switch', 'radio', 'input', 1, '1=开启\n0=关闭', NULL, NULL, NULL, NULL, '\"1\"', '余额开关', '余额开关', 0, 1),
(182, 'alicloud_account_id', 'text', 'input', 24, NULL, NULL, '', 100, NULL, '\"\"', '阿里云账号ID', '阿里云账号ID', 0, 1),
(183, 'configuration_item_region', 'text', 'input', 24, NULL, NULL, '', 100, NULL, '\"cn-shanghai\"', '配置项region', '配置项region', 0, 1),
(184, 'demand_switch', 'radio', 'input', 24, '1=开启\n2=关闭', NULL, NULL, NULL, NULL, '\"2\"', '点播开关', '点播开关', 0, 1),
(185, 'sms_account', 'text', 'input', 17, NULL, NULL, NULL, 100, NULL, '', '短信账号', 'crmeb短信平台账号', 0, 2),
(186, 'sms_token', 'text', 'input', 17, NULL, NULL, '', 100, NULL, '', '短信密码', 'crmeb短信平台的密码', 0, 2),
(187, 'sms_platform_selection', 'radio', 'input', 17, '1=阿里云短信平台\n2=crmeb短信平台', NULL, NULL, NULL, NULL, '\"2\"', '短信平台选择', '短信平台选择', 0, 1),
(188, 'alipay_switch', 'radio', 'input', 16, '1=开启\n0=关闭', NULL, NULL, NULL, NULL, '\"1\"', '支付宝开关', '支付宝开关', 0, 1),
(189, 'is_show_or_hide', 'radio', 'input', 22, '1=显示\n2=隐藏', NULL, NULL, NULL, NULL, '\"1\"', '首页活动显示开关', '首页活动显示开关', 0, 0),
(192, 'force_binding', 'radio', 'input', 1, '1=绑定\n2=不绑定', NULL, NULL, NULL, NULL, '\"1\"', '微信端是否强制绑定手机号', '微信端是否强制绑定手机号', 0, 1),
(193, 'login_logo', 'upload', 'input', 1, NULL, 1, NULL, NULL, NULL, '\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/f93a2202103161033588457.png\"', '后台登录框LOGO', '后台登录框LOGO[建议尺寸180*180]', 0, 1),
(194, 'wechat_notification_message', 'radio', 'input', 1, '1=模版消息\n2=订阅消息', NULL, NULL, NULL, NULL, '\"1\"', '微信通知消息', '微信端通知消息的选择', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_config_content`
--

CREATE TABLE `eb_system_config_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '中文标题',
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名',
  `content` text COMMENT '内容',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文章表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `eb_system_config_content`
--

INSERT INTO `eb_system_config_content` (`id`, `title`, `config_name`, `content`, `add_time`, `is_show`, `is_del`) VALUES
(1, '关于我们', 'about_us', '&lt;p&gt;关于公司的信息介绍&lt;/p&gt;', 0, 1, 0),
(2, '注册登录协议', 'user_agreement', '', 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_config_tab`
--

CREATE TABLE `eb_system_config_tab` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '配置分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类名称',
  `eng_title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类英文名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '配置分类状态',
  `info` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分类是否显示',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT '0' COMMENT '配置类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置分类表';

--
-- 转存表中的数据 `eb_system_config_tab`
--

INSERT INTO `eb_system_config_tab` (`id`, `title`, `eng_title`, `status`, `info`, `icon`, `type`) VALUES
(1, '基础配置', 'basics', 1, 0, 'cog', 0),
(2, '公众号配置', 'wechat', 1, 0, 'weixin', 1),
(3, '公众号分享配置', 'wechat_share', 1, 0, 'whatsapp', 1),
(4, '公众号支付配置', 'pay', 1, 0, 'jpy', 4),
(9, '分销配置', 'fenxiao', 1, 0, 'sitemap', 2),
(16, '支付宝支付配置', 'pay_system', 1, 0, 'yen', 4),
(17, '短信配置', 'sms_system', 1, 0, 'paper-plane', 5),
(18, '阿里云key配置', 'aliyun_system', 1, 0, 'sun-o', 5),
(19, 'OSS上传配置', 'oss_sytem', 1, 0, 'cloud-upload', 5),
(21, '阿里云直播', 'aliyun_live', 1, 0, 'arrow-circle-o-left', 5),
(22, '其他配置', 'shop_home', 1, 0, '', 6),
(23, '充值金币', 'recharge', 1, 0, 'jpy', 7),
(24, '视频点播上传', 'vod_upload', 1, 0, 'plus-square-o', 5);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_file`
--

CREATE TABLE `eb_system_file` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文件对比ID',
  `cthash` char(32) NOT NULL DEFAULT '' COMMENT '文件内容',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文价名称',
  `atime` char(12) NOT NULL DEFAULT '0' COMMENT '上次访问时间',
  `mtime` char(12) NOT NULL DEFAULT '0' COMMENT '上次修改时间',
  `ctime` char(12) NOT NULL DEFAULT '0' COMMENT '上次改变时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件对比表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_group`
--

CREATE TABLE `eb_system_group` (
  `id` int(11) NOT NULL COMMENT '组合数据ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据组名称',
  `info` varchar(256) NOT NULL DEFAULT '' COMMENT '数据提示',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据字段',
  `fields` text COMMENT '数据组字段以及类型（json数据）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合数据表';

--
-- 转存表中的数据 `eb_system_group`
--

INSERT INTO `eb_system_group` (`id`, `name`, `info`, `config_name`, `fields`) VALUES
(34, '首页轮播图', '首页轮播图设置', 'store_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]'),
(52, '提现银行', '提现银行', 'extract_bank', '[{\"name\":\"\\u94f6\\u884c\\u540d\\u79f0\",\"title\":\"bank_name\",\"type\":\"input\",\"param\":\"\"}]'),
(53, '提现规则', '提现规则', 'extract_rule', '[{\"name\":\"\\u89c4\\u5219\",\"title\":\"content\",\"type\":\"textarea\",\"param\":\"\"}]'),
(54, '分享页面背景图', '分享页面背景图', 'share_background', '[{\"name\":\"\\u80cc\\u666f\\u56fe\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]'),
(56, '首页活动区域图片', '首页活动区域图片', 'home_activity', '[{\"name\":\"\\u56fe\\u7247(200*200)\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u7b80\\u4ecb\",\"title\":\"info\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"wap_link\",\"type\":\"input\",\"param\":\"\"}]'),
(57, '会员权益', '会员权益', 'membership_interests', '[{\"name\":\"\\u6743\\u76ca\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u8bf4\\u660e\",\"title\":\"explain\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u6392\\u5e8f\",\"title\":\"sort\",\"type\":\"input\",\"param\":\"\"}]'),
(58, '会员说明', '会员说明', 'member_description', '[{\"name\":\"\\u5185\\u5bb9\",\"title\":\"text\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u6392\\u5e8f\",\"title\":\"sort\",\"type\":\"input\",\"param\":\"\"}]'),
(62, '商品列表轮播', '商品列表轮播设置', 'product_list_carousel', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]'),
(63, '订单详情状态图 ', '订单详情状态图 ', 'order_details_images', '[{\"name\":\"\\u8ba2\\u5355\\u72b6\\u6001\",\"title\":\"order_status\",\"type\":\"select\",\"param\":\"0=>\\u672a\\u652f\\u4ed8\\n1=>\\u5f85\\u53d1\\u8d27\\n2=>\\u5f85\\u6536\\u8d27\\n3=>\\u5df2\\u5b8c\\u6210\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]'),
(64, '商品订单退款原因', '商品订单退款原因', 'goods_order_refund_reason', '[{\"name\":\"\\u9000\\u6b3e\\u539f\\u56e0\",\"title\":\"reason_refund\",\"type\":\"input\",\"param\":\"\"}]'),
(65, '前端底部导航', '前端底部导航', 'bottom_navigation', '[{\"name\":\"\\u79fb\\u52a8\\u7aef\\u9875\\u9762\\u8fde\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u9009\\u4e2d\\u65f6\\u56fe\\u7247\",\"title\":\"class\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u672a\\u9009\\u4e2d\\u65f6\\u56fe\\u7247\",\"title\":\"hove_class\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"}]'),
(66, '新闻简报', '新闻简报', 'news_bulletin', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"}]'),
(67, '悬浮按钮', '前端页面悬浮按钮', 'suspension_button', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"icon\",\"type\":\"upload\",\"param\":\"\"}]');

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_group_data`
--

CREATE TABLE `eb_system_group_data` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '组合数据详情ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '对应的数据组id',
  `value` text COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加数据时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合数据详情表';

--
-- 转存表中的数据 `eb_system_group_data`
--

INSERT INTO `eb_system_group_data` (`id`, `gid`, `value`, `add_time`, `sort`, `status`) VALUES
(1, 38, '{\"banner\":{\"type\":\"upload\",\"value\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2436876e.jpg\"}}', 1527153599, 1, 1),
(2, 52, '{\"bank_name\":{\"type\":\"input\",\"value\":\"\\u62db\\u5546\\u94f6\\u884c\"}}', 1545116190, 1, 1),
(3, 52, '{\"bank_name\":{\"type\":\"input\",\"value\":\"\\u5efa\\u8bbe\\u94f6\\u884c\"}}', 1545116196, 1, 1),
(4, 52, '{\"bank_name\":{\"type\":\"input\",\"value\":\"\\u519c\\u4e1a\\u94f6\\u884c\"}}', 1545116201, 1, 1),
(5, 52, '{\"bank_name\":{\"type\":\"input\",\"value\":\"\\u4e2d\\u56fd\\u94f6\\u884c\"}}', 1545116213, 1, 1),
(6, 52, '{\"bank_name\":{\"type\":\"input\",\"value\":\"\\u5de5\\u5546\\u94f6\\u884c\"}}', 1545116248, 1, 1),
(7, 53, '{\"content\":{\"type\":\"textarea\",\"value\":\"\\u5230\\u8d26\\u65f6\\u95f4T+1\"}}', 1545117378, 0, 1),
(8, 53, '{\"content\":{\"type\":\"textarea\",\"value\":\"\\u63d0\\u73b0\\u624b\\u7eed\\u8d39\\u6263\\u966410%\\uff08\\u542b\\u4e2a\\u4eba\\u6240\\u5f97\\u7a0e\\uff09\"}}', 1545117383, 1, 1),
(9, 54, '{\"pic\":{\"type\":\"upload\",\"value\":\"https:\\/\\/huochemeng.crmeb.net\\/public\\/uploads\\/25\\/20181224\\/s_5c2055fb368ab.jpg\"}}', 1545623151, 1, 1),
(10, 34, '{\"title\":{\"type\":\"input\",\"value\":\"1\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/special\\/special_cate.html\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/f4313202002201232435004.jpg\"}}', 1548224930, 1, 1),
(11, 34, '{\"title\":{\"type\":\"input\",\"value\":\"2\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/special\\/special_cate.html\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d41c7202002201232431520.jpg\"}}', 1581416351, 1, 1),
(12, 34, '{\"title\":{\"type\":\"input\",\"value\":\"3\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/special\\/special_cate.html\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/ce99d202002201232432554.jpg\"}}', 1581502059, 1, 1),
(13, 56, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/bf614202104211036578670.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u96f6\\u5143\\u8bfe\\u7a0b\\u514d\\u8d39\\u9886\"},\"info\":{\"type\":\"input\",\"value\":\"\\u673a\\u4f1a\\u4e0d\\u80fd\\u9519\\u8fc7\"},\"wap_link\":{\"type\":\"select\",\"value\":\"\\/wap\\/special\\/details?id=97\"},\"select_id\":{\"value\":\"97\",\"type\":\"select\"},\"type\":{\"type\":\"radio\",\"value\":\"0\"}}', 1581416634, 0, 1),
(14, 56, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/3f36b202104211036429955.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u96c5\\u601d\\u6258\\u798f\\u7ebf\\u4e0a\\u57f9\\u8bad\"},\"info\":{\"type\":\"input\",\"value\":\"\\u51fa\\u56fd\\u6df1\\u9020\\u5fc5\\u5907\\u8bfe\\u7a0b\"},\"wap_link\":{\"type\":\"select\",\"value\":\"\\/wap\\/special\\/details?id=97\"},\"select_id\":{\"value\":\"97\",\"type\":\"select\"},\"type\":{\"type\":\"radio\",\"value\":\"0\"}}', 1581416745, 0, 1),
(15, 56, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/d73c2202104211036264679.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u8003\\u7814\\u5347\\u5b66\\u6b63\\u5f53\\u65f6\"},\"info\":{\"type\":\"input\",\"value\":\"\\u8003\\u7814\\u5f3a\\u52a9\\u529b\"},\"wap_link\":{\"type\":\"select\",\"value\":\"\\/wap\\/special\\/special_cate?cate_id=4\"},\"select_id\":{\"value\":\"4\",\"type\":\"select\"},\"type\":{\"type\":\"radio\",\"value\":\"1\"}}', 1581416759, 0, 1),
(16, 57, '{\"name\":{\"type\":\"input\",\"value\":\"\\u4f1a\\u5458\\u4f18\\u60e0\\u4ef7\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/39472202004291128217988.png\"},\"explain\":{\"type\":\"input\",\"value\":\"\\u8d2d\\u4e70\\u4e13\\u9898\\u4eab\\u4f1a\\u5458\\u4ef7\"},\"sort\":{\"type\":\"input\",\"value\":\"1\"}}', 1588130969, 1, 1),
(17, 57, '{\"name\":{\"type\":\"input\",\"value\":\"\\u514d\\u8d39\\u8bfe\\u7a0b\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/59285202004291128212590.png\"},\"explain\":{\"type\":\"input\",\"value\":\"\\u90e8\\u5206\\u8bfe\\u7a0b\\u4f1a\\u5458\\u514d\\u8d39\"},\"sort\":{\"type\":\"input\",\"value\":\"2\"}}', 1588130996, 2, 1),
(18, 57, '{\"name\":{\"type\":\"input\",\"value\":\"\\u66f4\\u591a\\u6743\\u76ca\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/11009202004291128212348.png\"},\"explain\":{\"type\":\"input\",\"value\":\"\\u66f4\\u591a\\u6743\\u76ca\\u589e\\u52a0\\u4e2d\"},\"sort\":{\"type\":\"input\",\"value\":\"3\"}}', 1588131020, 3, 1),
(19, 58, '{\"text\":{\"type\":\"input\",\"value\":\"\\u4f1a\\u5458\\u8d2d\\u4e70\\u90e8\\u5206\\u8bfe\\u7a0b\\u53ef\\u4eab\\u53d7\\u4f18\\u60e0\\u4ef7\"},\"sort\":{\"type\":\"input\",\"value\":\"1\"}}', 1588131048, 1, 1),
(20, 58, '{\"text\":{\"type\":\"input\",\"value\":\"\\u4f1a\\u5458\\u5230\\u671f\\u540e\\u6743\\u76ca\\u5373\\u5931\\u6548\\uff0c\\u9700\\u7ee7\\u7eed\\u4eab\\u53d7\\u6743\\u76ca\\u8bf7\\u53ca\\u65f6\\u7eed\\u8d39\"},\"sort\":{\"type\":\"input\",\"value\":\"2\"}}', 1588131059, 2, 1),
(21, 58, '{\"text\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\\u6d3b\\u52a8\\u4ef7\\u65e0\\u4f1a\\u5458\\u4f18\\u60e0\"},\"sort\":{\"type\":\"input\",\"value\":\"3\"}}', 1588131073, 3, 1),
(22, 62, '{\"title\":{\"type\":\"input\",\"value\":\"\\u739b\\u838e\\u62c9\\u8482\\u5f1f\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/detail.html?id=1\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/71b5e20200819165009881.jpg\"}}', 1595058954, 1, 1),
(23, 63, '{\"order_status\":{\"type\":\"select\",\"value\":\"0\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/85bee202008100935589979.gif\"}}', 1597023369, 1, 1),
(24, 63, '{\"order_status\":{\"type\":\"select\",\"value\":\"1\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/b8f8b202008100936333641.gif\"}}', 1597023411, 1, 1),
(25, 63, '{\"order_status\":{\"type\":\"select\",\"value\":\"2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/1f6d8202008100937514239.gif\"}}', 1597023479, 1, 1),
(26, 63, '{\"order_status\":{\"type\":\"select\",\"value\":\"3\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/55c49202008100938248247.gif\"}}', 1597023511, 1, 1),
(27, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86\"}}', 1596525090, 1, 1),
(28, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26\"}}', 1596525119, 1, 1),
(29, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd\"}}', 1596525129, 1, 1),
(30, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86\"}}', 1596525139, 1, 1),
(31, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27\"}}', 1596525149, 1, 1),
(32, 64, '{\"reason_refund\":{\"type\":\"input\",\"value\":\"\\u5176\\u5b83\\u539f\\u56e0\"}}', 1596525158, 1, 1),
(33, 62, '{\"title\":{\"type\":\"input\",\"value\":\"\\u8fc8\\u51ef\\u4f26\\u7406\"},\"url\":{\"type\":\"input\",\"value\":\"#\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/9a908202008191650033943.jpg\"}}', 1597827237, 1, 1),
(34, 65, '{\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/index\\/index.html\"},\"class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/03645202102221211256015.png\"},\"hove_class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/8d6c7202102221211183819.png\"},\"name\":{\"type\":\"input\",\"value\":\"\\u9996\\u9875\"}}', 1614741868, 4, 1),
(35, 65, '{\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/special\\/special_cate.html\"},\"class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/7e5eb202102221210586855.png\"},\"hove_class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/1881a20210222121051213.png\"},\"name\":{\"type\":\"input\",\"value\":\"\\u8bfe\\u7a0b\"}}', 1614743135, 3, 1),
(36, 65, '{\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/my\\/index.html\"},\"class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/4533d202102221209576961.png\"},\"hove_class\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/50710202102221209424541.png\"},\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\"}}', 1614743277, 1, 1),
(37, 66, '{\"title\":{\"type\":\"input\",\"value\":\"\\u7b80\\u62a51\"},\"url\":{\"type\":\"input\",\"value\":\"#\"}}', 1615371134, 1, 1),
(38, 66, '{\"title\":{\"type\":\"input\",\"value\":\"\\u7b80\\u62a52\"},\"url\":{\"type\":\"input\",\"value\":\"http:\\/\\/www.zsf.com\\/wap\\/special\\/special_cate.html\"}}', 1615371147, 2, 1),
(39, 67, '{\"name\":{\"type\":\"input\",\"value\":\"\\u9996\\u9875\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/index\\/index\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/fe36a202103131049193502.png\"}}', 1615603842, 3, 1),
(40, 67, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5ba2\\u670d\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/service\\/service_list\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/722d9202103131051525833.png\"}}', 1615603890, 2, 1),
(41, 67, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/my\\/index\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/cremb-zsff.oss-cn-beijing.aliyuncs.com\\/8f1fb202103131051255873.png\"}}', 1615603915, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_log`
--

CREATE TABLE `eb_system_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '管理员操作记录ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '链接',
  `page` varchar(64) NOT NULL DEFAULT '' COMMENT '行为',
  `method` varchar(12) NOT NULL DEFAULT '' COMMENT '访问类型',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录IP',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间',
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作记录表';

--
-- 转存表中的数据 `eb_system_log`
--

INSERT INTO `eb_system_log` (`id`, `admin_id`, `admin_name`, `path`, `page`, `method`, `ip`, `type`, `add_time`, `merchant_id`) VALUES
(1, 1, 'admin', 'admin/user.userspread/index/', '分销列表', 'GET', '1.80.115.89', 'system', 1618908390, 0),
(2, 1, 'admin', 'admin/user.userspread/spread_list/', '未知', 'GET', '1.80.115.89', 'system', 1618908390, 0),
(3, 1, 'admin', 'admin/user.userspread/get_badge_list/', '未知', 'POST', '1.80.115.89', 'system', 1618908390, 0),
(4, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/52', '提现银行配置', 'GET', '1.80.115.89', 'system', 1618908391, 0),
(5, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/53', '提现银行规则', 'GET', '1.80.115.89', 'system', 1618908392, 0),
(6, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/9', '分销配置', 'GET', '1.80.115.89', 'system', 1618908398, 0),
(7, 1, 'admin', 'admin/setting.systemconfigcontent/index/id/1', '关于我们', 'GET', '1.80.115.89', 'system', 1618908406, 0),
(8, 1, 'admin', 'admin/setting.systemconfigcontent/index/id/2', '用户付费协议', 'GET', '1.80.115.89', 'system', 1618908406, 0),
(9, 1, 'admin', 'admin/system.systemattachment/index/', '未知', 'GET', '1.80.115.89', 'system', 1618908407, 0),
(10, 1, 'admin', 'admin/system.systemattachment/index/', '未知', 'GET', '1.80.115.89', 'system', 1618908407, 0),
(11, 1, 'admin', 'admin/article.search/index/', '关键词搜索', 'GET', '1.80.115.89', 'system', 1618908408, 0),
(12, 1, 'admin', 'admin/setting.systemgroupdata/center_menu/', '个人中心菜单', 'GET', '1.80.115.89', 'system', 1618908409, 0),
(13, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/2', '未知', 'GET', '1.80.115.89', 'system', 1618908409, 0),
(14, 1, 'admin', 'admin/special.subject/index/', '课程分类', 'GET', '1.80.115.89', 'system', 1618908414, 0),
(15, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '1.80.115.89', 'system', 1618908414, 0),
(16, 1, 'admin', 'admin/special.subject/index/', '课程分类', 'GET', '113.132.67.227', 'system', 1618909219, 0),
(17, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909219, 0),
(18, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618909221, 0),
(19, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618909221, 0),
(20, 1, 'admin', 'admin/special.specialtype/index/special_type/2', '音频专题', 'GET', '113.132.67.227', 'system', 1618909222, 0),
(21, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/2', '未知', 'GET', '113.132.67.227', 'system', 1618909222, 0),
(22, 1, 'admin', 'admin/special.specialtype/index/special_type/3', '视频专题', 'GET', '113.132.67.227', 'system', 1618909223, 0),
(23, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/3', '未知', 'GET', '113.132.67.227', 'system', 1618909223, 0),
(24, 1, 'admin', 'admin/special.specialtype/index/special_type/5', '专栏专题', 'GET', '113.132.67.227', 'system', 1618909224, 0),
(25, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/5', '未知', 'GET', '113.132.67.227', 'system', 1618909224, 0),
(26, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618909228, 0),
(27, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909228, 0),
(28, 1, 'admin', 'admin/special.specialtaskcategory/index/', '素材分类', 'GET', '113.132.67.227', 'system', 1618909229, 0),
(29, 1, 'admin', 'admin/special.specialtaskcategory/get_category_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909229, 0),
(30, 1, 'admin', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '113.132.67.227', 'system', 1618909232, 0),
(31, 1, 'admin', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '113.132.67.227', 'system', 1618909232, 0),
(32, 1, 'admin', 'admin/live.aliyunlive/index/special_type/4/type/2', '直播间管理', 'GET', '113.132.67.227', 'system', 1618909233, 0),
(33, 1, 'admin', 'admin/live.aliyunlive/get_live_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909233, 0),
(34, 1, 'admin', 'admin/live.aliyunlive/live_reward/', '直播贡献', 'GET', '113.132.67.227', 'system', 1618909234, 0),
(35, 1, 'admin', 'admin/live.aliyunlive/live_reward_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909234, 0),
(36, 1, 'admin', 'admin/live.aliyunlive/getbadge/', '未知', 'POST', '113.132.67.227', 'system', 1618909234, 0),
(37, 1, 'admin', 'admin/live.aliyunlive/livegiftlist/', '未知', 'GET', '113.132.67.227', 'system', 1618909234, 0),
(38, 1, 'admin', 'admin/live.aliyunlive/live_gift/', '礼物设置', 'GET', '113.132.67.227', 'system', 1618909234, 0),
(39, 1, 'admin', 'admin/live.aliyunlive/live_gift_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909235, 0),
(40, 1, 'admin', 'admin/order.storeorder/index/', '课程订单', 'GET', '113.132.67.227', 'system', 1618909237, 0),
(41, 1, 'admin', 'admin/order.storeorder/order_list/types/0', '订单展示页面', 'GET', '113.132.67.227', 'system', 1618909237, 0),
(42, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '113.132.67.227', 'system', 1618909237, 0),
(43, 1, 'admin', 'admin/user.user/index/', '用户页面展示', 'GET', '113.132.67.227', 'system', 1618909240, 0),
(44, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909240, 0),
(45, 1, 'admin', 'admin/user.userspread/index/', '分销列表', 'GET', '113.132.67.227', 'system', 1618909246, 0),
(46, 1, 'admin', 'admin/user.userspread/spread_list/', '未知', 'GET', '113.132.67.227', 'system', 1618909246, 0),
(47, 1, 'admin', 'admin/user.userspread/get_badge_list/', '未知', 'POST', '113.132.67.227', 'system', 1618909247, 0),
(48, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/9', '分销配置', 'GET', '113.132.67.227', 'system', 1618909248, 0),
(49, 1, 'admin', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '113.132.67.227', 'system', 1618909251, 0),
(50, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618909251, 0),
(51, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618909251, 0),
(52, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/9', '分销配置', 'GET', '113.132.67.227', 'system', 1618911100, 0),
(53, 1, 'admin', 'admin/special.subject/index/', '课程分类', 'GET', '113.132.67.227', 'system', 1618912705, 0),
(54, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912706, 0),
(55, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618912708, 0),
(56, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618912709, 0),
(57, 1, 'admin', 'admin/special.specialtype/index/special_type/2', '音频专题', 'GET', '113.132.67.227', 'system', 1618912710, 0),
(58, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/2', '未知', 'GET', '113.132.67.227', 'system', 1618912710, 0),
(59, 1, 'admin', 'admin/special.specialtype/index/special_type/3', '视频专题', 'GET', '113.132.67.227', 'system', 1618912711, 0),
(60, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/3', '未知', 'GET', '113.132.67.227', 'system', 1618912711, 0),
(61, 1, 'admin', 'admin/special.specialtype/index/special_type/5', '专栏专题', 'GET', '113.132.67.227', 'system', 1618912712, 0),
(62, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/5', '未知', 'GET', '113.132.67.227', 'system', 1618912712, 0),
(63, 1, 'admin', 'admin/setting.systemgroupdata/navigation/', '导航配置', 'GET', '113.132.67.227', 'system', 1618912734, 0),
(64, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/1', '未知', 'GET', '113.132.67.227', 'system', 1618912734, 0),
(65, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend/', '未知', 'GET', '113.132.67.227', 'system', 1618912741, 0),
(66, 1, 'admin', 'admin/setting.systemgroupdata/navigation/', '导航配置', 'GET', '113.132.67.227', 'system', 1618912748, 0),
(67, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/1', '未知', 'GET', '113.132.67.227', 'system', 1618912748, 0),
(68, 1, 'admin', 'admin/widget.images/index/', '附件管理', 'GET', '113.132.67.227', 'system', 1618912819, 0),
(69, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '113.132.67.227', 'system', 1618912819, 0),
(70, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618912820, 0),
(71, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618912823, 0),
(72, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '113.132.67.227', 'system', 1618912832, 0),
(73, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618912833, 0),
(74, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '113.132.67.227', 'system', 1618912839, 0),
(75, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618912839, 0),
(76, 1, 'admin', 'admin/setting.systemgroupdata/index_v1/gid/56', '首页活动', 'GET', '113.132.67.227', 'system', 1618912845, 0),
(77, 1, 'admin', 'admin/setting.systemgroupdata/get_group_data_list/gid/56', '未知', 'GET', '113.132.67.227', 'system', 1618912845, 0),
(78, 1, 'admin', 'admin/setting.systemgroupdata/recommend/', '首页推荐', 'GET', '113.132.67.227', 'system', 1618912847, 0),
(79, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912847, 0),
(80, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_v1/', '未知', 'GET', '113.132.67.227', 'system', 1618912850, 0),
(81, 1, 'admin', 'admin/setting.systemgroupdata/save_recemmend/', '未知', 'POST', '113.132.67.227', 'system', 1618912870, 0),
(82, 1, 'admin', 'admin/setting.systemgroupdata/recommend/', '首页推荐', 'GET', '113.132.67.227', 'system', 1618912873, 0),
(83, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912873, 0),
(84, 1, 'admin', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '113.132.67.227', 'system', 1618912876, 0),
(85, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618912876, 0),
(86, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618912877, 0),
(87, 1, 'admin', 'admin/article.articlev1/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912881, 0),
(88, 1, 'admin', 'admin/article.articlev1/save_recommend/article_id/8', '未知', 'POST', '113.132.67.227', 'system', 1618912884, 0),
(89, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618912884, 0),
(90, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618912884, 0),
(91, 1, 'admin', 'admin/article.articlev1/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912886, 0),
(92, 1, 'admin', 'admin/article.articlev1/save_recommend/article_id/7', '未知', 'POST', '113.132.67.227', 'system', 1618912890, 0),
(93, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618912890, 0),
(94, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618912890, 0),
(95, 1, 'admin', 'admin/article.articlev1/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912892, 0),
(96, 1, 'admin', 'admin/article.articlev1/save_recommend/article_id/3', '未知', 'POST', '113.132.67.227', 'system', 1618912895, 0),
(97, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618912896, 0),
(98, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618912896, 0),
(99, 1, 'admin', 'admin/article.articlev1/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912898, 0),
(100, 1, 'admin', 'admin/article.articlev1/save_recommend/article_id/2', '未知', 'POST', '113.132.67.227', 'system', 1618912901, 0),
(101, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '113.132.67.227', 'system', 1618912901, 0),
(102, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '113.132.67.227', 'system', 1618912901, 0),
(103, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_v1/', '未知', 'GET', '113.132.67.227', 'system', 1618912918, 0),
(104, 1, 'admin', 'admin/setting.systemgroupdata/save_recemmend/', '未知', 'POST', '113.132.67.227', 'system', 1618912947, 0),
(105, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618912954, 0),
(106, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912954, 0),
(107, 1, 'admin', 'admin/special.specialtype/sourcerecommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912965, 0),
(108, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/66', '未知', 'POST', '113.132.67.227', 'system', 1618912968, 0),
(109, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618912968, 0),
(110, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912968, 0),
(111, 1, 'admin', 'admin/special.specialtype/sourcerecommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912975, 0),
(112, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/61', '未知', 'POST', '113.132.67.227', 'system', 1618912978, 0),
(113, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618912978, 0),
(114, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912978, 0),
(115, 1, 'admin', 'admin/special.specialtype/sourcerecommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912986, 0),
(116, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/58', '未知', 'POST', '113.132.67.227', 'system', 1618912989, 0),
(117, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618912989, 0),
(118, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912989, 0),
(119, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618912994, 0),
(120, 1, 'admin', 'admin/special.specialtype/sourcerecommend/', '未知', 'GET', '113.132.67.227', 'system', 1618912998, 0),
(121, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/52', '未知', 'POST', '113.132.67.227', 'system', 1618913000, 0),
(122, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '113.132.67.227', 'system', 1618913001, 0),
(123, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '113.132.67.227', 'system', 1618913001, 0),
(124, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913036, 0),
(125, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/134', '未知', 'POST', '113.132.67.227', 'system', 1618913041, 0),
(126, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618913041, 0),
(127, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618913041, 0),
(128, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913044, 0),
(129, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/132', '未知', 'POST', '113.132.67.227', 'system', 1618913047, 0),
(130, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618913047, 0),
(131, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618913048, 0),
(132, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913051, 0),
(133, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/131', '未知', 'POST', '113.132.67.227', 'system', 1618913054, 0),
(134, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618913054, 0),
(135, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618913054, 0),
(136, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913059, 0),
(137, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/130', '未知', 'POST', '113.132.67.227', 'system', 1618913061, 0),
(138, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '113.132.67.227', 'system', 1618913061, 0),
(139, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '113.132.67.227', 'system', 1618913062, 0),
(140, 1, 'admin', 'admin/special.specialtype/index/special_type/3', '视频专题', 'GET', '113.132.67.227', 'system', 1618913115, 0),
(141, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/3', '未知', 'GET', '113.132.67.227', 'system', 1618913115, 0),
(142, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend/', '未知', 'GET', '113.132.67.227', 'system', 1618913277, 0),
(143, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend/', '未知', 'GET', '113.132.67.227', 'system', 1618913279, 0),
(144, 1, 'admin', 'admin/widget.images/index/', '附件管理', 'GET', '113.132.67.227', 'system', 1618913281, 0),
(145, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '113.132.67.227', 'system', 1618913282, 0),
(146, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618913282, 0),
(147, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '113.132.67.227', 'system', 1618913288, 0),
(148, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618913288, 0),
(149, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_v1/', '未知', 'GET', '113.132.67.227', 'system', 1618913319, 0),
(150, 1, 'admin', 'admin/setting.systemgroupdata/save_recemmend/', '未知', 'POST', '113.132.67.227', 'system', 1618913324, 0),
(151, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_v1/', '未知', 'GET', '113.132.67.227', 'system', 1618913328, 0),
(152, 1, 'admin', 'admin/setting.systemgroupdata/save_recemmend/', '未知', 'POST', '113.132.67.227', 'system', 1618913332, 0),
(153, 1, 'admin', 'admin/setting.systemgroupdata/index_v1/gid/56', '首页活动', 'GET', '1.80.115.89', 'system', 1618913370, 0),
(154, 1, 'admin', 'admin/setting.systemgroupdata/get_group_data_list/gid/56', '未知', 'GET', '1.80.115.89', 'system', 1618913370, 0),
(155, 1, 'admin', 'admin/setting.systemgroupdata/recommend/', '首页推荐', 'GET', '1.80.115.89', 'system', 1618913372, 0),
(156, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/', '未知', 'GET', '1.80.115.89', 'system', 1618913372, 0),
(157, 1, 'admin', 'admin/setting.systemgroupdata/recemmend_content/', '未知', 'GET', '1.80.115.89', 'system', 1618913385, 0),
(158, 1, 'admin', 'admin/setting.systemgroupdata/recemmend_content/id/31', '未知', 'GET', '1.80.115.89', 'system', 1618913385, 0),
(159, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913391, 0),
(160, 1, 'admin', 'admin/setting.systemgroupdata/recemmend_content/', '未知', 'GET', '1.80.115.89', 'system', 1618913391, 0),
(161, 1, 'admin', 'admin/setting.systemgroupdata/recemmend_content/id/26', '未知', 'GET', '1.80.115.89', 'system', 1618913391, 0),
(162, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/126', '未知', 'POST', '113.132.67.227', 'system', 1618913394, 0),
(163, 1, 'admin', 'admin/special.specialtype/index/special_type/5', '专栏专题', 'GET', '113.132.67.227', 'system', 1618913394, 0),
(164, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/5', '未知', 'GET', '113.132.67.227', 'system', 1618913394, 0),
(165, 1, 'admin', 'admin/special.specialtype/recommend/', '未知', 'GET', '113.132.67.227', 'system', 1618913397, 0),
(166, 1, 'admin', 'admin/special.specialtype/save_recommend/special_id/114', '未知', 'POST', '113.132.67.227', 'system', 1618913400, 0),
(167, 1, 'admin', 'admin/special.specialtype/index/special_type/5', '专栏专题', 'GET', '113.132.67.227', 'system', 1618913400, 0),
(168, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/5', '未知', 'GET', '113.132.67.227', 'system', 1618913401, 0),
(169, 1, 'admin', 'admin/article.articlev1/index/', '新闻列表', 'GET', '1.80.115.89', 'system', 1618913411, 0),
(170, 1, 'admin', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '1.80.115.89', 'system', 1618913411, 0),
(171, 1, 'admin', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '1.80.115.89', 'system', 1618913411, 0),
(172, 1, 'admin', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '1.80.115.89', 'system', 1618913420, 0),
(173, 1, 'admin', 'admin/user.userspread/index/', '分销列表', 'GET', '1.80.115.89', 'system', 1618913440, 0),
(174, 1, 'admin', 'admin/user.userspread/spread_list/', '未知', 'GET', '1.80.115.89', 'system', 1618913440, 0),
(175, 1, 'admin', 'admin/user.userspread/get_badge_list/', '未知', 'POST', '1.80.115.89', 'system', 1618913440, 0),
(176, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/9', '分销配置', 'GET', '1.80.115.89', 'system', 1618913440, 0),
(177, 1, 'admin', 'admin/order.storeorder/index/', '课程订单', 'GET', '1.80.115.89', 'system', 1618913469, 0),
(178, 1, 'admin', 'admin/order.storeorder/order_list/types/0', '订单展示页面', 'GET', '1.80.115.89', 'system', 1618913469, 0),
(179, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '1.80.115.89', 'system', 1618913469, 0),
(180, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '113.132.67.227', 'system', 1618913551, 0),
(181, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '113.132.67.227', 'system', 1618913552, 0),
(182, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '113.132.67.227', 'system', 1618913552, 0),
(183, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618913552, 0),
(184, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '113.132.67.227', 'system', 1618913557, 0),
(185, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618913557, 0),
(186, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '113.132.67.227', 'system', 1618914489, 0),
(187, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '113.132.67.227', 'system', 1618914490, 0),
(188, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '113.132.67.227', 'system', 1618914490, 0),
(189, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618914490, 0),
(190, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '113.132.67.227', 'system', 1618914495, 0),
(191, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '113.132.67.227', 'system', 1618914495, 0),
(192, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '113.132.67.227', 'system', 1618914582, 0),
(193, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '113.132.67.227', 'system', 1618914971, 0),
(194, 1, 'admin', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '113.132.67.227', 'system', 1618914986, 0),
(195, 1, 'admin', 'admin/special.subject/index/', '课程分类', 'GET', '36.44.34.18', 'system', 1618966633, 0),
(196, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966633, 0),
(197, 1, 'admin', 'admin/special.specialtype/index/special_type/1', '图文专题', 'GET', '36.44.34.18', 'system', 1618966639, 0),
(198, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/1', '未知', 'GET', '36.44.34.18', 'system', 1618966639, 0),
(199, 1, 'admin', 'admin/special.specialtype/index/special_type/2', '音频专题', 'GET', '36.44.34.18', 'system', 1618966640, 0),
(200, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/2', '未知', 'GET', '36.44.34.18', 'system', 1618966641, 0),
(201, 1, 'admin', 'admin/special.specialtype/index/special_type/3', '视频专题', 'GET', '36.44.34.18', 'system', 1618966641, 0),
(202, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/3', '未知', 'GET', '36.44.34.18', 'system', 1618966641, 0),
(203, 1, 'admin', 'admin/special.specialtype/index/special_type/5', '专栏专题', 'GET', '36.44.34.18', 'system', 1618966642, 0),
(204, 1, 'admin', 'admin/special.specialtype/list/subject_id/0/special_type/5', '未知', 'GET', '36.44.34.18', 'system', 1618966642, 0),
(205, 1, 'admin', 'admin/special.specialtype/add/', '创建编辑专题', 'GET', '36.44.34.18', 'system', 1618966647, 0),
(206, 1, 'admin', 'admin/special.specialtype/get_subject_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966647, 0),
(207, 1, 'admin', 'admin/system.systemattachment/index/', '未知', 'GET', '36.44.34.18', 'system', 1618966647, 0),
(208, 1, 'admin', 'admin/special.specialtype/sources_index/', '素材列表', 'GET', '36.44.34.18', 'system', 1618966658, 0),
(209, 1, 'admin', 'admin/special.specialtype/get_source_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966658, 0),
(210, 1, 'admin', 'admin/special.specialtaskcategory/index/', '素材分类', 'GET', '36.44.34.18', 'system', 1618966658, 0),
(211, 1, 'admin', 'admin/special.specialtaskcategory/get_category_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966658, 0),
(212, 1, 'admin', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '36.44.34.18', 'system', 1618966660, 0),
(213, 1, 'admin', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '36.44.34.18', 'system', 1618966660, 0),
(214, 1, 'admin', 'admin/live.aliyunlive/live_reward/', '直播贡献', 'GET', '36.44.34.18', 'system', 1618966687, 0),
(215, 1, 'admin', 'admin/live.aliyunlive/live_reward_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966688, 0),
(216, 1, 'admin', 'admin/live.aliyunlive/getbadge/', '未知', 'POST', '36.44.34.18', 'system', 1618966688, 0),
(217, 1, 'admin', 'admin/live.aliyunlive/livegiftlist/', '未知', 'GET', '36.44.34.18', 'system', 1618966688, 0),
(218, 1, 'admin', 'admin/live.aliyunlive/live_gift/', '礼物设置', 'GET', '36.44.34.18', 'system', 1618966688, 0),
(219, 1, 'admin', 'admin/live.aliyunlive/live_gift_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966688, 0),
(220, 1, 'admin', 'admin/order.storeorder/index/', '课程订单', 'GET', '36.44.34.18', 'system', 1618966689, 0),
(221, 1, 'admin', 'admin/order.storeorder/order_list/types/0', '订单展示页面', 'GET', '36.44.34.18', 'system', 1618966690, 0),
(222, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '36.44.34.18', 'system', 1618966690, 0),
(223, 1, 'admin', 'admin/user.user/index/', '用户页面展示', 'GET', '36.44.34.18', 'system', 1618966691, 0),
(224, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966691, 0),
(225, 1, 'admin', 'admin/user.userspread/index/', '分销列表', 'GET', '36.44.34.18', 'system', 1618966692, 0),
(226, 1, 'admin', 'admin/user.userspread/spread_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966693, 0),
(227, 1, 'admin', 'admin/user.userspread/get_badge_list/', '未知', 'POST', '36.44.34.18', 'system', 1618966693, 0),
(228, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/66', '新闻简报', 'GET', '36.44.34.18', 'system', 1618966698, 0),
(229, 1, 'admin', 'admin/setting.systemgroupdata/recommend/', '首页推荐', 'GET', '36.44.34.18', 'system', 1618966699, 0),
(230, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/', '未知', 'GET', '36.44.34.18', 'system', 1618966699, 0),
(231, 1, 'admin', 'admin/setting.systemgroupdata/center_menu/', '个人中心菜单', 'GET', '36.44.34.18', 'system', 1618967483, 0),
(232, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/2', '未知', 'GET', '36.44.34.18', 'system', 1618967483, 0),
(233, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '36.44.34.18', 'system', 1618967489, 0),
(234, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '36.44.34.18', 'system', 1618967491, 0),
(235, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618967491, 0),
(236, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967491, 0),
(237, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/2/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967497, 0),
(238, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/3/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967499, 0),
(239, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/2/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967501, 0),
(240, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967503, 0),
(241, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618967526, 0),
(242, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967526, 0),
(243, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '36.44.34.18', 'system', 1618967557, 0),
(244, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618967557, 0),
(245, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967557, 0),
(246, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967562, 0),
(247, 1, 'admin', 'admin/widget.images/get_image_list/pid/5/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967563, 0),
(248, 1, 'admin', 'admin/widget.images/get_image_list/pid/6/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967564, 0),
(249, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618967586, 0),
(250, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/19/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618967588, 0),
(251, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618967807, 0),
(252, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '36.44.34.18', 'system', 1618967817, 0),
(253, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '36.44.34.18', 'system', 1618967819, 0),
(254, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618967819, 0),
(255, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967819, 0),
(256, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618967823, 0),
(257, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618967824, 0),
(258, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理', 'GET', '36.44.34.18', 'system', 1618968224, 0),
(259, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表', 'GET', '36.44.34.18', 'system', 1618968227, 0),
(260, 1, 'admin', 'admin/setting.systemadmin/create/', '未知', 'GET', '36.44.34.18', 'system', 1618968229, 0),
(261, 1, 'admin', 'admin/setting.systemrole/create/', '未知', 'GET', '36.44.34.18', 'system', 1618968236, 0),
(262, 1, 'admin', 'admin/setting.systemrole/save/', '未知', 'POST', '36.44.34.18', 'system', 1618968495, 0),
(263, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理', 'GET', '36.44.34.18', 'system', 1618968498, 0),
(264, 1, 'admin', 'admin/setting.systemadmin/create/', '未知', 'GET', '36.44.34.18', 'system', 1618968558, 0),
(265, 1, 'admin', 'admin/setting.systemadmin/save/', '未知', 'POST', '36.44.34.18', 'system', 1618968592, 0),
(266, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表', 'GET', '36.44.34.18', 'system', 1618968597, 0),
(267, 2, 'demo', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618968656, 0),
(268, 2, 'demo', 'admin/article.articlev1/index/', '新闻列表', 'GET', '36.44.34.18', 'system', 1618968668, 0),
(269, 2, 'demo', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '36.44.34.18', 'system', 1618968668, 0),
(270, 2, 'demo', 'admin/article.articlev1/recommend/', '未知', 'GET', '36.44.34.18', 'system', 1618968671, 0),
(271, 2, 'demo', 'admin/article.articlev1/add_article/type/2', '添加编辑新闻', 'GET', '36.44.34.18', 'system', 1618968674, 0),
(272, 2, 'demo', 'admin/system.systemattachment/index/', '未知', 'GET', '36.44.34.18', 'system', 1618968675, 0),
(273, 2, 'demo', 'admin/article.articlev1/index/', '新闻列表', 'GET', '36.44.34.18', 'system', 1618968682, 0),
(274, 2, 'demo', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '36.44.34.18', 'system', 1618968682, 0),
(275, 2, 'demo', 'admin/article.articlev1/recommend/', '未知', 'GET', '36.44.34.18', 'system', 1618968693, 0),
(276, 2, 'demo', 'admin/article.articlev1/save_recommend/article_id/1', '未知', 'POST', '36.44.34.18', 'system', 1618968697, 0),
(277, 2, 'demo', 'admin/article.articlev1/index/', '新闻列表', 'GET', '36.44.34.18', 'system', 1618968697, 0),
(278, 2, 'demo', 'admin/article.articlev1/article_list/cid/0', '未知', 'GET', '36.44.34.18', 'system', 1618968697, 0),
(279, 2, 'demo', 'admin/article.articlecategory/index/', '新闻分类', 'GET', '36.44.34.18', 'system', 1618968702, 0),
(280, 2, 'demo', 'admin/article.articlecategory/edit/', '编辑新闻分类', 'GET', '36.44.34.18', 'system', 1618968705, 0),
(281, 2, 'demo', 'admin/user.userspread/index/', '分销列表', 'GET', '36.44.34.18', 'system', 1618968712, 0),
(282, 2, 'demo', 'admin/user.userspread/spread_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968712, 0),
(283, 2, 'demo', 'admin/user.userspread/get_badge_list/', '未知', 'POST', '36.44.34.18', 'system', 1618968712, 0),
(284, 2, 'demo', 'admin/user.signposter/index/', '海报列表展示', 'GET', '36.44.34.18', 'system', 1618968714, 0),
(285, 2, 'demo', 'admin/user.signposter/getsignposterlist/', '未知', 'GET', '36.44.34.18', 'system', 1618968714, 0),
(286, 2, 'demo', 'admin/user.usersign/index/', '签到记录', 'GET', '36.44.34.18', 'system', 1618968715, 0),
(287, 2, 'demo', 'admin/user.usersign/getusersignlist/', '未知', 'GET', '36.44.34.18', 'system', 1618968715, 0),
(288, 2, 'demo', 'admin/user.user/index/', '用户页面展示', 'GET', '36.44.34.18', 'system', 1618968718, 0),
(289, 2, 'demo', 'admin/user.user/get_user_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968718, 0),
(290, 2, 'demo', 'admin/order.storeorder/index/', '课程订单', 'GET', '36.44.34.18', 'system', 1618968722, 0),
(291, 2, 'demo', 'admin/order.storeorder/order_list/types/0', '订单展示页面', 'GET', '36.44.34.18', 'system', 1618968722, 0),
(292, 2, 'demo', 'admin/order.storeorder/getbadge/', '未知', 'POST', '36.44.34.18', 'system', 1618968722, 0),
(293, 2, 'demo', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '36.44.34.18', 'system', 1618968725, 0),
(294, 2, 'demo', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '36.44.34.18', 'system', 1618968725, 0),
(295, 2, 'demo', 'admin/live.aliyunlive/go_live/', '去直播', 'GET', '36.44.34.18', 'system', 1618968731, 0),
(296, 2, 'demo', 'admin/live.aliyunlive/index/special_type/4/type/2', '直播间管理', 'GET', '36.44.34.18', 'system', 1618968735, 0),
(297, 2, 'demo', 'admin/live.aliyunlive/get_live_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968735, 0),
(298, 2, 'demo', 'admin/live.aliyunlive/live_reward/', '直播贡献', 'GET', '36.44.34.18', 'system', 1618968738, 0),
(299, 2, 'demo', 'admin/live.aliyunlive/live_reward_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968739, 0),
(300, 2, 'demo', 'admin/live.aliyunlive/getbadge/', '未知', 'POST', '36.44.34.18', 'system', 1618968739, 0),
(301, 2, 'demo', 'admin/live.aliyunlive/livegiftlist/', '未知', 'GET', '36.44.34.18', 'system', 1618968739, 0),
(302, 2, 'demo', 'admin/live.aliyunlive/live_gift/', '礼物设置', 'GET', '36.44.34.18', 'system', 1618968739, 0),
(303, 2, 'demo', 'admin/live.aliyunlive/live_gift_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968739, 0),
(304, 2, 'demo', 'admin/special.subject/index/', '课程分类', 'GET', '36.44.34.18', 'system', 1618968741, 0),
(305, 2, 'demo', 'admin/special.subject/get_subject_list/', '未知', 'GET', '36.44.34.18', 'system', 1618968741, 0),
(306, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理', 'GET', '36.44.34.18', 'system', 1618968770, 0),
(307, 1, 'admin', 'admin/setting.systemrole/edit/id/4', '未知', 'GET', '36.44.34.18', 'system', 1618968771, 0),
(308, 1, 'admin', 'admin/setting.systemrole/update/id/4', '未知', 'POST', '36.44.34.18', 'system', 1618968864, 0),
(309, 2, 'demo', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '36.44.34.18', 'system', 1618968886, 0),
(310, 2, 'demo', 'admin/setting.systemgroup/index/', '组合数据', 'GET', '36.44.34.18', 'system', 1618968899, 0),
(311, 2, 'demo', 'admin/setting.systemgroupdata/index/gid/0', '未知', 'GET', '36.44.34.18', 'system', 1618968904, 0),
(312, 2, 'demo', 'admin/setting.systemgroup/index/', '组合数据', 'GET', '36.44.34.18', 'system', 1618968907, 0),
(313, 2, 'demo', 'admin/setting.systemgroup/edit/id/56', '未知', 'GET', '36.44.34.18', 'system', 1618968908, 0),
(314, 2, 'demo', 'admin/setting.systemgroup/save/', '未知', 'POST', '36.44.34.18', 'system', 1618968911, 0),
(315, 2, 'demo', 'admin/setting.systemgroup/edit/id/34', '未知', 'GET', '36.44.34.18', 'system', 1618968914, 0),
(316, 2, 'demo', 'admin/setting.systemgroupdata/index/gid/0', '未知', 'GET', '36.44.34.18', 'system', 1618968926, 0),
(317, 2, 'demo', 'admin/setting.systemgroup/index/', '组合数据', 'GET', '36.44.34.18', 'system', 1618968928, 0),
(318, 2, 'demo', 'admin/system.clear/index/', '刷新缓存', 'GET', '36.44.34.18', 'system', 1618968973, 0),
(319, 2, 'demo', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618968976, 0),
(320, 2, 'demo', 'admin/wechat.wechatnewscategory/index/', '图文消息展示页', 'GET', '36.44.34.18', 'system', 1618968980, 0),
(321, 2, 'demo', 'admin/wechat.wechatnewscategory/append/', '未知', 'GET', '36.44.34.18', 'system', 1618968982, 0),
(322, 2, 'demo', 'admin/system.systemattachment/index/', '未知', 'GET', '36.44.34.18', 'system', 1618968983, 0),
(323, 2, 'demo', 'admin/wechat.wechatnewscategory/index/', '图文消息展示页', 'GET', '36.44.34.18', 'system', 1618968994, 0),
(324, 1, 'admin', 'admin/special.subject/index/', '课程分类', 'GET', '1.80.114.228', 'system', 1618968998, 0),
(325, 1, 'admin', 'admin/special.subject/get_subject_list/', '未知', 'GET', '1.80.114.228', 'system', 1618968998, 0),
(326, 1, 'admin', 'admin/setting.systemmenus/index/cate/12', '权限规则', 'GET', '36.44.34.18', 'system', 1618969079, 0),
(327, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理', 'GET', '36.44.34.18', 'system', 1618969082, 0),
(328, 1, 'admin', 'admin/setting.systemrole/edit/id/4', '未知', 'GET', '36.44.34.18', 'system', 1618969084, 0),
(329, 1, 'admin', 'admin/setting.systemrole/update/id/4', '未知', 'POST', '36.44.34.18', 'system', 1618969133, 0),
(330, 2, 'demo', 'admin/special.subject/index/', '课程分类', 'GET', '36.44.34.18', 'system', 1618969158, 0),
(331, 2, 'demo', 'admin/special.subject/get_subject_list/', '未知', 'GET', '36.44.34.18', 'system', 1618969158, 0),
(332, 2, 'demo', 'admin/special.subject/create/', '创建分类', 'GET', '36.44.34.18', 'system', 1618969159, 0),
(333, 2, 'demo', 'admin/special.subject/get_cate_list/', '未知', 'GET', '36.44.34.18', 'system', 1618969159, 0),
(334, 2, 'demo', 'admin/widget.images/index/', '附件管理', 'GET', '36.44.34.18', 'system', 1618969162, 0),
(335, 2, 'demo', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618969162, 0),
(336, 2, 'demo', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618969162, 0),
(337, 2, 'demo', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618969175, 0),
(338, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理', 'GET', '36.44.34.18', 'system', 1618969436, 0),
(339, 1, 'admin', 'admin/setting.systemrole/edit/id/4', '未知', 'GET', '36.44.34.18', 'system', 1618969438, 0),
(340, 1, 'admin', 'admin/setting.systemrole/update/id/4', '未知', 'POST', '36.44.34.18', 'system', 1618969449, 0),
(341, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970739, 0),
(342, 1, 'admin', 'admin/widget.images/index/fodder/home_logo', '附件管理', 'GET', '36.44.34.18', 'system', 1618970743, 0),
(343, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618970743, 0),
(344, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618970743, 0),
(345, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618970750, 0),
(346, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618970750, 0),
(347, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号配置', 'GET', '36.44.34.18', 'system', 1618970778, 0),
(348, 1, 'admin', 'admin/setting.systemconfig/index/type/4/tab_id/4', '支付配置', 'GET', '36.44.34.18', 'system', 1618970780, 0),
(349, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618970780, 0),
(350, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/19/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970783, 0),
(351, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/21/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970784, 0),
(352, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/18/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970785, 0),
(353, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618970786, 0),
(354, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/21/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970787, 0),
(355, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/19/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970788, 0),
(356, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/21/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618970790, 0),
(357, 1, 'admin', 'admin/setting.systembucket/index/', '对象存储', 'GET', '36.44.34.18', 'system', 1618970800, 0),
(358, 1, 'admin', 'admin/setting.systembroadcast/index/', '直播配置', 'GET', '36.44.34.18', 'system', 1618970802, 0),
(359, 1, 'admin', 'admin/setting.systembucket/create/', '添加存储空间', 'GET', '36.44.34.18', 'system', 1618971526, 0),
(360, 1, 'admin', 'admin/setting.systembucket/create/', '添加存储空间', 'GET', '36.44.34.18', 'system', 1618971566, 0),
(361, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971596, 0),
(362, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971601, 0),
(363, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971602, 0),
(364, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971603, 0),
(365, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971604, 0),
(366, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971605, 0),
(367, 2, 'demo', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '36.44.34.18', 'system', 1618971607, 0),
(368, 2, 'demo', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '36.44.34.18', 'system', 1618971607, 0),
(369, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971609, 0),
(370, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971612, 0),
(371, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971622, 0),
(372, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971623, 0),
(373, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971627, 0),
(374, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971628, 0),
(375, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971629, 0),
(376, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971629, 0),
(377, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971631, 0),
(378, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971632, 0),
(379, 1, 'admin', 'admin/setting.systembucket/save/', '保存存储空间', 'POST', '36.44.34.18', 'system', 1618971633, 0),
(380, 2, 'demo', 'admin/live.aliyunlive/index/special_type/4/type/2', '直播间管理', 'GET', '36.44.34.18', 'system', 1618971705, 0),
(381, 2, 'demo', 'admin/live.aliyunlive/get_live_list/', '未知', 'GET', '36.44.34.18', 'system', 1618971705, 0),
(382, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/18/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971813, 0),
(383, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618971815, 0),
(384, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/18/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971826, 0),
(385, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618971838, 0),
(386, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/19/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971840, 0),
(387, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618971847, 0),
(388, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/18/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971848, 0),
(389, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/19/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971852, 0),
(390, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/18/type/5', '配置列表展示页', 'GET', '36.44.34.18', 'system', 1618971855, 0),
(391, 1, 'admin', 'admin/widget.images/index/fodder/home_logo', '附件管理', 'GET', '36.44.34.18', 'system', 1618971918, 0),
(392, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618971918, 0),
(393, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618971918, 0),
(394, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618971925, 0),
(395, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618971925, 0),
(396, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618971932, 0),
(397, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618971945, 0),
(398, 1, 'admin', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '36.44.34.18', 'system', 1618971971, 0),
(399, 1, 'admin', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '36.44.34.18', 'system', 1618971971, 0),
(400, 1, 'admin', 'admin/live.aliyunlive/index/special_type/4/type/2', '直播间管理', 'GET', '36.44.34.18', 'system', 1618971975, 0),
(401, 1, 'admin', 'admin/live.aliyunlive/get_live_list/', '未知', 'GET', '36.44.34.18', 'system', 1618971975, 0),
(402, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号配置', 'GET', '36.44.34.18', 'system', 1618971991, 0),
(403, 1, 'admin', 'admin/widget.images/index/fodder/wechat_qrcode', '附件管理', 'GET', '36.44.34.18', 'system', 1618971999, 0),
(404, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972000, 0),
(405, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972000, 0),
(406, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618972285, 0),
(407, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972286, 0),
(408, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618972291, 0),
(409, 1, 'admin', 'admin/setting.systemgroupdata/navigation/', '导航配置', 'GET', '36.44.34.18', 'system', 1618972363, 0),
(410, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/1', '未知', 'GET', '36.44.34.18', 'system', 1618972363, 0),
(411, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '36.44.34.18', 'system', 1618972366, 0),
(412, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '36.44.34.18', 'system', 1618972375, 0),
(413, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972375, 0),
(414, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972375, 0),
(415, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618972381, 0),
(416, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972382, 0),
(417, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618972465, 0),
(418, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618972467, 0),
(419, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '36.44.34.18', 'system', 1618972489, 0),
(420, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/5', '阿里云配置', 'GET', '36.44.34.18', 'system', 1618972491, 0),
(421, 1, 'admin', 'admin/setting.systemgroupdata/create_recemmend_custom/', '未知', 'GET', '36.44.34.18', 'system', 1618972502, 0),
(422, 1, 'admin', 'admin/widget.images/index/fodder/icon', '附件管理', 'GET', '36.44.34.18', 'system', 1618972508, 0);
INSERT INTO `eb_system_log` (`id`, `admin_id`, `admin_name`, `path`, `page`, `method`, `ip`, `type`, `add_time`, `merchant_id`) VALUES
(423, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972508, 0),
(424, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972508, 0),
(425, 1, 'admin', 'admin/setting.systemgroupdata/save_recemmend_custom/id/0/is_fixed/1', '未知', 'POST', '36.44.34.18', 'system', 1618972526, 0),
(426, 1, 'admin', 'admin/setting.systemgroupdata/navigation/', '导航配置', 'GET', '36.44.34.18', 'system', 1618972526, 0),
(427, 1, 'admin', 'admin/setting.systemgroupdata/recommend_list/is_fixed/1', '未知', 'GET', '36.44.34.18', 'system', 1618972526, 0),
(428, 1, 'admin', 'admin/setting.systemgroupdata/set_show/is_show/1/id/48', '未知', 'GET', '36.44.34.18', 'system', 1618972543, 0),
(429, 1, 'admin', 'admin/setting.systemgroupdata/index_v1/gid/56', '首页活动', 'GET', '36.44.34.18', 'system', 1618972573, 0),
(430, 1, 'admin', 'admin/setting.systemgroupdata/get_group_data_list/gid/56', '未知', 'GET', '36.44.34.18', 'system', 1618972573, 0),
(431, 1, 'admin', 'admin/setting.systemgroupdata/create_v1/', '未知', 'GET', '36.44.34.18', 'system', 1618972576, 0),
(432, 1, 'admin', 'admin/widget.images/index/', '附件管理', 'GET', '36.44.34.18', 'system', 1618972578, 0),
(433, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972578, 0),
(434, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972578, 0),
(435, 1, 'admin', 'admin/live.aliyunlive/special_live/special_type/4', '直播列表', 'GET', '36.44.34.18', 'system', 1618972584, 0),
(436, 1, 'admin', 'admin/live.aliyunlive/special_list/subject_id/0/special_type/4', '未知', 'GET', '36.44.34.18', 'system', 1618972585, 0),
(437, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618972586, 0),
(438, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972587, 0),
(439, 1, 'admin', 'admin/setting.systemgroupdata/save_group_data/name/home_activity', '未知', 'POST', '36.44.34.18', 'system', 1618972590, 0),
(440, 1, 'admin', 'admin/setting.systemgroupdata/create_v1/', '未知', 'GET', '36.44.34.18', 'system', 1618972594, 0),
(441, 1, 'admin', 'admin/widget.images/index/', '附件管理', 'GET', '36.44.34.18', 'system', 1618972596, 0),
(442, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972597, 0),
(443, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972597, 0),
(444, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618972602, 0),
(445, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972603, 0),
(446, 1, 'admin', 'admin/setting.systemgroupdata/save_group_data/name/home_activity', '未知', 'POST', '36.44.34.18', 'system', 1618972606, 0),
(447, 1, 'admin', 'admin/setting.systemgroupdata/create_v1/', '未知', 'GET', '36.44.34.18', 'system', 1618972609, 0),
(448, 1, 'admin', 'admin/widget.images/index/', '附件管理', 'GET', '36.44.34.18', 'system', 1618972611, 0),
(449, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '36.44.34.18', 'system', 1618972611, 0),
(450, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972611, 0),
(451, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '36.44.34.18', 'system', 1618972617, 0),
(452, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '36.44.34.18', 'system', 1618972617, 0),
(453, 1, 'admin', 'admin/setting.systemgroupdata/save_group_data/name/home_activity', '未知', 'POST', '36.44.34.18', 'system', 1618972620, 0),
(454, 1, 'admin', 'admin/setting.systemgroupdata/index_v1/gid/56', '首页活动', 'GET', '36.44.34.18', 'system', 1618972623, 0),
(455, 1, 'admin', 'admin/setting.systemgroupdata/get_group_data_list/gid/56', '未知', 'GET', '36.44.34.18', 'system', 1618972623, 0);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_menus`
--

CREATE TABLE `eb_system_menus` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT '菜单ID',
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `icon` varchar(16) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` int(5) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '子管理员是否可用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- 转存表中的数据 `eb_system_menus`
--

INSERT INTO `eb_system_menus` (`id`, `pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES
(1, 289, '', '系统设置', 'admin', '', '', '[]', 4, 1, 1),
(2, 153, '', '权限规则', 'admin', 'setting.systemMenus', 'index', '{\"cate\":\"12\"}', 7, 1, 1),
(4, 153, '', '管理员列表', 'admin', 'setting.systemAdmin', 'index', '[]', 9, 1, 1),
(6, 675, '', '基础配置', 'admin', 'setting.systemConfig', 'index', '{\"tab_id\":\"1\",\"type\":\"0\"}', 4, 1, 1),
(7, 497, '', '配置分类', 'admin', 'setting.systemConfigTab', 'index', '[]', 277, 1, 1),
(8, 153, '', '身份管理', 'admin', 'setting.systemRole', 'index', '[]', 10, 1, 1),
(9, 497, '', '组合数据', 'admin', 'setting.systemGroup', 'index', '[]', 276, 1, 1),
(11, 0, 'wechat', '公众号', 'admin', '', '', '[]', 10, 1, 1),
(12, 354, '', '微信关注回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"subscribe\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u914d\\u7f6e\\u9ed8\\u8ba4\\u56de\\u590d\"}', 86, 1, 1),
(17, 360, '', '微信菜单', 'admin', 'wechat.menus', 'index', '[]', 95, 1, 1),
(19, 11, '', '图文管理', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 60, 1, 1),
(21, 0, 'magic', '系统维护', 'admin', 'system.system', '', '[]', 1, 1, 1),
(30, 354, '', '关键字回复', 'admin', 'wechat.reply', 'keyword', '[]', 85, 1, 1),
(31, 354, '', '无效关键词回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"default\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u6548\\u5173\\u952e\\u5b57\\u9ed8\\u8ba4\\u56de\\u590d\"}', 84, 1, 1),
(37, 31, '', '附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1),
(42, 19, '', '附加权限', 'admin', 'wechat.wechatNewsCategory', '', '[]', 0, 0, 1),
(43, 42, '', '添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'create', '[]', 0, 0, 1),
(44, 42, '', '编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'edit', '[]', 0, 0, 1),
(45, 42, '', '删除图文消息', 'admin', 'wechat.wechatNewsCategory', 'delete', '[]', 0, 0, 1),
(46, 7, '', '配置分类附加权限', 'admin', 'setting.systemConfigTab', '', '[]', 0, 0, 1),
(47, 46, '', '添加配置分类', 'admin', 'setting.systemConfigTab', 'create', '[]', 0, 0, 1),
(48, 46, '', '添加配置', 'admin', 'setting.systemConfig', 'create', '[]', 0, 0, 1),
(49, 46, '', '编辑配置分类', 'admin', 'setting.systemConfigTab', 'edit', '[]', 0, 0, 1),
(50, 46, '', '删除配置分类', 'admin', 'setting.systemConfigTab', 'delete', '[]', 0, 0, 1),
(51, 46, '', '查看子字段', 'admin', 'system.systemConfigTab', 'sonConfigTab', '[]', 0, 0, 1),
(52, 9, '', '组合数据附加权限', 'admin', 'system.systemGroup', '', '[]', 0, 0, 1),
(53, 52, '', '添加数据', 'admin', 'system.systemGroupData', 'create', '[]', 0, 0, 1),
(54, 52, '', '编辑数据', 'admin', 'system.systemGroupData', 'edit', '[]', 0, 0, 1),
(55, 52, '', '删除数据', 'admin', 'system.systemGroupData', 'delete', '[]', 0, 0, 1),
(56, 52, '', '数据列表', 'admin', 'system.systemGroupData', 'index', '[]', 0, 0, 1),
(57, 52, '', '添加数据组', 'admin', 'system.systemGroup', 'create', '[]', 0, 0, 1),
(58, 52, '', '删除数据组', 'admin', 'system.systemGroup', 'delete', '[]', 0, 0, 1),
(59, 4, '', '管理员列表附加权限', 'admin', 'system.systemAdmin', '', '[]', 0, 0, 1),
(60, 59, '', '添加管理员', 'admin', 'system.systemAdmin', 'create', '[]', 0, 0, 1),
(61, 59, '', '编辑管理员', 'admin', 'system.systemAdmin', 'edit', '[]', 0, 0, 1),
(62, 59, '', '删除管理员', 'admin', 'system.systemAdmin', 'delete', '[]', 0, 0, 1),
(63, 8, '', '身份管理附加权限', 'admin', 'system.systemRole', '', '[]', 0, 0, 1),
(64, 63, '', '添加身份', 'admin', 'system.systemRole', 'create', '[]', 0, 0, 1),
(65, 63, '', '修改身份', 'admin', 'system.systemRole', 'edit', '[]', 0, 0, 1),
(66, 63, '', '删除身份', 'admin', 'system.systemRole', 'delete', '[]', 0, 0, 1),
(67, 8, '', '身份管理展示页', 'admin', 'system.systemRole', 'index', '[]', 0, 0, 1),
(68, 4, '', '管理员列表展示页', 'admin', 'system.systemAdmin', 'index', '[]', 0, 0, 1),
(69, 7, '', '配置分类展示页', 'admin', 'setting.systemConfigTab', 'index', '[]', 0, 0, 1),
(70, 9, '', '组合数据展示页', 'admin', 'system.systemGroup', 'index', '[]', 0, 0, 1),
(73, 19, '', '图文消息展示页', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 0, 0, 1),
(74, 2, '', '菜单管理附加权限', 'admin', 'system.systemMenus', '', '[]', 0, 0, 1),
(75, 74, '', '添加菜单', 'admin', 'system.systemMenus', 'create', '[]', 0, 0, 1),
(76, 74, '', '编辑菜单', 'admin', 'system.systemMenus', 'edit', '[]', 0, 0, 1),
(77, 74, '', '删除菜单', 'admin', 'system.systemMenus', 'delete', '[]', 0, 0, 1),
(78, 2, '', '菜单管理展示页', 'admin', 'system.systemMenus', 'index', '[]', 0, 0, 1),
(89, 30, '', '关键字回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1),
(90, 89, '', '添加关键字', 'admin', 'wechat.reply', 'add_keyword', '[]', 0, 0, 1),
(91, 89, '', '修改关键字', 'admin', 'wechat.reply', 'info_keyword', '[]', 0, 0, 1),
(92, 89, '', '删除关键字', 'admin', 'wechat.reply', 'delete', '[]', 0, 0, 1),
(93, 30, '', '关键字回复展示页', 'admin', 'wechat.reply', 'keyword', '[]', 0, 0, 1),
(94, 31, '', '无效关键词回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1),
(95, 31, '', '无效关键词回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1),
(96, 95, '', '无效关键词回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"default\",\"title\":\"编辑无效关键字默认回复\"}', 0, 0, 1),
(97, 12, '', '微信关注回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1),
(98, 12, '', '微信关注回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1),
(99, 98, '', '微信关注回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"subscribe\",\"title\":\"编辑无配置默认回复\"}', 0, 0, 1),
(100, 74, '', '添加提交菜单', 'admin', 'system.systemMenus', 'save', '[]', 0, 0, 1),
(101, 74, '', '编辑提交菜单', 'admin', 'system.systemMenus', 'update', '[]', 0, 1, 1),
(102, 59, '', '提交添加管理员', 'admin', 'system.systemAdmin', 'save', '[]', 0, 0, 1),
(103, 59, '', '提交修改管理员', 'admin', 'system.systemAdmin', 'update', '[]', 0, 0, 1),
(104, 63, '', '提交添加身份', 'admin', 'system.systemRole', 'save', '[]', 0, 0, 1),
(105, 63, '', '提交修改身份', 'admin', 'system.systemRole', 'update', '[]', 0, 0, 1),
(106, 46, '', '提交添加配置分类', 'admin', 'setting.systemConfigTab', 'save', '[]', 0, 0, 1),
(107, 46, '', '提交修改配置分类', 'admin', 'setting.systemConfigTab', 'update', '[]', 0, 0, 1),
(108, 46, '', '提交添加配置列表', 'admin', 'setting.systemConfig', 'save', '[]', 0, 0, 1),
(109, 52, '', '提交添加数据组', 'admin', 'system.systemGroup', 'save', '[]', 0, 0, 1),
(110, 52, '', '提交修改数据组', 'admin', 'system.systemGroup', 'update', '[]', 0, 0, 1),
(111, 52, '', '提交添加数据', 'admin', 'system.systemGroupData', 'save', '[]', 0, 0, 1),
(112, 52, '', '提交修改数据', 'admin', 'system.systemGroupData', 'update', '[]', 0, 0, 1),
(115, 42, '', '提交添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'save', '[]', 0, 0, 1),
(116, 42, '', '提交编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'update', '[]', 0, 0, 1),
(117, 6, '', '配置列表附加权限', 'admin', 'setting.systemConfig', '', '[]', 0, 0, 1),
(118, 6, '', '配置列表展示页', 'admin', 'setting.systemConfig', 'index', '[]', 0, 0, 1),
(119, 117, '', '提交保存配置列表', 'admin', 'setting.systemConfig', 'save_basics', '[]', 0, 0, 1),
(123, 89, '', '提交添加关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"1\"}', 0, 0, 1),
(124, 89, '', '提交修改关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"2\"}', 0, 0, 1),
(126, 17, '', '微信菜单展示页', 'admin', 'wechat.menus', 'index', '[]', 0, 0, 1),
(127, 17, '', '微信菜单附加权限', 'admin', 'wechat.menus', '', '[]', 0, 0, 1),
(128, 127, '', '提交微信菜单按钮', 'admin', 'wechat.menus', 'save', '{\"dis\":\"1\"}', 0, 0, 1),
(130, 498, '', '系统日志', 'admin', 'system.systemLog', 'index', '[]', 274, 1, 1),
(131, 130, '', '管理员操作记录展示页', 'admin', 'system.systemLog', 'index', '[]', 0, 0, 1),
(137, 135, '', '添加通知模板', 'admin', 'system.systemNotice', 'create', '[]', 0, 0, 1),
(138, 135, '', '编辑通知模板', 'admin', 'system.systemNotice', 'edit', '[]', 0, 0, 1),
(139, 135, '', '删除辑通知模板', 'admin', 'system.systemNotice', 'delete', '[]', 0, 0, 1),
(140, 135, '', '提交编辑辑通知模板', 'admin', 'system.systemNotice', 'update', '[]', 0, 0, 1),
(141, 135, '', '提交添加辑通知模板', 'admin', 'system.systemNotice', 'save', '[]', 0, 0, 1),
(144, 117, '', '获取配置列表上传文件的名称', 'admin', 'setting.systemConfig', 'getimagename', '[]', 0, 0, 1),
(145, 117, '', '配置列表上传文件', 'admin', 'setting.systemConfig', 'view_upload', '[]', 0, 0, 1),
(151, 0, 'user', '用户管理', 'admin', 'user.userList', 'list', '[]', 15, 1, 1),
(153, 289, '', '权限管理', 'admin', 'setting.systemAdmin', '', '[]', 3, 1, 1),
(155, 154, '', '商户产品展示页', 'admin', 'store.storeMerchant', 'index', '[]', 0, 0, 1),
(156, 154, '', '商户产品附加权限', 'admin', 'store.storeMerchant', '', '[]', 0, 0, 1),
(158, 157, '', '商户文章管理展示页', 'admin', 'wechat.wechatNews', 'merchantIndex', '[]', 0, 0, 1),
(159, 157, '', '商户文章管理附加权限', 'admin', 'wechat.wechatNews', '', '[]', 0, 0, 1),
(173, 498, '', '文件校验', 'admin', 'system.system_file', 'index', '[]', 273, 1, 1),
(174, 360, '', '模板消息', 'admin', 'wechat.wechatTemplate', 'index', '[]', 1, 1, 1),
(175, 675, '', '客服管理', 'admin', 'wechat.storeService', 'index', '[]', 1, 1, 1),
(177, 151, '', '用户管理', 'admin', 'user.user', 'index', '[]', 2, 1, 1),
(179, 307, '', '充值记录', 'admin', 'finance.userRecharge', 'index', '[]', 1, 1, 1),
(209, 175, '', '客服管理展示页', 'admin', 'store.storeService', 'index', '[]', 0, 0, 1),
(210, 175, '', '客服管理附加权限', 'admin', 'store.storeService', '', '[]', 0, 0, 1),
(211, 210, '', '客服管理添加', 'admin', 'store.storeService', 'create', '[]', 0, 0, 1),
(212, 210, '', '客服管理添加提交', 'admin', 'store.storeService', 'save', '[]', 0, 0, 1),
(213, 210, '', '客服管理编辑', 'admin', 'store.storeService', 'edit', '[]', 0, 0, 1),
(214, 210, '', '客服管理编辑提交', 'admin', 'store.storeService', 'update', '[]', 0, 0, 1),
(215, 210, '', '客服管理删除', 'admin', 'store.storeService', 'delete', '[]', 0, 0, 1),
(216, 179, '', '用户充值记录展示页', 'admin', 'user.userRecharge', 'index', '[]', 0, 0, 1),
(217, 179, '', '用户充值记录附加权限', 'admin', 'user.userRecharge', '', '[]', 0, 0, 1),
(218, 217, '', '用户充值记录退款', 'admin', 'user.userRecharge', 'edit', '[]', 0, 0, 1),
(219, 217, '', '用户充值记录退款提交', 'admin', 'user.userRecharge', 'updaterefundy', '[]', 0, 0, 1),
(220, 180, '', '预售卡管理批量修改预售卡金额', 'admin', 'presell.presellCard', 'batch_price', '[]', 0, 0, 1),
(221, 180, '', '预售卡管理批量修改预售卡金额提交', 'admin', 'presell.presellCard', 'savebatch', '[]', 0, 0, 1),
(222, 210, '', '客服管理聊天记录查询', 'admin', 'store.storeService', 'chat_user', '[]', 0, 0, 1),
(223, 210, '', '客服管理聊天记录查询详情', 'admin', 'store.storeService', 'chat_list', '[]', 0, 0, 1),
(237, 21, '', '刷新缓存', 'admin', 'system.clear', 'index', '[]', 0, 1, 1),
(239, 306, '', '提现申请', 'admin', 'finance.userExtract', 'index', '[]', 0, 1, 1),
(244, 294, '', '财务报表', 'admin', 'record.storeStatistics', 'index', '[]', 0, 1, 1),
(246, 295, '', '用户统计', 'admin', 'user.user', 'user_analysis', '[]', 0, 1, 1),
(247, 153, '', '个人资料', 'admin', 'setting.systemAdmin', 'admininfo', '[]', 0, 0, 1),
(248, 247, '', '个人资料附加权限', 'admin', 'system.systemAdmin', '', '[]', 0, 0, 1),
(249, 248, '', '个人资料提交保存', 'admin', 'system.systemAdmin', 'setAdminInfo', '[]', 0, 0, 1),
(250, 247, '', '个人资料展示页', 'admin', 'system.systemAdmin', 'admininfo', '[]', 0, 0, 1),
(251, 293, '', '订单统计', 'admin', 'order.storeOrder', 'orderchart', '[]', 0, 1, 1),
(276, 21, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 0, 1),
(278, 498, '', '清除数据', 'admin', 'system.systemCleardata', 'index', '[]', 271, 0, 1),
(286, 0, 'paper-plane', '营销中心', 'admin', '', '', '[]', 14, 1, 1),
(287, 0, 'money', '财务管理', 'admin', '', '', '[]', 11, 1, 1),
(289, 0, 'gear', '系统设置', 'admin', '', '', '[]', 2, 1, 1),
(306, 287, '', '财务操作', 'admin', '', '', '[]', 100, 1, 1),
(307, 287, '', '财务记录', 'admin', '', '', '[]', 50, 1, 1),
(308, 287, '', '佣金记录', 'admin', '', '', '[]', 1, 1, 1),
(312, 307, '', '资金监控', 'admin', 'finance.finance', 'bill', '{\"category\":\"now_money\"}', 0, 1, 1),
(313, 308, '', '佣金记录', 'admin', 'finance.finance', 'commission_list', '[]', 0, 1, 1),
(337, 286, '', '分销管理', 'admin', '', '', '[]', 4, 1, 1),
(353, 337, '', '分销配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"2\",\"tab_id\":\"9\"}', 282, 1, 1),
(354, 11, '', '自动回复', '', '', '', '[]', 80, 1, 1),
(357, 507, '', '首页轮播图', 'admin', 'setting.systemGroupData', 'index', '{\"gid\":\"34\"}', 463, 1, 1),
(360, 11, '', '公众号配置', '', '', '', '[]', 100, 1, 1),
(362, 276, '', '附加权限', '', '', '', '[]', 0, 1, 1),
(363, 362, '', '上传图片', 'admin', 'widget.images', 'upload', '[]', 0, 1, 1),
(364, 362, '', '删除图片', 'admin', 'widget.images', 'delete', '[]', 0, 1, 1),
(365, 362, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 1, 1),
(374, 295, '', '分销会员业务', 'admin', 'record.record', 'userDistributionChart', '[]', 0, 1, 1),
(377, 498, '', '数据库维护', 'admin', 'system.systemDatabackup', 'index', '[]', 272, 1, 1),
(399, 0, 'th-list', '订单中心', 'admin', '', '', '[]', 16, 1, 1),
(400, 399, '', '课程订单', 'admin', 'order.storeOrder', 'index', '[]', 3, 1, 1),
(409, 507, '', '首页推荐', 'admin', 'setting.systemGroupData', 'recommend', '[]', 261, 1, 1),
(417, 0, 'picture-o', '新闻资讯', 'admin', '', '', '[]', 13, 1, 1),
(418, 417, '', '新闻列表', 'admin', 'article.articleV1', 'index', '[]', 289, 1, 1),
(419, 417, '', '搜索关键词', 'admin', 'article.search', 'index', '[]', 0, 0, 1),
(420, 502, '', '关键词搜索', 'admin', 'article.search', 'index', '[]', 258, 1, 1),
(421, 337, '', '分销列表', 'admin', 'user.userSpread', 'index', '[]', 287, 1, 1),
(429, 482, '', '课程分类', 'admin', 'special.subject', 'index', '[]', 299, 1, 1),
(431, 507, '', '导航配置', 'admin', 'setting.systemGroupData', 'navigation', '[]', 264, 1, 1),
(432, 507, '', '首页活动', 'admin', 'setting.systemGroupData', 'index_v1', '{\"gid\":\"56\"}', 262, 1, 1),
(433, 674, '', '提现银行配置', 'admin', 'setting.systemGroupData', 'index', '{\"gid\":\"52\"}', 2, 1, 1),
(434, 502, '', '关于我们', 'admin', 'setting.systemConfigContent', 'index', '{\"id\":\"1\"}', 259, 1, 1),
(435, 502, '', '用户付费协议', 'admin', 'setting.systemConfigContent', 'index', '{\"id\":\"2\"}', 259, 1, 1),
(454, 429, '', '删除分类', 'admin', 'special.subject', 'delete', '[]', 0, 0, 1),
(455, 429, '', '保存分类', 'admin', 'special.subject', 'save', '[]', 0, 0, 1),
(456, 429, '', '快速编辑分类', 'admin', 'special.subject', 'set_value', '[]', 0, 0, 1),
(457, 429, '', '创建分类', 'admin', 'special.subject', 'create', '[]', 0, 0, 1),
(461, 400, '', '订单展示页面', 'admin', 'order.storeOrder', 'order_list', '[]', 0, 0, 1),
(462, 400, '', '修改订单金额', 'admin', 'order.storeOrder', 'edit', '[]', 0, 0, 1),
(463, 400, '', '保存订单金额', 'admin', 'order.storeOrder', 'update', '[]', 0, 0, 1),
(464, 400, '', '送货', 'admin', 'order.storeOrder', 'delivery', '[]', 0, 0, 1),
(465, 400, '', '发货', 'admin', 'order.storeOrder', 'deliver_goods', '[]', 0, 0, 1),
(466, 400, '', '发货保存', 'admin', 'order.storeOrder', 'updateDeliveryGoods', '[]', 0, 0, 1),
(467, 400, '', '确认收货', 'admin', 'order.storeOrder', 'take_delivery', '[]', 0, 0, 1),
(468, 400, '', '退款页面', 'admin', 'order.storeOrder', 'refund_y', '[]', 0, 0, 1),
(469, 400, '', '退款处理', 'admin', 'order.storeOrder', 'updateRefundY', '[]', 0, 0, 1),
(470, 400, '', '订单详情', 'admin', 'order.storeOrder', 'order_info', '[]', 0, 0, 1),
(471, 400, '', '物流查询', 'admin', 'order.storeOrder', 'express', '[]', 0, 0, 1),
(472, 400, '', '修改配送信息', 'admin', 'order.storeOrder', 'distribution', '[]', 0, 0, 1),
(473, 400, '', '保存配送信息', 'admin', 'order.storeOrder', 'updateDistribution', '[]', 0, 0, 1),
(474, 400, '', '不退款保存页面', 'admin', 'order.storeOrder', 'refund_n', '[]', 0, 0, 1),
(475, 400, '', '保存不退款信息', 'admin', 'order.storeOrder', 'updateRefundN', '[]', 0, 0, 1),
(476, 400, '', '立即支付', 'admin', 'order.storeOrder', 'offline', '[]', 0, 0, 1),
(482, 0, 'book', '课程管理', 'admin', '', '', '[]', 20, 1, 1),
(485, 482, '', '专题管理', 'admin', 'special.specialType', 'index', '{\"special_type\":\"3\"}', 2, 1, 1),
(487, 513, '', '直播列表', 'admin', 'live.aliyunLive', 'special_live', '{\"special_type\":\"4\"}', 292, 1, 1),
(488, 485, '', '专栏专题', 'admin', 'special.specialType', 'index', '{\"special_type\":\"5\"}', 1, 1, 1),
(496, 674, '', '提现银行规则', 'admin', 'setting.systemGroupData', 'index', '{\"gid\":\"53\"}', 1, 1, 1),
(497, 21, '', '开发配置', 'admin', '', '', '[]', 278, 1, 1),
(498, 21, '', '安全维护', 'admin', '', '', '[]', 275, 1, 1),
(499, 1, '', '公众号配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"2\"}', 269, 1, 1),
(500, 1, '', '支付配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"4\",\"tab_id\":\"4\"}', 266, 1, 1),
(501, 1, '', '阿里云配置', 'admin', 'setting.systemConfig', 'index', '{\"tab_id\":\"17\",\"type\":\"5\"}', 265, 1, 1),
(502, 675, '', '其他设置', 'admin', '', '', '[]', 2, 1, 1),
(507, 675, '', '首页配置', 'admin', '', '', '[]', 3, 1, 1),
(508, 502, '', '其他配置', 'admin', 'setting.systemConfig', 'index', '{\"tab_id\":\"22\",\"type\":\"6\"}', 260, 0, 1),
(512, 287, '', '充值配置', 'admin', 'setting.systemConfig', 'index', '{\"tab_id\":\"23\",\"type\":\"7\"}', 0, 1, 1),
(513, 0, 'video-camera', '直播管理', 'admin', '', '', '[]', 18, 1, 1),
(515, 513, '', '直播间管理', 'admin', 'live.aliyunLive', 'index', '{\"special_type\":\"4\",\"type\":\"2\"}', 290, 1, 1),
(517, 513, '', '直播贡献', 'admin', 'live.aliyunLive', 'live_reward', '[]', 288, 1, 1),
(518, 307, '', '虚拟币监控', 'admin', 'finance.finance', 'bill', '{\"category\":\"gold_num\"}', 0, 1, 1),
(520, 485, '', '视频专题', 'admin', 'special.SpecialType', 'index', '{\"special_type\":\"3\"}', 2, 1, 1),
(522, 485, '', '音频专题', 'admin', 'special.SpecialType', 'index', '{\"special_type\":\"2\"}', 3, 1, 1),
(524, 485, '', '图文专题', 'admin', 'special.SpecialType', 'index', '{\"special_type\":\"1\"}', 4, 1, 1),
(526, 417, '', '新闻分类', 'admin', 'article.articleCategory', 'index', '[]', 0, 1, 1),
(527, 286, '', '签到管理', 'admin', '', '', '[]', 2, 1, 1),
(528, 527, '', '签到海报', 'admin', 'user.signPoster', 'index', '[]', 2, 1, 1),
(529, 527, '', '签到记录', 'admin', 'user.userSign', 'index', '[]', 1, 1, 1),
(536, 513, '', '礼物设置', 'admin', 'live.aliyunLive', 'live_gift', '[]', 0, 1, 1),
(537, 289, '', '阿里云管理', 'admin', '', '', '[]', 1, 1, 1),
(538, 537, '', '对象存储', 'admin', 'setting.systemBucket', 'index', '[]', 0, 1, 1),
(539, 537, '', '直播配置', 'admin', 'setting.systemBroadcast', 'index', '[]', 0, 1, 1),
(540, 289, '', '短信设置', 'admin', '', '', '[]', 2, 1, 1),
(541, 540, '', '短信账户', 'admin', 'setting.systemPlat', 'index', '[]', 0, 1, 1),
(542, 540, '', '短信服务', 'admin', 'setting.systemPlat', 'meal', '[]', 0, 1, 1),
(543, 540, '', '短信模版', 'admin', 'setting.systemPlat', 'sms_temp', '[]', 0, 1, 1),
(550, 520, '', '删除专题', 'admin', 'special.SpecialType', 'delete', '[]', 0, 0, 1),
(551, 520, '', '保存拼团设置', 'admin', 'special.SpecialType', 'save_pink', '[]', 0, 0, 1),
(552, 520, '', '保存专题', 'admin', 'special.SpecialType', 'save_special', '[]', 0, 0, 1),
(553, 520, '', '创建编辑专题', 'admin', 'special.SpecialType', 'add', '[]', 0, 0, 1),
(554, 522, '', '删除专题', 'admin', 'special.SpecialType', 'delete', '[]', 0, 0, 1),
(555, 522, '', '保存拼团设置	', 'admin', 'special.SpecialType', 'save_pink', '[]', 0, 0, 1),
(556, 522, '', '保存专题', 'admin', 'special.SpecialType', 'save_special', '[]', 0, 0, 1),
(557, 522, '', '创建编辑专题', 'admin', 'special.SpecialType', 'add', '[]', 0, 0, 1),
(571, 487, '', '直播回放', 'admin', 'live.aliyunLive', 'download_list', '[]', 0, 0, 1),
(573, 487, '', '直播间转让', 'admin', 'live.aliyunLive', 'move_live_admin', '[]', 0, 0, 1),
(574, 487, '', '去直播', 'admin', 'live.aliyunLive', 'go_live', '[]', 0, 0, 1),
(575, 487, '', '删除直播专题', 'admin', 'live.aliyunLive', 'delete', '[]', 0, 0, 1),
(576, 487, '', '创建编辑专题', 'admin', 'special.SpecialType', 'add', '[]', 0, 0, 1),
(577, 515, '', '评论查看', 'admin', 'live.aliyunLive', 'comment_list', '[]', 0, 0, 1),
(578, 515, '', '嘉宾设置', 'admin', 'live.aliyunLive', 'guest_list', '[]', 0, 0, 1),
(579, 515, '', '直播提醒', 'admin', 'live.aliyunLive', 'send_remind', '[]', 0, 0, 1),
(580, 515, '', '直播间商品', 'admin', 'live.aliyunLive', 'live_store', '[]', 0, 0, 1),
(581, 515, '', '直播间课程', 'admin', 'live.aliyunLive', 'live_goods', '[]', 0, 0, 1),
(582, 515, '', '直播间禁止进入', 'admin', 'live.aliyunLive', 'live_no_entry', '[]', 0, 0, 1),
(583, 515, '', '直播间禁言', 'admin', 'live.aliyunLive', 'live_no_speaking', '[]', 0, 0, 1),
(584, 515, '', '直播间编辑保存', 'admin', 'live.aliyunLive', 'save_live', '[]', 0, 0, 1),
(585, 515, '', '编辑直播间', 'admin', 'live.aliyunLive', 'update_live', '[]', 0, 0, 1),
(586, 536, '', '礼物创建', 'admin', 'live.aliyunLive', 'create', '[]', 0, 0, 1),
(587, 536, '', '礼物提交保存', 'admin', 'live.aliyunLive', 'save', '[]', 0, 0, 1),
(588, 524, '', '创建编辑专题', 'admin', 'special.SpecialType', 'add', '[]', 0, 0, 1),
(589, 524, '', '保存专题', 'admin', 'special.SpecialType', 'save_special', '[]', 0, 0, 1),
(590, 524, '', '保存拼团设置', 'admin', 'special.SpecialType', 'save_pink', '[]', 0, 0, 1),
(591, 524, '', '删除专题', 'admin', 'special.SpecialType', 'delete', '[]', 0, 0, 1),
(596, 488, '', '创建编辑专题', 'admin', 'special.SpecialType', 'add', '[]', 0, 0, 1),
(597, 488, '', '保存专题', 'admin', 'special.SpecialType', 'save_special', '[]', 0, 0, 1),
(599, 488, '', '删除专题', 'admin', 'special.SpecialType', 'delete', '[]', 0, 0, 1),
(600, 423, '', '弹幕页面展示', 'admin', 'special.SpecialType', 'special_barrage', '[]', 0, 0, 1),
(601, 423, '', '删除弹幕', 'admin', 'special.SpecialType', 'del_barrage', '[]', 0, 0, 1),
(602, 423, '', '添加弹幕', 'admin', 'special.SpecialType', 'save_barrage', '[]', 0, 0, 1),
(603, 400, '', '添加订单备注', 'admin', 'order.storeOrder', 'remark', '[]', 0, 0, 1),
(604, 400, '', '删除订单', 'admin', 'order.storeOrder', 'delete', '[]', 0, 0, 1),
(605, 418, '', '删除新闻', 'admin', 'article.articleV1', 'delete', '[]', 0, 0, 1),
(606, 418, '', '保存新闻', 'admin', 'article.articleV1', 'save_article', '[]', 0, 0, 1),
(607, 418, '', '添加编辑新闻', 'admin', 'article.articleV1', 'add_article', '[]', 0, 0, 1),
(608, 526, '', '编辑新闻分类', 'admin', 'article.articleCategory', 'edit', '[]', 0, 0, 1),
(609, 526, '', '添加新闻分类', 'admin', 'article.articleCategory', 'create', '[]', 0, 0, 1),
(610, 526, '', '编辑新闻分类保存', 'admin', 'article.articleCategory', 'update', '[]', 0, 0, 1),
(611, 526, '', '添加新闻分类保存', 'admin', 'article.articleCategory', 'save', '[]', 0, 0, 1),
(612, 177, '', '用户信息编辑', 'admin', 'user.user', 'edit', '[]', 0, 0, 1),
(613, 177, '', '用户页面展示', 'admin', 'user.user', 'index', '[]', 0, 0, 1),
(615, 177, '', '赠送专题提交', 'admin', 'user.user', 'save_give', '[]', 0, 0, 1),
(621, 379, '', '拼团页面展示', 'admin', 'ump.storeCombination', 'combina_list', '[]', 0, 0, 1),
(622, 379, '', '拼团删除', 'admin', 'ump.storeCombination', 'delete_pink', '[]', 0, 0, 1),
(623, 379, '', '拼团助力提交', 'admin', 'ump.storeCombination', 'save', '[]', 0, 0, 1),
(624, 379, '', '拼团下架', 'admin', 'ump.storeCombination', 'down_pink', '[]', 0, 0, 1),
(625, 528, '', '海报列表展示', 'admin', 'user.signPoster', 'index', '[]', 0, 0, 1),
(626, 528, '', '海报删除', 'admin', 'user.signPoster', 'delete', '[]', 0, 0, 1),
(627, 528, '', '编辑保存', 'admin', 'user.signPoster', 'update', '[]', 0, 0, 1),
(628, 528, '', '新增保存', 'admin', 'user.signPoster', 'save', '[]', 0, 0, 1),
(633, 239, '', '提现不通过', 'admin', 'finance.userExtract', 'fail', '[]', 0, 0, 1),
(634, 239, '', '提现通过', 'admin', 'finance.userExtract', 'succ', '[]', 0, 0, 1),
(635, 46, '', '修改配置', 'admin', 'setting.systemConfig', 'update_config', '[]', 0, 0, 1),
(636, 46, '', '删除配置', 'admin', 'setting.systemConfig', 'delete_cinfig', '[]', 0, 0, 1),
(637, 538, '', '添加存储空间', 'admin', 'setting.systemBucket', 'create', '[]', 0, 0, 1),
(638, 538, '', '保存存储空间', 'admin', 'setting.systemBucket', 'save', '[]', 0, 0, 1),
(639, 538, '', '删除储存空间', 'admin', 'setting.systemBucket', 'delete', '[]', 0, 0, 1),
(640, 538, '', '使用储存空间', 'admin', 'setting.systemBucket', 'userUse', '[]', 0, 0, 1),
(641, 539, '', '添加直播域名', 'admin', 'setting.systemBroadcast', 'create', '[]', 0, 0, 1),
(642, 539, '', '保存直播域名', 'admin', 'setting.systemBroadcast', 'save', '[]', 0, 0, 1),
(643, 539, '', '域名停用', 'admin', 'setting.systemBroadcast', 'offlines', '[]', 0, 0, 1),
(644, 539, '', '域名启用', 'admin', 'setting.systemBroadcast', 'onlines', '[]', 0, 0, 1),
(645, 539, '', '添加推流域名', 'admin', 'setting.systemBroadcast', 'addStreaming', '[]', 0, 0, 1),
(646, 539, '', '录制设置', 'admin', 'setting.systemBroadcast', 'toConfigure', '[]', 0, 0, 1),
(647, 539, '', '删除推流域名', 'admin', 'setting.systemBroadcast', 'delStreaming', '[]', 0, 0, 1),
(648, 539, '', '删除录制oss', 'admin', 'setting.systemBroadcast', 'delLiveAppRecordConfig', '[]', 0, 0, 1),
(649, 539, '', '使用直播域名', 'admin', 'setting.systemBroadcast', 'userLiveUse', '[]', 0, 0, 1),
(650, 526, '', '删除分类', 'admin', 'article.articleCategory', 'delete', '[]', 0, 0, 1),
(651, 430, '', '显示开关', 'admin', 'special.subject', 'set_show', '[]', 0, 0, 1),
(653, 482, '', '专题/直播显示开关', 'admin', 'special.SpecialType', 'set_value', '[]', 0, 0, 1),
(654, 532, '', '显示开关', 'admin', 'store.storeCategory', 'set_show', '[]', 0, 0, 1),
(656, 418, '', '显示开关', 'admin', 'article.articleV1', 'set_show', '[]', 0, 0, 1),
(660, 429, '', '显示开关', 'admin', 'special.grade', 'set_show', '[]', 0, 0, 1),
(661, 482, '', '素材管理', 'admin', '', '', '[]', 0, 1, 1),
(662, 661, '', '素材分类', 'admin', 'special.specialTaskCategory', 'index', '[]', 0, 1, 1),
(663, 661, '', '素材列表', 'admin', 'special.SpecialType', 'sources_index', '[]', 0, 1, 1),
(664, 663, '', '创建编辑素材', 'admin', 'special.SpecialType', 'addSources', '[]', 0, 0, 1),
(665, 663, '', '保存素材', 'admin', 'special.SpecialType', 'save_source', '[]', 0, 0, 1),
(666, 663, '', '删除素材', 'admin', 'special.SpecialType', 'delete', '[]', 0, 0, 1),
(667, 662, '', '编辑素材分类', 'admin', 'special.specialTaskCategory', 'create', '[]', 0, 0, 1),
(668, 662, '', '保存素材分类', 'admin', 'special.specialTaskCategory', 'save', '[]', 0, 0, 1),
(669, 662, '', '删除素材分类', 'admin', 'special.specialTaskCategory', 'delete', '[]', 0, 0, 1),
(672, 507, '', '底部菜单', 'admin', 'setting.systemGroupData', 'index', '{\"gid\":\"65\"}', 2, 1, 1),
(674, 337, '', '提现配置', 'admin', '', '', '[]', 1, 1, 1),
(675, 0, 'th', '系统管理', 'admin', '', '', '[]', 3, 1, 1),
(677, 507, '', '新闻简报', 'admin', 'setting.systemGroupData', 'index', '{\"gid\":\"66\"}', 5, 1, 1),
(678, 502, '', '个人中心菜单', 'admin', 'setting.systemGroupData', 'center_menu', '[]', 0, 1, 1),
(679, 360, '', '订阅消息', 'admin', 'wechat.routineTemplate', 'index', '[]', 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_notice`
--

CREATE TABLE `eb_system_notice` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '通知模板id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '通知标题',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '通知类型',
  `icon` varchar(16) NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(64) NOT NULL DEFAULT '' COMMENT '链接',
  `table_title` varchar(256) NOT NULL DEFAULT '' COMMENT '通知数据',
  `template` varchar(64) NOT NULL DEFAULT '' COMMENT '通知模板',
  `push_admin` varchar(128) NOT NULL DEFAULT '' COMMENT '通知管理员id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知模板表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_notice_admin`
--

CREATE TABLE `eb_system_notice_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '通知记录ID',
  `notice_type` varchar(64) NOT NULL DEFAULT '' COMMENT '通知类型',
  `admin_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '通知的管理员',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联ID',
  `table_data` text COMMENT '通知的数据',
  `is_click` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_visit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '访问次数',
  `visit_time` int(11) NOT NULL DEFAULT '0' COMMENT '访问时间',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '通知时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知记录表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `eb_system_role`
--

CREATE TABLE `eb_system_role` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '身份管理id',
  `role_name` varchar(32) NOT NULL DEFAULT '' COMMENT '身份管理名称',
  `sign` varchar(50) NOT NULL DEFAULT '' COMMENT '身份标识',
  `rules` text COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='身份管理表';

--
-- 转存表中的数据 `eb_system_role`
--

INSERT INTO `eb_system_role` (`id`, `role_name`, `sign`, `rules`, `level`, `status`) VALUES
(1, '超级管理员', 'admin', '37,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,73,74,75,76,77,78,89,90,91,92,93,94,95,96,97,98,99,100,102,103,104,105,106,107,108,109,110,111,112,115,116,117,118,119,123,124,126,127,128,131,137,138,139,140,141,144,145,148,155,156,158,159,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,229,230,231,232,233,234,245,247,248,249,250,269,273,276,288,349,378,419,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,1,2,4,6,7,8,9,11,12,17,19,21,30,31,101,130,149,150,151,153,173,174,175,177,179,235,237,239,241,244,246,251,252,267,270,278,286,287,289,293,306,307,308,312,313,337,350,351,352,353,354,355,357,360,361,362,363,364,365,372,373,374,375,376,377,379,380,391,392,399,400,409,411,412,415,417,418,420,421,423,428,429,430,431,432,433,434,435,479,480,481', 0, 1),
(2, '主播', 'anchor', '', 1, 1),
(3, '核销员', 'verification', '518,286', 1, 1),
(4, '演示账号', 'demo_account', '457,456,588,557,553,596,664,667,576,574,585,577,517,586,461,613,421,625,529,607,608,216,518,312,308,313,73,44,118,69,365,237,429,524,522,520,488,663,662,487,515,513,536,400,177,337,528,527,418,526,179,307,287,19,42,6,7,362,21,482,485,661,0,399,151,286,417,11,675,497,276', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_user`
--

CREATE TABLE `eb_user` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `account` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户账号',
  `pwd` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` varchar(16) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(256) NOT NULL DEFAULT '' COMMENT '用户头像',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `phone` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号码',
  `grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '年级id',
  `full_name` varchar(35) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '真实姓名',
  `bank_card` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '银行卡号码',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '添加ip',
  `last_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `gold_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '虚拟币余额',
  `brokerage_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '可提现金额',
  `integral` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '用户剩余积分',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁止',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `spread_uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '推广元id',
  `spread_time` int(11) NOT NULL DEFAULT '0',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '客户关系解除时间',
  `user_type` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户类型',
  `is_promoter` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(11) UNSIGNED DEFAULT '0' COMMENT '用户购买次数',
  `is_binding` int(11) NOT NULL DEFAULT '0',
  `is_senior` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为高级推广人',
  `is_h5user` tinyint(1) DEFAULT '0' COMMENT '是否为H5虚拟用户',
  `is_permanent` tinyint(2) DEFAULT '0' COMMENT '会员是否永久',
  `member_time` int(11) UNSIGNED DEFAULT '0' COMMENT '成为会员时间',
  `overdue_time` int(11) UNSIGNED DEFAULT '0' COMMENT '会员过期时间',
  `client_id` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT 'client_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_address`
--

CREATE TABLE `eb_user_address` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户地址id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `district` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '邮编',
  `longitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_bill`
--

CREATE TABLE `eb_user_bill` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户账单id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户uid',
  `get_uid` int(11) NOT NULL DEFAULT '0' COMMENT '由谁获得',
  `link_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '明细数字',
  `balance` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '剩余',
  `mark` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = 带确定 1 = 有效 -1 = 无效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账单表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_enter`
--

CREATE TABLE `eb_user_enter` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '商户申请ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在省',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在市',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在区',
  `address` varchar(256) NOT NULL DEFAULT '' COMMENT '商户详细地址',
  `merchant_name` varchar(256) NOT NULL DEFAULT '' COMMENT '商户名称',
  `link_user` varchar(32) NOT NULL DEFAULT '',
  `link_tel` varchar(16) NOT NULL DEFAULT '' COMMENT '商户电话',
  `charter` varchar(512) NOT NULL DEFAULT '' COMMENT '商户证书',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `apply_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '审核时间',
  `success_time` int(11) NOT NULL DEFAULT '0' COMMENT '通过时间',
  `fail_message` varchar(256) NOT NULL DEFAULT '' COMMENT '未通过原因',
  `fail_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户申请表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_extract`
--

CREATE TABLE `eb_user_extract` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED DEFAULT NULL,
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `real_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `partner_trade_no` varchar(32) NOT NULL DEFAULT '' COMMENT '商户订单号',
  `extract_type` varchar(32) DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8,2) UNSIGNED DEFAULT '0.00' COMMENT '提现金额',
  `mark` varchar(512) DEFAULT NULL,
  `balance` decimal(8,2) UNSIGNED DEFAULT '0.00',
  `fail_msg` varchar(128) DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) UNSIGNED DEFAULT NULL,
  `add_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) DEFAULT '0' COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) DEFAULT NULL COMMENT '微信号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户提现表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_group`
--

CREATE TABLE `eb_user_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `group_name` varchar(64) DEFAULT NULL COMMENT '用户分组名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分组表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_notice`
--

CREATE TABLE `eb_user_notice` (
  `id` int(11) NOT NULL,
  `uid` text COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '通知消息的标题信息',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通知表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_notice_see`
--

CREATE TABLE `eb_user_notice_see` (
  `id` int(11) NOT NULL,
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT '查看的通知id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '查看通知的时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通知发送记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_recharge`
--

CREATE TABLE `eb_user_recharge` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) DEFAULT NULL COMMENT '充值用户UID',
  `vip_id` int(11) NOT NULL DEFAULT '0' COMMENT '0为充值金额,',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `price` decimal(8,2) DEFAULT NULL COMMENT '充值金额',
  `gold_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '虚拟币余额',
  `recharge_type` varchar(32) DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '退款金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_user_sign`
--

CREATE TABLE `eb_user_sign` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '获得金币',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余金币',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_media`
--

CREATE TABLE `eb_wechat_media` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '微信视频音频id',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信回复表';

--
-- 转存表中的数据 `eb_wechat_media`
--

INSERT INTO `eb_wechat_media` (`id`, `type`, `path`, `media_id`, `url`, `temporary`, `add_time`) VALUES
(12, 'image', '/public/uploads/wechat/image/5b042ca618139.jpg', '6sFx6PzPF2v_Lv4FGOMzzwcwmM2wuoA63ZMSxiN-7DY', 'http://mmbiz.qpic.cn/mmbiz_jpg/xVkDhuiaGm78WOdUXuPE1oYLnU4J0LCEiaSuLhwwSrfdyINspibXsllaj8rOMSs5estAv0qhGuGniaqhb6HftecPuw/0?wx_fmt=jpeg', 0, 1527000231);

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_message`
--

CREATE TABLE `eb_wechat_message` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户行为记录id',
  `openid` varchar(32) NOT NULL DEFAULT '' COMMENT '用户openid',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '操作类型',
  `result` varchar(512) NOT NULL DEFAULT '' COMMENT '操作详细记录',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户行为记录表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_news_category`
--

CREATE TABLE `eb_wechat_news_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '图文消息管理ID',
  `cate_name` varchar(255) NOT NULL DEFAULT '' COMMENT '图文名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态',
  `new_id` varchar(255) NOT NULL DEFAULT '' COMMENT '文章id',
  `add_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文消息管理表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_qrcode`
--

CREATE TABLE `eb_wechat_qrcode` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '微信二维码ID',
  `third_type` varchar(32) NOT NULL DEFAULT '' COMMENT '二维码类型',
  `third_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `scan_id` int(10) NOT NULL DEFAULT '0' COMMENT '扫描用户uid',
  `ticket` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码参数',
  `expire_seconds` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '二维码有效时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '微信访问url',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '微信二维码url',
  `scan` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被扫的次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信二维码管理表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_reply`
--

CREATE TABLE `eb_wechat_reply` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '微信关键字回复id',
  `key` varchar(64) NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text COMMENT '回复数据',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信关键字回复表';

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_template`
--

CREATE TABLE `eb_wechat_template` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '模板id',
  `tempkey` char(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信模板';

--
-- 转存表中的数据 `eb_wechat_template`
--

INSERT INTO `eb_wechat_template` (`id`, `tempkey`, `name`, `content`, `tempid`, `add_time`, `status`) VALUES
(1, 'OPENTM200565259', '订单发货提醒', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'RRsyuuWpCo81xCtfG-5qYnXXoeSQHY4mTVav0zzaZsM', '1515052638', 1),
(2, 'OPENTM413386489', '订单收货通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单状态：{{keyword2.DATA}}\n收货时间：{{keyword3.DATA}}\n商品详情：{{keyword4.DATA}}\n{{remark.DATA}}', 'caAhoWioDb2A8Ew1bTr4GTe6mdsDoM4kjp9XV5BC8hg', '1515052765', 1),
(3, 'OPENTM410119152', '退款进度通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单金额：{{keyword2.DATA}}\n下单时间：{{keyword3.DATA}}\n{{remark.DATA}}', '-WH6gUzezKnX9OTam9VrQEVyNWfr1bUhT6FRuBMotZw', '1515053049', 1),
(4, 'OPENTM415437052', '账户资金变动提醒', '{{first.DATA}}\n交易类型：{{keyword1.DATA}}\n交易金额：{{keyword2.DATA}}\n交易时间：{{keyword3.DATA}}\n账户余额：{{keyword4.DATA}}\n{{remark.DATA}}', 'qYMdIRYj3EoNYjFljxxgcEnzWP5TCN8yRb553HeX-yE', '1515053127', 1),
(5, 'OPENTM407456411', '拼团成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n团购商品：{{keyword2.DATA}}\n{{remark.DATA}}', '0vOEi8iBqKXYsqvVep9Nn-CDaqPfqG8ajDpib2eY1S0', '1520063823', 1),
(6, 'OPENTM401113750', '拼团失败通知', '{{first.DATA}}\n拼团商品：{{keyword1.DATA}}\n商品金额：{{keyword2.DATA}}\n退款金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'zFFr8ENLdKvVqA7Clo5ZB0WC6eARlYClCVDck-RIoSM', '1520064059', 1),
(7, 'OPENTM205213550', '订单生成通知', '{{first.DATA}}\n时间：{{keyword1.DATA}}\n商品名称：{{keyword2.DATA}}\n订单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'pUMM82fuyNAeomd4mpzNz9_FdIxEehGTPR2l6q8GuCQ', '1528966701', 1),
(8, 'OPENTM207791277', '订单支付成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}', 'zQ0HVGaYM_zZoCiUG9E8IZiOD4X54G9e9ldUWkyuPvo', '1528966759', 1),
(9, 'OPENTM411478702', '开团成功通知', '{{first.DATA}}\n商品名称：{{keyword1.DATA}}\n商品价格：{{keyword2.DATA}}\n组团人数：{{keyword3.DATA}}\n组团时间：{{keyword4.DATA}}\n{{remark.DATA}}', 'PDLbtKYeoWFjqwmvEb49s3zaqe1ufdXGEfZ5rt1XQLk', '1552034788', 1),
(10, 'OPENTM415198906', '拼单进度提醒', '\n{{first.DATA}}\n商品名称：{{keyword1.DATA}}\n拼单进度：{{keyword2.DATA}}\n{{remark.DATA}}', 'USG9thsiUOjyT9UISNiThdBgkq2Tl29cE6J39_vWdTo', '1562752076', 1),
(11, 'OPENTM405456204', '开播提醒', '{{first.DATA}}\r\n课程名称：{{keyword1.DATA}}\r\n开始时间：{{keyword2.DATA}}\r\n{{remark.DATA}}', 'MCfo_7rP8vFGssGE78JdgXycghSwCqmeFmFnYYIbPb8', '1585197241', 1);

-- --------------------------------------------------------

--
-- 表的结构 `eb_wechat_user`
--

CREATE TABLE `eb_wechat_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '微信用户id',
  `unionid` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '用户的昵称',
  `headimgurl` varchar(256) NOT NULL DEFAULT '' COMMENT '用户头像',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `remark` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) UNSIGNED DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) UNSIGNED DEFAULT '1' COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) UNSIGNED DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) UNSIGNED DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) UNSIGNED DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) UNSIGNED DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` int(11) UNSIGNED DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) CHARACTER SET utf8 DEFAULT 'wechat' COMMENT '用户类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

--
-- 转储表的索引
--

--
-- 表的索引 `eb_article`
--
ALTER TABLE `eb_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_article_category`
--
ALTER TABLE `eb_article_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_article_content`
--
ALTER TABLE `eb_article_content`
  ADD UNIQUE KEY `nid` (`nid`) USING BTREE;

--
-- 表的索引 `eb_cache`
--
ALTER TABLE `eb_cache`
  ADD PRIMARY KEY (`key`);

--
-- 表的索引 `eb_event_registration`
--
ALTER TABLE `eb_event_registration`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_event_sign_up`
--
ALTER TABLE `eb_event_sign_up`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_express`
--
ALTER TABLE `eb_express`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`) USING BTREE,
  ADD KEY `is_show` (`is_show`) USING BTREE;

--
-- 表的索引 `eb_grade`
--
ALTER TABLE `eb_grade`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_learning_records`
--
ALTER TABLE `eb_learning_records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_lecturer`
--
ALTER TABLE `eb_lecturer`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_live_barrage`
--
ALTER TABLE `eb_live_barrage`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `live_id` (`live_id`) USING BTREE,
  ADD KEY `to_uid` (`to_uid`) USING BTREE;

--
-- 表的索引 `eb_live_gift`
--
ALTER TABLE `eb_live_gift`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_live_goods`
--
ALTER TABLE `eb_live_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_live_honoured_guest`
--
ALTER TABLE `eb_live_honoured_guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `live_id` (`live_id`);

--
-- 表的索引 `eb_live_playback`
--
ALTER TABLE `eb_live_playback`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_live_reward`
--
ALTER TABLE `eb_live_reward`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `eb_live_studio`
--
ALTER TABLE `eb_live_studio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `special_id` (`special_id`),
  ADD KEY `stream_name` (`stream_name`);

--
-- 表的索引 `eb_live_user`
--
ALTER TABLE `eb_live_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `live_id` (`live_id`);

--
-- 表的索引 `eb_member_card`
--
ALTER TABLE `eb_member_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_batch_id` (`card_batch_id`) USING BTREE;

--
-- 表的索引 `eb_member_card_batch`
--
ALTER TABLE `eb_member_card_batch`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_member_record`
--
ALTER TABLE `eb_member_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_member_ship`
--
ALTER TABLE `eb_member_ship`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_phone_user`
--
ALTER TABLE `eb_phone_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_recommend`
--
ALTER TABLE `eb_recommend`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_recommend_banner`
--
ALTER TABLE `eb_recommend_banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_recommend_relation`
--
ALTER TABLE `eb_recommend_relation`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- 表的索引 `eb_routine_access_token`
--
ALTER TABLE `eb_routine_access_token`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_routine_form_id`
--
ALTER TABLE `eb_routine_form_id`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_routine_template`
--
ALTER TABLE `eb_routine_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tempkey` (`tempkey`) USING BTREE;

--
-- 表的索引 `eb_search`
--
ALTER TABLE `eb_search`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_search_history`
--
ALTER TABLE `eb_search_history`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_sign_poster`
--
ALTER TABLE `eb_sign_poster`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_sms_code`
--
ALTER TABLE `eb_sms_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- 表的索引 `eb_special`
--
ALTER TABLE `eb_special`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_barrage`
--
ALTER TABLE `eb_special_barrage`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_buy`
--
ALTER TABLE `eb_special_buy`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_content`
--
ALTER TABLE `eb_special_content`
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `eb_special_course`
--
ALTER TABLE `eb_special_course`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_record`
--
ALTER TABLE `eb_special_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_relation`
--
ALTER TABLE `eb_special_relation`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_source`
--
ALTER TABLE `eb_special_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `special_ids` (`special_id`) USING BTREE,
  ADD KEY `source_ids` (`source_id`) USING BTREE;

--
-- 表的索引 `eb_special_subject`
--
ALTER TABLE `eb_special_subject`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_task`
--
ALTER TABLE `eb_special_task`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `eb_special_task_category`
--
ALTER TABLE `eb_special_task_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_special_watch`
--
ALTER TABLE `eb_special_watch`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_bargain`
--
ALTER TABLE `eb_store_bargain`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_bargain_user`
--
ALTER TABLE `eb_store_bargain_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_bargain_user_help`
--
ALTER TABLE `eb_store_bargain_user_help`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_cart`
--
ALTER TABLE `eb_store_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`uid`) USING BTREE,
  ADD KEY `goods_id` (`product_id`) USING BTREE,
  ADD KEY `uid` (`uid`,`is_pay`) USING BTREE,
  ADD KEY `uid_2` (`uid`,`is_del`) USING BTREE,
  ADD KEY `uid_3` (`uid`,`is_new`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- 表的索引 `eb_store_category`
--
ALTER TABLE `eb_store_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`) USING BTREE,
  ADD KEY `is_base` (`is_show`) USING BTREE,
  ADD KEY `sort` (`sort`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE;

--
-- 表的索引 `eb_store_combination`
--
ALTER TABLE `eb_store_combination`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_combination_attr`
--
ALTER TABLE `eb_store_combination_attr`
  ADD KEY `store_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_combination_attr_result`
--
ALTER TABLE `eb_store_combination_attr_result`
  ADD UNIQUE KEY `product_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_combination_attr_value`
--
ALTER TABLE `eb_store_combination_attr_value`
  ADD UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  ADD KEY `store_id` (`product_id`,`suk`) USING BTREE;

--
-- 表的索引 `eb_store_coupon`
--
ALTER TABLE `eb_store_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state` (`status`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `coupon_time` (`coupon_time`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE;

--
-- 表的索引 `eb_store_coupon_issue`
--
ALTER TABLE `eb_store_coupon_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`) USING BTREE,
  ADD KEY `start_time` (`start_time`,`end_time`) USING BTREE,
  ADD KEY `remain_count` (`remain_count`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE;

--
-- 表的索引 `eb_store_coupon_issue_user`
--
ALTER TABLE `eb_store_coupon_issue_user`
  ADD UNIQUE KEY `uid` (`uid`,`issue_coupon_id`) USING BTREE;

--
-- 表的索引 `eb_store_coupon_user`
--
ALTER TABLE `eb_store_coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `end_time` (`end_time`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `is_fail` (`is_fail`) USING BTREE;

--
-- 表的索引 `eb_store_order`
--
ALTER TABLE `eb_store_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id_2` (`order_id`,`uid`) USING BTREE,
  ADD UNIQUE KEY `unique` (`unique`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `pay_price` (`pay_price`) USING BTREE,
  ADD KEY `paid` (`paid`) USING BTREE,
  ADD KEY `pay_time` (`pay_time`) USING BTREE,
  ADD KEY `pay_type` (`pay_type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE,
  ADD KEY `coupon_id` (`coupon_id`) USING BTREE;

--
-- 表的索引 `eb_store_order_cart_info`
--
ALTER TABLE `eb_store_order_cart_info`
  ADD UNIQUE KEY `oid` (`oid`,`unique`) USING BTREE,
  ADD KEY `cart_id` (`cart_id`) USING BTREE,
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_order_status`
--
ALTER TABLE `eb_store_order_status`
  ADD KEY `oid` (`oid`) USING BTREE,
  ADD KEY `change_type` (`change_type`) USING BTREE;

--
-- 表的索引 `eb_store_pink`
--
ALTER TABLE `eb_store_pink`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_pink_false`
--
ALTER TABLE `eb_store_pink_false`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_product`
--
ALTER TABLE `eb_store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`) USING BTREE,
  ADD KEY `is_hot` (`is_hot`) USING BTREE,
  ADD KEY `is_benefit` (`is_benefit`) USING BTREE,
  ADD KEY `is_best` (`is_best`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  ADD KEY `price` (`price`) USING BTREE,
  ADD KEY `is_show` (`is_show`) USING BTREE,
  ADD KEY `sort` (`sort`) USING BTREE,
  ADD KEY `sales` (`sales`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `is_postage` (`is_postage`) USING BTREE;

--
-- 表的索引 `eb_store_product_attr`
--
ALTER TABLE `eb_store_product_attr`
  ADD KEY `store_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_product_attr_result`
--
ALTER TABLE `eb_store_product_attr_result`
  ADD UNIQUE KEY `product_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_product_attr_value`
--
ALTER TABLE `eb_store_product_attr_value`
  ADD UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  ADD KEY `store_id` (`product_id`,`suk`) USING BTREE;

--
-- 表的索引 `eb_store_product_relation`
--
ALTER TABLE `eb_store_product_relation`
  ADD UNIQUE KEY `uid` (`uid`,`product_id`,`type`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `category` (`category`) USING BTREE;

--
-- 表的索引 `eb_store_product_reply`
--
ALTER TABLE `eb_store_product_reply`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `parent_id` (`reply_type`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE,
  ADD KEY `product_score` (`product_score`) USING BTREE,
  ADD KEY `service_score` (`service_score`) USING BTREE;

--
-- 表的索引 `eb_store_seckill`
--
ALTER TABLE `eb_store_seckill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `start_time` (`start_time`,`stop_time`),
  ADD KEY `is_del` (`is_del`),
  ADD KEY `is_hot` (`is_hot`),
  ADD KEY `is_show` (`status`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `sort` (`sort`),
  ADD KEY `is_postage` (`is_postage`);

--
-- 表的索引 `eb_store_seckill_attr`
--
ALTER TABLE `eb_store_seckill_attr`
  ADD KEY `store_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_seckill_attr_result`
--
ALTER TABLE `eb_store_seckill_attr_result`
  ADD UNIQUE KEY `product_id` (`product_id`) USING BTREE;

--
-- 表的索引 `eb_store_seckill_attr_value`
--
ALTER TABLE `eb_store_seckill_attr_value`
  ADD UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  ADD KEY `store_id` (`product_id`,`suk`) USING BTREE;

--
-- 表的索引 `eb_store_service`
--
ALTER TABLE `eb_store_service`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_service_log`
--
ALTER TABLE `eb_store_service_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_store_visit`
--
ALTER TABLE `eb_store_visit`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_admin`
--
ALTER TABLE `eb_system_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- 表的索引 `eb_system_attachment`
--
ALTER TABLE `eb_system_attachment`
  ADD PRIMARY KEY (`att_id`);

--
-- 表的索引 `eb_system_attachment_category`
--
ALTER TABLE `eb_system_attachment_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `eb_system_broadcast`
--
ALTER TABLE `eb_system_broadcast`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_bucket`
--
ALTER TABLE `eb_system_bucket`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_config`
--
ALTER TABLE `eb_system_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_config_content`
--
ALTER TABLE `eb_system_config_content`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_config_tab`
--
ALTER TABLE `eb_system_config_tab`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_file`
--
ALTER TABLE `eb_system_file`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_group`
--
ALTER TABLE `eb_system_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `config_name` (`config_name`) USING BTREE;

--
-- 表的索引 `eb_system_group_data`
--
ALTER TABLE `eb_system_group_data`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_system_log`
--
ALTER TABLE `eb_system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- 表的索引 `eb_system_menus`
--
ALTER TABLE `eb_system_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`) USING BTREE,
  ADD KEY `is_show` (`is_show`) USING BTREE,
  ADD KEY `access` (`access`) USING BTREE;

--
-- 表的索引 `eb_system_notice`
--
ALTER TABLE `eb_system_notice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- 表的索引 `eb_system_notice_admin`
--
ALTER TABLE `eb_system_notice_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`,`notice_type`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `is_visit` (`is_visit`) USING BTREE,
  ADD KEY `is_click` (`is_click`) USING BTREE;

--
-- 表的索引 `eb_system_role`
--
ALTER TABLE `eb_system_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sign` (`sign`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- 表的索引 `eb_user`
--
ALTER TABLE `eb_user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `account` (`account`) USING BTREE,
  ADD KEY `spreaduid` (`spread_uid`) USING BTREE,
  ADD KEY `level` (`level`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `is_promoter` (`is_promoter`) USING BTREE;

--
-- 表的索引 `eb_user_address`
--
ALTER TABLE `eb_user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `is_default` (`is_default`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE;

--
-- 表的索引 `eb_user_bill`
--
ALTER TABLE `eb_user_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `openid` (`uid`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `pm` (`pm`) USING BTREE,
  ADD KEY `type` (`category`,`type`,`link_id`) USING BTREE;

--
-- 表的索引 `eb_user_enter`
--
ALTER TABLE `eb_user_enter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`) USING BTREE,
  ADD KEY `province` (`province`,`city`,`district`) USING BTREE,
  ADD KEY `is_lock` (`is_lock`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- 表的索引 `eb_user_extract`
--
ALTER TABLE `eb_user_extract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extract_type` (`extract_type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `openid` (`uid`) USING BTREE,
  ADD KEY `fail_time` (`fail_time`);

--
-- 表的索引 `eb_user_group`
--
ALTER TABLE `eb_user_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_user_notice`
--
ALTER TABLE `eb_user_notice`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_user_notice_see`
--
ALTER TABLE `eb_user_notice_see`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_user_recharge`
--
ALTER TABLE `eb_user_recharge`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `recharge_type` (`recharge_type`) USING BTREE,
  ADD KEY `paid` (`paid`) USING BTREE;

--
-- 表的索引 `eb_user_sign`
--
ALTER TABLE `eb_user_sign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- 表的索引 `eb_wechat_media`
--
ALTER TABLE `eb_wechat_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`media_id`) USING BTREE,
  ADD KEY `type_2` (`type`) USING BTREE;

--
-- 表的索引 `eb_wechat_message`
--
ALTER TABLE `eb_wechat_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `openid` (`openid`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE;

--
-- 表的索引 `eb_wechat_news_category`
--
ALTER TABLE `eb_wechat_news_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `eb_wechat_qrcode`
--
ALTER TABLE `eb_wechat_qrcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `third_type` (`third_type`,`third_id`) USING BTREE,
  ADD KEY `ticket` (`ticket`) USING BTREE;

--
-- 表的索引 `eb_wechat_reply`
--
ALTER TABLE `eb_wechat_reply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `hide` (`hide`) USING BTREE;

--
-- 表的索引 `eb_wechat_template`
--
ALTER TABLE `eb_wechat_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tempkey` (`tempkey`) USING BTREE;

--
-- 表的索引 `eb_wechat_user`
--
ALTER TABLE `eb_wechat_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `openid` (`openid`) USING BTREE,
  ADD KEY `groupid` (`groupid`) USING BTREE,
  ADD KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `subscribe` (`subscribe`) USING BTREE,
  ADD KEY `unionid` (`unionid`) USING BTREE,
  ADD KEY `uid` (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `eb_article`
--
ALTER TABLE `eb_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `eb_article_category`
--
ALTER TABLE `eb_article_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类id', AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `eb_event_registration`
--
ALTER TABLE `eb_event_registration`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_event_sign_up`
--
ALTER TABLE `eb_event_sign_up`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_express`
--
ALTER TABLE `eb_express`
  MODIFY `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快递公司id', AUTO_INCREMENT=426;

--
-- 使用表AUTO_INCREMENT `eb_grade`
--
ALTER TABLE `eb_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_learning_records`
--
ALTER TABLE `eb_learning_records`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_lecturer`
--
ALTER TABLE `eb_lecturer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_barrage`
--
ALTER TABLE `eb_live_barrage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_gift`
--
ALTER TABLE `eb_live_gift`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `eb_live_goods`
--
ALTER TABLE `eb_live_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_honoured_guest`
--
ALTER TABLE `eb_live_honoured_guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_playback`
--
ALTER TABLE `eb_live_playback`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_reward`
--
ALTER TABLE `eb_live_reward`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_live_studio`
--
ALTER TABLE `eb_live_studio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- 使用表AUTO_INCREMENT `eb_live_user`
--
ALTER TABLE `eb_live_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_member_card`
--
ALTER TABLE `eb_member_card`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_member_card_batch`
--
ALTER TABLE `eb_member_card_batch`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_member_record`
--
ALTER TABLE `eb_member_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_member_ship`
--
ALTER TABLE `eb_member_ship`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_phone_user`
--
ALTER TABLE `eb_phone_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_recommend`
--
ALTER TABLE `eb_recommend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- 使用表AUTO_INCREMENT `eb_recommend_banner`
--
ALTER TABLE `eb_recommend_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `eb_recommend_relation`
--
ALTER TABLE `eb_recommend_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- 使用表AUTO_INCREMENT `eb_routine_access_token`
--
ALTER TABLE `eb_routine_access_token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID';

--
-- 使用表AUTO_INCREMENT `eb_routine_form_id`
--
ALTER TABLE `eb_routine_form_id`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID';

--
-- 使用表AUTO_INCREMENT `eb_routine_template`
--
ALTER TABLE `eb_routine_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id', AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `eb_search`
--
ALTER TABLE `eb_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `eb_search_history`
--
ALTER TABLE `eb_search_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_sign_poster`
--
ALTER TABLE `eb_sign_poster`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_sms_code`
--
ALTER TABLE `eb_sms_code`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `eb_special`
--
ALTER TABLE `eb_special`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- 使用表AUTO_INCREMENT `eb_special_barrage`
--
ALTER TABLE `eb_special_barrage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `eb_special_buy`
--
ALTER TABLE `eb_special_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_special_content`
--
ALTER TABLE `eb_special_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- 使用表AUTO_INCREMENT `eb_special_course`
--
ALTER TABLE `eb_special_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_special_record`
--
ALTER TABLE `eb_special_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_special_relation`
--
ALTER TABLE `eb_special_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_special_source`
--
ALTER TABLE `eb_special_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `eb_special_subject`
--
ALTER TABLE `eb_special_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `eb_special_task`
--
ALTER TABLE `eb_special_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- 使用表AUTO_INCREMENT `eb_special_task_category`
--
ALTER TABLE `eb_special_task_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `eb_special_watch`
--
ALTER TABLE `eb_special_watch`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_store_bargain`
--
ALTER TABLE `eb_store_bargain`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID';

--
-- 使用表AUTO_INCREMENT `eb_store_bargain_user`
--
ALTER TABLE `eb_store_bargain_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_bargain_user_help`
--
ALTER TABLE `eb_store_bargain_user_help`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_cart`
--
ALTER TABLE `eb_store_cart`
  MODIFY `id` bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_category`
--
ALTER TABLE `eb_store_category`
  MODIFY `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_combination`
--
ALTER TABLE `eb_store_combination`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_store_coupon`
--
ALTER TABLE `eb_store_coupon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_coupon_issue`
--
ALTER TABLE `eb_store_coupon_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_store_coupon_user`
--
ALTER TABLE `eb_store_coupon_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id';

--
-- 使用表AUTO_INCREMENT `eb_store_order`
--
ALTER TABLE `eb_store_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID';

--
-- 使用表AUTO_INCREMENT `eb_store_pink`
--
ALTER TABLE `eb_store_pink`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_store_pink_false`
--
ALTER TABLE `eb_store_pink_false`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_store_product`
--
ALTER TABLE `eb_store_product`
  MODIFY `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id';

--
-- 使用表AUTO_INCREMENT `eb_store_product_reply`
--
ALTER TABLE `eb_store_product_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID';

--
-- 使用表AUTO_INCREMENT `eb_store_seckill`
--
ALTER TABLE `eb_store_seckill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id';

--
-- 使用表AUTO_INCREMENT `eb_store_service`
--
ALTER TABLE `eb_store_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id';

--
-- 使用表AUTO_INCREMENT `eb_store_service_log`
--
ALTER TABLE `eb_store_service_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID';

--
-- 使用表AUTO_INCREMENT `eb_store_visit`
--
ALTER TABLE `eb_store_visit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_system_admin`
--
ALTER TABLE `eb_system_admin`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `eb_system_attachment`
--
ALTER TABLE `eb_system_attachment`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用表AUTO_INCREMENT `eb_system_attachment_category`
--
ALTER TABLE `eb_system_attachment_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `eb_system_broadcast`
--
ALTER TABLE `eb_system_broadcast`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_system_bucket`
--
ALTER TABLE `eb_system_bucket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_system_config`
--
ALTER TABLE `eb_system_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id', AUTO_INCREMENT=195;

--
-- 使用表AUTO_INCREMENT `eb_system_config_content`
--
ALTER TABLE `eb_system_config_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `eb_system_config_tab`
--
ALTER TABLE `eb_system_config_tab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置分类id', AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `eb_system_file`
--
ALTER TABLE `eb_system_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件对比ID';

--
-- 使用表AUTO_INCREMENT `eb_system_group`
--
ALTER TABLE `eb_system_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID', AUTO_INCREMENT=68;

--
-- 使用表AUTO_INCREMENT `eb_system_group_data`
--
ALTER TABLE `eb_system_group_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID', AUTO_INCREMENT=42;

--
-- 使用表AUTO_INCREMENT `eb_system_log`
--
ALTER TABLE `eb_system_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员操作记录ID', AUTO_INCREMENT=456;

--
-- 使用表AUTO_INCREMENT `eb_system_menus`
--
ALTER TABLE `eb_system_menus`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=680;

--
-- 使用表AUTO_INCREMENT `eb_system_notice`
--
ALTER TABLE `eb_system_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知模板id';

--
-- 使用表AUTO_INCREMENT `eb_system_notice_admin`
--
ALTER TABLE `eb_system_notice_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知记录ID';

--
-- 使用表AUTO_INCREMENT `eb_system_role`
--
ALTER TABLE `eb_system_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '身份管理id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `eb_user`
--
ALTER TABLE `eb_user`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id';

--
-- 使用表AUTO_INCREMENT `eb_user_address`
--
ALTER TABLE `eb_user_address`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户地址id';

--
-- 使用表AUTO_INCREMENT `eb_user_bill`
--
ALTER TABLE `eb_user_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户账单id';

--
-- 使用表AUTO_INCREMENT `eb_user_enter`
--
ALTER TABLE `eb_user_enter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户申请ID';

--
-- 使用表AUTO_INCREMENT `eb_user_extract`
--
ALTER TABLE `eb_user_extract`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_user_group`
--
ALTER TABLE `eb_user_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_user_notice`
--
ALTER TABLE `eb_user_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_user_notice_see`
--
ALTER TABLE `eb_user_notice_see`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_user_recharge`
--
ALTER TABLE `eb_user_recharge`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_user_sign`
--
ALTER TABLE `eb_user_sign`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `eb_wechat_media`
--
ALTER TABLE `eb_wechat_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id', AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `eb_wechat_message`
--
ALTER TABLE `eb_wechat_message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id';

--
-- 使用表AUTO_INCREMENT `eb_wechat_news_category`
--
ALTER TABLE `eb_wechat_news_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID';

--
-- 使用表AUTO_INCREMENT `eb_wechat_qrcode`
--
ALTER TABLE `eb_wechat_qrcode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID';

--
-- 使用表AUTO_INCREMENT `eb_wechat_reply`
--
ALTER TABLE `eb_wechat_reply`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id';

--
-- 使用表AUTO_INCREMENT `eb_wechat_template`
--
ALTER TABLE `eb_wechat_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `eb_wechat_user`
--
ALTER TABLE `eb_wechat_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
