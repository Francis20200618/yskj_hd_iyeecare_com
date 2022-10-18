/*
Navicat MySQL Data Transfer

Source Server         : 互动商城
Source Server Version : 50734
Source Host           : 112.126.72.86:3306
Source Database       : hd_iyeecare_com

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2022-04-19 13:11:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ims_core_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_sessions`;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_cron_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_cron_job`;
CREATE TABLE `ims_cron_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `runtime` double(8,2) NOT NULL,
  `cron_manager_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_cron_manager
-- ----------------------------
DROP TABLE IF EXISTS `ims_cron_manager`;
CREATE TABLE `ims_cron_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rundate` datetime NOT NULL,
  `runtime` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_decorate_diy_market_sync
-- ----------------------------
DROP TABLE IF EXISTS `ims_decorate_diy_market_sync`;
CREATE TABLE `ims_decorate_diy_market_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_id` int(11) NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:已拉取，0:未拉取',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`sync_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ims_failed_jobs`;
CREATE TABLE `ims_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ims_jobs`;
CREATE TABLE `ims_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_laravel_sms
-- ----------------------------
DROP TABLE IF EXISTS `ims_laravel_sms`;
CREATE TABLE `ims_laravel_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `temp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voice_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fail_times` mediumint(9) NOT NULL DEFAULT '0',
  `last_fail_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(10) unsigned NOT NULL DEFAULT '0',
  `result_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_mc_chats_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_chats_record`;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_fans_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_groups`;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_fans_tag_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_mapping_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`) USING BTREE,
  UNIQUE KEY `openid_2` (`openid`) USING BTREE,
  KEY `acid` (`acid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `updatetime` (`updatetime`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_mc_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_member_address`;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  `longitude` varchar(15) NOT NULL DEFAULT '',
  `latitude` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_members
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_members`;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_migrations
-- ----------------------------
DROP TABLE IF EXISTS `ims_migrations`;
CREATE TABLE `ims_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_uploads
-- ----------------------------
DROP TABLE IF EXISTS `ims_uploads`;
CREATE TABLE `ims_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_account_open_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_account_open_config`;
CREATE TABLE `ims_yz_account_open_config` (
  `config_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `app_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity`;
CREATE TABLE `ims_yz_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `pack_price` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '打包价格',
  `goods_count` int(10) unsigned NOT NULL COMMENT '商品数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0-正常、1-失效',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-未删除、1-已删除',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(10) unsigned NOT NULL COMMENT '修改时间',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `rule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展示规则：0-默认文案、1-自定义规则',
  `custom_thumb` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义图片',
  `paid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付订单数',
  `paid_amount` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `extension_qrcode` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '推广二维码',
  `extension_poster` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '推广海报',
  `applets_qrcode` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序二维码',
  `applets_poster` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序海报',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_activity`;
CREATE TABLE `ims_yz_activity_apply_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `calssify_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT '讲师ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `form_id` int(11) DEFAULT NULL COMMENT '表单ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `limit` int(11) DEFAULT NULL COMMENT '报名人数',
  `cash` decimal(14,2) DEFAULT NULL COMMENT '活动费用',
  `registration_time` int(11) DEFAULT NULL COMMENT '开始报名时间',
  `registration_end_time` int(11) DEFAULT NULL COMMENT '结束报名时间',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动图片',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banner图片',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '活动详情',
  `province_id` int(11) DEFAULT NULL COMMENT '省级ID',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省级名称',
  `city_id` int(11) DEFAULT '0' COMMENT '市级ID',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市级名称',
  `district_id` int(11) DEFAULT '0' COMMENT '区级ID',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '区级名称',
  `street_id` int(11) DEFAULT '0' COMMENT '街道级ID',
  `street_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道级名称',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT '地址',
  `status` tinyint(4) DEFAULT '0' COMMENT '0活动未开始',
  `is_premium` tinyint(1) DEFAULT NULL COMMENT '免费0,收费1',
  `is_open` tinyint(1) DEFAULT NULL COMMENT '0关闭,1开启',
  `is_recommand` tinyint(1) DEFAULT NULL COMMENT '0不推荐,1推荐',
  `is_hot` tinyint(1) DEFAULT NULL COMMENT '0不热门,1热门',
  `is_discount` tinyint(1) DEFAULT NULL COMMENT '0不精选,1精选',
  `created_at` int(11) NOT NULL COMMENT '加入购物车时间',
  `updated_at` int(11) NOT NULL COMMENT '最后一次修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '移除购物车时间',
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起点经纬度',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点经纬度',
  `initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国标',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标题',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图片',
  `share_describe` text COLLATE utf8mb4_unicode_ci COMMENT '分享描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_attention
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_attention`;
CREATE TABLE `ims_yz_activity_apply_attention` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `is_attention` tinyint(4) DEFAULT NULL COMMENT '0取消，1关注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_calssify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_calssify`;
CREATE TABLE `ims_yz_activity_apply_calssify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `calssify_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL COMMENT '分类排序',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图片',
  `is_open` tinyint(1) DEFAULT NULL COMMENT '是否使用分类0禁用,1启动',
  `create_time` int(11) NOT NULL COMMENT '创建的时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_give_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_give_coupon`;
CREATE TABLE `ims_yz_activity_apply_give_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_goods`;
CREATE TABLE `ims_yz_activity_apply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) DEFAULT NULL,
  `is_open` tinyint(4) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `plugins` text COLLATE utf8mb4_unicode_ci COMMENT '插件设置',
  `profit` text COLLATE utf8mb4_unicode_ci COMMENT '插件分红结算比例',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_lantern_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_lantern_slide`;
CREATE TABLE `ims_yz_activity_apply_lantern_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片地址',
  `display_order` int(11) DEFAULT NULL COMMENT '排序',
  `is_open` int(11) NOT NULL COMMENT '不显示0,显示1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `app_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_order`;
CREATE TABLE `ims_yz_activity_apply_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `calssify_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT '讲师ID',
  `member_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `form_id` int(11) DEFAULT NULL COMMENT '表单ID',
  `activity_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报名人数',
  `cash` decimal(14,2) DEFAULT NULL COMMENT '金额',
  `attention` tinyint(4) DEFAULT NULL COMMENT '0没关注,1关注',
  `sign` tinyint(4) DEFAULT NULL COMMENT '0没签到,1签到',
  `sign_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签到时间',
  `created_at` int(11) NOT NULL COMMENT '加入购物车时间',
  `updated_at` int(11) NOT NULL COMMENT '最后一次修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '移除购物车时间',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_order_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_order_log`;
CREATE TABLE `ims_yz_activity_apply_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `pay_status` int(11) DEFAULT NULL COMMENT '驳回支付状态',
  `rejection_details` text COLLATE utf8mb4_unicode_ci COMMENT '驳回信息',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_relation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_relation`;
CREATE TABLE `ims_yz_activity_apply_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `activity_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_data_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_goods`;
CREATE TABLE `ims_yz_activity_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0-正常、1-失效',
  `is_deleted` tinyint(1) NOT NULL COMMENT '是否删除：0-否、1-是',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `deleted_at` int(10) unsigned NOT NULL COMMENT '删除时间',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_address`;
CREATE TABLE `ims_yz_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=659004547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_address_mgmt_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_address_mgmt_log`;
CREATE TABLE `ims_yz_address_mgmt_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `area_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址名称',
  `after_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '之后地址',
  `before_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '之前地址',
  `operate_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作类型',
  `level` tinyint(4) DEFAULT '0' COMMENT '地址级别',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_logs`;
CREATE TABLE `ims_yz_admin_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `admin_uid` int(11) NOT NULL DEFAULT '0' COMMENT '类型;1-管理员用户ID',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ip',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录账号',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联的会员id（实时记录）',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员登录日志表';

-- ----------------------------
-- Table structure for ims_yz_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_operation_log`;
CREATE TABLE `ims_yz_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_uid` int(11) DEFAULT NULL COMMENT '管理员',
  `table_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `table_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `before` text COLLATE utf8mb4_unicode_ci COMMENT '改变前',
  `after` text COLLATE utf8mb4_unicode_ci COMMENT '改变后',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作者ip',
  `before_identify` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '修改前标识',
  `after_identify` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改后标识',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_permission_role`;
CREATE TABLE `ims_yz_admin_permission_role` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_permissions`;
CREATE TABLE `ims_yz_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限解释名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述与备注',
  `parent_id` tinyint(4) NOT NULL COMMENT '级别',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图标',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_role_user`;
CREATE TABLE `ims_yz_admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_roles`;
CREATE TABLE `ims_yz_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_users`;
CREATE TABLE `ims_yz_admin_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员用户表ID',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:超级管理员(admin); 1:审核; 2:有效; 3:禁用)',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(0:超级管理员(admin); 1:普通用户; 3:店员)',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `application_number` int(11) NOT NULL DEFAULT '0' COMMENT '平台数量(0:代表不允许创建)',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间(0:永久有效)',
  `owner_uid` int(11) NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joinip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加入ip',
  `lastvisit` int(11) NOT NULL COMMENT '最后访问',
  `lastip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后访问ip',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `change_password_at` int(11) DEFAULT NULL,
  `change_remind` tinyint(4) NOT NULL DEFAULT '0',
  `login_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `yz_admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_adv`;
CREATE TABLE `ims_yz_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `advs` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_advertisement`;
CREATE TABLE `ims_yz_advertisement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '广告链接',
  `sort_by` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:不显示|1：显示',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_agent_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_agent_level`;
CREATE TABLE `ims_yz_agent_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `first_level` decimal(12,2) DEFAULT '0.00',
  `second_level` decimal(12,2) DEFAULT '0.00',
  `third_level` decimal(12,2) DEFAULT '0.00',
  `upgraded` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_manage` int(11) DEFAULT NULL,
  `additional_ratio` decimal(12,2) DEFAULT '0.00',
  `no_withdraw` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_agents
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_agents`;
CREATE TABLE `ims_yz_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `agent_level_id` int(11) DEFAULT '0',
  `is_black` tinyint(1) DEFAULT '0',
  `commission_total` decimal(14,2) DEFAULT '0.00',
  `agent_not_upgrade` tinyint(1) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `parent` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_pay` decimal(14,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_parent` (`uniacid`,`parent`),
  KEY `yz_agents_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_bing_bird_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_bing_bird_order`;
CREATE TABLE `ims_yz_aggregation_bing_bird_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `type` int(11) DEFAULT NULL COMMENT '订单类型',
  `buyer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买者(外部用户标识)',
  `buyer_out_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买者(外部用户标识)',
  `parent_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父订单编号',
  `sub_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子订单编号',
  `pre_commission` decimal(12,2) DEFAULT NULL COMMENT '订单总预估佣金（元），已扣除技术服务费',
  `commission` decimal(12,2) DEFAULT NULL COMMENT '订单总结算佣金（元）',
  `pre_amount` decimal(12,2) DEFAULT NULL COMMENT '用户获得的预估佣金（元）',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '用户获得的结算佣金（元）',
  `user_out_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '佣金获得者（外部用户标识）',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品主图',
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品id',
  `goods_count` int(11) DEFAULT NULL COMMENT '购买数量',
  `goods_price` decimal(12,2) DEFAULT NULL COMMENT '商品单价',
  `pay_price` decimal(12,2) DEFAULT NULL COMMENT '订单支付金额',
  `deposite_price` decimal(12,2) DEFAULT NULL COMMENT '定金（仅淘宝订单）',
  `cpa_commission` decimal(12,2) DEFAULT NULL COMMENT '状态 1:待支付 2:已付款 3:确认收货 4:联盟结算 5:退货 6:违规 7:其他',
  `fl_commission` decimal(12,2) DEFAULT NULL,
  `point` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `love` decimal(12,2) DEFAULT NULL,
  `integral` decimal(12,2) DEFAULT NULL,
  `red_packet` decimal(12,2) DEFAULT NULL,
  `seller_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `special_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `receive_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `settle_time` int(11) DEFAULT NULL COMMENT '结算时间',
  `user_settle_time` int(11) DEFAULT NULL COMMENT 'B端客户结算给C端用户的时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_bing_bird_order_types
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_bing_bird_order_types`;
CREATE TABLE `ims_yz_aggregation_bing_bird_order_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL COMMENT '订单类型（对应 订单同步API的type）',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '中文名',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标（可参考使用）',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_bing_bird_order_types_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_academy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_academy`;
CREATE TABLE `ims_yz_aggregation_cps_academy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '栏目名称',
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '栏目图片',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更多链接',
  `is_show` int(11) DEFAULT NULL COMMENT '是否显示',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_app_version
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_app_version`;
CREATE TABLE `ims_yz_aggregation_cps_app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本号',
  `version_code` int(11) NOT NULL COMMENT '版本代码',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态 0不启用 1启用',
  `log` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新日志',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'app下载链接',
  `apk_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'app包名',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'app图标链接',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'app应用名',
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件大小',
  `upload_type` int(11) NOT NULL COMMENT '上传类型',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--app版本表';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_content`;
CREATE TABLE `ims_yz_aggregation_cps_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `academy_id` int(11) DEFAULT NULL COMMENT '栏目ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容名称',
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容封面',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转链接',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示1是 0否',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_brand
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_brand`;
CREATE TABLE `ims_yz_aggregation_cps_equity_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `category_id` int(11) DEFAULT NULL COMMENT '品牌所属的类目',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'logo',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `is_hot` int(11) DEFAULT NULL COMMENT '是否热门 0否 1是',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `show_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '前端是否显示 1显示 0隐藏',
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_brand_b_id_index` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_category`;
CREATE TABLE `ims_yz_aggregation_cps_equity_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_category_b_id_index` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_goods`;
CREATE TABLE `ims_yz_aggregation_cps_equity_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品logo',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `status` int(11) DEFAULT NULL COMMENT '状态1上架2售罄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `sell_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_goods_brand_id_index` (`brand_id`),
  KEY `yz_aggregation_cps_equity_goods_b_id_index` (`b_id`),
  KEY `yz_aggregation_cps_equity_goods_sell_count_index` (`sell_count`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_goods_sku`;
CREATE TABLE `ims_yz_aggregation_cps_equity_goods_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品logo',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `status` int(11) DEFAULT NULL COMMENT '状态1上架2售罄',
  `face_price` decimal(10,2) DEFAULT '0.00',
  `sale_price` decimal(10,2) DEFAULT '0.00',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `use_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `equity_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `reward_point` decimal(10,2) DEFAULT '0.00',
  `reward_point1` decimal(10,2) DEFAULT '0.00',
  `reward_point2` decimal(10,2) DEFAULT '0.00',
  `reward_balance` decimal(10,2) DEFAULT '0.00',
  `reward_balance1` decimal(10,2) DEFAULT '0.00',
  `reward_balance2` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_goods_sku_brand_id_index` (`brand_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_equity_id_index` (`equity_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_b_id_index` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_pay_order`;
CREATE TABLE `ims_yz_aggregation_cps_equity_pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `member_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `sub_order_id` int(11) DEFAULT NULL COMMENT '子订单ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `recharge_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直充参数',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自定义订单编号',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '必应鸟订单编号',
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `goods_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的logo',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息',
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品说明',
  `use_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用说明',
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息',
  `coupon_info` text COLLATE utf8mb4_unicode_ci COMMENT '消息',
  `code` int(11) DEFAULT NULL COMMENT '状态',
  `sku_type` int(11) DEFAULT NULL COMMENT 'sku的类型：1直充2卡券',
  `status` int(11) DEFAULT NULL COMMENT '状态：0默认状态-1失败2成功3处理中，如果一直是状态3请联系客服',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_pay_order_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_pay_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_equity_pay_order_member_id_index` (`member_id`),
  KEY `yz_aggregation_cps_equity_pay_order_sub_order_id_index` (`sub_order_id`),
  KEY `yz_aggregation_cps_equity_pay_order_sku_id_index` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_place_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_place_order`;
CREATE TABLE `ims_yz_aggregation_cps_equity_place_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `face_price` decimal(10,2) DEFAULT NULL COMMENT '面值',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价格',
  `recharge_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值账户',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值账户',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值账户',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息',
  `code` int(11) DEFAULT NULL COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_place_order_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_place_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_equity_place_order_member_id_index` (`member_id`),
  KEY `yz_aggregation_cps_equity_place_order_sku_id_index` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_link_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_link_category`;
CREATE TABLE `ims_yz_aggregation_cps_link_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类标题',
  `level` tinyint(4) NOT NULL COMMENT '分类级别',
  `parent_id` int(11) NOT NULL COMMENT '父分类id',
  `need_login` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `target_type` int(11) NOT NULL COMMENT '跳转类型id 0分类 -1淘宝 -2京东 -3拼多多 -4网页 -5APP -6小程序',
  `target` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转参数,序列化',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图标链接',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，值越大，优先度越高',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示 0不显示 1显示',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `image_state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_link_category_image_state_index` (`image_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--自定义分类表';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order`;
CREATE TABLE `ims_yz_aggregation_cps_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `sub_order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子订单编号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `order_type` int(11) DEFAULT NULL COMMENT '第三方平台类型',
  `price` decimal(12,2) DEFAULT NULL COMMENT '结算金额',
  `statement_at` int(11) DEFAULT NULL COMMENT '结算时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `close_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_sub_order_sn_index` (`sub_order_sn`),
  KEY `yz_aggregation_cps_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_order_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order_request`;
CREATE TABLE `ims_yz_aggregation_cps_order_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret',
  `api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'api',
  `v` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '版本号',
  `t` int(11) DEFAULT NULL COMMENT '请求时间',
  `mode` int(11) DEFAULT NULL COMMENT '请求类型',
  `type` int(11) DEFAULT NULL COMMENT '请求类型',
  `time` int(11) DEFAULT NULL COMMENT '时间：1-下单时间，2-收货时间，3-更新时间',
  `start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间，格式：2020-09-12 或2020-09-12 11:05:24',
  `end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间，格式：2020-09-12 或2020-09-12 11:05:24',
  `min_id` int(11) DEFAULT NULL COMMENT '最小ID，传入上一次请求返回的最大ID',
  `page` int(11) DEFAULT NULL COMMENT '页码',
  `page_size` int(11) DEFAULT NULL COMMENT '每页数据量，默认20，最大100',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_request_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=558587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order_response
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order_response`;
CREATE TABLE `ims_yz_aggregation_cps_order_response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `type` int(11) DEFAULT NULL COMMENT '请求类型',
  `api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret',
  `api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'api',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '返回码',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息',
  `has_next` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否有下一页',
  `max_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最大值',
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '数据',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_response_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=558587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_activity`;
CREATE TABLE `ims_yz_aggregation_cps_plat_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开启状态 0关闭 1开启',
  `another_id` int(10) unsigned NOT NULL COMMENT '必应鸟资源类型id',
  `another_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '必应鸟资源类型名',
  `web_poster_id` int(10) unsigned NOT NULL COMMENT '公众号海报id',
  `mini_poster_id` int(10) unsigned NOT NULL COMMENT '小程序海报id',
  `bottom_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '底部文本',
  `top_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '底部文本',
  `page_type` tinyint(4) NOT NULL DEFAULT '3' COMMENT '页面类型 1H5 2小程序 3H5+小程序',
  `visit_count` int(11) NOT NULL COMMENT '访问次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--推广资源表';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_activity_code`;
CREATE TABLE `ims_yz_aggregation_cps_plat_activity_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `code_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '二维码或小程序码图片链接',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--推广活动码表';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_list`;
CREATE TABLE `ims_yz_aggregation_cps_plat_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `plat_id` int(11) NOT NULL COMMENT '推广资源id',
  `state` tinyint(4) NOT NULL COMMENT '0失效 有效',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源名',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源logo',
  `is_h5` tinyint(4) NOT NULL COMMENT '是否支持h5',
  `is_mini` tinyint(4) NOT NULL COMMENT '是否支持小程序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--推广资源表';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_text`;
CREATE TABLE `ims_yz_aggregation_cps_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本键名',
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合cps--富文本表';

-- ----------------------------
-- Table structure for ims_yz_alipay_order_settle_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_alipay_order_settle_log`;
CREATE TABLE `ims_yz_alipay_order_settle_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalty_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_out_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_in_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_request_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_alipay_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_alipay_pay_order`;
CREATE TABLE `ims_yz_alipay_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT NULL,
  `royalty` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_answer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_answer`;
CREATE TABLE `ims_yz_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `subject_id` int(11) DEFAULT NULL COMMENT '题目id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案内容',
  `answer` int(11) DEFAULT NULL COMMENT '正确答案',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_answer_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_answer_reward_log`;
CREATE TABLE `ims_yz_answer_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级id',
  `answer_id` int(11) DEFAULT NULL COMMENT '答案id',
  `subject_id` int(11) DEFAULT NULL COMMENT '题目id',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id',
  `uid_reward_integral` decimal(5,2) DEFAULT NULL COMMENT '会员奖励积分',
  `parent_reward_integral` decimal(5,2) DEFAULT NULL COMMENT '上级奖励积分',
  `set_type` int(11) DEFAULT NULL COMMENT '全局/单独设置: 0 全局 1 单独',
  `uid_whole_value` decimal(5,2) DEFAULT NULL COMMENT '会员全局设置固定值',
  `uid_alone_value` decimal(5,2) DEFAULT NULL COMMENT '会员单独设置固定值',
  `parent_whole_value` decimal(5,2) DEFAULT NULL COMMENT '上级全局设置固定值',
  `parent_alone_value` decimal(5,2) DEFAULT NULL COMMENT '上级单独设置固定值',
  `uid_reward_c_integral` decimal(5,2) DEFAULT NULL COMMENT '会员奖励消费积分',
  `parent_reward_c_integral` decimal(5,2) DEFAULT NULL COMMENT '上级奖励消费积分',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_api_access_token
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_api_access_token`;
CREATE TABLE `ims_yz_api_access_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_api_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_api_refresh_token`;
CREATE TABLE `ims_yz_api_refresh_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_app_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_app_user`;
CREATE TABLE `ims_yz_app_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户角色(manager:管理员; operator: 操作员; clerk:操作员)',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '公众号及小程序置顶排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend`;
CREATE TABLE `ims_yz_area_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `area_level` tinyint(1) NOT NULL COMMENT '区域等级',
  `agent_area` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代理区域',
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `order_amount` decimal(12,2) NOT NULL COMMENT '订单金额',
  `amount` decimal(12,2) NOT NULL COMMENT '分红结算金额',
  `dividend_rate` decimal(10,2) DEFAULT '0.00' COMMENT '分红比例',
  `lower_level_rate` decimal(10,2) DEFAULT '0.00' COMMENT '下级分红比例',
  `same_level_number` int(11) DEFAULT NULL COMMENT '同级人数',
  `dividend_amount` decimal(12,2) NOT NULL COMMENT '分红金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分红状态 0:未结算 1：已结算',
  `create_month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recrive_at` int(11) DEFAULT NULL COMMENT '收货时间',
  `settle_days` int(11) NOT NULL DEFAULT '0' COMMENT '结算天数',
  `statement_at` int(11) DEFAULT NULL COMMENT '结算时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_area_dividend_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_agent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_agent`;
CREATE TABLE `ims_yz_area_dividend_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `province_id` int(11) DEFAULT NULL COMMENT '省级ID',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省级名称',
  `city_id` int(11) DEFAULT '0' COMMENT '市级ID',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市级名称',
  `district_id` int(11) DEFAULT '0' COMMENT '区级ID',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '区级名称',
  `street_id` int(11) DEFAULT '0' COMMENT '街道级ID',
  `street_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道级名称',
  `agent_level` tinyint(1) DEFAULT '0' COMMENT '0：无效；1：省代；2：市代；3：区代：4：街道代理',
  `status` tinyint(1) DEFAULT '0' COMMENT '0：待审核；1：通过；-1驳回',
  `agent_at` int(11) DEFAULT NULL COMMENT '成为代理时间',
  `count_order_amount` decimal(14,2) DEFAULT '0.00' COMMENT '区域订单消费金额',
  `count_settle_amount` decimal(14,2) DEFAULT '0.00' COMMENT '累计结算分红金额',
  `settle_dividend_amount` decimal(14,2) DEFAULT '0.00' COMMENT '已结算分红',
  `unsettled_dividend_amount` decimal(14,2) DEFAULT '0.00' COMMENT '未结算分红',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `manage` int(11) DEFAULT '0',
  `ratio` decimal(10,2) DEFAULT NULL,
  `has_ratio` int(11) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT '招商专员会员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_lock
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_lock`;
CREATE TABLE `ims_yz_area_dividend_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_order`;
CREATE TABLE `ims_yz_area_dividend_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_article_pay_money
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_article_pay_money`;
CREATE TABLE `ims_yz_article_pay_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `category_id` tinyint(4) NOT NULL COMMENT '文章分类',
  `money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '文章价格',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '付款次数',
  `pay_total` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0-正常 1-删除',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_article_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_article_pay_record`;
CREATE TABLE `ims_yz_article_pay_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `pay_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `pay_id` int(11) NOT NULL DEFAULT '0' COMMENT '付款方式ID',
  `pay_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '付款方式',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '付款状态 0-未付款  1-已付款',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_audio_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_audio_notice`;
CREATE TABLE `ims_yz_audio_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `belong` int(11) NOT NULL DEFAULT '0' COMMENT '所属者id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未播放|1：已播放',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '预留扩展',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance`;
CREATE TABLE `ims_yz_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_money` decimal(14,2) DEFAULT NULL,
  `change_money` decimal(14,2) NOT NULL,
  `new_money` decimal(14,2) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `service_type` tinyint(11) NOT NULL,
  `serial_number` varchar(45) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL,
  `operator_id` varchar(45) NOT NULL DEFAULT '',
  `thirdStatus` varchar(255) DEFAULT '1',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_balance_serial_number_index` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8997 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_balance_covert_love
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_covert_love`;
CREATE TABLE `ims_yz_balance_covert_love` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `covert_amount` int(11) NOT NULL COMMENT '转化金额',
  `status` int(11) NOT NULL COMMENT '转化状态',
  `order_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `remark` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge`;
CREATE TABLE `ims_yz_balance_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_money` decimal(14,2) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `new_money` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `ordersn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge_activity`;
CREATE TABLE `ims_yz_balance_recharge_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `partake_count` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge_check
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge_check`;
CREATE TABLE `ims_yz_balance_recharge_check` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `money` decimal(12,2) NOT NULL COMMENT '充值余额',
  `type` int(11) NOT NULL COMMENT '充值类型',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作者ID',
  `operator` int(11) DEFAULT NULL COMMENT '操作者',
  `source` int(11) NOT NULL COMMENT '来源',
  `enclosure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附件',
  `recharge_remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值时填写的备注',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `explain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0待审核,1通过,2驳回',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_balance_recharge_check_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='余额充值审核表';

-- ----------------------------
-- Table structure for ims_yz_balance_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_transfer`;
CREATE TABLE `ims_yz_balance_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `transferor` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_bind_mobile_award_point
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_bind_mobile_award_point`;
CREATE TABLE `ims_yz_bind_mobile_award_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `point` decimal(14,2) NOT NULL COMMENT '奖励积分',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_boss_audio_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_boss_audio_notice`;
CREATE TABLE `ims_yz_boss_audio_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '所属者id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plugin_id` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL COMMENT '0:未播放|1：已播放',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '预留扩展',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_brand
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_brand`;
CREATE TABLE `ims_yz_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_broadcast_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_broadcast_config`;
CREATE TABLE `ims_yz_broadcast_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `is_open` int(11) NOT NULL COMMENT '状态：0-关闭，1-开启',
  `broadcast_number` int(11) NOT NULL COMMENT '滚动数量',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '自定义文案',
  `show_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-商城所有商品，2-当前浏览商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_browse_footprint
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_browse_footprint`;
CREATE TABLE `ims_yz_browse_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '访问会员：0-游客',
  `page_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面类型',
  `page_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '页面类型ID',
  `port_type` tinyint(4) NOT NULL COMMENT '端口类型:wap,公众号,微信小程序等',
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '访问IP地址',
  `ip_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '访问区域，国内记录省份，国外记录国家',
  `cookie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问的整数时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '页面完整URL',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '分享者id',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_page_type` (`page_type`),
  KEY `idx_cookie` (`cookie`),
  KEY `inx_day` (`day`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=160619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_browse_footprint_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_browse_footprint_config`;
CREATE TABLE `ims_yz_browse_footprint_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `is_open` int(11) NOT NULL COMMENT '状态：0-关闭，1-开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card`;
CREATE TABLE `ims_yz_business_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `card_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片头像',
  `card_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片姓名',
  `card_mobile` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片手机号',
  `card_wechat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片微信号',
  `role_id` int(11) DEFAULT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `voice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录音',
  `card_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片链接',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名片二维码',
  `picture` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `areas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区选择',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:不开启，1:开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `min_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序名片二维码',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '海报图',
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '海报图url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_children
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_children`;
CREATE TABLE `ims_yz_business_card_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_collection
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_collection`;
CREATE TABLE `ims_yz_business_card_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `collect_member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:不收藏，1:收藏',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_goods`;
CREATE TABLE `ims_yz_business_card_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_reliable
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_reliable`;
CREATE TABLE `ims_yz_business_card_reliable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `reliable_member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:不靠谱，1:靠谱',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_statistics`;
CREATE TABLE `ims_yz_business_card_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `visit` int(11) NOT NULL DEFAULT '0' COMMENT '访问',
  `visitor_num` int(11) NOT NULL DEFAULT '0' COMMENT '访问人数',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '收藏',
  `reliable` int(11) NOT NULL DEFAULT '0' COMMENT '靠谱',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT '分享',
  `save` int(11) NOT NULL DEFAULT '0' COMMENT '保存',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT '新增会员',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_department
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_department`;
CREATE TABLE `ims_yz_business_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `en_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门英文名称',
  `level` int(11) NOT NULL COMMENT '层级',
  `parent_id` int(11) NOT NULL COMMENT '上级部门id',
  `wechat_department_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信部门id',
  `order` int(11) NOT NULL COMMENT '部门排序',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_department_index_business_wechat` (`business_id`,`wechat_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-企业部门表';

-- ----------------------------
-- Table structure for ims_yz_business_department_staff
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_department_staff`;
CREATE TABLE `ims_yz_business_department_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `staff_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业员工id,yz_business_staff表id',
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `is_leader` int(11) NOT NULL COMMENT '是否部门领导',
  `sort` int(11) NOT NULL COMMENT '部门排序',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_department_staff_index_bds` (`business_id`,`department_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-企业员工表';

-- ----------------------------
-- Table structure for ims_yz_business_manager_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_manager_list`;
CREATE TABLE `ims_yz_business_manager_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `business_id` int(11) NOT NULL COMMENT '企业id',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-管理员表';

-- ----------------------------
-- Table structure for ims_yz_business_material
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_material`;
CREATE TABLE `ims_yz_business_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件类型',
  `file_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件名称',
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件完整地址',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业微信回传的素材标识（三天有效）',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BniId` (`uniacid`,`business_id`),
  KEY `ids_Type_FName` (`type`,`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信素材标识管理表';

-- ----------------------------
-- Table structure for ims_yz_business_pc_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_pc_text`;
CREATE TABLE `ims_yz_business_pc_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本标识',
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文本内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业pc端管理--富文本表';

-- ----------------------------
-- Table structure for ims_yz_business_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_permission`;
CREATE TABLE `ims_yz_business_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `staff_id` int(11) NOT NULL DEFAULT '0' COMMENT '员工id',
  `type` tinyint(4) NOT NULL COMMENT '1部门员工权限 2部门领导权限 3用户独立权限',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块名或插件名,如admin,frontend,yun-sign',
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '路由名',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_permission_index_business_department_staff` (`business_id`,`department_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-部门员工权限表';

-- ----------------------------
-- Table structure for ims_yz_business_plat_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_plat_log`;
CREATE TABLE `ims_yz_business_plat_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `final_plat_id` int(11) NOT NULL DEFAULT '0' COMMENT '最后管理的企业id',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_business_plat_log_uid_unique` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-企业管理记录';

-- ----------------------------
-- Table structure for ims_yz_business_staff
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_staff`;
CREATE TABLE `ims_yz_business_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '成员UserID。对应管理端的帐号',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '成员名称',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职务',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未知 1男 2女',
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '固话',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未关联 1=已激活，2=已禁用，4=未激活，5=退出企业',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '员工个人二维码',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '员工地址',
  `open_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '成员第三方唯一标识代码',
  `main_department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主部门',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `right_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权限类型 0部门权限 1成员独立权限',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用 0正常 1禁用',
  PRIMARY KEY (`id`),
  KEY `yz_business_staff_business_id_index` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业PC端-企业员工表';

-- ----------------------------
-- Table structure for ims_yz_card_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_goods_history`;
CREATE TABLE `ims_yz_card_goods_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_history_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_history_statistics`;
CREATE TABLE `ims_yz_card_history_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num_sum` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_reward_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_reward_records`;
CREATE TABLE `ims_yz_card_reward_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `source_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(11) NOT NULL,
  `amount` decimal(14,2) NOT NULL COMMENT '奖励额度',
  `reward_type` int(11) NOT NULL COMMENT '奖励类型',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_save_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_save_records`;
CREATE TABLE `ims_yz_card_save_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `save_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_share_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_share_records`;
CREATE TABLE `ims_yz_card_share_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `share_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_visit_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_visit_records`;
CREATE TABLE `ims_yz_card_visit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `visitor_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_diy_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_diy_return`;
CREATE TABLE `ims_yz_cashier_diy_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `diy_total` int(11) DEFAULT NULL,
  `point_total` int(11) DEFAULT NULL,
  `finish_point_total` int(11) DEFAULT NULL,
  `cash_total` int(11) DEFAULT NULL,
  `finish_cash_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_goods`;
CREATE TABLE `ims_yz_cashier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启收银台',
  `shop_commission` decimal(10,5) DEFAULT '0.00000' COMMENT '平台分成比例',
  `settlement_day` int(11) DEFAULT '0' COMMENT '结算期',
  `is_write_information` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户付款是否需要填写信息',
  `is_cash_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用现金支付',
  `plugins` text COLLATE utf8mb4_unicode_ci COMMENT '插件设置',
  `shop_award_point` decimal(10,2) DEFAULT NULL COMMENT '商家奖励积分',
  `profit` text COLLATE utf8mb4_unicode_ci COMMENT '插件分红结算比例',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `payment_types` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shop_award_point1` decimal(10,2) DEFAULT NULL COMMENT '一级商家奖励积分',
  `shop_award_point2` decimal(10,2) DEFAULT NULL COMMENT '二级商家奖励积分',
  `audio_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:关闭|1：开启',
  `pay_reward` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付奖励值',
  `fixed_meney` decimal(14,2) DEFAULT NULL COMMENT '积分最低抵扣固定多少元',
  `max_pay_number` int(11) DEFAULT NULL COMMENT '会员最多下单次数',
  `every_min_money` decimal(14,2) DEFAULT NULL COMMENT '每次最多消费金额',
  `face_pay` int(11) DEFAULT '0' COMMENT '人脸支付',
  `is_open_member_discount` int(11) NOT NULL DEFAULT '0' COMMENT '开启会员折扣,0开启，1关闭',
  `pay_reward_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付奖励值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_sale
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_sale`;
CREATE TABLE `ims_yz_cashier_sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `max_point_deduct` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '积分最大折扣',
  `min_point_deduct` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '积分最小折扣',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1百分比，2固定值',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店收银台积分抵扣';

-- ----------------------------
-- Table structure for ims_yz_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_category`;
CREATE TABLE `ims_yz_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `is_home` tinyint(1) DEFAULT '0',
  `adv_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `adv_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `level` tinyint(1) DEFAULT '0',
  `advimg_pc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `advurl_pc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `filter_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_ishome` (`is_home`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_category_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_category_discount`;
CREATE TABLE `ims_yz_category_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_ids` text COLLATE utf8mb4_unicode_ci COMMENT '分类id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_discount_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '折扣类型',
  `discount_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '折扣方式',
  `discount_value` text COLLATE utf8mb4_unicode_ci COMMENT '折扣值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_change_mobile_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_change_mobile_log`;
CREATE TABLE `ims_yz_change_mobile_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `mobile_before` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '修改前手机号',
  `mobile_after` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '修改后手机号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ckt_class
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_class`;
CREATE TABLE `ims_yz_ckt_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL COMMENT '分类id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴分类';

-- ----------------------------
-- Table structure for ims_yz_ckt_colour
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_colour`;
CREATE TABLE `ims_yz_ckt_colour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colour_id` int(11) DEFAULT NULL COMMENT '颜色id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色名称',
  `colour_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '色号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴颜色';

-- ----------------------------
-- Table structure for ims_yz_ckt_industry
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_industry`;
CREATE TABLE `ims_yz_ckt_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) DEFAULT NULL COMMENT '行业id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '行业名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴行业';

-- ----------------------------
-- Table structure for ims_yz_ckt_purpose
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_purpose`;
CREATE TABLE `ims_yz_ckt_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose_id` int(11) DEFAULT NULL COMMENT '用途id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用途名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴用途';

-- ----------------------------
-- Table structure for ims_yz_ckt_scene
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_scene`;
CREATE TABLE `ims_yz_ckt_scene` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(11) DEFAULT NULL COMMENT '场景id',
  `class_id` int(11) DEFAULT NULL COMMENT '分类id',
  `industry_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '场景ids',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '场景名称',
  `width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宽',
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '高',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴场景';

-- ----------------------------
-- Table structure for ims_yz_ckt_style
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_style`;
CREATE TABLE `ims_yz_ckt_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` int(11) DEFAULT NULL COMMENT '风格id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风格名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--创客贴风格';

-- ----------------------------
-- Table structure for ims_yz_clock_continuity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_continuity`;
CREATE TABLE `ims_yz_clock_continuity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `clock_num` int(11) DEFAULT NULL,
  `last_clock_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_pay_log`;
CREATE TABLE `ims_yz_clock_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_method` tinyint(1) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '0未支付1支付成功',
  `clock_in_status` tinyint(1) DEFAULT NULL COMMENT '打卡状态0未打卡1已打卡',
  `clock_in_at` int(11) DEFAULT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_queue`;
CREATE TABLE `ims_yz_clock_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `day_before_amount` decimal(10,2) DEFAULT NULL COMMENT '前一天奖金池总额',
  `rate` decimal(10,2) DEFAULT NULL COMMENT '奖金发放比例',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '总发放金额',
  `pay_num` int(11) DEFAULT NULL COMMENT '前一天支付人数',
  `clock_in_num` int(11) DEFAULT NULL COMMENT '打卡人数',
  `not_clock_in_num` int(11) DEFAULT NULL COMMENT '未打卡人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_reward_log`;
CREATE TABLE `ims_yz_clock_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_rule`;
CREATE TABLE `ims_yz_clock_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `rule_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_comment`;
CREATE TABLE `ims_yz_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` tinyint(1) DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `comment_id` int(11) DEFAULT '0',
  `reply_id` int(11) DEFAULT '0',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(3) DEFAULT '1',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `plugin_table_id` int(11) DEFAULT NULL COMMENT '评论归属id?平台/门店',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示：1-显示',
  `is_top` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否置顶：1-置顶',
  `score_latitude` text COLLATE utf8mb4_unicode_ci COMMENT '评分纬度',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0-不需要审核，1-通过，-1 = 驳回，2-待审核',
  `additional_comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '追评ID',
  `has_default_good_reputation` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认好评，1-是',
  `order_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单商品表ID',
  `level_set` int(11) NOT NULL DEFAULT '0' COMMENT '手动设置等级',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_orderid` (`order_id`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_openid` (`uid`),
  KEY `idx_createtime` (`created_at`),
  KEY `idx_is_show` (`is_show`),
  KEY `idx_is_top` (`is_top`),
  KEY `idx_audit_status` (`audit_status`),
  KEY `idx_order_goods_id` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_comment_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_comment_config`;
CREATE TABLE `ims_yz_comment_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `is_comment_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评论审核：1-开启',
  `is_default_good_reputation` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认好评：1-开启',
  `is_order_comment_entrance` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单显示评论入口：1-开启',
  `is_additional_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '追评：1-开启',
  `is_score_latitude` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分维度：1-开启',
  `top_sort` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'asc' COMMENT '置顶排序：asc升序，desc倒序',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_top_sort` (`top_sort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论设置表';

-- ----------------------------
-- Table structure for ims_yz_commission_edit_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_edit_log`;
CREATE TABLE `ims_yz_commission_edit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_log`;
CREATE TABLE `ims_yz_commission_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `before_level_id` int(11) NOT NULL DEFAULT '0',
  `after_level_id` int(11) NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_lose
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_lose`;
CREATE TABLE `ims_yz_commission_lose` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `award_id` int(11) DEFAULT NULL COMMENT '分销奖励id',
  `amount_seal` decimal(10,2) DEFAULT NULL COMMENT '封顶金额',
  `today_commission` decimal(10,2) DEFAULT NULL COMMENT '今日分销佣金',
  `today_team_dividend` decimal(10,2) DEFAULT NULL COMMENT '今日经销商奖励',
  `today_share` decimal(10,2) DEFAULT NULL COMMENT '今日共享奖',
  `should_amount` decimal(10,2) DEFAULT NULL COMMENT '应该获得奖励金额',
  `reality_amount` decimal(10,2) DEFAULT NULL COMMENT '实际奖励金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_manage`;
CREATE TABLE `ims_yz_commission_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '获奖者',
  `subordinate_id` int(11) DEFAULT NULL COMMENT '下级分销商',
  `subordinate_commission` decimal(12,2) DEFAULT NULL COMMENT '下级佣金',
  `hierarchy` int(11) DEFAULT NULL COMMENT '下级层级',
  `manage_rage` int(11) DEFAULT NULL COMMENT '管理奖比例',
  `manage_amount` decimal(12,2) DEFAULT NULL COMMENT '管理奖金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '管理奖状态 0未提现 1已提现',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_operation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_operation`;
CREATE TABLE `ims_yz_commission_operation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `buy_uid` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `ratio` decimal(10,2) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_order`;
CREATE TABLE `ims_yz_commission_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `ordertable_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordertable_id` int(11) DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `commission_amount` decimal(14,2) DEFAULT '0.00',
  `formula` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hierarchy` int(11) DEFAULT '1',
  `commission_rate` decimal(14,2) DEFAULT '0.00',
  `commission` decimal(14,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT '0',
  `recrive_at` int(11) DEFAULT NULL,
  `settle_days` int(11) DEFAULT '0',
  `statement_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `withdraw` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_commission_order_ordertable_id_index` (`ordertable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_order_goods`;
CREATE TABLE `ims_yz_commission_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commission_order_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_commission` tinyint(1) DEFAULT NULL,
  `commission_rate` int(11) DEFAULT NULL,
  `commission_pay` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_conference_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_conference_activity`;
CREATE TABLE `ims_yz_conference_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL COMMENT '表单ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `max_limit` int(11) DEFAULT NULL COMMENT '报名人数最大限制',
  `starttime` int(11) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '结束时间',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动图片',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '活动介绍',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分享标题',
  `share_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分享图标',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分享描述',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `love` int(11) DEFAULT NULL COMMENT '爱心值',
  `send_level_ids` text COLLATE utf8mb4_unicode_ci COMMENT '发送消息的会员ids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_conference_enrol
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_conference_enrol`;
CREATE TABLE `ims_yz_conference_enrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_data_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_consume_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_consume_coupon_log`;
CREATE TABLE `ims_yz_consume_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `member_id` int(11) DEFAULT '0' COMMENT '会员id',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型1获得2使用',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '变化数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='一卡通消费券记录';

-- ----------------------------
-- Table structure for ims_yz_converge_pay_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_bank_card`;
CREATE TABLE `ims_yz_converge_pay_bank_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `receiverAccountNoEnc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人银行卡卡号',
  `receiverNameEnc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人银行卡持卡人名称',
  `receiverAccountType` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账户类型, 对私账户: 201;对公账户: 204',
  `receiverBankChannelNo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款账户联行号, 对公账户必须填写此字段',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_bank_card_member_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_bank_card_member_default`;
CREATE TABLE `ims_yz_converge_pay_bank_card_member_default` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '银行卡关联会员 id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `default` int(11) NOT NULL COMMENT '会员默认银行卡 id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_withdraw_card_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_withdraw_card_log`;
CREATE TABLE `ims_yz_converge_pay_withdraw_card_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `card_id` int(11) NOT NULL COMMENT '银行卡id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_withdraw_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_withdraw_log`;
CREATE TABLE `ims_yz_converge_pay_withdraw_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `withdraw_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商城提现号',
  `merchantOrderNo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '汇聚请求号',
  `paidAmount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '提现状态',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT '提现请求数据',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT '提现返回数据',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误信息',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `withdraw_type` tinyint(4) DEFAULT '0' COMMENT '提现类型:0商城1供应商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_pay_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_pay_bank_card`;
CREATE TABLE `ims_yz_converge_quick_pay_bank_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `request_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求号',
  `bank_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属银行',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属银行名称',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡号',
  `sign_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑卡签约ID',
  `payer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '持卡人姓名',
  `payer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡绑定手机号',
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '持卡人证件号',
  `expire_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '信用卡有效期',
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '信用卡CVV安全码',
  `id_type` tinyint(4) DEFAULT NULL COMMENT '持卡人证件类型',
  `bank_type` tinyint(4) DEFAULT '0' COMMENT '银行卡类型',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_pay_order`;
CREATE TABLE `ims_yz_converge_quick_pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `pay_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求号',
  `jp_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '汇聚平台流水号',
  `mch_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商城支付订单号',
  `bank_trx_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行流水号',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡号',
  `sign_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑卡签约ID',
  `order_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单状态',
  `pay_type` tinyint(4) DEFAULT '0' COMMENT '产品类型：1：直接 2：协议',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付完成时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单错误码',
  `err_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单错误码描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_refund_order`;
CREATE TABLE `ims_yz_converge_quick_refund_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `refund_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款请求号',
  `refund_trx_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '汇聚退款流水号',
  `mch_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商城支付订单号',
  `refund_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '退款状态',
  `refund_at` int(11) DEFAULT NULL COMMENT '退款完成时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单错误码',
  `err_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单错误码描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_core_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_core_attachment`;
CREATE TABLE `ims_yz_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `module_upload_dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `upload_type` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT '0',
  `timeline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_core_attachment_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_core_attachment_tags`;
CREATE TABLE `ims_yz_core_attachment_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `source_type` int(11) NOT NULL COMMENT '1图片2音频3视频',
  `tag_type` int(11) NOT NULL COMMENT '1系统分组2自定义分组',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `timeline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon`;
CREATE TABLE `ims_yz_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cat_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `get_type` tinyint(3) DEFAULT '0',
  `level_limit` int(11) NOT NULL DEFAULT '0',
  `get_max` int(11) DEFAULT '0',
  `get_limit_max` int(11) NOT NULL DEFAULT '0' COMMENT '每人每日限领数量',
  `get_limit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '每人每日限领状态',
  `use_type` tinyint(3) unsigned DEFAULT '0',
  `return_type` tinyint(3) DEFAULT '0',
  `bgcolor` varchar(255) DEFAULT '',
  `enough` int(11) NOT NULL DEFAULT '0',
  `coupon_type` tinyint(3) DEFAULT '0',
  `time_limit` tinyint(3) DEFAULT '0',
  `time_days` int(11) DEFAULT '0',
  `time_start` int(11) DEFAULT '0',
  `time_end` int(11) DEFAULT '0',
  `coupon_method` tinyint(4) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `deduct` decimal(10,2) DEFAULT '0.00',
  `back_type` tinyint(3) DEFAULT '0',
  `back_money` varchar(50) DEFAULT '',
  `back_credit` varchar(50) DEFAULT '',
  `back_redpack` varchar(50) DEFAULT '',
  `back_when` tinyint(3) DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `desc` text,
  `total` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `resp_desc` text,
  `resp_thumb` varchar(255) DEFAULT '',
  `resp_title` varchar(255) DEFAULT '',
  `resp_url` varchar(255) DEFAULT '',
  `credit` int(11) DEFAULT '0',
  `usecredit2` tinyint(3) DEFAULT '0',
  `remark` varchar(1000) DEFAULT '',
  `descnoset` tinyint(3) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `supplier_uid` int(11) DEFAULT '0',
  `getcashier` tinyint(1) NOT NULL DEFAULT '0',
  `cashiersids` text,
  `cashiersnames` text,
  `category_ids` text,
  `categorynames` text,
  `goods_names` text,
  `goods_ids` text,
  `storeids` text,
  `storenames` text,
  `member_tags_ids` text COMMENT '会员标签id组',
  `member_tags_names` text COMMENT '会员标签名称',
  `getstore` tinyint(1) NOT NULL DEFAULT '0',
  `getsupplier` tinyint(1) DEFAULT '0',
  `supplierids` text,
  `suppliernames` text,
  `createtime` int(11) DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `is_complex` tinyint(4) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `use_conditions` longtext COMMENT '使用条件',
  `is_integral_exchange_coupon` tinyint(4) NOT NULL DEFAULT '0' COMMENT '消费积分兑换优惠券：1-开启，0-关闭',
  `exchange_coupon_integral` decimal(10,2) DEFAULT NULL COMMENT '兑换优惠券需要消费积分',
  PRIMARY KEY (`id`),
  KEY `idx_catid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_category`;
CREATE TABLE `ims_yz_coupon_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `display_order` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_hotel`;
CREATE TABLE `ims_yz_coupon_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `hotel_id` int(11) DEFAULT NULL COMMENT '酒店id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_increase_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_increase_records`;
CREATE TABLE `ims_yz_coupon_increase_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT '每次新增的数量',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_coupon_increase_records_id_unique` (`id`),
  KEY `yz_coupon_increase_records_coupon_id_index` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券新增记录表';

-- ----------------------------
-- Table structure for ims_yz_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_log`;
CREATE TABLE `ims_yz_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `logno` varchar(255) DEFAULT '',
  `member_id` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `paystatus` tinyint(3) DEFAULT '0',
  `creditstatus` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `paytype` tinyint(3) DEFAULT '0',
  `getfrom` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_status` (`status`),
  KEY `idx_paystatus` (`paystatus`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_getfrom` (`getfrom`)
) ENGINE=InnoDB AUTO_INCREMENT=455074 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_contrast
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_contrast`;
CREATE TABLE `ims_yz_coupon_qr_contrast` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_coupon_id` int(11) DEFAULT NULL COMMENT '会员优惠券id',
  `random_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '随机数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `ids_qr_contrast_random_data` (`random_data`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_generate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_generate`;
CREATE TABLE `ims_yz_coupon_qr_generate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `coupon_type_id` int(11) DEFAULT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券类型名称',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二维码路径',
  `small` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序二维码路径',
  `generation_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '生成方式 1-公众号  2-小程序',
  `grant_num` int(11) NOT NULL DEFAULT '0' COMMENT '发放数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_record`;
CREATE TABLE `ims_yz_coupon_qr_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_slide_show
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_slide_show`;
CREATE TABLE `ims_yz_coupon_slide_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `slide_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片图片',
  `slide_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '幻灯片连接',
  `mini_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序连接',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_store`;
CREATE TABLE `ims_yz_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_use_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_use_log`;
CREATE TABLE `ims_yz_coupon_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `member_coupon_id` int(11) NOT NULL COMMENT '会员优惠券ID',
  `type` int(11) NOT NULL COMMENT '类型',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`coupon_id`),
  KEY `idx_membercouponid` (`member_coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cps_sub_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_member`;
CREATE TABLE `ims_yz_cps_sub_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `another_id` int(10) unsigned NOT NULL COMMENT '总平台会员id',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用key',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--会员表';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_order`;
CREATE TABLE `ims_yz_cps_sub_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `amount` decimal(10,2) NOT NULL COMMENT '订单金额',
  `bird_order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方订单号',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `bird_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方平台名',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态 0待完成 1已结算 -1已失效',
  `create_time` int(11) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `close_time` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `yun_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '芸订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--订单表';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_plat_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_plat_activity`;
CREATE TABLE `ims_yz_cps_sub_plat_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开启状态 0关闭 1开启',
  `another_id` int(10) unsigned NOT NULL COMMENT '必应鸟资源类型id',
  `another_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '必应鸟资源类型名',
  `web_poster_id` int(10) unsigned NOT NULL COMMENT '公众号海报id',
  `mini_poster_id` int(10) unsigned NOT NULL COMMENT '小程序海报id',
  `bottom_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '底部文本',
  `top_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '底部文本',
  `page_type` tinyint(4) NOT NULL DEFAULT '3' COMMENT '页面类型 1H5 2小程序 3H5+小程序',
  `visit_count` int(11) NOT NULL COMMENT '访问次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--推广资源表';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_plat_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_plat_activity_code`;
CREATE TABLE `ims_yz_cps_sub_plat_activity_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `code_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '二维码或小程序码图片链接',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--推广活动码表';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_reward_log`;
CREATE TABLE `ims_yz_cps_sub_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `amount` decimal(10,2) NOT NULL COMMENT '奖励金额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待奖励 1奖励完成',
  `reward_type` tinyint(4) NOT NULL COMMENT '1余额 2积分',
  `level` tinyint(4) NOT NULL COMMENT '层级',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--奖励记录表';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_set_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_set_log`;
CREATE TABLE `ims_yz_cps_sub_set_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `set_log` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置记录',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cps子平台--设置记录表';

-- ----------------------------
-- Table structure for ims_yz_cr_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_activity`;
CREATE TABLE `ims_yz_cr_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `rule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_buyer_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_buyer_count`;
CREATE TABLE `ims_yz_cr_buyer_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `cr_goods_id` int(10) unsigned NOT NULL,
  `buyer_count` int(10) unsigned NOT NULL,
  `buyer_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_buyer_count_cr_goods_id_index` (`cr_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_goods`;
CREATE TABLE `ims_yz_cr_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_order`;
CREATE TABLE `ims_yz_cr_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `reward_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_order_pay_time_state_activity_id_index` (`pay_time`,`state`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_order_goods`;
CREATE TABLE `ims_yz_cr_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `cr_goods_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `cr_order_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_order_goods_cr_order_id_index` (`cr_order_id`),
  KEY `yz_cr_order_goods_cr_goods_id_state_index` (`cr_goods_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_poster`;
CREATE TABLE `ims_yz_cr_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通二维码  2小程序码  3公众号码',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_reward_log`;
CREATE TABLE `ims_yz_cr_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `cr_order_id` int(10) unsigned NOT NULL,
  `coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未发放 1已发放',
  `prize_type` tinyint(4) NOT NULL,
  `prize_num` int(11) NOT NULL,
  `reward_type` tinyint(4) NOT NULL,
  `reward_amount` decimal(10,2) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cron_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cron_heartbeat`;
CREATE TABLE `ims_yz_cron_heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_time` int(11) DEFAULT NULL COMMENT '执行时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_decorate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate`;
CREATE TABLE `ims_yz_decorate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `member_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '浏览权限（会员等级）0为全部会员等级',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '0.不显示 自定义顶部导航id',
  `foot_type` int(11) NOT NULL DEFAULT '1' COMMENT '底部导航 0.不显示 1.系统默认 2.自定义',
  `foot_id` int(11) NOT NULL DEFAULT '0' COMMENT '自定义底部导航id',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面数据集合',
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `page_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '页面类型 0.其他 1.公众号 2.小程序 3.APP 4.支付宝 5.WAP',
  `page_sort` tinyint(4) NOT NULL DEFAULT '1' COMMENT ' 1.H5 2.小程序',
  `page_scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT '页面场景 1.首页 2.会员页 3.店铺',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `datas` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面组件数据集合',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1.删除 0.正常',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `cps_foot_type` int(11) NOT NULL DEFAULT '1' COMMENT 'cps底部导航 0.不显示 1.系统默认 2.自定义',
  `cps_foot_id` int(11) NOT NULL DEFAULT '0' COMMENT 'cps自定义底部导航id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--装修列表存放页面装修数据';

-- ----------------------------
-- Table structure for ims_yz_decorate_advertising
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_advertising`;
CREATE TABLE `ims_yz_decorate_advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '广告图',
  `show_time` int(11) NOT NULL DEFAULT '0' COMMENT '广告显示时间(秒)',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '广告类型 1.弹窗广告 2.全屏广告',
  `show_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '显示规则0.全屏广告 1.每次进入首页时 2.每日首次登陆小程序时',
  `url_type` int(11) NOT NULL DEFAULT '0' COMMENT '跳转链接类型 1.h5,2.小程序',
  `h_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'H5广告跳转链接',
  `s_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序广告跳转链接',
  `s_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序原始id',
  `is_minapp` int(11) NOT NULL DEFAULT '0' COMMENT '1.跳转页面，2，跳转小程序',
  `minapp_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序跳转小程序链接',
  `minapp_sid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序跳转小程序链接的id',
  `minapp_link2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序跳转页面',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `datas` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面组件数据集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--首屏广告';

-- ----------------------------
-- Table structure for ims_yz_decorate_diy_market
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_diy_market`;
CREATE TABLE `ims_yz_decorate_diy_market` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `sync_id` int(11) NOT NULL DEFAULT '0' COMMENT '远端模板id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类别',
  `page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板图片',
  `data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:已拉取，0:未拉取',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--diy市场';

-- ----------------------------
-- Table structure for ims_yz_decorate_footer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_footer`;
CREATE TABLE `ims_yz_decorate_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面数据集合',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `page_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 1.H5 2.小程序',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用 0.未启用 1.启用',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--底部导航';

-- ----------------------------
-- Table structure for ims_yz_decorate_templet
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_templet`;
CREATE TABLE `ims_yz_decorate_templet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板图片',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板编号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '模板类型 会员中心=1 推广中心=2 分类中心=3 商品模版=4 商品列表=5',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--模板管理';

-- ----------------------------
-- Table structure for ims_yz_decorate_top
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_top`;
CREATE TABLE `ims_yz_decorate_top` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面数据集合',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `top_type` int(11) NOT NULL DEFAULT '1' COMMENT '1.h5 2.小程序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新页面装修--顶部导航';

-- ----------------------------
-- Table structure for ims_yz_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_deduction`;
CREATE TABLE `ims_yz_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '抵扣名称',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '抵扣开启',
  `created_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch`;
CREATE TABLE `ims_yz_dispatch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `dispatch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送模板名称',
  `display_order` int(11) DEFAULT NULL COMMENT '排序',
  `enabled` tinyint(3) DEFAULT NULL COMMENT '是否显示（1：是；0：否）',
  `is_default` tinyint(3) DEFAULT NULL COMMENT '是否默认模板（1：是；0：否）',
  `calculate_type` tinyint(3) DEFAULT NULL COMMENT '计费方式',
  `areas` text COLLATE utf8mb4_unicode_ci COMMENT '配送区域',
  `first_weight` int(11) DEFAULT NULL COMMENT '首重克数',
  `another_weight` int(11) DEFAULT NULL COMMENT '续重克数',
  `first_weight_price` decimal(14,2) DEFAULT NULL COMMENT '首重价格',
  `another_weight_price` decimal(14,2) DEFAULT NULL COMMENT '续重价格',
  `first_piece` int(11) DEFAULT NULL COMMENT '首件个数',
  `another_piece` int(11) DEFAULT NULL COMMENT '续件个数',
  `first_piece_price` decimal(14,2) DEFAULT NULL COMMENT '首件价格',
  `another_piece_price` decimal(14,2) DEFAULT NULL COMMENT '续件价格',
  `weight_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '按重量计费数据',
  `piece_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '按数量计费数据',
  `is_plugin` tinyint(3) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch_classify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_classify`;
CREATE TABLE `ims_yz_dispatch_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `dispatch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freight_type` tinyint(4) NOT NULL COMMENT '运费类型',
  `freight_value` int(11) DEFAULT NULL COMMENT '固定运费值',
  `template_id` int(11) DEFAULT NULL COMMENT '运费模板ID',
  `is_cod` int(11) NOT NULL COMMENT '是否支持貨到付款',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_type`;
CREATE TABLE `ims_yz_dispatch_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `plugin` int(11) NOT NULL,
  `need_send` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_dispatch_type_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_type_set`;
CREATE TABLE `ims_yz_dispatch_type_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `dispatch_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送方式ID',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  `enable` tinyint(4) DEFAULT '0' COMMENT '是否开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispatch_type_idx` (`dispatch_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配送方式设置';

-- ----------------------------
-- Table structure for ims_yz_distribution_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_distribution_order`;
CREATE TABLE `ims_yz_distribution_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `commission_order_num` int(11) NOT NULL DEFAULT '0' COMMENT '分销订单数',
  `commission_order_prices` decimal(65,2) NOT NULL DEFAULT '0.00' COMMENT '分销订单业绩',
  `team_people_num` int(11) NOT NULL DEFAULT '0' COMMENT '团队总人数',
  `team_commission_order_prices` decimal(65,2) NOT NULL DEFAULT '0.00' COMMENT '团队分销订单业绩',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_cashier
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_cashier`;
CREATE TABLE `ims_yz_diy_queue_cashier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashier_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '是否开启自定义队列',
  `is_independent` int(11) DEFAULT NULL COMMENT '是否开启独立规则',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT '时间段',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT '限制条件',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_hotel`;
CREATE TABLE `ims_yz_diy_queue_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '是否开启自定义队列',
  `is_independent` int(11) DEFAULT NULL COMMENT '是否开启独立规则',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT '时间段',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT '限制条件',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `extract_ratio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_store`;
CREATE TABLE `ims_yz_diy_queue_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '是否开启自定义队列',
  `is_independent` int(11) DEFAULT NULL COMMENT '是否开启独立规则',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT '时间段',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT '限制条件',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `extract_ratio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_data`;
CREATE TABLE `ims_yz_diyform_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `form_id` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `form_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_typeid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_order`;
CREATE TABLE `ims_yz_diyform_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_order_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_order_content`;
CREATE TABLE `ims_yz_diyform_order_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_type`;
CREATE TABLE `ims_yz_diyform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表单标题',
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `success` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交成功提示文本',
  `submit_number` int(11) DEFAULT NULL COMMENT '允许提交次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `share_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_type_member_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_type_member_data`;
CREATE TABLE `ims_yz_diyform_type_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `form_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `form_data_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_activity`;
CREATE TABLE `ims_yz_draw_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countdown_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_type` tinyint(4) DEFAULT NULL COMMENT '参与人身份',
  `member_type` tinyint(4) DEFAULT NULL COMMENT '会员/推广员',
  `level_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员等级id',
  `draw_type` tinyint(4) DEFAULT NULL COMMENT '活动抽奖方式0无限制/1积分/2爱心值',
  `use_point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消耗积分',
  `use_love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消耗爱心值',
  `partake_times` tinyint(4) DEFAULT NULL COMMENT '参与次数类型0每天/1每人',
  `days_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '每天可抽',
  `days_share_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '每天分享获得次数',
  `somebody_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '每人可抽',
  `somebody_share_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '每人分享获得次数',
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品id组',
  `empty_prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '空奖名称',
  `empty_prize_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '空奖图片',
  `empty_prize_prompt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提示语',
  `jump_type` tinyint(4) DEFAULT NULL COMMENT '跳转类型0无跳转/1有跳转',
  `jump_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转链接',
  `partake_point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与送积分',
  `partake_love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与送爱心值',
  `partake_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与送余额',
  `partake_coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与送优惠卷',
  `limit` tinyint(4) DEFAULT NULL COMMENT '参与奖限制0未中奖者/1所有人',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景图',
  `background_colour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景色',
  `is_logo` tinyint(4) DEFAULT NULL COMMENT '商家logo不展示0/1展示',
  `is_roster` tinyint(4) DEFAULT NULL COMMENT '中奖名单不展示0/1展示',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '活动说明',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_times` int(11) DEFAULT '0' COMMENT '抽奖人数',
  `member_draw_times` int(11) DEFAULT '0' COMMENT '中奖人数',
  `success_app_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成功跳转公众号链接',
  `success_mini_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成功跳转小程序链接',
  `describe_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动描述',
  `prize_name` int(11) NOT NULL DEFAULT '1' COMMENT '奖品名称 (1=展示, 0=不展示)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_by_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_by_member`;
CREATE TABLE `ims_yz_draw_by_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `log` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_prize
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_prize`;
CREATE TABLE `ims_yz_draw_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠卷id',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT '积分',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT '爱心值',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT '余额',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize_num` int(11) DEFAULT NULL COMMENT '奖品数量',
  `chance` double(14,2) DEFAULT NULL COMMENT '中奖概率',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `coupon_num` int(11) NOT NULL DEFAULT '1' COMMENT '优惠券数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_prize_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_prize_record`;
CREATE TABLE `ims_yz_draw_prize_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` decimal(14,2) DEFAULT NULL,
  `love` decimal(14,2) DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_share`;
CREATE TABLE `ims_yz_draw_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_order_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_order_package`;
CREATE TABLE `ims_yz_electronics_bill_order_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `package_goods` text COLLATE utf8mb4_unicode_ci COMMENT '包裹商品',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_electronics_bill_order_package_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子面单----订单包裹表';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_panel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_panel`;
CREATE TABLE `ims_yz_electronics_bill_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `panel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单名称',
  `panel_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单客户账号',
  `panel_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单密码',
  `panel_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '月结编码',
  `panel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件网点标识',
  `panel_style` int(11) NOT NULL COMMENT '模板样式',
  `exhelper_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递类型',
  `exhelper_type` int(11) NOT NULL DEFAULT '0' COMMENT '快递/快运业务类型',
  `is_self` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通知快递员上门揽件',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL COMMENT '快递员揽件日期',
  `begin_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递员揽件开始时间',
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递员揽件结束时间',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子面单----电子面单模板表';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_send_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_send_user`;
CREATE TABLE `ims_yz_electronics_bill_send_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子面单----收件人信息表';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_sys`;
CREATE TABLE `ims_yz_electronics_bill_sys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '打印机ip',
  `port` int(11) DEFAULT '0' COMMENT '打印机端口',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '打印机名称',
  `apikey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'APPID',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'APPSecret',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子面单----打印信息表';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_template`;
CREATE TABLE `ims_yz_electronics_bill_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `print_template` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '面单打印模板内容(html格式)',
  `mark_destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '大头笔',
  `logistic_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递单号',
  `shipper_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `package_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '集包编码',
  `sorting_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分拣编码',
  `sub_count` int(11) NOT NULL COMMENT '子单数量',
  `ebusiness_id` int(11) NOT NULL COMMENT '用户ID',
  `uniquer_request_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '唯一标识',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '返回编码',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '失败原因',
  `success` tinyint(4) NOT NULL COMMENT '成功与否(true/false)',
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_electronics_bill_template_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子面单----打印模板存放表';

-- ----------------------------
-- Table structure for ims_yz_embargoed_area_goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_embargoed_area_goods_goods`;
CREATE TABLE `ims_yz_embargoed_area_goods_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `area_ids` text COLLATE utf8mb4_unicode_ci COMMENT '区域ids',
  `province_ids` text COLLATE utf8mb4_unicode_ci COMMENT '省ids',
  `areas` text COLLATE utf8mb4_unicode_ci COMMENT '区域名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='禁运区域--商品挂件';

-- ----------------------------
-- Table structure for ims_yz_error_commission_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_error_commission_order`;
CREATE TABLE `ims_yz_error_commission_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_order_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `order_id` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci,
  `commission_amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_error_team_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_error_team_dividend`;
CREATE TABLE `ims_yz_error_team_dividend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_dividend_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `order_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci,
  `dividend_amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_excel_recharge_detail
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_excel_recharge_detail`;
CREATE TABLE `ims_yz_excel_recharge_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `recharge_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_excel_recharge_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_excel_recharge_records`;
CREATE TABLE `ims_yz_excel_recharge_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总个数',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总数量',
  `failure` int(11) NOT NULL DEFAULT '0' COMMENT '失败数',
  `success` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '成功数',
  `source` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_delivery`;
CREATE TABLE `ims_yz_exhelper_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `width` decimal(10,2) DEFAULT NULL COMMENT '单据宽度',
  `height` decimal(10,2) DEFAULT NULL COMMENT '单据高度',
  `supplier_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  `supplier_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商电话',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='快递助手--送货单模板';

-- ----------------------------
-- Table structure for ims_yz_exhelper_electronic_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_electronic_template`;
CREATE TABLE `ims_yz_exhelper_electronic_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_template` longtext COLLATE utf8mb4_unicode_ci,
  `mark_destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logistic_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipper_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdn_order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_count` int(11) NOT NULL,
  `ebusiness_id` int(11) NOT NULL,
  `uniquer_request_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_express`;
CREATE TABLE `ims_yz_exhelper_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `expressname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `expresscom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `express` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` decimal(10,2) DEFAULT '0.00',
  `datas` text COLLATE utf8mb4_unicode_ci,
  `height` decimal(10,2) DEFAULT '0.00',
  `bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_goods`;
CREATE TABLE `ims_yz_exhelper_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `short_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_order`;
CREATE TABLE `ims_yz_exhelper_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_panel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_panel`;
CREATE TABLE `ims_yz_exhelper_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `panel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单名称',
  `panel_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单客户账号',
  `panel_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子面单密码',
  `panel_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '月结编码',
  `panel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件网点标识',
  `panel_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模板样式',
  `exhelper_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递类型',
  `isself` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通知快递员上门揽件',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `begin_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  `exhelper_type` int(11) DEFAULT '0' COMMENT '快递/快运业务类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_print
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_print`;
CREATE TABLE `ims_yz_exhelper_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `express_print_status` tinyint(1) NOT NULL DEFAULT '0',
  `send_print_status` tinyint(1) NOT NULL DEFAULT '0',
  `panel_print_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_senduser
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_senduser`;
CREATE TABLE `ims_yz_exhelper_senduser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_code` int(11) DEFAULT NULL,
  `sender_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sender_province` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_area` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_street` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_sys`;
CREATE TABLE `ims_yz_exhelper_sys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `port` int(11) DEFAULT '0',
  `apikey` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `merchant_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_template_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_template_log`;
CREATE TABLE `ims_yz_exhelper_template_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_express_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_express_company`;
CREATE TABLE `ims_yz_express_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快递公司名称',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快递公司编码',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups`;
CREATE TABLE `ims_yz_fight_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动标题',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '商家说明',
  `menu_show` tinyint(1) DEFAULT '0' COMMENT '隐藏开关',
  `hide_num` int(11) DEFAULT '0' COMMENT '当参团人数达到多少时开团按钮不显示',
  `is_integral` tinyint(1) DEFAULT '0' COMMENT '团长送积分',
  `integral_num` decimal(14,2) DEFAULT '0.00' COMMENT '送多少积分',
  `is_lead` tinyint(1) DEFAULT '0' COMMENT '老拉新',
  `setting` int(11) DEFAULT '0' COMMENT '拼团设置',
  `barrage` tinyint(1) DEFAULT '0' COMMENT '弹幕设置',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分享标题',
  `share_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分享内容',
  `desc_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '详情标题',
  `desc_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '详情内容',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_love` int(11) DEFAULT NULL COMMENT '是否开启爱心值',
  `love` decimal(14,2) DEFAULT NULL COMMENT '奖励爱心值',
  `is_balance` int(11) DEFAULT NULL COMMENT '是否开启余额',
  `balance` decimal(14,2) DEFAULT NULL COMMENT '奖励余额',
  `is_coupon` int(11) DEFAULT NULL COMMENT '是否开启优惠卷',
  `coupon` text COLLATE utf8mb4_unicode_ci COMMENT '优惠卷',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  `plugin_id` int(11) DEFAULT '0' COMMENT '商品类型',
  `commissions` text COLLATE utf8mb4_unicode_ci COMMENT '分销等级',
  `c_level` tinyint(4) DEFAULT NULL COMMENT '分销默认等级',
  `is_consumption_points` int(11) DEFAULT '0' COMMENT '是否开启团长赠送消费积分:0不赠送 1赠送',
  `consumption_points` decimal(14,2) DEFAULT '0.00' COMMENT '赠送团长消费积分值',
  `is_join_number` tinyint(4) NOT NULL DEFAULT '0' COMMENT '限制参与活动次数',
  `join_number` int(11) NOT NULL DEFAULT '0' COMMENT '每人每天参与活动总次数',
  `parent_reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '拼团成团奖-上级获得奖励（余额）',
  `parent_every_group` int(11) NOT NULL DEFAULT '0' COMMENT '拼团成团奖-人/组',
  `parent_reward_max` int(11) NOT NULL DEFAULT '0' COMMENT '拼团成团奖-封顶奖励次数',
  `open_group_max` int(11) NOT NULL DEFAULT '0' COMMENT '拼团成团奖-团长正在开团中的活动限制（次数）',
  `is_team_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '限制参与活动次数',
  `balance_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '团长送余额分销等级奖励开关',
  `commissions_num` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分销等级开团次数限制规则设置',
  `commissions_balance` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '团长送余额分销等级独立规则设置',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_credit_line
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_credit_line`;
CREATE TABLE `ims_yz_fight_groups_credit_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `credit_score` tinyint(4) NOT NULL DEFAULT '100' COMMENT '信用分',
  `blacklist_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '黑名单状态,1-进入了黑名单',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团活动--信用度表';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_level`;
CREATE TABLE `ims_yz_fight_groups_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `group_id` int(11) NOT NULL COMMENT '活动id',
  `level_num` int(11) NOT NULL COMMENT '层级',
  `member_num` int(11) NOT NULL COMMENT '拼团人数',
  `expire_in` double(14,1) NOT NULL COMMENT '拼团时间',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态信息,如手动结束',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery`;
CREATE TABLE `ims_yz_fight_groups_lottery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团表fight_groups的主键ID',
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启抽奖 0.关闭 1.开启',
  `is_separate_rules` int(11) NOT NULL DEFAULT '0' COMMENT '是否独立规则 0.否 1.是',
  `commander_set` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖规则 团长设置 0.无限制 1.必中 2.必不中',
  `first_set` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖规则 新会员设置 0.无限制 1.必中 2.必不中',
  `winning_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '抽中会员奖励',
  `loser_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '未抽中会员奖励',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `is_old` int(11) NOT NULL DEFAULT '0' COMMENT '0旧数据不处理，1新添加数据(兼容旧的活动)',
  `win_number` int(11) NOT NULL DEFAULT '1' COMMENT '中奖人数',
  `loser_parent_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '未中奖上级奖励',
  `loser_credit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '未中奖奖励类型；0-平均分,1-每人固定奖励',
  `is_winning_thaw_love` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启中奖解冻爱心值:1-开启,0-关闭',
  `winning_thaw_love_limit` int(11) NOT NULL DEFAULT '0' COMMENT '累计中奖次数',
  `winning_thaw_love_number` int(11) NOT NULL DEFAULT '0' COMMENT '解冻爱心值个数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_fight_groups_lottery_fight_groups_id_unique` (`fight_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团抽奖--拼团抽奖设置';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团表fight_groups的主键ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT '团长id',
  `is_refund` int(11) NOT NULL DEFAULT '0' COMMENT '是否退款成功0不成功，1成功',
  `is_win` int(11) NOT NULL DEFAULT '0' COMMENT '是否中奖0不中奖，1中奖',
  `team_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'FightGroupsTeamMember表ID',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '积分奖励',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '爱心值奖励',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '余额奖励',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '消费积分奖励',
  `refund_type` int(11) NOT NULL DEFAULT '0' COMMENT '退款类型1.原路退款，2退款到余额',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团抽奖--拼团抽奖奖励记录';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_reward`;
CREATE TABLE `ims_yz_fight_groups_lottery_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团表fight_groups的主键ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT '团长id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_sn` int(11) NOT NULL DEFAULT '0' COMMENT '订单号',
  `is_win` int(11) NOT NULL DEFAULT '0' COMMENT '是否中奖0不中奖，1中奖',
  `team_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'FightGroupsTeamMember表ID',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '积分奖励',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '爱心值奖励',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '余额奖励',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '消费积分奖励',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `reward_status` int(11) NOT NULL DEFAULT '0' COMMENT '奖励发放状态：0未发放，1已经发放',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_lottery_reward_order_id_index` (`order_id`),
  KEY `yz_fight_groups_lottery_reward_team_member_id_index` (`team_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团抽奖--拼团抽奖奖励';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_reward_auxiliary
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_reward_auxiliary`;
CREATE TABLE `ims_yz_fight_groups_lottery_reward_auxiliary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `reward_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '奖励会员id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖会员id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '奖励类型1.会员上级奖励',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT '团id',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '积分奖励',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '爱心值奖励',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '余额奖励',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '消费积分奖励',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `reward_status` int(11) NOT NULL DEFAULT '0' COMMENT '奖励发放状态：0未发放，1已经发放',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团抽奖--奖励记录副表';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_winning_accumulate_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_winning_accumulate_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_winning_accumulate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团表fight_groups的主键ID',
  `winning_total` int(11) NOT NULL DEFAULT '0' COMMENT '该活动会员总累积中奖次数',
  `surplus_winning_total` int(11) NOT NULL DEFAULT '0' COMMENT '剩余中奖次数',
  `love_activate_total` int(11) NOT NULL DEFAULT '0' COMMENT '爱心值激活次数',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团奖励--会员中奖解冻爱心值累计表（二开解冻爱心值需求）';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_winning_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_winning_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_winning_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团表fight_groups的主键ID(活动ID)',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT '团id',
  `activity_rules` text COLLATE utf8mb4_unicode_ci COMMENT '部分活动规则',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼团奖励--会员中奖解冻爱心值记录表（二开解冻爱心值需求）';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_option`;
CREATE TABLE `ims_yz_fight_groups_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `group_id` int(11) NOT NULL COMMENT '活动id',
  `option_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品规格id',
  `option_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '单规格' COMMENT '商品规格名称',
  `option_price` decimal(14,2) NOT NULL COMMENT '原价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '活动库存',
  `buy_limit` int(11) NOT NULL DEFAULT '0' COMMENT '限购件数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_option_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_option_level`;
CREATE TABLE `ims_yz_fight_groups_option_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `groups_option_id` int(11) NOT NULL COMMENT '活动规格id',
  `level_id` int(11) NOT NULL COMMENT '层级id',
  `option_id` int(11) NOT NULL COMMENT '冗余,商品规格id',
  `group_price` decimal(14,2) NOT NULL COMMENT '拼团价格',
  `member_num` int(11) NOT NULL DEFAULT '0' COMMENT '冗余,拼团人数',
  `group_id` int(11) NOT NULL COMMENT '冗余,活动id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_point_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_point_deduction`;
CREATE TABLE `ims_yz_fight_groups_point_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `point` decimal(8,2) DEFAULT NULL,
  `point_type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_team
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_team`;
CREATE TABLE `ims_yz_fight_groups_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `group_id` int(11) NOT NULL COMMENT '活动id',
  `level_id` int(11) NOT NULL COMMENT '层级id',
  `leader_id` int(11) NOT NULL COMMENT '团长id,对应会员id',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `status` int(11) DEFAULT '0' COMMENT '拼团状态',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '成功或失败的信息,如团长未支付',
  `is_virtual` int(11) DEFAULT '0' COMMENT '是否虚拟成团',
  `success_time` int(11) DEFAULT NULL COMMENT '成团时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_team_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_team_member`;
CREATE TABLE `ims_yz_fight_groups_team_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `group_id` int(11) NOT NULL COMMENT '活动id',
  `level_id` int(11) NOT NULL COMMENT '层级id',
  `team_id` int(11) NOT NULL COMMENT '团id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `option_id` int(11) DEFAULT '0' COMMENT '规格id',
  `purchase_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `price` decimal(14,2) NOT NULL COMMENT '拼团单价',
  `total_price` decimal(14,2) NOT NULL COMMENT '拼团总价',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `status` int(11) DEFAULT '0' COMMENT '参团状态',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态信息,如手动结束',
  `join_time` int(11) DEFAULT NULL COMMENT '参团时间(支付时间)',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `is_leader` tinyint(1) DEFAULT '0' COMMENT '冗余,是否团长',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  `plugin_id` int(11) DEFAULT '0' COMMENT '商品类型',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_team_member_team_id_index` (`team_id`),
  KEY `yz_fight_groups_team_member_order_id_index` (`order_id`),
  KEY `yz_fight_groups_team_member_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_first_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_first_order`;
CREATE TABLE `ims_yz_first_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `shop_order_set` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_flow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_flow`;
CREATE TABLE `ims_yz_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure`;
CREATE TABLE `ims_yz_forwarding_treasure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `start_datetime` datetime NOT NULL COMMENT '开始时间',
  `end_datetime` datetime NOT NULL COMMENT '结束时间',
  `not_start_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动未开始提示语',
  `end_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动已结束提示语',
  `activity_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动关键字',
  `activity_type` tinyint(4) DEFAULT '1' COMMENT '活动类型 1分享链接2分享海报',
  `rule_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动规则及回复',
  `transpond_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '转发链接',
  `transpond_link_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接页面标题/同样也是验证使用的内容',
  `poster_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分享海报文案',
  `poster_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说明文案图片',
  `poster_image_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信资源id',
  `poster_id` int(11) NOT NULL COMMENT '海报id（新海报插件）',
  `number_astrict` int(11) NOT NULL COMMENT '限制条件 参与人数',
  `number_astrict_type` tinyint(4) NOT NULL COMMENT '是否限制人数 1是2否',
  `area_type` tinyint(4) NOT NULL COMMENT '是否限制区域 1是2否',
  `area_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '限制区域 serialize函数',
  `share_type` tinyint(4) DEFAULT '1' COMMENT '分享渠道 1朋友圈 2微信群',
  `review_type` tinyint(4) DEFAULT '1' COMMENT '审核类型 1AI识别 2人工审核 ',
  `time` int(11) NOT NULL COMMENT '分享停留时间 0为不限制',
  `time_type` tinyint(4) DEFAULT '1' COMMENT '分享停留时间单位 1分钟 2小时 3天',
  `not_retention_time_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '未达到留存时间提示语',
  `grouping_is_visible_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置了分组可见提示语',
  `set_private_send_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置了私密发送提示语',
  `fail_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '识别失败提示语',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动海报宣传图片（用于生成活动海报）',
  `propaganda_poster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣传海报',
  `propaganda_poster_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣传海报微信资源id 宣传海报微信资源id 背景颜色 广告语 参与人数如果没有发生改变则不额外生成海报',
  `participation` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上次生成海报的参数serialize函数 用来对比如果不一致则重新生成',
  `qrcode_id` int(11) NOT NULL COMMENT '公众号二维码 二维码与活动关联',
  `backgroundcolor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '背景颜色',
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告语',
  `thumb_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动宣传海报关键词',
  `num` int(11) NOT NULL COMMENT '分享微信群人数要求 0代表不限制',
  `group_num_not_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信群人数不达标提示语',
  `integral` int(11) NOT NULL COMMENT '积分',
  `balance` decimal(8,2) NOT NULL COMMENT '余额',
  `wechat_red_racket` int(11) NOT NULL COMMENT '微信红包',
  `consumption_points` int(11) NOT NULL COMMENT '消费积分',
  `award_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖励通知',
  `advertising_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告图片',
  `advertising_image_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告图片微信资源id',
  `is_lose_efficacy` tinyint(4) DEFAULT '2' COMMENT '是否失效 1是2否',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转发宝活动表';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_coupon`;
CREATE TABLE `ims_yz_forwarding_treasure_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT '转发宝活动id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `coupon_several` int(11) NOT NULL COMMENT '发放个数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转发宝优惠券关联表';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_image
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_image`;
CREATE TABLE `ims_yz_forwarding_treasure_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT '转发宝活动id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信资源id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转发宝分享海报图片(不是活动海报)';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_log`;
CREATE TABLE `ims_yz_forwarding_treasure_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uniacid` int(11) NOT NULL,
  `forwarding_treasure_id` int(11) NOT NULL COMMENT '转发宝活动id',
  `member_id` int(11) NOT NULL,
  `request_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求信息',
  `return_param` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '返回信息',
  `is_fee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该记录是否计费，0为未计费',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转发宝--芸签接口请求记录';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_member`;
CREATE TABLE `ims_yz_forwarding_treasure_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT '活动id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态1未转发2未通过3已通过',
  `count` int(11) NOT NULL COMMENT '已验证的次数（N次之后就不可以再验证了）',
  `screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证的截图',
  `integral` int(11) NOT NULL COMMENT '积分',
  `balance` decimal(8,2) NOT NULL COMMENT '余额',
  `wechat_red_racket` int(11) NOT NULL COMMENT '微信红包',
  `consumption_points` int(11) NOT NULL COMMENT '消费积分',
  `coupon` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发放的优惠券奖励 serialize函数',
  `reward_information` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖励信息 （用户替换”{奖励信息}“ 与发放完后台奖励显示）',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `group_num` int(11) NOT NULL DEFAULT '0' COMMENT '群聊人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转发宝用户表';

-- ----------------------------
-- Table structure for ims_yz_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods`;
CREATE TABLE `ims_yz_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) DEFAULT '0',
  `title` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` text,
  `sku` varchar(5) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `content` longtext,
  `goods_sn` varchar(50) DEFAULT '',
  `product_sn` varchar(50) DEFAULT '',
  `market_price` decimal(14,2) DEFAULT '0.00',
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(14,2) DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `reduce_stock_method` int(11) DEFAULT '0',
  `show_sales` int(11) DEFAULT '0',
  `real_sales` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `has_option` int(11) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_discount` tinyint(1) DEFAULT '0',
  `is_recommand` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `virtual_sales` int(11) DEFAULT '0',
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要填写收货地址 0:是1:否',
  `type2` tinyint(1) DEFAULT '1' COMMENT '商品类型2',
  `old_id` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT '体积',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '商品别名',
  PRIMARY KEY (`id`,`is_deleted`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isnew` (`is_new`),
  KEY `idx_ishot` (`is_hot`),
  KEY `idx_isdiscount` (`is_discount`),
  KEY `idx_isrecommand` (`is_recommand`),
  KEY `idx_iscomment` (`is_comment`),
  KEY `idx_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1616 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_advertising
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_advertising`;
CREATE TABLE `ims_yz_goods_advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT '广告宣传语开关',
  `copywriting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文案',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `font_size` int(11) NOT NULL DEFAULT '0' COMMENT '字体大小',
  `font_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字体颜色',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `min_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序链接',
  PRIMARY KEY (`id`),
  KEY `yz_goods_advertising_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告宣传语记录表';

-- ----------------------------
-- Table structure for ims_yz_goods_area
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_area`;
CREATE TABLE `ims_yz_goods_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与商品区域插件关联表';

-- ----------------------------
-- Table structure for ims_yz_goods_area_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_area_dividend`;
CREATE TABLE `ims_yz_goods_area_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_dividend` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `has_dividend` tinyint(4) NOT NULL DEFAULT '3',
  `has_dividend_price` decimal(10,2) DEFAULT '0.00',
  `has_dividend_rate` decimal(10,2) DEFAULT '0.00',
  `alone_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用独立规则，0不启用',
  `province_rate` decimal(8,2) DEFAULT NULL COMMENT '省比例',
  `city_rate` decimal(8,2) DEFAULT NULL COMMENT '市比例',
  `area_rate` decimal(8,2) DEFAULT NULL COMMENT '区/县比例',
  `street_rate` decimal(8,2) DEFAULT NULL COMMENT '街道比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_bonus`;
CREATE TABLE `ims_yz_goods_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `bonus_money` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与分红关联表';

-- ----------------------------
-- Table structure for ims_yz_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_category`;
CREATE TABLE `ims_yz_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL COMMENT '分类组关联商品规格ID',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2224 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ims_yz_goods_commission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_commission`;
CREATE TABLE `ims_yz_goods_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_commission` int(11) DEFAULT NULL,
  `show_commission_button` tinyint(1) NOT NULL DEFAULT '0',
  `poster_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_commission` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=774 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_copy1
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_copy1`;
CREATE TABLE `ims_yz_goods_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) DEFAULT '0',
  `title` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` text,
  `sku` varchar(5) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `content` longtext,
  `goods_sn` varchar(50) DEFAULT '',
  `product_sn` varchar(50) DEFAULT '',
  `market_price` decimal(14,2) DEFAULT '0.00',
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(14,2) DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `reduce_stock_method` int(11) DEFAULT '0',
  `show_sales` int(11) DEFAULT '0',
  `real_sales` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `has_option` int(11) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_discount` tinyint(1) DEFAULT '0',
  `is_recommand` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `virtual_sales` int(11) DEFAULT '0',
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要填写收货地址 0:是1:否',
  `type2` tinyint(1) DEFAULT '1' COMMENT '商品类型2',
  `old_id` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT '体积',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '商品别名',
  PRIMARY KEY (`id`,`is_deleted`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isnew` (`is_new`),
  KEY `idx_ishot` (`is_hot`),
  KEY `idx_isdiscount` (`is_discount`),
  KEY `idx_isrecommand` (`is_recommand`),
  KEY `idx_iscomment` (`is_comment`),
  KEY `idx_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_coupon`;
CREATE TABLE `ims_yz_goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_give` tinyint(1) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `send_type` tinyint(1) DEFAULT NULL COMMENT '发送时间',
  `send_num` int(11) DEFAULT NULL COMMENT '发放次数',
  `shopping_share` tinyint(4) NOT NULL DEFAULT '0' COMMENT '购买分享优惠券开关',
  `share_coupon` text COLLATE utf8mb4_unicode_ci COMMENT '分享优惠券',
  `no_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '禁止使用优惠券,1开启（不可使用），0关闭',
  `use_num` int(11) DEFAULT NULL COMMENT '可使用数量',
  `is_use_num` tinyint(4) DEFAULT '0' COMMENT '可使用数量开关',
  PRIMARY KEY (`id`),
  KEY `goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_coupon_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_coupon_queue`;
CREATE TABLE `ims_yz_goods_coupon_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `uid` int(11) DEFAULT NULL COMMENT '会员ID',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `send_num` int(11) DEFAULT NULL COMMENT '发放数量',
  `end_send_num` int(11) DEFAULT NULL COMMENT '已发放',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 ：未完成 1：已完成',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_discount`;
CREATE TABLE `ims_yz_goods_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `level_discount_type` tinyint(1) NOT NULL,
  `discount_method` tinyint(1) NOT NULL,
  `level_id` int(11) NOT NULL,
  `discount_value` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_discount_detail
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_discount_detail`;
CREATE TABLE `ims_yz_goods_discount_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_discountid` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品折扣与商品折扣明细关联表';

-- ----------------------------
-- Table structure for ims_yz_goods_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_dispatch`;
CREATE TABLE `ims_yz_goods_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `dispatch_type` tinyint(1) NOT NULL DEFAULT '1',
  `dispatch_price` decimal(14,2) DEFAULT '0.00',
  `dispatch_id` int(11) DEFAULT NULL,
  `is_cod` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `dispatch_type_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=980 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_div_from
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_div_from`;
CREATE TABLE `ims_yz_goods_div_from` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_diyform
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_diyform`;
CREATE TABLE `ims_yz_goods_diyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `diyform_id` int(11) DEFAULT NULL,
  `diyform_enable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与自定义表单关联表';

-- ----------------------------
-- Table structure for ims_yz_goods_edit_disable
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_edit_disable`;
CREATE TABLE `ims_yz_goods_edit_disable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提示信息，简述禁止编辑商品的原因,如:商品已参加XX活动，不可编辑，请等待XX活动结束!',
  `edit_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键字,通过该字段可区分一条记录!',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_filtering
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_filtering`;
CREATE TABLE `ims_yz_goods_filtering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `filtering_id` int(11) DEFAULT '0' COMMENT '过滤id',
  PRIMARY KEY (`id`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_level_returns
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_level_returns`;
CREATE TABLE `ims_yz_goods_level_returns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_return_id` int(11) NOT NULL,
  `level_type` tinyint(3) NOT NULL DEFAULT '1',
  `level_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_return_id` (`good_return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品等级返现规则表';

-- ----------------------------
-- Table structure for ims_yz_goods_limitbuy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_limitbuy`;
CREATE TABLE `ims_yz_goods_limitbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '限时购' COMMENT '自定义前端命名',
  PRIMARY KEY (`id`),
  KEY `yz_goods_limitbuy_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_material
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_material`;
CREATE TABLE `ims_yz_goods_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '推荐文案',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1显示 0不显示',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT '分享人数',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `collect` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `videos` text COLLATE utf8mb4_unicode_ci COMMENT '视频封面/视频',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_micro
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_micro`;
CREATE TABLE `ims_yz_goods_micro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `independent_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `set` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_notices
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_notices`;
CREATE TABLE `ims_yz_goods_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_option`;
CREATE TABLE `ims_yz_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT '0.00',
  `market_price` decimal(10,2) DEFAULT '0.00',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `display_order` int(11) DEFAULT '0',
  `specs` text,
  `skuId` varchar(255) DEFAULT '',
  `goods_sn` varchar(255) DEFAULT '',
  `product_sn` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  `red_price` varchar(50) DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT '体积',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package`;
CREATE TABLE `ims_yz_goods_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `on_sale_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `limit_time_status` tinyint(1) NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `other_package_status` tinyint(1) NOT NULL DEFAULT '0',
  `other_package_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_package_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package_carousel`;
CREATE TABLE `ims_yz_goods_package_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `carousel_package_id` int(11) NOT NULL,
  `carousel_sort` int(11) NOT NULL,
  `carousel_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_open_status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_package_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package_category`;
CREATE TABLE `ims_yz_goods_package_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `category_package_id` int(11) NOT NULL,
  `category_sort` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_goods_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_param
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_param`;
CREATE TABLE `ims_yz_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=38971 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_partner_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_partner_reward`;
CREATE TABLE `ims_yz_goods_partner_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL,
  `partner_reward_amount` decimal(10,2) DEFAULT '0.00',
  `same_level_amount` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_point_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_point_activity`;
CREATE TABLE `ims_yz_goods_point_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_price_authority
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_price_authority`;
CREATE TABLE `ims_yz_goods_price_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_jurisdiction_widgets` int(11) DEFAULT NULL,
  `supplier_vip_level_widgets` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_jurisdiction_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_vip_level_widgets` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_jurisdiction_word` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_privilege
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_privilege`;
CREATE TABLE `ims_yz_goods_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `show_levels` text COLLATE utf8mb4_unicode_ci,
  `show_groups` text COLLATE utf8mb4_unicode_ci,
  `buy_levels` text COLLATE utf8mb4_unicode_ci,
  `buy_groups` text COLLATE utf8mb4_unicode_ci,
  `once_buy_limit` int(11) DEFAULT '0',
  `total_buy_limit` int(11) DEFAULT '0',
  `day_buy_limit` int(11) DEFAULT '0',
  `week_buy_limit` int(11) DEFAULT '0',
  `month_buy_limit` int(11) DEFAULT '0',
  `time_begin_limit` int(11) DEFAULT NULL,
  `time_end_limit` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `enable_time_limit` tinyint(4) DEFAULT '0',
  `min_buy_limit` int(11) DEFAULT '0' COMMENT '会员起购数量',
  `day_buy_total_limit` int(11) NOT NULL DEFAULT '0' COMMENT '商品每日限购总量',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_rank_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_rank_category`;
CREATE TABLE `ims_yz_goods_rank_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用：0-否、1-是',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking`;
CREATE TABLE `ims_yz_goods_ranking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公众号id',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `banner` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `goods_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '指定商品id',
  `goods_category_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '指定商品分类id',
  `goods_filtering_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '指定商品标签id',
  `show_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示数量',
  `rank_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排行周期：1-天、2-周、3-月、4-季度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_day
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_day`;
CREATE TABLE `ims_yz_goods_ranking_day` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_month
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_month`;
CREATE TABLE `ims_yz_goods_ranking_month` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_quarter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_quarter`;
CREATE TABLE `ims_yz_goods_ranking_quarter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_week
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_week`;
CREATE TABLE `ims_yz_goods_ranking_week` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_return`;
CREATE TABLE `ims_yz_goods_return` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `is_level_return` tinyint(3) NOT NULL DEFAULT '0',
  `level_return_type` tinyint(3) NOT NULL DEFAULT '1',
  `is_order_return` tinyint(3) NOT NULL DEFAULT '0',
  `is_queue_return` tinyint(3) NOT NULL DEFAULT '0',
  `add_pool_amount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与全返关联表';

-- ----------------------------
-- Table structure for ims_yz_goods_return_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_return_address`;
CREATE TABLE `ims_yz_goods_return_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `address_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `province_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `city_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `district_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_id` int(11) DEFAULT NULL,
  `street_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugins_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_room_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_room_dividend`;
CREATE TABLE `ims_yz_goods_room_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_dividend` int(11) DEFAULT NULL,
  `has_dividend` tinyint(4) NOT NULL DEFAULT '3',
  `has_dividend_price` decimal(10,2) DEFAULT '0.00',
  `has_dividend_rate` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule` text COLLATE utf8mb4_unicode_ci,
  `open_anchor_commerce` int(11) DEFAULT '0' COMMENT '是否开启主播带货 0-是 1-否',
  PRIMARY KEY (`id`),
  KEY `idx_gid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_sale
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_sale`;
CREATE TABLE `ims_yz_goods_sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `max_balance_deduct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '余额最低抵扣',
  `is_sendfree` int(11) DEFAULT '0',
  `ed_num` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ed_money` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ed_areas` text COLLATE utf8mb4_unicode_ci,
  `ed_areaids` text COLLATE utf8mb4_unicode_ci,
  `bonus` int(11) DEFAULT '0',
  `max_point_deduct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ed_full` decimal(10,2) DEFAULT '0.00',
  `ed_reduction` decimal(10,2) DEFAULT '0.00',
  `is_push` tinyint(4) NOT NULL DEFAULT '0',
  `push_goods_ids` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `award_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `min_point_deduct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point_type` tinyint(1) DEFAULT '0',
  `max_once_point` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `all_point_deduct` decimal(10,2) DEFAULT NULL,
  `has_all_point_deduct` int(11) DEFAULT NULL,
  `balance_deduct` int(11) NOT NULL DEFAULT '1' COMMENT '余额抵扣开关',
  `pay_reward_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付奖励值',
  `min_balance_deduct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '余额最低抵扣',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=980 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_service
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_service`;
CREATE TABLE `ims_yz_goods_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `is_automatic` tinyint(4) NOT NULL DEFAULT '0' COMMENT '自动上下架 1：是',
  `on_shelf_time` int(11) DEFAULT NULL,
  `lower_shelf_time` int(11) DEFAULT NULL,
  `is_refund` tinyint(4) DEFAULT '1' COMMENT '是否支持退货 1：是',
  `serviceFee` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_setting`;
CREATE TABLE `ims_yz_goods_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_month_sales` tinyint(4) NOT NULL COMMENT '月销售量开关：1-开启，0-关闭',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `is_member_enter` tinyint(4) NOT NULL DEFAULT '1' COMMENT '会员中心开关：1-开启，0-关闭',
  `detail_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品详情页-商品详情：1-默认显示，0-默认不显示',
  `is_price_desc` tinyint(4) NOT NULL DEFAULT '0' COMMENT '价格说明开关：1-开启，0-关闭',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义表题',
  `explain` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说明内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_share`;
CREATE TABLE `ims_yz_goods_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `need_follow` tinyint(1) DEFAULT NULL,
  `no_follow_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `follow_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_small_code_url
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_small_code_url`;
CREATE TABLE `ims_yz_goods_small_code_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `collect_small_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序二维码',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec`;
CREATE TABLE `ims_yz_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `display_type` tinyint(3) DEFAULT '0',
  `content` text,
  `display_order` int(11) DEFAULT '0',
  `propId` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=18758 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_spec_info
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec_info`;
CREATE TABLE `ims_yz_goods_spec_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `info_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `goods_option_id` int(11) DEFAULT NULL COMMENT '规格ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品规格信息表';

-- ----------------------------
-- Table structure for ims_yz_goods_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec_item`;
CREATE TABLE `ims_yz_goods_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `show` int(11) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `valueId` varchar(255) DEFAULT NULL,
  `virtual` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_specid` (`specid`),
  KEY `idx_show` (`show`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=44895 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_video
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_video`;
CREATE TABLE `ims_yz_goods_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `goods_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `video_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_grade_change_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_grade_change_record`;
CREATE TABLE `ims_yz_grade_change_record` (
  `uid` int(11) NOT NULL COMMENT '会员id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '被删除的等级id',
  `new_level_id` int(11) NOT NULL DEFAULT '0' COMMENT '新的等级id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '修改类型：1招商中心 2招商员',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_group_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code`;
CREATE TABLE `ims_yz_group_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建的用户id，0为后台创建',
  `code_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '群活码名称',
  `code_guide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '引导语',
  `auth_visit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '访问授权，0关闭，1开启',
  `join_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '进群方式，0默认进群，1标签进群',
  `explain` tinyint(4) NOT NULL DEFAULT '0' COMMENT '说明，0关闭，1开启',
  `explain_content` text COLLATE utf8mb4_unicode_ci COMMENT '说明内容',
  `customer_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客服二维码',
  `customer_service_guide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客服引导语',
  `label_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签banner（标签进群开启）',
  `label_data` text COLLATE utf8mb4_unicode_ci COMMENT '标签数据（标签进群开启）',
  `in_number` int(11) NOT NULL DEFAULT '0' COMMENT '默认参与人数（标签进群开启）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0关闭，1开启',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，0关闭，1开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_data` longtext COLLATE utf8mb4_unicode_ci COMMENT '访问权限数据',
  `code_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二维码类型：0手动上传，1自动生成',
  `join_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '进群权限：0关，1开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群活码表';

-- ----------------------------
-- Table structure for ims_yz_group_code_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_data`;
CREATE TABLE `ims_yz_group_code_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT '关联的群活码id',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签',
  `code_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '二维码url',
  `expire` int(11) NOT NULL COMMENT '过期时间',
  `upper_limit` int(11) NOT NULL COMMENT '上限人数',
  `status` tinyint(4) NOT NULL COMMENT '状态，0关闭，1开启',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `code_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二维码类型：0手动上传，1自动生成',
  `select_group` longtext COLLATE utf8mb4_unicode_ci COMMENT '选择的群聊CHAT_ID：json',
  `generate_group` longtext COLLATE utf8mb4_unicode_ci COMMENT '自动生成的群聊ID：json',
  `auto_generate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否自动生成群聊：0关，1开',
  `config_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群二维码表';

-- ----------------------------
-- Table structure for ims_yz_group_code_data_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_data_log`;
CREATE TABLE `ims_yz_group_code_data_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `group_id` int(11) NOT NULL COMMENT '用户查看的群活码id',
  `code_id` int(11) NOT NULL COMMENT '用户查看的二维码id',
  `date_day` date NOT NULL COMMENT '当日日期',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群二维码访问记录表';

-- ----------------------------
-- Table structure for ims_yz_group_code_day_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_day_log`;
CREATE TABLE `ims_yz_group_code_day_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT '群活码id',
  `date_day` date NOT NULL COMMENT '当日日期',
  `total_count` int(11) NOT NULL COMMENT '当日扫码人数',
  `new_count` int(11) NOT NULL COMMENT '当日新会员人数',
  `cumulative` int(11) NOT NULL COMMENT '截止当日累计扫码人数',
  `cumulative_new` int(11) NOT NULL COMMENT '截止当日累计新会员人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_group_code_day_log_uniacid_index` (`uniacid`),
  KEY `yz_group_code_day_log_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群活码日数据统计表';

-- ----------------------------
-- Table structure for ims_yz_group_code_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_goods`;
CREATE TABLE `ims_yz_group_code_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启独立设置',
  `citation_copy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '引导文案',
  `group_code_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '指定群活码ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群活码商品挂件表';

-- ----------------------------
-- Table structure for ims_yz_group_code_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_log`;
CREATE TABLE `ims_yz_group_code_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT '用户查看的群活码id',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户是否新会员，0否，1是',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `date_day` date NOT NULL COMMENT '当日日期',
  PRIMARY KEY (`id`),
  KEY `yz_group_code_log_uniacid_index` (`uniacid`),
  KEY `yz_group_code_log_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群活码--群活码访问人数记录表';

-- ----------------------------
-- Table structure for ims_yz_help_center_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_help_center_content`;
CREATE TABLE `ims_yz_help_center_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel`;
CREATE TABLE `ims_yz_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `banner_thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `star_rated` int(11) NOT NULL DEFAULT '0',
  `entrance_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_uid` int(11) NOT NULL DEFAULT '0',
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salers` text COLLATE utf8mb4_unicode_ci,
  `hotel_introduce` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL COMMENT '收银台id',
  `collect_money_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台小程序二维码地址',
  `hotel_index_mini_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '酒店首页小程序码地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_apply`;
CREATE TABLE `ims_yz_hotel_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_auto_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_auto_log`;
CREATE TABLE `ims_yz_hotel_auto_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_carousel`;
CREATE TABLE `ims_yz_hotel_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_cashier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_cashier_goods`;
CREATE TABLE `ims_yz_hotel_cashier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL,
  `is_write_information` tinyint(4) NOT NULL,
  `shop_commission` decimal(10,2) NOT NULL,
  `settlement_day` int(11) NOT NULL,
  `plugins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `profit` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_award_point` decimal(10,2) NOT NULL,
  `shop_award_point1` decimal(10,2) NOT NULL,
  `shop_award_point2` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_category`;
CREATE TABLE `ims_yz_hotel_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_details
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_details`;
CREATE TABLE `ims_yz_hotel_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_dispatch`;
CREATE TABLE `ims_yz_hotel_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_facilities
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_facilities`;
CREATE TABLE `ims_yz_hotel_facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_network` tinyint(4) DEFAULT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_parking` tinyint(4) DEFAULT NULL,
  `traffic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_traffic` tinyint(4) DEFAULT NULL,
  `recreation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_recreation` tinyint(4) DEFAULT NULL,
  `reception` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_reception` tinyint(4) DEFAULT NULL,
  `restaurant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_restaurant` tinyint(4) DEFAULT NULL,
  `business` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_business` tinyint(4) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_currency` tinyint(4) DEFAULT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_other` tinyint(4) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_give_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_give_reward`;
CREATE TABLE `ims_yz_hotel_give_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `is_hotel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为购买者1为门店',
  `reward_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为积分1为爱心值',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods`;
CREATE TABLE `ims_yz_hotel_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods_category`;
CREATE TABLE `ims_yz_hotel_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods_date
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods_date`;
CREATE TABLE `ims_yz_hotel_goods_date` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '商品原价',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer`;
CREATE TABLE `ims_yz_hotel_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer_set`;
CREATE TABLE `ims_yz_hotel_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer_temp`;
CREATE TABLE `ims_yz_hotel_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_setting`;
CREATE TABLE `ims_yz_hotel_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_import_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_import_order`;
CREATE TABLE `ims_yz_import_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_income_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_income_log`;
CREATE TABLE `ims_yz_income_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `income_id` int(11) NOT NULL COMMENT '收入表id',
  `before` text COLLATE utf8mb4_unicode_ci COMMENT '修改前内容',
  `after` text COLLATE utf8mb4_unicode_ci COMMENT '修改后内容',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_company`;
CREATE TABLE `ims_yz_insurance_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险公司名称',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_goods`;
CREATE TABLE `ims_yz_insurance_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_pdf
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_pdf`;
CREATE TABLE `ims_yz_insurance_pdf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `pdf` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_policy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_policy`;
CREATE TABLE `ims_yz_insurance_policy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `serial_number` int(11) DEFAULT NULL COMMENT '序号',
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店面名称',
  `insured` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '被保人',
  `identification_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `province_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `city_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `district_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `street_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `insured_property` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保财产',
  `customer_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保类型',
  `insured_amount` int(11) DEFAULT NULL COMMENT '保额',
  `guarantee_period` int(11) DEFAULT NULL COMMENT '保期',
  `premium` int(11) DEFAULT NULL COMMENT '保费',
  `insurance_company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保险公司',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `insurance_coverage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投保险种',
  `additional_glass_risk` int(11) DEFAULT NULL COMMENT '附加玻璃险',
  `is_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `company_id` tinyint(4) DEFAULT NULL COMMENT '保险公司id',
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_currency_withdrawal_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_currency_withdrawal_address`;
CREATE TABLE `ims_yz_integral_currency_withdrawal_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `address` varchar(62) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `qr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_integral_currency_withdrawal_address_address_unique` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_deduction_return_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_deduction_return_record`;
CREATE TABLE `ims_yz_integral_deduction_return_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `change_value` int(11) NOT NULL,
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '返还单号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_goods`;
CREATE TABLE `ims_yz_integral_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `deduction_set` tinyint(1) NOT NULL DEFAULT '0',
  `deduction_set_min` decimal(14,2) NOT NULL DEFAULT '0.00',
  `deduction_set_max` decimal(14,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `parent_award` tinyint(1) NOT NULL,
  `parent_award_fixed` decimal(14,2) NOT NULL DEFAULT '0.00',
  `parent_award_proportion` decimal(14,2) NOT NULL DEFAULT '0.00',
  `second_award_fixed` decimal(14,2) NOT NULL DEFAULT '0.00',
  `second_award_proportion` decimal(14,2) NOT NULL DEFAULT '0.00',
  `commission_level_award` text COLLATE utf8mb4_unicode_ci,
  `is_self_reward` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启购物赠送',
  `self_reward_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:比例1：固定值',
  `self_award` decimal(14,2) DEFAULT NULL COMMENT '奖励值',
  `give_integral` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级购买商品赠送消费积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_manual_cash_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_manual_cash_withdrawal`;
CREATE TABLE `ims_yz_integral_manual_cash_withdrawal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `address` varchar(62) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `audit_at` int(11) DEFAULT NULL,
  `pay_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `qr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_member`;
CREATE TABLE `ims_yz_integral_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_integral_member_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_recharge`;
CREATE TABLE `ims_yz_integral_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '充值单号',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '充值value',
  `pay_way` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值状态',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '充值备注',
  `value_type` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `certificates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_records`;
CREATE TABLE `ims_yz_integral_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_id` int(11) NOT NULL,
  `original` decimal(14,2) NOT NULL DEFAULT '0.00',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `present` decimal(14,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_transfer`;
CREATE TABLE `ims_yz_integral_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` int(11) NOT NULL,
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage_rate` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `transformation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '转化类型：0-原数据不区分类型，1-转化爱心，2-转化积分，3-手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_withdraw`;
CREATE TABLE `ims_yz_integral_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_invite_page
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_invite_page`;
CREATE TABLE `ims_yz_invite_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_auto_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_auto_category`;
CREATE TABLE `ims_yz_jd_supply_cloud_auto_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `local_first` int(11) NOT NULL DEFAULT '0' COMMENT '本地一级分类',
  `local_second` int(11) NOT NULL DEFAULT '0' COMMENT '本地二级分类',
  `local_third` int(11) NOT NULL DEFAULT '0' COMMENT '本地三级分类',
  `cloud_first` int(11) NOT NULL DEFAULT '0' COMMENT '云仓一级分类',
  `cloud_second` int(11) NOT NULL DEFAULT '0' COMMENT '云仓二级分类',
  `cloud_third` int(11) NOT NULL DEFAULT '0' COMMENT '云仓三级分类',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0自动匹配，1手动匹配',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_goods`;
CREATE TABLE `ims_yz_jd_supply_cloud_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `cloud_goods_id` int(11) DEFAULT '0' COMMENT '云仓商品id',
  `is_update` tinyint(4) DEFAULT '0' COMMENT '商城商品更新字段',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '商城商品删除字段',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_message`;
CREATE TABLE `ims_yz_jd_supply_cloud_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '推送类型',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_error
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_error`;
CREATE TABLE `ims_yz_jd_supply_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误描述',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求类型',
  `error_data` text COLLATE utf8mb4_unicode_ci COMMENT '返回错误',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT '请求数据',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT '返回数据',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预留字段',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods`;
CREATE TABLE `ims_yz_jd_supply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `jd_goods_id` int(11) DEFAULT '0' COMMENT '第三方商品ID',
  `shop_id` int(11) DEFAULT '0' COMMENT '第三方店铺ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `source` int(11) DEFAULT '0' COMMENT '第三方商品来源类型',
  `uniacid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `jd_goods_idx` (`jd_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods_control
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods_control`;
CREATE TABLE `ims_yz_jd_supply_goods_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods_option`;
CREATE TABLE `ims_yz_jd_supply_goods_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `option_id` int(11) DEFAULT '0' COMMENT '商城商品规格id',
  `jd_goods_id` int(11) DEFAULT '0' COMMENT '第三方商品ID',
  `jd_option_id` int(11) DEFAULT '0' COMMENT '第三方商品规格id',
  `shop_goods_specs` text COLLATE utf8mb4_unicode_ci COMMENT '商城规格项ids',
  `spec_value_ids` text COLLATE utf8mb4_unicode_ci COMMENT '第三方规格值ids',
  `spec_value_names` text COLLATE utf8mb4_unicode_ci COMMENT '第三方规格名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `goods_option_idx` (`option_id`),
  KEY `jd_goods_idx` (`jd_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_order_goods`;
CREATE TABLE `ims_yz_jd_supply_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `jd_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '第三方商品id',
  `jd_option_id` int(11) NOT NULL DEFAULT '0' COMMENT '第三方规格id',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_push_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_push_message`;
CREATE TABLE `ims_yz_jd_supply_push_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '推送类型',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_topic_import
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_topic_import`;
CREATE TABLE `ims_yz_jd_supply_topic_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `diy_id` int(11) NOT NULL DEFAULT '0' COMMENT '装修id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_refund_order`;
CREATE TABLE `ims_yz_jd_take_parts_refund_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `refund_id` int(11) NOT NULL COMMENT '订单退款表ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `pick_up_address_complete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '完整取件地址(省-市-区-其他信息)',
  `pick_up_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取件地址(其他信息)',
  `pick_up_street` int(11) DEFAULT NULL COMMENT '取件地址(街道ID)',
  `pick_up_district` int(11) NOT NULL COMMENT '取件地址(区/镇ID)',
  `pick_up_city` int(11) NOT NULL COMMENT '取件地址(市ID)',
  `pick_up_province` int(11) NOT NULL COMMENT '取件地址(省ID)',
  `pick_up_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取件联系人',
  `pick_up_tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '取件联系电话',
  `receive_address_complete` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件地址(省-市-区-其他信息)',
  `receive_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件地址(其他信息)',
  `receive_street` int(11) DEFAULT NULL COMMENT '收件地址(街道ID)',
  `receive_district` int(11) DEFAULT NULL COMMENT '收件地址(区/镇ID)',
  `receive_city` int(11) DEFAULT NULL COMMENT '收件地址(市ID)',
  `receive_province` int(11) DEFAULT NULL COMMENT '收件地址(省ID)',
  `receive_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件联系人',
  `receive_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件联系电话',
  `product_count` int(11) NOT NULL COMMENT '商品数量，大于0，且为整数',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名字',
  `jd_weight` decimal(11,2) NOT NULL COMMENT '重量',
  `jd_length` decimal(11,2) NOT NULL COMMENT '长',
  `jd_width` decimal(11,2) NOT NULL COMMENT '宽',
  `jd_height` decimal(11,2) NOT NULL COMMENT '高',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未处理，1已生成取件单-1已失效',
  `is_message` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未发消息，1已发消息,2无需发消息',
  `start_time` int(11) DEFAULT NULL COMMENT '取件开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '取件结束时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `pick_up_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取件单号',
  `way_bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运单号',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_jd_take_parts_refund_order_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东上门取件--上门取件订单表';

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_request`;
CREATE TABLE `ims_yz_jd_take_parts_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `take_parts_refund_id` int(11) NOT NULL COMMENT '上门取件订单表ID',
  `request_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `request_res` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求结果',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东上门取件--取件单下单请求表';

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_set`;
CREATE TABLE `ims_yz_jd_take_parts_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL,
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'appSecret',
  `customer_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家编码',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'accessToken',
  `default_weight` decimal(12,2) NOT NULL COMMENT '默认重量/千克',
  `default_length` decimal(12,2) NOT NULL COMMENT '默认长/cm',
  `default_width` decimal(12,2) NOT NULL COMMENT '默认宽/cm',
  `default_height` decimal(12,2) NOT NULL COMMENT '体积默认高/cm',
  `take_parts_message` int(11) DEFAULT NULL COMMENT '取件信息快递员通知',
  `take_parts_fail_message` int(11) DEFAULT NULL COMMENT '取件单下单失败通知',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东上门取件--设置表';

-- ----------------------------
-- Table structure for ims_yz_job_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_job_heartbeat`;
CREATE TABLE `ims_yz_job_heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_time` int(11) DEFAULT NULL COMMENT '执行时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_cogradient_level_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_cogradient_level_set`;
CREATE TABLE `ims_yz_level_cogradient_level_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '设置首位插件升级条件',
  `type_comment` text COLLATE utf8mb4_unicode_ci COMMENT '插件等级升级条件',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '升级备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_cogradient_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_cogradient_record`;
CREATE TABLE `ims_yz_level_cogradient_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '首位插件升级条件',
  `level_id` int(11) DEFAULT NULL COMMENT '首位等级条件',
  `plugin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首位插件名称条件',
  `plugin_level_id` int(11) DEFAULT NULL COMMENT '次位插件升级条件',
  `type_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '次位插件名称条件',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '升级备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_deletion_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_deletion_record`;
CREATE TABLE `ims_yz_level_deletion_record` (
  `level_id` int(11) NOT NULL COMMENT '删除等级的原id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '等级名称',
  `level_weight` int(11) NOT NULL DEFAULT '0' COMMENT '等级权重',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '等级比例',
  `upgrade_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '等级条件',
  `become` text COLLATE utf8mb4_unicode_ci COMMENT '等级条件',
  `count` int(11) DEFAULT NULL COMMENT '等级人数',
  `type` int(11) DEFAULT NULL COMMENT '等级类型：1招商中心 2招商员',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_link_tool
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_link_tool`;
CREATE TABLE `ims_yz_link_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序原始ID',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面参数',
  `end_time` int(11) DEFAULT NULL COMMENT '到期时间',
  `validity` int(11) DEFAULT NULL COMMENT '1有期限0无限期',
  `remark` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `browse` int(11) DEFAULT NULL COMMENT '访问次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_logistics_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_logistics_set`;
CREATE TABLE `ims_yz_logistics_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '设置数据',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love`;
CREATE TABLE `ims_yz_love` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_value` decimal(14,2) DEFAULT NULL,
  `change_value` decimal(14,2) NOT NULL,
  `new_value` decimal(14,2) NOT NULL,
  `value_type` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `source` tinyint(1) NOT NULL,
  `relation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_activation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_activation`;
CREATE TABLE `ims_yz_love_activation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `first_order_money` decimal(14,2) DEFAULT NULL,
  `first_proportion` decimal(10,2) NOT NULL,
  `first_activation_love` decimal(14,2) NOT NULL,
  `second_three_order_money` decimal(14,2) NOT NULL,
  `second_three_proportion` decimal(10,2) NOT NULL,
  `last_upgrade_team_leve_award` decimal(14,2) NOT NULL,
  `second_three_fetter_proportion` decimal(10,2) NOT NULL,
  `second_three_activation_love` decimal(14,2) DEFAULT NULL,
  `sum_activation_love` decimal(14,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `actual_activation_love` decimal(14,2) DEFAULT NULL,
  `fixed_proportion` decimal(10,2) NOT NULL,
  `fixed_activation_love` decimal(10,2) NOT NULL,
  `member_froze_love` decimal(10,2) NOT NULL,
  `surplus_froze_love` decimal(10,2) NOT NULL,
  `team_proportion` decimal(10,2) NOT NULL,
  `team_activation_love` decimal(10,2) NOT NULL,
  `team_order_money` decimal(10,2) NOT NULL,
  `day_time` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `froze_total` decimal(14,2) NOT NULL,
  `profit_proportion` decimal(14,2) NOT NULL,
  `cycle_order_profit` decimal(14,2) NOT NULL,
  `profit_activation_love` decimal(14,2) NOT NULL,
  `income_proportion` decimal(14,2) NOT NULL COMMENT '收入周期激活比例',
  `member_income` decimal(14,2) NOT NULL COMMENT '会员周期收入金额',
  `income_activation_love` decimal(14,2) NOT NULL COMMENT '收入周期激活值',
  `self_order_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '自购周期订单金额',
  `self_proportion` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '自购周期订单金额激活比例',
  `self_activation_love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '自购周期订单金额激活值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_deduction_integral
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_deduction_integral`;
CREATE TABLE `ims_yz_love_deduction_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_uid` int(11) NOT NULL COMMENT '门店店长会员id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `love_value` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '赠送的爱心值',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '要扣除的消费积分',
  `reward_rules` int(11) NOT NULL DEFAULT '0' COMMENT '爱心值奖励规则，现价，成本价，实际价,利润',
  `reward_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '奖励比例',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '奖励按订单支付后或完成后',
  `reward_time` int(11) DEFAULT NULL COMMENT '奖励时间',
  `love_conversion_ratio` int(11) DEFAULT NULL COMMENT '爱心值转换比例',
  `integral_conversion_ratio` int(11) DEFAULT NULL COMMENT '消费积分转换比例',
  `reward_type` int(11) DEFAULT NULL COMMENT '奖励类型，冻结或可用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_dividend_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_dividend_log`;
CREATE TABLE `ims_yz_love_dividend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `shop_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商城营业额',
  `love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人爱心值',
  `love_all` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '总爱心值',
  `dividend_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分红比例',
  `dividend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分红',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_goods`;
CREATE TABLE `ims_yz_love_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `award` tinyint(1) NOT NULL,
  `deduction` tinyint(1) NOT NULL,
  `award_proportion` decimal(10,2) NOT NULL,
  `deduction_proportion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `parent_award` tinyint(1) NOT NULL,
  `parent_award_proportion` decimal(10,2) NOT NULL,
  `second_award_proportion` decimal(10,2) NOT NULL,
  `third_award_proportion` decimal(10,2) NOT NULL,
  `parent_award_fixed` decimal(10,2) NOT NULL,
  `second_award_fixed` decimal(10,2) NOT NULL,
  `third_award_fixed` decimal(10,2) NOT NULL,
  `love_accelerate` int(11) NOT NULL DEFAULT '0',
  `activation_state` int(11) NOT NULL DEFAULT '0',
  `deduction_proportion_low` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `commission` text COLLATE utf8mb4_unicode_ci,
  `commission_level_give` tinyint(4) NOT NULL DEFAULT '0',
  `award_fixed` decimal(14,2) NOT NULL,
  `is_activation` tinyint(1) NOT NULL COMMENT '商品是否参与激活：0开启，1关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_member`;
CREATE TABLE `ims_yz_love_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `usable` decimal(14,2) DEFAULT '0.00',
  `froze` decimal(14,2) DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_member_group`;
CREATE TABLE `ims_yz_love_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open_love_member_group` tinyint(4) NOT NULL COMMENT '是否开启会员组转让',
  `love_member_no_group_id` int(11) DEFAULT NULL COMMENT '无分组转让',
  `love_member_group_id` text COLLATE utf8mb4_unicode_ci COMMENT '会员组转让id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_order`;
CREATE TABLE `ims_yz_love_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_order_goods`;
CREATE TABLE `ims_yz_love_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_goods_id` int(11) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_ozy_goods_update
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_ozy_goods_update`;
CREATE TABLE `ims_yz_love_ozy_goods_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `original_love` decimal(14,2) DEFAULT '0.00' COMMENT '本来的爱心值数目',
  `modified_love` decimal(14,2) DEFAULT '0.00' COMMENT '修改过后的爱心值数目',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_ozy_order_update
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_ozy_order_update`;
CREATE TABLE `ims_yz_love_ozy_order_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `love_reward` decimal(14,2) DEFAULT '0.00' COMMENT '奖励的爱心值数目',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_recharge`;
CREATE TABLE `ims_yz_love_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `change_value` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_type` int(11) DEFAULT '1',
  `money` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_return_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_return_log`;
CREATE TABLE `ims_yz_love_return_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_timing_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_timing_log`;
CREATE TABLE `ims_yz_love_timing_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `recharge_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_timing_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_timing_queue`;
CREATE TABLE `ims_yz_love_timing_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `change_value` decimal(10,2) DEFAULT NULL,
  `timing_days` int(11) DEFAULT NULL,
  `timing_rate` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `recharge_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_trading
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_trading`;
CREATE TABLE `ims_yz_love_trading` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '出卖人ID',
  `buy_id` int(11) DEFAULT NULL COMMENT '购买人ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0：出售中 1：已完成',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：0：交易 1：公司回购',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `poundage` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_transfer`;
CREATE TABLE `ims_yz_love_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `transfer` int(11) NOT NULL,
  `change_value` decimal(14,2) NOT NULL,
  `recipient` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poundage` decimal(14,2) DEFAULT NULL,
  `proportion` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_withdrawal_rcord
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_withdrawal_rcord`;
CREATE TABLE `ims_yz_love_withdrawal_rcord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `love_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '爱心值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_withdrawal_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_withdrawal_record`;
CREATE TABLE `ims_yz_love_withdrawal_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `love_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '爱心值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_fee_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提现单号',
  `state` int(11) NOT NULL DEFAULT '2' COMMENT '1:申请，2成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_manual_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_manual_bonus`;
CREATE TABLE `ims_yz_manual_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `bonus_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分红名称',
  `bonus_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '分红人数',
  `unit_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `role_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分红类型',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_manual_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_manual_bonus_log`;
CREATE TABLE `ims_yz_manual_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `manual_id` int(11) NOT NULL DEFAULT '0' COMMENT '分红id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `bonus_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分红名称',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_material_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_material_category`;
CREATE TABLE `ims_yz_material_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '上级id',
  `display_order` tinyint(1) DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否开启',
  `level` tinyint(1) DEFAULT '0' COMMENT '分类级别',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_material_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_material_goods_category`;
CREATE TABLE `ims_yz_material_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mc_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mc_groups`;
CREATE TABLE `ims_yz_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_yz_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member`;
CREATE TABLE `ims_yz_member` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `inviter` int(11) DEFAULT '0',
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `province_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `area_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `area` int(11) DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci,
  `referralsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_agent` tinyint(1) DEFAULT '0',
  `alipayname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '0',
  `child_time` int(11) DEFAULT '0',
  `agent_time` int(11) DEFAULT '0',
  `apply_time` int(11) DEFAULT '0',
  `relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `custom_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity` int(11) DEFAULT NULL COMMENT '等级有效期',
  `member_form` text COLLATE utf8mb4_unicode_ci,
  `pay_password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yz_openid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `invite_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upgrade_at` int(11) DEFAULT NULL COMMENT '升级时间',
  `downgrade_at` int(11) DEFAULT NULL COMMENT '降级时间',
  `access_token_1` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access_expires_in_1` int(11) NOT NULL DEFAULT '0',
  `refresh_token_1` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `refresh_expires_in_1` int(11) NOT NULL DEFAULT '0',
  `access_token_2` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access_expires_in_2` int(11) NOT NULL DEFAULT '0',
  `refresh_token_2` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `refresh_expires_in_2` int(11) NOT NULL DEFAULT '0',
  `is_old` tinyint(4) NOT NULL DEFAULT '0' COMMENT '老数据判断',
  `mark_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '标记会员id',
  `system_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_time` int(11) DEFAULT '0',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `un_member_id` (`member_id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `yz_member_invite_code_index` (`invite_code`),
  KEY `yz_member_access_token_1_member_id_index` (`access_token_1`,`member_id`),
  KEY `yz_member_yz_openid_index` (`yz_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_address`;
CREATE TABLE `ims_yz_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdefault` tinyint(1) NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_aggregation_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_aggregation_app`;
CREATE TABLE `ims_yz_member_aggregation_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId_create_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_alipay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_alipay`;
CREATE TABLE `ims_yz_member_alipay` (
  `alipay_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_student_certified` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_certified` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`alipay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_app_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_app_wechat`;
CREATE TABLE `ims_yz_member_app_wechat` (
  `app_wechat_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_wechat_id`),
  UNIQUE KEY `un_openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_bank_card`;
CREATE TABLE `ims_yz_member_bank_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_card` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `bank_province` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_city` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_cancel_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cancel_record`;
CREATE TABLE `ims_yz_member_cancel_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '审核状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账号注销审核记录';

-- ----------------------------
-- Table structure for ims_yz_member_cancel_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cancel_set`;
CREATE TABLE `ims_yz_member_cancel_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `tel_status` tinyint(4) DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账号注销审核设置';

-- ----------------------------
-- Table structure for ims_yz_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cart`;
CREATE TABLE `ims_yz_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid_index` (`uniacid`),
  KEY `goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_certified
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_certified`;
CREATE TABLE `ims_yz_member_certified` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `realname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `idcard` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL COMMENT '关联会员id',
  `order_id` int(11) DEFAULT '0' COMMENT '关联订单id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_change_log`;
CREATE TABLE `ims_yz_member_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_id_after` int(11) NOT NULL COMMENT '变更后会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_children
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_children`;
CREATE TABLE `ims_yz_member_children` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT '下级id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '层级',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_member_children_member_id_level_index` (`member_id`,`level`),
  KEY `yz_member_children_child_id_index` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=822 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_coupon`;
CREATE TABLE `ims_yz_member_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `get_type` tinyint(3) DEFAULT '0',
  `used` int(11) DEFAULT '0',
  `use_time` int(11) DEFAULT '0',
  `get_time` int(11) DEFAULT '0',
  `send_uid` int(11) DEFAULT '0',
  `order_sn` varchar(255) DEFAULT '',
  `back` tinyint(3) DEFAULT '0',
  `back_time` int(11) DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `is_member_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_expired` int(11) NOT NULL DEFAULT '0',
  `near_expiration` tinyint(4) NOT NULL DEFAULT '0' COMMENT '即将过期',
  `expired_at` varchar(100) DEFAULT '',
  `coupon_qr` varchar(180) NOT NULL COMMENT '优惠券二维码插件id',
  `small_qr` varchar(255) NOT NULL COMMENT '小程序二维码地址',
  `coupon_qr_sn` varchar(180) NOT NULL COMMENT '优惠券二维码编码',
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`coupon_id`),
  KEY `idx_gettype` (`get_type`),
  KEY `idx_isexpired` (`is_expired`),
  KEY `yz_member_coupon_uid_index` (`uid`),
  KEY `ids_member_coupon_qr_sn` (`coupon_qr_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=455092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_member_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_customer`;
CREATE TABLE `ims_yz_member_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部客户userid',
  `unionid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '跟开放平台关联的unionid',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信同步会员关联表';

-- ----------------------------
-- Table structure for ims_yz_member_del_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_del_log`;
CREATE TABLE `ims_yz_member_del_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `del_uid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_douyin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_douyin`;
CREATE TABLE `ims_yz_member_douyin` (
  `douyin_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`douyin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_favorite`;
CREATE TABLE `ims_yz_member_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_goods_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_goods_invite_log`;
CREATE TABLE `ims_yz_member_goods_invite_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '邀请码',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_group`;
CREATE TABLE `ims_yz_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `group_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_history`;
CREATE TABLE `ims_yz_member_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_income
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_income`;
CREATE TABLE `ims_yz_member_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dividend_code` int(11) DEFAULT NULL COMMENT '分红插件',
  `incometable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `incometable_id` int(11) DEFAULT NULL,
  `type_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `create_month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `separate` text COLLATE utf8mb4_unicode_ci,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY `yz_member_income_member_id_dividend_code_incometable_id_index` (`member_id`,`dividend_code`,`incometable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_invitation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_invitation_log`;
CREATE TABLE `ims_yz_member_invitation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '邀请码',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_level`;
CREATE TABLE `ims_yz_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `level_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_money` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_count` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  `validity` int(11) DEFAULT NULL COMMENT '等级有效期',
  `freight_reduction` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运费减免',
  `interests_rules` text COLLATE utf8mb4_unicode_ci COMMENT '会员权益细则',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '权益说明',
  `team_performance` decimal(10,2) DEFAULT NULL COMMENT '团队业绩',
  `balance_recharge` decimal(14,2) NOT NULL COMMENT '一次性充值余额值',
  `give_integral` decimal(12,2) DEFAULT NULL COMMENT '购买商品赠送消费积分比例',
  `give_point_today` int(11) DEFAULT NULL COMMENT '每天最高可获积分数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_count`;
CREATE TABLE `ims_yz_member_lower_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `first_total` int(11) NOT NULL DEFAULT '0' COMMENT '一级下线总数',
  `second_total` int(11) NOT NULL DEFAULT '0' COMMENT '二级下线总数',
  `third_total` int(11) NOT NULL DEFAULT '0' COMMENT '三级下线总数',
  `team_total` int(11) NOT NULL DEFAULT '0' COMMENT '团队总数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_group_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_group_order`;
CREATE TABLE `ims_yz_member_lower_group_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `team_count` int(11) NOT NULL DEFAULT '0',
  `goods_count` int(11) NOT NULL DEFAULT '0',
  `pay_count` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_order`;
CREATE TABLE `ims_yz_member_lower_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `first_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '一级下线订单数',
  `first_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT '一级下线订单金额',
  `second_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '二级下线订单数',
  `second_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT '二级下线订单金额',
  `third_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '三级下线订单数',
  `third_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT '三级下线订单金额',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '团队下线订单数',
  `team_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT '团队下线订单金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `pay_count` int(11) DEFAULT '0' COMMENT '团队支付人数',
  `team_count` int(11) DEFAULT '0' COMMENT '团队总人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_merge_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_merge_log`;
CREATE TABLE `ims_yz_member_merge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `member_id` int(11) NOT NULL COMMENT '保留会员id',
  `mark_member_id` int(11) NOT NULL COMMENT '被标记会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_mini_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_mini_app`;
CREATE TABLE `ims_yz_member_mini_app` (
  `mini_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId_create_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`mini_app_id`),
  UNIQUE KEY `un_openid` (`openid`),
  KEY `yz_member_mini_app_openid_index` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_mini_formid
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_mini_formid`;
CREATE TABLE `ims_yz_member_mini_formid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addtime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_month_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_month_order`;
CREATE TABLE `ims_yz_member_month_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '订单数量',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_month_rank
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_month_rank`;
CREATE TABLE `ims_yz_member_month_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一二级团队业绩总额',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_order_operation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_order_operation`;
CREATE TABLE `ims_yz_member_order_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_parent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_parent`;
CREATE TABLE `ims_yz_member_parent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '层级',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_member_parent_member_id_level_index` (`member_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_position
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_position`;
CREATE TABLE `ims_yz_member_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `province_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省',
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '市',
  `district_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '区',
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员定位表';

-- ----------------------------
-- Table structure for ims_yz_member_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_poster`;
CREATE TABLE `ims_yz_member_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `job_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_price_independent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_price_independent`;
CREATE TABLE `ims_yz_member_price_independent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `is_member_price_independent` tinyint(4) DEFAULT NULL COMMENT '商品单独设置  1-关闭 2-开启',
  `price_level` tinyint(4) DEFAULT NULL COMMENT '商品会员等级价格设置  1-当前会员等级价格 2-当前会员下一等级价格',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_qq
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_qq`;
CREATE TABLE `ims_yz_member_qq` (
  `qq_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_qq_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_qq_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `is_yellow_year_vip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vip` int(11) NOT NULL DEFAULT '0',
  `yellow_vip_level` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `is_yellow_vip` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`qq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_record`;
CREATE TABLE `ims_yz_member_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `after_parent_id` int(11) DEFAULT '0' COMMENT '修改后父级id',
  `status` int(11) DEFAULT '1' COMMENT '0修改中，1修改成功，2修改失败',
  `time` int(11) DEFAULT '0' COMMENT '耗时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation`;
CREATE TABLE `ims_yz_member_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `become` tinyint(1) NOT NULL DEFAULT '0',
  `become_order` tinyint(1) NOT NULL DEFAULT '0',
  `become_child` tinyint(1) NOT NULL DEFAULT '0',
  `become_ordercount` int(11) DEFAULT '0',
  `become_moneycount` decimal(15,2) DEFAULT '0.00',
  `become_goods_id` text COLLATE utf8mb4_unicode_ci,
  `become_info` tinyint(1) NOT NULL DEFAULT '1',
  `become_check` tinyint(1) NOT NULL DEFAULT '1',
  `share_page` tinyint(1) NOT NULL DEFAULT '1',
  `become_selfmoney` decimal(15,2) NOT NULL DEFAULT '0.00',
  `become_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `become_goods` text COLLATE utf8mb4_unicode_ci,
  `share_page_deail` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:显示1:不显示',
  `reward_points` int(11) NOT NULL DEFAULT '0',
  `maximum_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation_order_statistics`;
CREATE TABLE `ims_yz_member_relation_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `first_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '一级下线订单总数',
  `first_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '一级下线订单总额',
  `second_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '二级下线订单总数',
  `second_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '二级下线订单总额',
  `third_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '三级下线订单总数',
  `third_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '三级下线订单总额',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '团队订单总数',
  `team_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '团队订单总额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation_statistics`;
CREATE TABLE `ims_yz_member_relation_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `first_total` int(11) NOT NULL DEFAULT '0' COMMENT '一级下线总数',
  `second_total` int(11) NOT NULL DEFAULT '0' COMMENT '二级下线总数',
  `third_total` int(11) NOT NULL DEFAULT '0' COMMENT '三级下线总数',
  `team_total` int(11) NOT NULL DEFAULT '0' COMMENT '团队总人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_synchro_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_synchro_log`;
CREATE TABLE `ims_yz_member_synchro_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_member` int(11) NOT NULL,
  `new_member` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_tags`;
CREATE TABLE `ims_yz_member_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`),
  KEY `tagid` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_unique
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_unique`;
CREATE TABLE `ims_yz_member_unique` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`unique_id`),
  UNIQUE KEY `un_unionid` (`unionid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_wechat`;
CREATE TABLE `ims_yz_member_wechat` (
  `wechat_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`wechat_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_membership_infomattion_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_membership_infomattion_log`;
CREATE TABLE `ims_yz_membership_infomattion_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `old_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户修改前信息',
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'session_id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `new_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户修改后信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_menu`;
CREATE TABLE `ims_yz_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url_params` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `permit` tinyint(1) NOT NULL DEFAULT '0',
  `menu` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant`;
CREATE TABLE `ims_yz_merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `staff_level_id` int(11) NOT NULL DEFAULT '0',
  `change_time` int(11) DEFAULT NULL COMMENT '成为招商中心时间',
  `user_uid` int(11) DEFAULT '0' COMMENT 'yz_user.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_apply`;
CREATE TABLE `ims_yz_merchant_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_black
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_black`;
CREATE TABLE `ims_yz_merchant_black` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_bonus_log`;
CREATE TABLE `ims_yz_merchant_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_base` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_status` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `create_month` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settle_days` int(11) DEFAULT NULL,
  `lower_level_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `store_detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店独立分红详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_goods`;
CREATE TABLE `ims_yz_merchant_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open_bonus_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_open_bonus_center` tinyint(1) NOT NULL DEFAULT '0',
  `staff_bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `set` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `staff_levels` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_level`;
CREATE TABLE `ims_yz_merchant_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000',
  `upgrade_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `become` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `condition` int(11) NOT NULL DEFAULT '1' COMMENT '1与，0或',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_log`;
CREATE TABLE `ims_yz_merchant_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_log_id` int(11) DEFAULT NULL COMMENT '招商分红记录ID',
  `boss_uid` int(11) DEFAULT NULL COMMENT '老板UID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_staff_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_staff_level`;
CREATE TABLE `ims_yz_merchant_staff_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000',
  `upgrate` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '1' COMMENT '1与，0或',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_message_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_message_template`;
CREATE TABLE `ims_yz_message_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first` text COLLATE utf8mb4_unicode_ci,
  `first_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `remark_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `notice_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `news_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_category`;
CREATE TABLE `ims_yz_micro_communities_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `see_major` int(11) DEFAULT NULL,
  `see_subordinate` text COLLATE utf8mb4_unicode_ci,
  `release_major` int(11) DEFAULT NULL,
  `release_subordinate` text COLLATE utf8mb4_unicode_ci,
  `is_show` tinyint(4) DEFAULT '1',
  `is_examine` tinyint(4) DEFAULT '1',
  `is_del` tinyint(4) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `integral_num` int(11) DEFAULT NULL COMMENT '积分次数',
  `love` text COLLATE utf8mb4_unicode_ci COMMENT '爱心值',
  `love_num` text COLLATE utf8mb4_unicode_ci COMMENT '爱心值次数',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '分类级别 1-主分类 2-次分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_category_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_category_reward`;
CREATE TABLE `ims_yz_micro_communities_category_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `stick_id` int(11) DEFAULT NULL COMMENT '帖子id',
  `integral` int(11) DEFAULT NULL COMMENT '奖励积分',
  `love` int(11) DEFAULT NULL COMMENT '奖励爱心值',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_search_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_search_log`;
CREATE TABLE `ims_yz_micro_communities_search_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_set`;
CREATE TABLE `ims_yz_micro_communities_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick`;
CREATE TABLE `ims_yz_micro_communities_stick` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `uname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments_num` int(11) NOT NULL DEFAULT '0',
  `browse_num` int(11) NOT NULL,
  `browse_user` int(11) NOT NULL,
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `reward_num` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `is_recommend` tinyint(4) DEFAULT '0',
  `is_top` tinyint(4) DEFAULT '0',
  `is_show` tinyint(4) DEFAULT '0',
  `is_del` tinyint(4) DEFAULT '0',
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ylng` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ylat` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `order_sn` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `order_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单地址',
  `wish_goods_id` int(11) DEFAULT NULL COMMENT '心愿商品ID',
  `is_store` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否门店发布，1是',
  `is_pc` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是PC端发布，1是',
  `audio` longtext COLLATE utf8mb4_unicode_ci COMMENT '音频链接',
  `is_crm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否crm推送，0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_browse`;
CREATE TABLE `ims_yz_micro_communities_stick_browse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_comments
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_comments`;
CREATE TABLE `ims_yz_micro_communities_stick_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_cm_id` int(11) DEFAULT '0',
  `less_cm_id` int(11) DEFAULT '0',
  `praise_num` int(11) DEFAULT '0',
  `is_del` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci COMMENT '父级分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10765 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_follow`;
CREATE TABLE `ims_yz_micro_communities_stick_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `attention_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_images
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_images`;
CREATE TABLE `ims_yz_micro_communities_stick_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stick_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_praise
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_praise`;
CREATE TABLE `ims_yz_micro_communities_stick_praise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_reward`;
CREATE TABLE `ims_yz_micro_communities_stick_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `stick_user_id` int(11) DEFAULT NULL,
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT NULL,
  `money` decimal(8,2) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `pay_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_status` tinyint(4) DEFAULT NULL,
  `reward_user_id` int(11) DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  `sync_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop`;
CREATE TABLE `ims_yz_micro_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `shop_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `shop_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `signature` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `shop_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `is_ban` int(11) DEFAULT '0' COMMENT '1禁用，0正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_bonus_log`;
CREATE TABLE `ims_yz_micro_shop_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_buyer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) DEFAULT '0.00',
  `goods_cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_total` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `pay_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `complete_time` int(11) NOT NULL DEFAULT '0',
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_time` int(11) NOT NULL DEFAULT '0',
  `refund_time` int(11) NOT NULL DEFAULT '0',
  `is_lower` int(11) NOT NULL DEFAULT '0',
  `lower_level_shop_id` int(11) NOT NULL DEFAULT '0',
  `lower_level_member_id` int(11) NOT NULL DEFAULT '0',
  `lower_level_nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `lower_level_bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `agent_bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_carousel`;
CREATE TABLE `ims_yz_micro_shop_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `slide_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_carousel` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0',
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_goods`;
CREATE TABLE `ims_yz_micro_shop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_level`;
CREATE TABLE `ims_yz_micro_shop_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0' COMMENT '等级权重',
  `level_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '等级名称',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红比例',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_withdraw`;
CREATE TABLE `ims_yz_micro_shop_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `log_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_min_app_urlscheme
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_min_app_urlscheme`;
CREATE TABLE `ims_yz_min_app_urlscheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序原始ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mini_app_template_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mini_app_template_message`;
CREATE TABLE `ims_yz_mini_app_template_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `is_default` int(11) DEFAULT NULL,
  `is_open` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `small_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '新模板标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mini_template_corresponding
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mini_template_corresponding`;
CREATE TABLE `ims_yz_mini_template_corresponding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `small_type` int(11) DEFAULT NULL COMMENT '类型id',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信模板id',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信模板名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer`;
CREATE TABLE `ims_yz_more_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ukey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `printer_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `times` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer_setting`;
CREATE TABLE `ims_yz_more_printer_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `printer_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer_temp`;
CREATE TABLE `ims_yz_more_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '打印内容放大一倍',
  `print_style_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '打印列格式放大一倍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_activity`;
CREATE TABLE `ims_yz_new_member_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间',
  `activity_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动渠道',
  `receive_type` tinyint(4) DEFAULT NULL COMMENT '领取条件',
  `receive_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条件内容',
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品id',
  `background_type` tinyint(4) DEFAULT NULL COMMENT '样式',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `receive_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '领取人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_poster`;
CREATE TABLE `ims_yz_new_member_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '生成状态',
  `job_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_prize
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_prize`;
CREATE TABLE `ims_yz_new_member_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品名称',
  `prize_type` tinyint(4) DEFAULT NULL COMMENT '奖品类型',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `coupon_num` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT '积分',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT '爱心值',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT '余额',
  `prize_num` int(11) DEFAULT NULL COMMENT '奖品数量',
  `received_num` int(11) DEFAULT '0' COMMENT '已发放',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_record`;
CREATE TABLE `ims_yz_new_member_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT '积分',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT '爱心值',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT '余额',
  `receive_type` int(11) DEFAULT NULL COMMENT '领取条件',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券名称',
  `coupon_num` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品名称',
  `prize_id` int(11) DEFAULT NULL COMMENT '奖品id',
  `prize_type` int(11) DEFAULT NULL COMMENT '奖品类型',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_post_by_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_post_by_wechat`;
CREATE TABLE `ims_yz_new_post_by_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '海报完整路径',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信返回mediaId',
  `compare_at` int(11) NOT NULL COMMENT '比较更新时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster`;
CREATE TABLE `ims_yz_new_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '海报名称',
  `poster_type` tinyint(4) NOT NULL COMMENT '海报类型',
  `type` tinyint(4) NOT NULL COMMENT '海报期限类型',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `time_start` int(10) unsigned DEFAULT '0' COMMENT '开始时间',
  `time_end` int(10) unsigned DEFAULT '0' COMMENT '结束时间',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '背景色',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '背景图',
  `background_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '背景图url',
  `short_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `label_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签id',
  `style_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '海报数据',
  `response_status` tinyint(4) NOT NULL COMMENT '推送开关',
  `response_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送类型',
  `response_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '推送标题',
  `response_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推送图片',
  `response_thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推送图片url',
  `response_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推送描述',
  `response_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推送链接',
  `response_text` text COLLATE utf8mb4_unicode_ci COMMENT '推送文本',
  `is_open` tinyint(4) DEFAULT '0' COMMENT '开放权限',
  `auto_sub` tinyint(4) DEFAULT '1' COMMENT '扫码关注成为下线',
  `status` tinyint(4) DEFAULT '1' COMMENT '是否启用',
  `center_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '会员中心显示',
  `app_share_show` tinyint(4) DEFAULT '0' COMMENT 'app分享页面显示',
  `is_ago` tinyint(4) DEFAULT '0' COMMENT '是否由前端生成海报',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_award
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_award`;
CREATE TABLE `ims_yz_new_poster_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT '海报id',
  `subscriber_memberid` int(10) unsigned NOT NULL COMMENT '关注者会员id',
  `recommender_memberid` int(10) unsigned NOT NULL COMMENT '推荐者会员id',
  `recommender_credit` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得积分',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '推荐者获得金额',
  `recommender_wechat_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '推荐者获得微信金额',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得优惠券id',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得优惠券数量',
  `subscriber_credit` int(10) unsigned DEFAULT '0' COMMENT '关注者获得积分',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '关注者获得金额',
  `subscriber_wechat_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '关注者获得微信金额',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0' COMMENT '关注者获得优惠券id',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0' COMMENT '关注者获得优惠券数量',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `poster_id` (`poster_id`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_label
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_label`;
CREATE TABLE `ims_yz_new_poster_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_qrcode`;
CREATE TABLE `ims_yz_new_poster_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT '海报id',
  `qrcode_id` int(10) unsigned NOT NULL COMMENT '二维码id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_qrcodeid` (`qrcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_record`;
CREATE TABLE `ims_yz_new_poster_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '海报url',
  `poster_type` tinyint(4) DEFAULT NULL COMMENT '海报类型',
  `poster_id` int(10) unsigned NOT NULL COMMENT '海报id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_scan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_scan`;
CREATE TABLE `ims_yz_new_poster_scan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT '海报id',
  `subscriber_memberid` int(10) unsigned NOT NULL COMMENT '关注者会员id',
  `recommender_memberid` int(10) unsigned NOT NULL COMMENT '推荐者会员id',
  `event_type` tinyint(1) NOT NULL COMMENT '事件类型',
  `sign_up_this_time` tinyint(1) NOT NULL COMMENT '本次扫码注册',
  `is_register` tinyint(1) NOT NULL COMMENT '扫码时是否已注册过',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_supplement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_supplement`;
CREATE TABLE `ims_yz_new_poster_supplement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int(10) unsigned NOT NULL,
  `not_start_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `finish_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wait_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '生成时等待文字',
  `disable_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '禁用时回复文字',
  `not_open_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '未开放权限提示',
  `not_open_reminder_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '未开放权限提示url',
  `recommender_credit` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得积分',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '推荐者获得金额',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得优惠券id',
  `recommender_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推荐者获得优惠券名称',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0' COMMENT '推荐者获得优惠券数量',
  `subscriber_credit` int(10) unsigned DEFAULT '0' COMMENT '关注者获得积分',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT '关注者获得金额',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0' COMMENT '关注者获得优惠券id',
  `subscriber_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关注者获得优惠券名称',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0' COMMENT '关注者获得优惠券数量',
  `bonus_method` tinyint(1) DEFAULT '1' COMMENT '奖励现金方式',
  `recommender_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推荐者奖励通知标题',
  `subscriber_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关注者奖励通知标题',
  `recommender_award_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '推荐者奖励通知',
  `subscriber_award_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关注者奖励通知',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_poster_id` (`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_member_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_member_data`;
CREATE TABLE `ims_yz_official_website_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '姓名',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_multiple
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_multiple`;
CREATE TABLE `ims_yz_official_website_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `theme_id` int(11) NOT NULL COMMENT '主题ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识',
  `mul_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键词',
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `detail` text COLLATE utf8mb4_unicode_ci COMMENT '详情',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `article` longtext COLLATE utf8mb4_unicode_ci COMMENT '文章部分',
  `helper` longtext COLLATE utf8mb4_unicode_ci COMMENT '帮助部分',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_theme_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_theme_set`;
CREATE TABLE `ims_yz_official_website_theme_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主题名称',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认 1-是 0-否',
  `basic` text COLLATE utf8mb4_unicode_ci COMMENT '基础',
  `top` text COLLATE utf8mb4_unicode_ci COMMENT '头部',
  `tail` text COLLATE utf8mb4_unicode_ci COMMENT '尾部',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'common' COMMENT '标识：用于前端显示时区别标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_operation_log`;
CREATE TABLE `ims_yz_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `modules` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块类别',
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人IP',
  `old_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '修改前内容',
  `new_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '修改后内容',
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字段名称',
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '修改的字段',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '修改所属的id',
  `input` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:记录成功|1：记录失败',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=21015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_options
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_options`;
CREATE TABLE `ims_yz_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `top_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order`;
CREATE TABLE `ims_yz_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `order_sn` varchar(23) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_total` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `is_member_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `finish_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `send_time` int(11) NOT NULL DEFAULT '0',
  `cancel_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `cancel_pay_time` int(11) NOT NULL DEFAULT '0',
  `cancel_send_time` int(11) NOT NULL DEFAULT '0',
  `dispatch_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `order_goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_status` tinyint(2) NOT NULL DEFAULT '0',
  `order_pay_id` varchar(23) NOT NULL DEFAULT '',
  `is_virtual` tinyint(4) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `mark` varchar(100) DEFAULT '' COMMENT '柜子标识',
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  `note` text,
  `cost_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `shop_name` varchar(255) DEFAULT NULL,
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要填写收货地址 0:是1:否',
  `invoice_type` int(11) DEFAULT NULL,
  `rise_type` int(11) DEFAULT NULL,
  `collect_name` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `auto_receipt` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否自动收货 0:是1:否',
  `fee_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `service_fee_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单服务费金额',
  `is_all_send_goods` int(11) DEFAULT '0' COMMENT '0 正常全部发货 1部分发货 2多包裹全部发货',
  `close_reason` text COMMENT '关闭原因',
  `vip_order_goods_price` decimal(14,2) DEFAULT NULL COMMENT '会员价金额',
  PRIMARY KEY (`id`),
  KEY `yz_order_uniacid_index` (`uniacid`),
  KEY `yz_order_uid_index` (`uid`),
  KEY `yz_order_order_sn_index` (`order_sn`),
  KEY `yz_order_plugin_id_index` (`plugin_id`),
  KEY `yz_order_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_address`;
CREATE TABLE `ims_yz_order_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市id',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区id',
  `note` text,
  `street_id` int(11) DEFAULT '0',
  `zipcode` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `yz_order_address_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_address_update_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_address_update_log`;
CREATE TABLE `ims_yz_order_address_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '平台ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `province_id` int(11) DEFAULT '0' COMMENT '省ID',
  `city_id` int(11) DEFAULT '0' COMMENT '市ID',
  `district_id` int(11) DEFAULT '0' COMMENT '区ID',
  `street_id` int(11) DEFAULT '0' COMMENT '街道ID',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `new_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新地址',
  `old_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '旧地址',
  `old_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '旧名称',
  `old_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '旧手机号',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单--订单地址修改记录';

-- ----------------------------
-- Table structure for ims_yz_order_behalf_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_behalf_pay_record`;
CREATE TABLE `ims_yz_order_behalf_pay_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `order_ids` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号合集',
  `order_pay_id` int(11) NOT NULL COMMENT '订单支付表id',
  `pay_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付单号',
  `member_id` int(11) NOT NULL COMMENT '订单会员id',
  `behalf_id` int(11) NOT NULL COMMENT '代付人id',
  `behalf_type` int(11) NOT NULL DEFAULT '1' COMMENT '1是找人代付，2是上级代付',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代付记录表';

-- ----------------------------
-- Table structure for ims_yz_order_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_change_log`;
CREATE TABLE `ims_yz_order_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `new_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_price` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `change_dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `clerk_type` varchar(255) NOT NULL DEFAULT '' COMMENT '核销员来源',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '核销员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_coin_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coin_exchange`;
CREATE TABLE `ims_yz_order_coin_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coin` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_coin_exchange_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_count`;
CREATE TABLE `ims_yz_order_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `total_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '订单总数量',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `total_pay_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '已支付订单总数量',
  `total_pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '已支付订单总金额',
  `total_complete_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '已完成订单总数量',
  `total_complete_amount` decimal(10,2) DEFAULT '0.00' COMMENT '已完成订单总金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coupon`;
CREATE TABLE `ims_yz_order_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `member_coupon_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_coupon_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coupon_return`;
CREATE TABLE `ims_yz_order_coupon_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单优惠券id',
  `return_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_created_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_created_job`;
CREATE TABLE `ims_yz_order_created_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_deduction`;
CREATE TABLE `ims_yz_order_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '抵扣名称',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣数值',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_deliver`;
CREATE TABLE `ims_yz_order_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL,
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_discount`;
CREATE TABLE `ims_yz_order_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `discount_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '折扣代码',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `is_indirect` tinyint(1) NOT NULL DEFAULT '0' COMMENT '间接计算出',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该优惠项目不在预下单显示，0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_expediting_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_expediting_delivery`;
CREATE TABLE `ims_yz_order_expediting_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_express`;
CREATE TABLE `ims_yz_order_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_fee`;
CREATE TABLE `ims_yz_order_fee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `fee_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手续费码',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods`;
CREATE TABLE `ims_yz_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pay_sn` varchar(23) NOT NULL DEFAULT '',
  `total` int(11) NOT NULL DEFAULT '1',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_sn` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_option_id` int(11) NOT NULL DEFAULT '0',
  `goods_option_title` varchar(50) NOT NULL DEFAULT '',
  `product_sn` varchar(23) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_status` tinyint(3) NOT NULL DEFAULT '0',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `goods_market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vip_price` decimal(10,2) DEFAULT '0.00',
  `coupon_price` decimal(10,2) DEFAULT '0.00',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要填写收货地址 0:是1:否',
  `order_express_id` int(11) DEFAULT NULL COMMENT 'order_express表id  商品属于哪个包裹',
  `is_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否退款 1是 0否',
  PRIMARY KEY (`id`),
  KEY `yz_order_goods_order_id_index` (`order_id`),
  KEY `yz_order_goods_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1564 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_goods_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_change_log`;
CREATE TABLE `ims_yz_order_goods_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_change_log_id` int(11) DEFAULT NULL,
  `order_goods_id` int(11) NOT NULL,
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `new_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_goods_coin_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_coin_exchange`;
CREATE TABLE `ims_yz_order_goods_coin_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_goods_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coin` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_goods_coin_exchange_order_goods_id_index` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_coupon`;
CREATE TABLE `ims_yz_order_goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_goods_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_several` int(11) NOT NULL DEFAULT '1',
  `send_type` tinyint(4) NOT NULL DEFAULT '1',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT '发放数量。字段名和原流程一致',
  `end_send_num` int(11) NOT NULL DEFAULT '0' COMMENT '已发放。字段名和原流程一致',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应发几张和实发几张不一致时原因',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_goods_id_coupon_id` (`order_goods_id`,`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_deduction`;
CREATE TABLE `ims_yz_order_goods_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `order_goods_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '抵扣名称',
  `usable_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `usable_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣数值',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `used_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣数值',
  `used_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_discount`;
CREATE TABLE `ims_yz_order_goods_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_goods_id` int(11) NOT NULL,
  `discount_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '折扣代码',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `is_indirect` tinyint(1) NOT NULL DEFAULT '0' COMMENT '间接计算出',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_diy_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_diy_form`;
CREATE TABLE `ims_yz_order_goods_diy_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `diyform_data_id` int(11) DEFAULT NULL,
  `order_goods_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_expansion
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_expansion`;
CREATE TABLE `ims_yz_order_goods_expansion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_goods_id` int(11) NOT NULL,
  `plugin_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_income_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_income_count`;
CREATE TABLE `ims_yz_order_income_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL COMMENT '购买者id',
  `buy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买者昵称',
  `parent_id` int(11) NOT NULL COMMENT '推荐者id',
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐者昵称',
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单号',
  `price` decimal(14,2) DEFAULT NULL COMMENT '订单金额',
  `cost_price` decimal(14,2) DEFAULT NULL COMMENT '订单成本价',
  `dispatch_price` decimal(14,2) DEFAULT NULL COMMENT '订单运费',
  `undividend` decimal(14,2) DEFAULT NULL COMMENT '未被分红利润',
  `supplier` decimal(14,2) DEFAULT NULL COMMENT '供应商利润',
  `cashier` decimal(14,2) DEFAULT NULL COMMENT '收银台利润',
  `store` decimal(14,2) DEFAULT NULL COMMENT '门店利润',
  `point` decimal(14,2) DEFAULT NULL COMMENT '获得积分',
  `love` decimal(14,2) DEFAULT NULL COMMENT '获得爱心值',
  `micro_shop` decimal(14,2) DEFAULT NULL COMMENT '微店分红',
  `team_dividend` decimal(14,2) DEFAULT NULL COMMENT '经销商提成',
  `area_dividend` decimal(14,2) DEFAULT NULL COMMENT '区域分红',
  `merchant` decimal(14,2) DEFAULT NULL COMMENT '招商员分红',
  `merchant_center` decimal(14,2) DEFAULT NULL COMMENT '招商中心分红',
  `commission` decimal(14,2) DEFAULT NULL COMMENT '分销分红',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `plugin_id` int(11) DEFAULT NULL COMMENT '插件id',
  `day_time` int(11) NOT NULL COMMENT '购买日期',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `room` decimal(14,2) DEFAULT NULL COMMENT '主播分红',
  PRIMARY KEY (`id`),
  KEY `yz_order_income_count_order_id_index` (`order_id`),
  KEY `yz_order_income_count_uniacid_index` (`uniacid`),
  KEY `yz_order_income_count_uid_index` (`uid`),
  KEY `yz_order_income_count_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_invoice`;
CREATE TABLE `ims_yz_order_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `need_invoice` int(11) NOT NULL COMMENT '是否开发票 0否1是',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型(0电子1纸质)',
  `rise_type` int(11) DEFAULT NULL COMMENT '发票抬头(1个人0单位)',
  `collect_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '抬头或单位名称',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `company_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位识别码',
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '发票图片链接',
  `preview_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '发票预览链接',
  `invoice_date` int(11) DEFAULT NULL COMMENT '开票时间',
  `state` tinyint(4) DEFAULT '0' COMMENT '0未开票、1开票成功、2开票中、3开票失败',
  `invoice_fail_msg` text COLLATE utf8mb4_unicode_ci COMMENT '开票失败原因',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `enterprise_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业唯一标识',
  `invoice_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票请求流水号 (全局唯一)',
  `equipment_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '税控设备号',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '开票类型：0-蓝字发票；1-红字发票',
  `special_type` int(11) NOT NULL DEFAULT '0' COMMENT '特殊票种：0-不是；1-农产品销售；2-农产品收购(收购票)',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '征收方式：0- 专普票；1-减按计增；2-差额征收',
  `list_identification` int(11) NOT NULL DEFAULT '0' COMMENT '清单标识：0- 非清单；1- 清单',
  `xsf_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '销售方名称',
  `xsf_taxpayer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '销售方纳税人识别号',
  `xsf_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '销售方地址',
  `xsf_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '销售方电话',
  `xsf_bank_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '销售方银行账户',
  `gmf_taxpayer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '购买方纳税人识别号',
  `gmf_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册地址',
  `gmf_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开户银行',
  `gmf_bank_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '购买方银行账户',
  `gmf_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册电话',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票内容',
  `drawer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开票人',
  `payee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收款人',
  `reviewer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '复核人',
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `notice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '通知单编号',
  `applicant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请人',
  `is_audit` int(11) NOT NULL DEFAULT '0' COMMENT '是否自动审核：0-非自动审核；1-自动审核',
  `detail_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '明细参数',
  `tax_rate` int(11) NOT NULL DEFAULT '0' COMMENT '税率',
  `zero_tax_rate` int(11) NOT NULL DEFAULT '0' COMMENT '零税率标识：0-正常税率；1-免税；2-不征税；3-普通零税率',
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票编号',
  `invoice_nature` int(11) NOT NULL DEFAULT '0' COMMENT '发票行性质: 0-正常行;1-折扣行 (折扣票金额正);2-被折扣行''(折扣票金额负)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '开票状态 0-未开票，1-开票成功，2-开票中',
  `invoice_time` int(11) NOT NULL DEFAULT '0' COMMENT '开票时间',
  `invoice_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发票图片地址',
  `apply` int(11) NOT NULL DEFAULT '0' COMMENT '申请开票（0=未申请，1=已申请）',
  `col_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收票地址',
  `col_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收票人姓名',
  `col_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收票人电话',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'uid',
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单--发票记录';

-- ----------------------------
-- Table structure for ims_yz_order_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_mapping`;
CREATE TABLE `ims_yz_order_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_order_id` int(11) NOT NULL,
  `new_order_id` int(11) NOT NULL,
  `old_openid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_merge_create
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_merge_create`;
CREATE TABLE `ims_yz_order_merge_create` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '一同创建的订单ID，逗号拼接',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单合并创建表';

-- ----------------------------
-- Table structure for ims_yz_order_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_operation_log`;
CREATE TABLE `ims_yz_order_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `before_operation_status` tinyint(1) DEFAULT '0',
  `after_operation_status` tinyint(1) DEFAULT '0',
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `operation_time` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_package`;
CREATE TABLE `ims_yz_order_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单表id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `total` int(11) NOT NULL COMMENT '数量',
  `order_express_id` int(11) NOT NULL COMMENT '订单物流表id',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Oid_OGid` (`order_id`,`order_goods_id`),
  KEY `ids_OEid` (`order_express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单包裹表';

-- ----------------------------
-- Table structure for ims_yz_order_paid_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_paid_job`;
CREATE TABLE `ims_yz_order_paid_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pay`;
CREATE TABLE `ims_yz_order_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn` varchar(23) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `pay_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_time` int(11) DEFAULT NULL,
  `refund_time` int(11) DEFAULT NULL,
  `order_ids` varchar(500) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uid` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_order_pay_pay_sn_index` (`pay_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pay_order`;
CREATE TABLE `ims_yz_order_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_pay_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_order_pay_id` (`order_pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pending`;
CREATE TABLE `ims_yz_order_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_model_id` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_plugin`;
CREATE TABLE `ims_yz_order_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单plugin_id',
  `main_plugin_id` int(11) NOT NULL COMMENT '订单plugin_id',
  `sub_plugin_id` int(11) NOT NULL COMMENT '订单商品plugin_id，注：不同plugin_id的商品会分单，不存在一个订单里有多个不同plugin_id的商品',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_plugin_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单商品插件表';

-- ----------------------------
-- Table structure for ims_yz_order_plugin_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_plugin_bonus`;
CREATE TABLE `ims_yz_order_plugin_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ids` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `undividend` decimal(14,2) NOT NULL DEFAULT '0.00',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `member_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_received_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_received_job`;
CREATE TABLE `ims_yz_order_received_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund`;
CREATE TABLE `ims_yz_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `refund_sn` varchar(255) NOT NULL,
  `refund_type` tinyint(1) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `images` text NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `reply` text,
  `reject_reason` text,
  `refund_way_type` tinyint(3) DEFAULT '0',
  `apply_price` decimal(10,2) DEFAULT '0.00',
  `order_price` decimal(10,2) DEFAULT '0.00',
  `refund_proof_imgs` text,
  `refund_time` int(11) DEFAULT NULL,
  `refund_address` text,
  `remark` text,
  `operate_time` int(11) DEFAULT NULL,
  `send_time` int(11) DEFAULT NULL,
  `return_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT '0',
  `alipay_batch_sn` varchar(255) DEFAULT '',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(1) DEFAULT NULL,
  `receive_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '收货状态 0未收货 1已收货',
  `part_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单部分退款 0否 1是',
  `freight_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费金额',
  `other_price` decimal(10,2) DEFAULT '0.00' COMMENT '其他费用金额',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_shop_id` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_refund_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_change_log`;
CREATE TABLE `ims_yz_order_refund_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `refund_id` int(11) DEFAULT NULL COMMENT '退款记录id',
  `old_price` decimal(14,2) DEFAULT '0.00' COMMENT '旧金额',
  `new_price` decimal(14,2) DEFAULT '0.00' COMMENT '新金额',
  `change_price` decimal(14,2) DEFAULT '0.00' COMMENT '改价金额',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作员名称',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  `change_freight_price` decimal(10,2) DEFAULT '0.00' COMMENT '修改运费金额',
  `change_other_price` decimal(10,2) DEFAULT '0.00' COMMENT '修改其他费用金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单--退款金额修改记录';

-- ----------------------------
-- Table structure for ims_yz_order_refund_goods_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_goods_log`;
CREATE TABLE `ims_yz_order_refund_goods_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `refund_id` int(11) NOT NULL COMMENT '退款ID',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品ID',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT '发货数量',
  `refund_total` int(11) NOT NULL DEFAULT '0' COMMENT '退款商品数量',
  `refund_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '退款商品金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `refund_idx` (`refund_id`),
  KEY `order_goods_idx` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='已退款订单商品记录';

-- ----------------------------
-- Table structure for ims_yz_order_refund_process_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_process_log`;
CREATE TABLE `ims_yz_order_refund_process_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `refund_id` int(11) NOT NULL COMMENT '退款ID',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT '操作员类型',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `operate_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `detail` text COLLATE utf8mb4_unicode_ci COMMENT '详情描述',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备用字段',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `refund_idx` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售后协商记录';

-- ----------------------------
-- Table structure for ims_yz_order_remark
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_remark`;
CREATE TABLE `ims_yz_order_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `remark` char(255) NOT NULL,
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_request`;
CREATE TABLE `ims_yz_order_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_sent_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_sent_job`;
CREATE TABLE `ims_yz_order_sent_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_service_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_service_fee`;
CREATE TABLE `ims_yz_order_service_fee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '服务费码',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单--服务费记录';

-- ----------------------------
-- Table structure for ims_yz_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_setting`;
CREATE TABLE `ims_yz_order_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_statistics`;
CREATE TABLE `ims_yz_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `total_quantity` int(11) DEFAULT '0' COMMENT '商城总订单数',
  `total_amount` int(11) DEFAULT '0' COMMENT '商城总订单金额',
  `total_pay_quantity` int(11) DEFAULT '0' COMMENT '商城已支付订单数',
  `total_pay_amount` int(11) DEFAULT '0' COMMENT '商城已支付订单金额',
  `total_complete_quantity` int(11) DEFAULT '0' COMMENT '商城已完成订单数',
  `total_complete_amount` int(11) DEFAULT '0' COMMENT '商城已完成订单金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_status
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_status`;
CREATE TABLE `ims_yz_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_outside_app_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_app_setting`;
CREATE TABLE `ims_yz_outside_app_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用AppID',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '应用secret',
  `black_list` text COLLATE utf8mb4_unicode_ci COMMENT 'IP黑名单',
  `white_list` text COLLATE utf8mb4_unicode_ci COMMENT 'IP白名单',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '其他设置',
  `sign_required` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要签名 0需要1不需要',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `app_idx` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='对外应用设置表';

-- ----------------------------
-- Table structure for ims_yz_outside_order_has_many_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_order_has_many_order`;
CREATE TABLE `ims_yz_outside_order_has_many_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `outside_order_id` int(11) NOT NULL COMMENT '外部订单记录id',
  `order_id` int(11) DEFAULT NULL COMMENT '商城订单id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单与第三方订单关系表';

-- ----------------------------
-- Table structure for ims_yz_outside_order_trade
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_order_trade`;
CREATE TABLE `ims_yz_outside_order_trade` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_ids` text COLLATE utf8mb4_unicode_ci COMMENT '商城订单id组',
  `outside_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方订单编号',
  `trade_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商城订单编号',
  `total_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='第三方下单关系记录';

-- ----------------------------
-- Table structure for ims_yz_package_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver`;
CREATE TABLE `ims_yz_package_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_uid` int(11) DEFAULT NULL COMMENT 'ims_users.uid',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自提点名称',
  `deliver_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自提点电话',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `district_id` int(11) DEFAULT NULL COMMENT '区',
  `street_id` int(11) DEFAULT NULL COMMENT '街道',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间',
  `aptitute` text COLLATE utf8mb4_unicode_ci COMMENT '资质',
  `id_card_front` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证正面',
  `id_card_side` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证背面',
  `thumb` text COLLATE utf8mb4_unicode_ci COMMENT '自提点图片',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT '招商专员会员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_apply`;
CREATE TABLE `ims_yz_package_deliver_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自提点名称',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `district_id` int(11) DEFAULT NULL COMMENT '区',
  `street_id` int(11) DEFAULT NULL COMMENT '街道',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营业时间',
  `aptitute` text COLLATE utf8mb4_unicode_ci COMMENT '资质',
  `id_card_front` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证正面',
  `id_card_side` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证背面',
  `thumb` text COLLATE utf8mb4_unicode_ci COMMENT '自提点图片',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT '招商专员会员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_band_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_band_member`;
CREATE TABLE `ims_yz_package_deliver_band_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `deliver_id` int(11) NOT NULL DEFAULT '0' COMMENT '自提点ID',
  `band_type` tinyint(4) DEFAULT NULL COMMENT '绑定方式:1-首次进入绑定，2-选择其他自提点，3-下单更改，4-他人分享(优先级最高)',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商关联自提点--会员绑定自提点表';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_bonus`;
CREATE TABLE `ims_yz_package_deliver_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pd_id` int(11) DEFAULT NULL COMMENT 'package_deliver.id',
  `order_id` int(11) DEFAULT NULL COMMENT 'yz_order.id',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `original_amount` decimal(14,2) DEFAULT '0.00' COMMENT '提成总金额',
  `dividend_rate` decimal(10,2) DEFAULT '0.00' COMMENT '提成比率',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '实际提成金额',
  `status` int(11) DEFAULT NULL COMMENT '提成状态',
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间用于分组',
  `amount_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品有独立设置,提成算法记录',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_clerk`;
CREATE TABLE `ims_yz_package_deliver_clerk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pd_id` int(11) DEFAULT NULL COMMENT 'package_deliver.id',
  `uid` int(11) DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups`;
CREATE TABLE `ims_yz_package_deliver_community_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色',
  `share_img` text COLLATE utf8mb4_unicode_ci COMMENT '分享图片',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述说明',
  `is_all_area` int(11) DEFAULT '1' COMMENT '是否全部区域自提点',
  `condition_status` int(11) DEFAULT NULL COMMENT '成团条件 0无 1最低订单数 2最低人数 3最低金额',
  `min_order_count` int(11) DEFAULT NULL COMMENT '1最低订单数',
  `min_person_count` int(11) DEFAULT NULL COMMENT '2最低人数',
  `min_total_count` int(11) DEFAULT NULL COMMENT '3最低金额',
  `status` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_area
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_area`;
CREATE TABLE `ims_yz_package_deliver_community_groups_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `community_groups_id` int(11) NOT NULL COMMENT '标签id',
  `area_id` int(11) NOT NULL COMMENT '地区ID',
  `level` tinyint(1) NOT NULL COMMENT '地区等级',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_cart`;
CREATE TABLE `ims_yz_package_deliver_community_groups_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `uniacid` int(11) NOT NULL COMMENT '所属公众号id',
  `group_id` int(11) DEFAULT NULL COMMENT '团购id',
  `deliver_id` int(11) NOT NULL COMMENT '自提点id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `total` int(11) NOT NULL COMMENT '加入购物车数量',
  `option_id` int(11) NOT NULL COMMENT '商品规格id',
  `created_at` int(11) NOT NULL COMMENT '加入购物车时间',
  `updated_at` int(11) NOT NULL COMMENT '最后一次修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '移除购物车时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_groups_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods_statistic`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `deliver_id` int(11) DEFAULT NULL COMMENT '自提点id',
  `group_id` int(11) DEFAULT '0' COMMENT '活动id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_goods_id` int(11) DEFAULT '0' COMMENT '订单商品id',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `option_id` int(11) DEFAULT '0' COMMENT '商品规格id',
  `total` int(11) DEFAULT '0' COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品总金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `order_goods_idx` (`order_goods_id`),
  KEY `goods_idx` (`goods_id`),
  KEY `option_idx` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods_with_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods_with_deliver`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods_with_deliver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_order`;
CREATE TABLE `ims_yz_package_deliver_community_groups_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `community_groups_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_poster`;
CREATE TABLE `ims_yz_package_deliver_community_groups_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1普通二维码  2小程序码  3公众号码',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_street
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_street`;
CREATE TABLE `ims_yz_package_deliver_community_groups_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `community_groups_id` int(11) NOT NULL COMMENT '标签id',
  `area_id` int(11) NOT NULL COMMENT '地区ID',
  `level` tinyint(1) NOT NULL COMMENT '地区等级',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_goods`;
CREATE TABLE `ims_yz_package_deliver_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `has_independent` int(11) DEFAULT NULL COMMENT '是否启用独立奖励规则',
  `ratio` decimal(10,2) DEFAULT NULL COMMENT '比例',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '固定金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `assign` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品指定自提点：0全部1指定',
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自提点--商品挂件';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_goods_assign
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_goods_assign`;
CREATE TABLE `ims_yz_package_deliver_goods_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `package_deliver_id` int(11) DEFAULT NULL COMMENT '自提点id',
  `stock_sum` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '库存数量',
  `used_sum` int(11) DEFAULT '0' COMMENT '以发商品库存数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `package_deliver_idx` (`package_deliver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自提点--商品指定表';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_order`;
CREATE TABLE `ims_yz_package_deliver_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL,
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `click_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_polymorphism
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_polymorphism`;
CREATE TABLE `ims_yz_package_deliver_polymorphism` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `deliver_id` int(11) DEFAULT NULL COMMENT '自提点ID',
  `polymorphism` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自提点类型',
  `polymorphism_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `deliver_id` (`deliver_id`),
  KEY `polymorphism_id` (`polymorphism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自提点-- 多态类型关联表';

-- ----------------------------
-- Table structure for ims_yz_page_share_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_page_share_record`;
CREATE TABLE `ims_yz_page_share_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL,
  `share_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_parking_print_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_parking_print_template`;
CREATE TABLE `ims_yz_parking_print_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL COMMENT '门店id',
  `owner_id` int(11) DEFAULT NULL COMMENT '门店id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模板名称',
  `status` int(11) DEFAULT NULL COMMENT '状态:0关闭 1开启',
  `print_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头部',
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='打印机--车场打印模板';

-- ----------------------------
-- Table structure for ims_yz_partner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_partner`;
CREATE TABLE `ims_yz_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `partner_reward_total` int(11) DEFAULT NULL,
  `same_level_total` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_partner_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_partner_reward_log`;
CREATE TABLE `ims_yz_partner_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `amount` decimal(10,2) DEFAULT '0.00',
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `receive_at` int(11) DEFAULT NULL,
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settle_days` int(11) DEFAULT NULL,
  `statement_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_access_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_access_log`;
CREATE TABLE `ims_yz_pay_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_log`;
CREATE TABLE `ims_yz_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price` decimal(14,2) NOT NULL,
  `operation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(13) NOT NULL DEFAULT '0',
  `updated_at` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_order`;
CREATE TABLE `ims_yz_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(14,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_order_no` (`out_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_refund_order`;
CREATE TABLE `ims_yz_pay_refund_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `out_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` decimal(14,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_request_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_request_data`;
CREATE TABLE `ims_yz_pay_request_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_response_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_response_data`;
CREATE TABLE `ims_yz_pay_response_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type`;
CREATE TABLE `ims_yz_pay_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `plugin_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `setting_key` varchar(255) DEFAULT NULL,
  `need_password` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_pay_type_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type_group`;
CREATE TABLE `ims_yz_pay_type_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_type_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type_manage`;
CREATE TABLE `ims_yz_pay_type_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `pay_type_id` int(11) NOT NULL COMMENT '支付类型id',
  `plugin_id` int(11) DEFAULT NULL COMMENT '插件区分',
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付别名',
  `enable` tinyint(4) DEFAULT '0' COMMENT '是否开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacidx` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付别名';

-- ----------------------------
-- Table structure for ims_yz_pay_withdraw_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_withdraw_order`;
CREATE TABLE `ims_yz_pay_withdraw_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) DEFAULT NULL,
  `out_order_no` varchar(32) NOT NULL DEFAULT '',
  `trade_no` varchar(255) DEFAULT NULL,
  `price` decimal(14,2) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `created_at` int(13) NOT NULL DEFAULT '0',
  `updated_at` int(13) NOT NULL DEFAULT '0',
  `deleted_at` int(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付提现单';

-- ----------------------------
-- Table structure for ims_yz_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_permission`;
CREATE TABLE `ims_yz_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `item_id` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78789 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_attribution
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_attribution`;
CREATE TABLE `ims_yz_phone_attribution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `province` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市',
  `sp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '运营商',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_goods`;
CREATE TABLE `ims_yz_phone_bill_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `option_id` int(11) DEFAULT NULL COMMENT '规格id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0关闭 1开启',
  `type` int(11) DEFAULT NULL COMMENT '1=50元，2=100元，3=200元',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_order`;
CREATE TABLE `ims_yz_phone_bill_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `order_goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `type` int(11) DEFAULT NULL COMMENT '1=50,2=100,3=200',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` int(11) DEFAULT NULL COMMENT '1=未充值，2=充值中，3=充值成功, 4=充值失败, 5 = 退款',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pre_call_back
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pre_call_back`;
CREATE TABLE `ims_yz_phone_bill_pre_call_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_pre_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交给第三方的id',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方订单号',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '充值额度',
  `actualAmount` decimal(14,2) DEFAULT NULL COMMENT '实际扣除金额',
  `createdAt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下单时间',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SUCCESS成功 FAIL失败',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT '回调原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pre_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pre_order`;
CREATE TABLE `ims_yz_phone_bill_pre_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `order_pre_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交给第三方的id',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '充值额度',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `return_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回code',
  `return_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回msg',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回code',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT '接口返回数据实体',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_phone_bill_pre_order_order_pre_id_index` (`order_pre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_call_back
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_call_back`;
CREATE TABLE `ims_yz_phone_bill_pro_call_back` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交给第三方的id',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方订单号',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '充值额度',
  `actualAmount` decimal(14,2) DEFAULT NULL COMMENT '实际扣除金额',
  `createdAt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下单时间',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SUCCESS成功 FAIL失败',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT '回调原因',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `all_data` text COLLATE utf8mb4_unicode_ci COMMENT '回调所有参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--充值回调表';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_charge_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_charge_order`;
CREATE TABLE `ims_yz_phone_bill_pro_charge_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号，也提交给第三方',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '充值额度',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0慢充 1快充',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `return_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回code',
  `return_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回msg',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口返回code',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT '接口返回数据实体',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值通道',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--充值订单表';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_goods`;
CREATE TABLE `ims_yz_phone_bill_pro_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '平台ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_option_id` int(11) DEFAULT NULL COMMENT '规格id',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '自定义文案',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0慢充 1快充',
  `type` tinyint(4) DEFAULT NULL COMMENT '1=50元，2=100元，3=200元',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `bingbird_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联必应鸟商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--商品信息表';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_goods_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_goods_set`;
CREATE TABLE `ims_yz_phone_bill_pro_goods_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '平台ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用充值',
  `banner` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banner',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--商品设置表';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_order`;
CREATE TABLE `ims_yz_phone_bill_pro_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_option_id` int(11) DEFAULT NULL COMMENT '规格id',
  `type` int(11) DEFAULT NULL COMMENT '1=50,2=100,3=200',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0慢充 1快充',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` int(11) DEFAULT NULL COMMENT '1=未充值，2=充值中，3=充值成功, 4=充值失败, 5 = 退款',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--订单表';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_set`;
CREATE TABLE `ims_yz_phone_bill_pro_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '插件开启:0关闭,1开启',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'appKey',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'appSecret',
  `is_default_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认下单地址:0关闭,1开启',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认下单用户姓名',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认下单用户手机号',
  `province_id` int(11) DEFAULT NULL COMMENT '默认下单省ID',
  `city_id` int(11) DEFAULT NULL COMMENT '默认下单市ID',
  `district_id` int(11) DEFAULT NULL COMMENT '默认下单区ID',
  `street_id` int(11) DEFAULT NULL COMMENT '默认下单街道ID',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认下单详细地址',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `notify_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回调地址',
  `channel_list` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通道列表',
  `is_strategy` int(11) NOT NULL COMMENT '通道策略',
  `priority` int(11) NOT NULL COMMENT '36鲸通道优先级',
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值通道',
  `is_no_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT '充值失败是否不退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话费充值Pro--设置信息表';

-- ----------------------------
-- Table structure for ims_yz_picture_album
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album`;
CREATE TABLE `ims_yz_picture_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_peo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_background` tinyint(4) DEFAULT NULL,
  `background_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `is_open` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_picture_album_image
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album_image`;
CREATE TABLE `ims_yz_picture_album_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `picture_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `delete_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_picture_album_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album_thumb`;
CREATE TABLE `ims_yz_picture_album_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article`;
CREATE TABLE `ims_yz_plugin_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `desc` text,
  `thumb` text,
  `content` longtext NOT NULL,
  `virtual_created_at` int(11) DEFAULT NULL,
  `author` varchar(20) NOT NULL DEFAULT '',
  `virtual_read_num` int(11) DEFAULT NULL,
  `read_num` int(11) NOT NULL DEFAULT '0',
  `virtual_like_num` int(11) DEFAULT NULL,
  `like_num` int(11) NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `per_person_per_day` int(11) DEFAULT NULL,
  `total_per_person` int(11) DEFAULT NULL,
  `point` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `bonus_total` decimal(10,2) DEFAULT '0.00',
  `bonus_total_now` int(11) DEFAULT NULL,
  `no_copy_url` tinyint(1) DEFAULT NULL,
  `no_share` tinyint(1) DEFAULT NULL,
  `no_share_to_friend` tinyint(1) DEFAULT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `report_enabled` tinyint(1) DEFAULT NULL,
  `advs_type` tinyint(1) DEFAULT NULL,
  `advs_title` varchar(255) DEFAULT NULL,
  `advs_title_footer` varchar(255) DEFAULT NULL,
  `advs_link` varchar(255) DEFAULT NULL,
  `advs` text,
  `state` tinyint(1) DEFAULT NULL,
  `state_wechat` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `advs_img` varchar(255) DEFAULT NULL,
  `reward_mode` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT '0' COMMENT '文章类型',
  `display_order` int(11) DEFAULT NULL COMMENT '排序',
  `audio_link` varchar(255) DEFAULT NULL COMMENT '音频链接',
  `show_levels` text COMMENT '会员等级浏览权限',
  `small_link` varchar(255) DEFAULT NULL COMMENT '小程序链接',
  `min_app_advs_link` varchar(255) DEFAULT NULL COMMENT '小程序广告链接',
  `article_logo` varchar(255) DEFAULT '' COMMENT '期刊杂志插件--文章logo',
  `manager_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_state` (`uniacid`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_category`;
CREATE TABLE `ims_yz_plugin_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `member_level_limit` int(11) DEFAULT NULL,
  `commission_level_limit` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `member_level_id_limit` int(11) DEFAULT NULL,
  `cate_desc` longtext COMMENT '描述',
  `cate_img` varchar(255) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_comment`;
CREATE TABLE `ims_yz_plugin_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论昵称',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论头像',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `reply_id` int(11) DEFAULT '0' COMMENT '回答哪个会员ID',
  `reply_comment_id` int(11) DEFAULT NULL COMMENT '回答哪个评论',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回答哪个昵称',
  `manager_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `type` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否审核通过',
  PRIMARY KEY (`id`),
  KEY `idx_articleid` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章评论表';

-- ----------------------------
-- Table structure for ims_yz_plugin_article_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_log`;
CREATE TABLE `ims_yz_plugin_article_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `read_num` int(11) DEFAULT NULL,
  `like_num` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `liked` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_articleid` (`uniacid`,`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_manager
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_manager`;
CREATE TABLE `ims_yz_plugin_article_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `uid` int(11) NOT NULL COMMENT '管理员id',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登陆账号',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `mobile` int(11) DEFAULT NULL COMMENT '电话',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章营销管理员表';

-- ----------------------------
-- Table structure for ims_yz_plugin_article_report
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_report`;
CREATE TABLE `ims_yz_plugin_article_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_share`;
CREATE TABLE `ims_yz_plugin_article_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `share_uid` int(11) DEFAULT NULL,
  `click_uid` int(11) DEFAULT NULL,
  `click_time` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `credit` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_balance_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_balance_order`;
CREATE TABLE `ims_yz_plugin_balance_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `balance_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_cashier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_cashier_order`;
CREATE TABLE `ims_yz_plugin_cashier_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已提现',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `pay_type_id` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_mode` int(11) DEFAULT '0',
  `settle_time` int(11) DEFAULT NULL COMMENT '结算时间',
  `split_time` int(11) DEFAULT NULL COMMENT '分账时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_goods_assistant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_goods_assistant`;
CREATE TABLE `ims_yz_plugin_goods_assistant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `itemid` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_cashier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_cashier_order`;
CREATE TABLE `ims_yz_plugin_hotel_cashier_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `has_withdraw` tinyint(4) NOT NULL,
  `has_settlement` tinyint(4) NOT NULL,
  `settlement_days` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `fee_percentage` decimal(10,2) NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_type_id` tinyint(4) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_order`;
CREATE TABLE `ims_yz_plugin_hotel_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(4) NOT NULL DEFAULT '0',
  `has_settlement` tinyint(4) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `verification_clerk_id` int(11) NOT NULL DEFAULT '0',
  `pay_type_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `enter_at` int(11) DEFAULT NULL,
  `leave_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_self_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_self_delivery`;
CREATE TABLE `ims_yz_plugin_hotel_self_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `hotel_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_jd_supply_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_jd_supply_order`;
CREATE TABLE `ims_yz_plugin_jd_supply_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags`;
CREATE TABLE `ims_yz_plugin_member_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `update_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '1手动 2自动',
  `group_condition_type` int(11) DEFAULT '0' COMMENT '1与2或',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_condition
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_condition`;
CREATE TABLE `ims_yz_plugin_member_tags_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_type` int(11) DEFAULT '0' COMMENT '1与2或',
  `conditions` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_exec_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_exec_history`;
CREATE TABLE `ims_yz_plugin_member_tags_exec_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `member_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_group`;
CREATE TABLE `ims_yz_plugin_member_tags_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_pack_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_pack_member_cart`;
CREATE TABLE `ims_yz_plugin_pack_member_cart` (
  `created_at` int(11) NOT NULL COMMENT '加入购物车时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '移除购物车时间',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `option_id` int(11) NOT NULL COMMENT '商品规格id',
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `total` int(11) NOT NULL COMMENT '加入购物车数量',
  `uniacid` int(11) NOT NULL COMMENT '所属公众号id',
  `updated_at` int(11) NOT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_member_cart`;
CREATE TABLE `ims_yz_plugin_store_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `uniacid` int(11) NOT NULL COMMENT '所属公众号id',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `total` int(11) NOT NULL COMMENT '加入购物车数量',
  `option_id` int(11) NOT NULL COMMENT '商品规格id',
  `created_at` int(11) NOT NULL COMMENT '加入购物车时间',
  `updated_at` int(11) NOT NULL COMMENT '最后一次修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '移除购物车时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_order`;
CREATE TABLE `ims_yz_plugin_store_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `verification_clerk_id` int(11) NOT NULL DEFAULT '0',
  `pay_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式id',
  `withdraw_mode` int(11) DEFAULT '0',
  `settle_time` int(11) DEFAULT NULL COMMENT '结算时间',
  `split_time` int(11) DEFAULT NULL COMMENT '分账时间',
  `hidden_type` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0正常显示 1隐藏(上门安装)',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_self_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_self_delivery`;
CREATE TABLE `ims_yz_plugin_store_self_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_store_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_store_delivery`;
CREATE TABLE `ims_yz_plugin_store_store_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) DEFAULT '0',
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity`;
CREATE TABLE `ims_yz_point_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `point` decimal(12,2) DEFAULT '0.00' COMMENT '赠送积分',
  `used` decimal(12,2) DEFAULT '0.00' COMMENT '已领取积分',
  `stock` decimal(12,2) DEFAULT '0.00' COMMENT '剩余积分',
  `average` decimal(12,2) DEFAULT '0.00' COMMENT '积分/每人',
  `total` int(11) DEFAULT '0' COMMENT '赠送个数',
  `receive` int(11) DEFAULT '0' COMMENT '已领取个数',
  `remain` int(11) DEFAULT '0' COMMENT '剩余个数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:进行中，1:领取完，2:已过期',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `validity_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity_award_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity_award_log`;
CREATE TABLE `ims_yz_point_activity_award_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `give_member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `money` decimal(12,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity_receive_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity_receive_log`;
CREATE TABLE `ims_yz_point_activity_receive_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `member_id` int(11) DEFAULT NULL,
  `point` decimal(12,2) DEFAULT '0.00' COMMENT '领取积分值',
  `used` decimal(12,2) DEFAULT '0.00',
  `stock` decimal(12,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0:已领取，1:使用中，2:已使用，3已过期',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `validity_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_log`;
CREATE TABLE `ims_yz_point_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point_income_type` tinyint(2) NOT NULL DEFAULT '0',
  `point_mode` tinyint(5) NOT NULL DEFAULT '0',
  `before_point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `after_point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(255) NOT NULL DEFAULT '0',
  `thirdStatus` varchar(255) DEFAULT '1',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `relation_id` int(11) DEFAULT NULL,
  `order_goods_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单商品id,退款返还积分使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_point_love_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_love_set`;
CREATE TABLE `ims_yz_point_love_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '所属公众号',
  `member_id` int(11) NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_love` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transfer_integral` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_goods`;
CREATE TABLE `ims_yz_point_mall_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `point` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全抵所需积分数',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_point_mall_goods_goods_id_uniacid_index` (`goods_id`,`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='积分商城--商品表';

-- ----------------------------
-- Table structure for ims_yz_point_mall_goods_options
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_goods_options`;
CREATE TABLE `ims_yz_point_mall_goods_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_option_id` int(11) NOT NULL COMMENT '商品规格ID',
  `goods_option_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品规格标题',
  `goods_point` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全抵所需积分数',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='积分商城--商品规格表';

-- ----------------------------
-- Table structure for ims_yz_point_mall_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_set`;
CREATE TABLE `ims_yz_point_mall_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '插件是否开启，0-否，1-是',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `change_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品规格信息变动，积分商品相应变动规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='积分商城--设置表';

-- ----------------------------
-- Table structure for ims_yz_point_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_queue`;
CREATE TABLE `ims_yz_point_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `point_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送积分总数',
  `finish_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '完成数量',
  `surplus_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余数量',
  `once_unit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '每次赠送数量',
  `last_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最后一次赠送数量',
  `status` tinyint(1) DEFAULT '0' COMMENT '1已完成',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_queue_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_queue_log`;
CREATE TABLE `ims_yz_point_queue_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `queue_id` int(11) NOT NULL COMMENT '积分队列ID',
  `amount` decimal(14,2) NOT NULL COMMENT '赠送数量',
  `point_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送积分总数',
  `finish_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '完成数量',
  `surplus_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_recharge`;
CREATE TABLE `ims_yz_point_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_transfer`;
CREATE TABLE `ims_yz_point_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `transferor` int(11) DEFAULT NULL COMMENT '转让者',
  `recipient` int(11) DEFAULT NULL COMMENT '被转让者',
  `value` decimal(14,2) DEFAULT NULL COMMENT '转让值',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '-1失败，1成功',
  `updated_at` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poundage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_post_by_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_post_by_wechat`;
CREATE TABLE `ims_yz_post_by_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '海报完整路径',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信返回mediaId',
  `compare_at` int(11) NOT NULL COMMENT '比较更新时间',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_postage_included_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_postage_included_category`;
CREATE TABLE `ims_yz_postage_included_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `sort` int(11) NOT NULL COMMENT '排序',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名',
  `is_display` tinyint(4) NOT NULL COMMENT '是否展示',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='包邮分类表';

-- ----------------------------
-- Table structure for ims_yz_postage_included_category_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_postage_included_category_goods`;
CREATE TABLE `ims_yz_postage_included_category_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `postage_included_category_id` int(11) NOT NULL COMMENT '包邮分类ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postage_included_category_id` (`postage_included_category_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='包邮分类商品关系表';

-- ----------------------------
-- Table structure for ims_yz_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster`;
CREATE TABLE `ims_yz_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` int(10) unsigned DEFAULT '0',
  `time_end` int(10) unsigned DEFAULT '0',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `style_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_open` tinyint(1) DEFAULT '0',
  `auto_sub` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `center_show` tinyint(1) DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `short_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `app_share_show` tinyint(1) DEFAULT NULL,
  `is_ago` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否前端生成海报 0后端生成 1前端生成',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_award
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_award`;
CREATE TABLE `ims_yz_poster_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `subscriber_memberid` int(10) unsigned NOT NULL,
  `recommender_memberid` int(10) unsigned NOT NULL,
  `recommender_credit` int(10) unsigned DEFAULT '0',
  `recommender_bonus` int(10) unsigned DEFAULT '0',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0',
  `subscriber_credit` int(10) unsigned DEFAULT '0',
  `subscriber_bonus` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `poster_id` (`poster_id`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_qrcode`;
CREATE TABLE `ims_yz_poster_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `qrcode_id` int(10) unsigned NOT NULL,
  `memberid` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_qrcodeid` (`qrcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_record`;
CREATE TABLE `ims_yz_poster_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `poster_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_scan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_scan`;
CREATE TABLE `ims_yz_poster_scan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `subscriber_memberid` int(10) unsigned NOT NULL,
  `recommender_memberid` int(10) unsigned NOT NULL,
  `event_type` tinyint(1) NOT NULL,
  `sign_up_this_time` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `is_register` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_supplement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_supplement`;
CREATE TABLE `ims_yz_poster_supplement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int(10) unsigned NOT NULL,
  `not_start_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `finish_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wait_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `not_open_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `not_open_reminder_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_credit` int(10) unsigned DEFAULT '0',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0',
  `recommender_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0',
  `subscriber_credit` int(10) unsigned DEFAULT '0',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0',
  `bonus_method` tinyint(1) DEFAULT '1',
  `recommender_award_notice` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subscriber_award_notice` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriber_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_poster_id` (`poster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_print_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_print_setting`;
CREATE TABLE `ims_yz_print_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `printer_id` int(11) NOT NULL DEFAULT '0',
  `print_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '1',
  `owner_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `print_order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1,2' COMMENT '添加打印订单类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_print_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_print_template`;
CREATE TABLE `ims_yz_print_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `owner` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '打印内容放大一倍',
  `print_style_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '打印列格式放大一倍',
  `line_feed` int(11) NOT NULL DEFAULT '0' COMMENT '打印换行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_printed_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_printed_log`;
CREATE TABLE `ims_yz_printed_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `print_id` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `result` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_printer`;
CREATE TABLE `ims_yz_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ukey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `printer_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `times` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '1',
  `owner_id` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_privilege_merlevel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_privilege_merlevel`;
CREATE TABLE `ims_yz_privilege_merlevel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_id` int(11) NOT NULL DEFAULT '0' COMMENT '特权id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privilege_idx` (`privilege_id`),
  KEY `level_idx` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_process
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_process`;
CREATE TABLE `ims_yz_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flow_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `state` enum('processing','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_promotion_assistant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_promotion_assistant`;
CREATE TABLE `ims_yz_promotion_assistant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `content_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容链接',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系方式：姓名',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系方式：手机号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '跳转链接类型 1.商城首页 2.商品分类 3.商品',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'type=3的时候才会有，商品id',
  `share_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_desc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享描述',
  `share_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享图片',
  `browse_amount` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_protocol
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_protocol`;
CREATE TABLE `ims_yz_protocol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭1开启',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qq_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qq_config`;
CREATE TABLE `ims_yz_qq_config` (
  `config_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `app_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qrcode`;
CREATE TABLE `ims_yz_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `extra` int(11) DEFAULT '0',
  `qrcid` int(11) DEFAULT '0',
  `scene_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `model` int(11) DEFAULT '0',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `expire` int(11) DEFAULT '0',
  `subnum` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qrcode_stat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qrcode_stat`;
CREATE TABLE `ims_yz_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `qid` int(11) DEFAULT '0',
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` int(11) DEFAULT '0',
  `qrcid` int(11) DEFAULT '0',
  `scene_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire`;
CREATE TABLE `ims_yz_questionnaire` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频商品id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `number` int(11) DEFAULT NULL COMMENT '每天填写次数',
  `total` int(11) DEFAULT NULL COMMENT '填写总次数',
  `created_at` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL COMMENT '答题结束时间',
  `start_time` int(11) DEFAULT NULL COMMENT '答题开始时间',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_choice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_choice`;
CREATE TABLE `ims_yz_questionnaire_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT '问卷id',
  `type` int(11) DEFAULT NULL COMMENT '单选1，多选2',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `required` int(11) DEFAULT NULL COMMENT '0非必填，1必填',
  `choice_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `answer` text COLLATE utf8mb4_unicode_ci COMMENT '答案集合',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_programme
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_programme`;
CREATE TABLE `ims_yz_questionnaire_programme` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT '问卷id',
  `min_grade` int(11) DEFAULT NULL COMMENT 'min分数',
  `max_grade` int(11) DEFAULT NULL COMMENT 'max分数',
  `required` int(11) DEFAULT NULL COMMENT '0非必填，1必填',
  `programme` longtext COLLATE utf8mb4_unicode_ci COMMENT '推荐方案',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_programme_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_programme_reward`;
CREATE TABLE `ims_yz_questionnaire_programme_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT '问卷id',
  `min_grade` int(11) DEFAULT NULL COMMENT 'min分数',
  `max_grade` int(11) DEFAULT NULL COMMENT 'max分数',
  `reward` int(11) DEFAULT NULL COMMENT '奖励积分',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_record`;
CREATE TABLE `ims_yz_questionnaire_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT '问卷id',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `answers` longtext COLLATE utf8mb4_unicode_ci COMMENT '答案集合',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `problem` longtext COLLATE utf8mb4_unicode_ci COMMENT '问题集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ranking_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ranking_log`;
CREATE TABLE `ims_yz_ranking_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号id',
  `setting_log` text COLLATE utf8mb4_unicode_ci COMMENT '设置日志',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_real_name_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_real_name_auth`;
CREATE TABLE `ims_yz_real_name_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名字',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `auth_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证手机号',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡',
  `flow_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证流程id',
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证id',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT '认证方式',
  `auth_status` tinyint(4) DEFAULT '0' COMMENT '认证状态',
  `finish_time` int(11) DEFAULT NULL COMMENT '认证完成时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_real_name_auth_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_real_name_auth_set`;
CREATE TABLE `ims_yz_real_name_auth_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开关',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret密钥',
  `auth_scene` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证场景',
  `auth_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证方式',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口链接',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '认证协议',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_recharge_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_recharge_code`;
CREATE TABLE `ims_yz_recharge_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `code_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `end_time` (`end_time`),
  KEY `code_key` (`code_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_recharge_code_bind_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_recharge_code_bind_log`;
CREATE TABLE `ims_yz_recharge_code_bind_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `code_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `bind_time` int(11) NOT NULL DEFAULT '0',
  `code_information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_bonus_create_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_bonus_create_logs`;
CREATE TABLE `ims_yz_red_packet_bonus_create_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL COMMENT '生成的奖励总额',
  `number_sum` int(11) NOT NULL COMMENT '生成的额外奖励红包数量',
  `create_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '生成的额外奖励金额类型,1-固定，2-红包池百分比',
  `create_amount` double(10,2) NOT NULL COMMENT '生成的额外奖励红包单个奖励',
  `red_packet_logs_id` int(11) NOT NULL COMMENT '关联红包表ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日红包-额外奖励生成记录';

-- ----------------------------
-- Table structure for ims_yz_red_packet_bonus_receive_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_bonus_receive_logs`;
CREATE TABLE `ims_yz_red_packet_bonus_receive_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `receive_amount` double(10,2) DEFAULT NULL COMMENT '领取金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日红包-额外奖励领取记录';

-- ----------------------------
-- Table structure for ims_yz_red_packet_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_goods`;
CREATE TABLE `ims_yz_red_packet_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '0没开启,1开启',
  `scale` int(11) DEFAULT NULL COMMENT '比例',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_cashier` int(11) DEFAULT NULL COMMENT '收银台设置开关',
  `cashier_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台红包总额比例',
  `cashier_scale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台消费红包比例',
  `is_cps` int(11) DEFAULT NULL COMMENT 'CPS设置开关',
  `cps_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CPS红包总额比例',
  `cps_scale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CPS消费红包比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_import_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_import_records`;
CREATE TABLE `ims_yz_red_packet_import_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL COMMENT '操作员',
  `admin_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员IP',
  `total` int(11) DEFAULT NULL COMMENT '总数',
  `failure` int(11) DEFAULT NULL COMMENT '失败数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日红包额度导入记录';

-- ----------------------------
-- Table structure for ims_yz_red_packet_link_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_link_logs`;
CREATE TABLE `ims_yz_red_packet_link_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `red_packet_id` int(11) DEFAULT NULL COMMENT '红包池id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `is_browse` int(11) DEFAULT NULL COMMENT '是否浏览',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='观看广告记录';

-- ----------------------------
-- Table structure for ims_yz_red_packet_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_logs`;
CREATE TABLE `ims_yz_red_packet_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `percentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '红包比例',
  `results_amount` decimal(14,2) DEFAULT NULL COMMENT '业绩基数',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '红包总额',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT '已领取金额',
  `number_sum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '红包数量',
  `receive` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '已领取数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_quota_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_quota_logs`;
CREATE TABLE `ims_yz_red_packet_quota_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `order_id` int(11) DEFAULT NULL COMMENT '1',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `quota_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '金额比例',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '结算金额',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT '红包额度',
  `amount_sum` decimal(14,2) DEFAULT NULL COMMENT '累计总额度',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_quota_management
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_quota_management`;
CREATE TABLE `ims_yz_red_packet_quota_management` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '红包总额',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT '领取金额',
  `balance` decimal(14,2) DEFAULT NULL COMMENT '余额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_receive_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_receive_logs`;
CREATE TABLE `ims_yz_red_packet_receive_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `red_packet_id` int(11) DEFAULT NULL COMMENT '每日红包ID',
  `amount` decimal(14,2) DEFAULT NULL COMMENT '红包总额',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT '领取金额',
  `balance` decimal(14,2) DEFAULT NULL COMMENT '余额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity`;
CREATE TABLE `ims_yz_redpack_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `countdown_time` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动时间',
  `bg_color` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景颜色',
  `top_img` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '顶部图片',
  `audio_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '音频链接',
  `send_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户名称',
  `wishing` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '红包祝福语',
  `brand_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `brand_logo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌logo',
  `service_qr` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客服二维码',
  `service_mobile` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客服电话',
  `word` text COLLATE utf8mb4_unicode_ci COMMENT '口令',
  `withdraw_code` int(11) DEFAULT NULL COMMENT '奖励类型:1微信红包,2余额,3积分,4爱心值',
  `default_challenge_number` int(11) DEFAULT NULL COMMENT '默认会员挑战次数',
  `withdraw_count` int(11) DEFAULT NULL COMMENT '奖励总人数',
  `withdraw_total` decimal(10,2) DEFAULT NULL COMMENT '奖励金额总数',
  `min_withdraw` decimal(10,2) DEFAULT NULL COMMENT '最小奖励金额',
  `max_withdraw` decimal(10,2) DEFAULT NULL COMMENT '最大奖励金额',
  `verify_mobile` int(11) DEFAULT NULL COMMENT '是否验证手机号',
  `invite_people` int(11) DEFAULT NULL COMMENT '邀请几人获得一次挑战机会',
  `max_challenge_number` int(11) DEFAULT NULL COMMENT '会员最多获得x次奖励',
  `agreement` text COLLATE utf8mb4_unicode_ci COMMENT '活动信息',
  `share_title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标题',
  `share_thumb` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图片',
  `share_content` text COLLATE utf8mb4_unicode_ci COMMENT '分享内容',
  `status` int(11) DEFAULT NULL COMMENT '默认为1,到期修改成0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `exchange_rule` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '挑战次数兑换规则,序列化数组',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `scene_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '场景id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_browse`;
CREATE TABLE `ims_yz_redpack_activity_browse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_challenge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_challenge`;
CREATE TABLE `ims_yz_redpack_activity_challenge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '口令',
  `challenge_number` int(11) DEFAULT NULL,
  `invite_people` int(11) DEFAULT NULL COMMENT '邀请几个人获得一次挑战机会',
  `share_have_number` int(11) DEFAULT NULL COMMENT '邀请最多获得多少次挑战机会',
  `share_finish_number` int(11) DEFAULT NULL COMMENT '已经获得几次',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sum_consume` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费金额',
  `settle_consume` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '已结算金额',
  `sum_recommend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '累计直推人数',
  `settle_recommend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已结算直推人数',
  `sum_goods` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '累计购买指定商品数量',
  `settle_goods` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已结算商品数量',
  `consume_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '累计消费兑换的挑战次数',
  `point_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换的挑战次数',
  `recommend_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '直推奖励的挑战次数',
  `goods_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品奖励的挑战次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_redpack_activity_challenge_activity_id_uid_unique` (`activity_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_challenge_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_challenge_log`;
CREATE TABLE `ims_yz_redpack_activity_challenge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL COMMENT 'redpack_item.id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `status` int(11) DEFAULT NULL COMMENT '是否参与挑战活动',
  `send_listid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '红包订单的微信单号',
  `errno_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误代码',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_thumb`;
CREATE TABLE `ims_yz_redpack_activity_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_invite_log`;
CREATE TABLE `ims_yz_redpack_invite_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '是否挑战成功',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_statistic` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_item`;
CREATE TABLE `ims_yz_redpack_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_order`;
CREATE TABLE `ims_yz_redpack_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `goods_count` int(11) NOT NULL DEFAULT '0' COMMENT '购买的指定商品数量',
  `order_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_redpack_order_activity_id_order_id_uid_unique` (`activity_id`,`order_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='口令红包--兑换挑战次数订单关联表';

-- ----------------------------
-- Table structure for ims_yz_redpack_point_exchange_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_point_exchange_log`;
CREATE TABLE `ims_yz_redpack_point_exchange_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `exchange_times` int(10) unsigned NOT NULL COMMENT '兑换次数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '兑换状态 0待兑换  1兑换成功  2兑换失败',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='口令红包--用户直推记录表';

-- ----------------------------
-- Table structure for ims_yz_redpack_recommend_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_recommend_log`;
CREATE TABLE `ims_yz_redpack_recommend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `child_id` int(10) unsigned NOT NULL COMMENT '下级id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_word
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_word`;
CREATE TABLE `ims_yz_redpack_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `word` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '抽取的口令',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_remittance_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_remittance_record`;
CREATE TABLE `ims_yz_remittance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_pay_id` int(11) NOT NULL,
  `report_url` text COLLATE utf8mb4_unicode_ci,
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_resend_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_resend_express`;
CREATE TABLE `ims_yz_resend_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `pack_goods` text COMMENT '发货商品数据冗余',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_return_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_return_express`;
CREATE TABLE `ims_yz_return_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `images` text COMMENT '图片，text类型为了以后多图',
  `way_id` varchar(255) DEFAULT NULL COMMENT '退货方式唯一编号',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_rich_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_rich_text`;
CREATE TABLE `ims_yz_rich_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT '富文本',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='富文本存储表';

-- ----------------------------
-- Table structure for ims_yz_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_role`;
CREATE TABLE `ims_yz_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room`;
CREATE TABLE `ims_yz_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '横幅',
  `goods` text COLLATE utf8mb4_unicode_ci COMMENT '直播商品',
  `live_time` int(11) DEFAULT NULL COMMENT '直播时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '1待审核，2等待直播，3直播中，4已结束',
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推流ip',
  `ban` tinyint(4) DEFAULT '0' COMMENT '禁用',
  `role_id` tinyint(4) DEFAULT '0',
  `shop_id` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `start_time` int(11) DEFAULT '0',
  `end_time` int(11) DEFAULT '0',
  `bandwidth` decimal(8,2) DEFAULT '0.00',
  `flux` decimal(8,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `virtual` int(11) DEFAULT '0',
  `recommend` int(11) DEFAULT '2',
  `recommend_time` int(11) DEFAULT NULL,
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `live_type` int(11) NOT NULL DEFAULT '0',
  `is_purview` int(11) DEFAULT '0',
  `purview` text COLLATE utf8mb4_unicode_ci,
  `close_reward` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0开启打赏，1关闭打赏',
  `close_chat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0开启评论，1关闭评论',
  `mode_button` int(11) NOT NULL DEFAULT '0' COMMENT '1横屏，0竖屏',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity`;
CREATE TABLE `ims_yz_room_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动标题',
  `room_ids` text COLLATE utf8mb4_unicode_ci COMMENT '直播间ids',
  `anchor_reward` text COLLATE utf8mb4_unicode_ci COMMENT '主播奖励',
  `member_reward` text COLLATE utf8mb4_unicode_ci COMMENT '会员观看奖励',
  `room_member_reward` text COLLATE utf8mb4_unicode_ci COMMENT '直播间会员奖励',
  `packet_set` text COLLATE utf8mb4_unicode_ci COMMENT '红包设置',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_draw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_draw`;
CREATE TABLE `ims_yz_room_activity_draw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1主播奖励，2会员观看奖励，3直播间会员奖励',
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `point` decimal(8,2) DEFAULT '0.00',
  `love` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(8,2) DEFAULT '0.00',
  `packet` decimal(8,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`activity_id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_one
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_one`;
CREATE TABLE `ims_yz_room_activity_one` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`activity_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_room_condition
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_room_condition`;
CREATE TABLE `ims_yz_room_activity_room_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor`;
CREATE TABLE `ims_yz_room_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_black` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `level_id` int(11) NOT NULL DEFAULT '0',
  `virtual_quantity` int(11) DEFAULT '0',
  `synopsis` text COLLATE utf8mb4_unicode_ci COMMENT '简介',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_apply`;
CREATE TABLE `ims_yz_room_anchor_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_level`;
CREATE TABLE `ims_yz_room_anchor_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `award_rate` int(11) DEFAULT '0',
  `upgraded` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `code_level_id` int(11) DEFAULT NULL COMMENT '等级',
  `code_num` int(11) DEFAULT NULL COMMENT '授权码数量',
  `up_condition` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0完成，1支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_upgrate_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_upgrate_log`;
CREATE TABLE `ims_yz_room_anchor_upgrate_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `befor_level_id` int(11) DEFAULT NULL,
  `after_level_id` int(11) DEFAULT NULL,
  `up_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_ups` text COLLATE utf8mb4_unicode_ci,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_member`;
CREATE TABLE `ims_yz_room_authorization_code_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `code_level_id` int(11) DEFAULT NULL COMMENT '主播等级',
  `code_num` int(11) DEFAULT NULL COMMENT '授权码数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播--会员授权码';

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_member_change
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_member_change`;
CREATE TABLE `ims_yz_room_authorization_code_member_change` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `level_id` int(11) DEFAULT NULL COMMENT '等级ID',
  `type` int(11) NOT NULL COMMENT '变动类型 1-后台修改 2-出售 3-升级赠送',
  `old_num` int(11) DEFAULT NULL COMMENT '改变前的数量',
  `change_num` int(11) DEFAULT NULL COMMENT '变动数量',
  `new_num` int(11) DEFAULT NULL COMMENT '改变后的数量',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播--授权码变更记录';

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_used_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_used_log`;
CREATE TABLE `ims_yz_room_authorization_code_used_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL COMMENT '出售人ID',
  `buyer` int(11) DEFAULT NULL COMMENT '购买人ID',
  `level` int(11) DEFAULT NULL COMMENT '等级',
  `type` int(11) DEFAULT '1' COMMENT '状态 1-未激活 2-激活',
  `is_sold` int(11) DEFAULT '1' COMMENT '状态 1-未售出 2-已售出',
  `money` decimal(14,2) NOT NULL COMMENT '金额',
  `buy_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买时间',
  `activation_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '激活时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_seller` (`seller`),
  KEY `idx_buyer` (`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播--授权码使用';

-- ----------------------------
-- Table structure for ims_yz_room_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_banner`;
CREATE TABLE `ims_yz_room_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_bonus_log`;
CREATE TABLE `ims_yz_room_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `amount` decimal(12,2) NOT NULL COMMENT '分红结算金额',
  `bonus_ratio` decimal(10,2) DEFAULT '0.00' COMMENT '分红比例',
  `bonus_amount` decimal(12,2) NOT NULL COMMENT '分红金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分红状态 0:未结算 1：已结算',
  `recrive_at` int(11) DEFAULT NULL COMMENT '收货时间',
  `settle_days` int(11) NOT NULL DEFAULT '0' COMMENT '结算天数',
  `statement_at` int(11) DEFAULT NULL COMMENT '结算时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_osn` (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_category`;
CREATE TABLE `ims_yz_room_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_code_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_code_pay_log`;
CREATE TABLE `ims_yz_room_code_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '付款人ID',
  `code_log_id` int(11) DEFAULT NULL COMMENT '出售记录ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成的订单号',
  `type` int(11) DEFAULT '1' COMMENT '状态 1-未支付 2-已支付',
  `money` decimal(14,2) DEFAULT NULL COMMENT '金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_seller` (`code_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播--授权码支付记录';

-- ----------------------------
-- Table structure for ims_yz_room_diy_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_diy_menu`;
CREATE TABLE `ims_yz_room_diy_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_diy_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_diy_option`;
CREATE TABLE `ims_yz_room_diy_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_explain_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_explain_goods`;
CREATE TABLE `ims_yz_room_explain_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(14,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_gid` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_fan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_fan`;
CREATE TABLE `ims_yz_room_fan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_member_id` int(11) DEFAULT NULL,
  `anchor_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_amid` (`anchor_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_goods`;
CREATE TABLE `ims_yz_room_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT '0' COMMENT '是否推荐 1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_gid` (`goods_id`),
  KEY `idx_gt` (`goods_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_goods_check
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_goods_check`;
CREATE TABLE `ims_yz_room_goods_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_launch_certification
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_launch_certification`;
CREATE TABLE `ims_yz_room_launch_certification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `anchor_id` int(11) DEFAULT NULL COMMENT '主播ID',
  `realName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT '地址',
  `full_face_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '正面照',
  `reverse_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反面照',
  `hand_held_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手持照',
  `is_adopt` tinyint(4) DEFAULT '0' COMMENT '是否通过 0-验证中 1-通过 2-拒绝',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播--首播验证';

-- ----------------------------
-- Table structure for ims_yz_room_like
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_like`;
CREATE TABLE `ims_yz_room_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_online_num
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_online_num`;
CREATE TABLE `ims_yz_room_online_num` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_order`;
CREATE TABLE `ims_yz_room_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买会员ID',
  `room_id` int(11) NOT NULL DEFAULT '0' COMMENT '直播间ID',
  `anchor_id` int(11) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '主播会员ID',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `idx_osn` (`order_sn`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_play_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_play_notice`;
CREATE TABLE `ims_yz_room_play_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_app` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_popularize_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_popularize_code`;
CREATE TABLE `ims_yz_room_popularize_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '推广会员ID',
  `room_id` int(11) NOT NULL COMMENT '直播间ID',
  `guest_nums` int(11) NOT NULL DEFAULT '0' COMMENT '引流人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播推广码表';

-- ----------------------------
-- Table structure for ims_yz_room_popularize_code_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_popularize_code_logs`;
CREATE TABLE `ims_yz_room_popularize_code_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT '引流会员ID',
  `code_id` int(11) NOT NULL COMMENT '推广码ID',
  `view_time` int(11) NOT NULL DEFAULT '0' COMMENT '观看时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`member_id`),
  KEY `idx_codeid` (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直播推广码记录表';

-- ----------------------------
-- Table structure for ims_yz_room_record_file
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_record_file`;
CREATE TABLE `ims_yz_room_record_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `file_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `file_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `recommend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT '0',
  `recommend_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_report
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_report`;
CREATE TABLE `ims_yz_room_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_member_id` int(11) DEFAULT NULL,
  `room_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_reward_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_reward_list`;
CREATE TABLE `ims_yz_room_reward_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit1_number` decimal(8,2) DEFAULT NULL,
  `credit2_number` decimal(8,2) DEFAULT NULL,
  `love_number` decimal(8,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `show_effect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1开启特效，0关闭特效',
  `effect_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '播放类型 0上半屏，1下半屏，2全屏',
  `effect_gif` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '特效图',
  `effect_time` int(11) NOT NULL DEFAULT '0' COMMENT '特效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_reward_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_reward_record`;
CREATE TABLE `ims_yz_room_reward_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1积分，2余额，3爱心值',
  `transfer` int(11) DEFAULT NULL,
  `number` decimal(8,2) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `reward_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_view
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_view`;
CREATE TABLE `ims_yz_room_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `room_ban` int(11) DEFAULT '0',
  `chat_ban` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_voice_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_voice_record`;
CREATE TABLE `ims_yz_room_voice_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `send_member_id` int(11) DEFAULT NULL COMMENT '发起人会员id',
  `receive_member_id` int(11) DEFAULT NULL COMMENT '接收人会员id',
  `send_room_id` int(11) DEFAULT NULL COMMENT '发送人直播间id',
  `receive_room_id` int(11) DEFAULT NULL COMMENT '接收人直播间id',
  `status` int(11) NOT NULL COMMENT '连麦状态',
  `start_time` int(11) DEFAULT NULL COMMENT '连麦开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '连麦结束时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='连麦记录表';

-- ----------------------------
-- Table structure for ims_yz_search_filtering
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_search_filtering`;
CREATE TABLE `ims_yz_search_filtering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '过滤名称',
  `parent_id` int(11) DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '值',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `is_show` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_front_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '前端是否显示',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_service_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_service_fee`;
CREATE TABLE `ims_yz_service_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_open` int(11) DEFAULT '0',
  `fee` decimal(14,2) DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_setting`;
CREATE TABLE `ims_yz_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shop',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group_uniacid` (`group`,`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity`;
CREATE TABLE `ims_yz_share_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `diyform_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_background` tinyint(4) DEFAULT NULL,
  `button` tinyint(4) DEFAULT NULL,
  `audio_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_qr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_list` tinyint(4) DEFAULT NULL,
  `award_list` tinyint(4) DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countdown_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_content` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `poster_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '海报开启:0关闭1开启',
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '海报',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity_browse`;
CREATE TABLE `ims_yz_share_activity_browse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity_thumb`;
CREATE TABLE `ims_yz_share_activity_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_coupon_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_coupon_records`;
CREATE TABLE `ims_yz_share_coupon_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `mark_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用于查找的标识',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `recipient_id` int(11) DEFAULT NULL COMMENT '接受者id',
  `member_coupon_id` int(11) NOT NULL COMMENT '关联id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `is_combine` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是合并数据',
  `num` int(11) NOT NULL COMMENT '分享数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1：已领取',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_company_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_company_account`;
CREATE TABLE `ims_yz_shop_esign_company_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT '芸签企业认证id',
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '公司名称',
  `flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实名流程id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '认证状态：0、未认证；1、已认证',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `org_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组织代码类型',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract`;
CREATE TABLE `ims_yz_shop_esign_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同名称',
  `sign_end_date` int(11) NOT NULL DEFAULT '0' COMMENT '签署截止日期',
  `contract_end_date` int(11) NOT NULL DEFAULT '0' COMMENT '合同到期日期',
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `yq_contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '芸签合同流程id',
  `account_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '发起人姓名，快照保存',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0已发起，1签署中，2、已完成，3、已撤回，4、已超时',
  `contract_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '合同订单id',
  `origin_contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同文档原文件地址',
  `contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同文档地址',
  `contract_doc_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同文档名称',
  `contract_attach` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同附件地址',
  `pdf_width` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdf宽',
  `pdf_height` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdf高',
  `scene_id` int(11) NOT NULL DEFAULT '1' COMMENT '使用场景，1通用签署;2绑定手机号;3门店入驻;4供应商入驻;5提现申请',
  `sign_role_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签署主体，1个人，2、企业',
  `platform_role_id` int(11) NOT NULL DEFAULT '1' COMMENT '平台角色ID:1-甲;2-乙;3-丙等等',
  `variable_data` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同附件地址',
  `evid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '证据链ID',
  `spot_evid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同签署证据点ID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `plugin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '插件名称',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_form`;
CREATE TABLE `ims_yz_shop_esign_contract_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `contract_id` int(11) NOT NULL DEFAULT '0',
  `form_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文本域类型：1、文本;2、签章',
  `form_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文本域名称',
  `form_value` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文本域值',
  `is_require` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否必填：0否；1是',
  `pos_x` double(8,2) NOT NULL COMMENT 'x坐标',
  `pos_y` double(8,2) NOT NULL COMMENT 'y坐标',
  `pdf_pos_x` double(8,2) NOT NULL COMMENT 'pdf x坐标（单位毫米）',
  `pdf_pos_y` double(8,2) NOT NULL COMMENT 'pdf y坐标（单位毫米）',
  `doc_page` int(11) NOT NULL DEFAULT '1' COMMENT '所在文档页数',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '高度',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作角色ID:1-甲;2-乙;3-丙等等',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0否，1是',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_role`;
CREATE TABLE `ims_yz_shop_esign_contract_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID:1-甲;2-乙;3-丙等等',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '角色uid',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '姓名',
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电话',
  `sign_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签署主体：0、个人；1、企业',
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业或个人的account_id',
  `company_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '签署公司名',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '合同id',
  `sign_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签署状态：0未签署，1签署',
  `sign_service_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'E签宝签署记录id',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_template`;
CREATE TABLE `ims_yz_shop_esign_contract_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模板名称',
  `contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同文档地址',
  `contract_doc_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同文档名称',
  `contract_attach` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同附件地址',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0禁用，1正常',
  `scene_id` int(11) NOT NULL DEFAULT '1' COMMENT '使用场景，1通用签署;2绑定手机号;3门店入驻;4供应商入驻;5提现申请',
  `sign_role_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签署主体，0、个人；1、企业',
  `sign_end_day` int(11) NOT NULL DEFAULT '0' COMMENT '合同发起几天后到期',
  `platform_role_id` int(11) NOT NULL DEFAULT '1' COMMENT '平台角色ID:1-甲;2-乙;3-丙等等',
  `variable_data` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同附件地址',
  `pdf_width` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdf宽',
  `pdf_height` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdf高',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_template_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_template_form`;
CREATE TABLE `ims_yz_shop_esign_contract_template_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `template_id` int(11) NOT NULL DEFAULT '0',
  `form_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文本域类型：1、文本;2、签章域；',
  `form_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文本域名称',
  `form_value` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文本域默认值',
  `is_require` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否必填：0否；1是',
  `doc_page` int(11) NOT NULL DEFAULT '1' COMMENT '所在文档页数',
  `pos_x` double(8,2) NOT NULL COMMENT 'x坐标',
  `pos_y` double(8,2) NOT NULL COMMENT 'y坐标',
  `pdf_pos_x` double(8,2) NOT NULL COMMENT 'pdf x坐标（单位毫米）',
  `pdf_pos_y` double(8,2) NOT NULL COMMENT 'pdf y坐标（单位毫米）',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '高度',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作角色ID:1-甲;2-乙;3-丙等等',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_will_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_will_auth`;
CREATE TABLE `ims_yz_shop_esign_contract_will_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `seal_id` int(11) DEFAULT NULL COMMENT '印章id',
  `sign_type` int(11) DEFAULT NULL COMMENT '签章类型',
  `doc_page` int(11) DEFAULT NULL COMMENT '签署页码',
  `total_page` int(11) DEFAULT NULL COMMENT '总页数',
  `pos_x` int(11) DEFAULT NULL COMMENT 'x轴',
  `pos_y` int(11) DEFAULT NULL COMMENT 'y轴',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'token验证',
  `expires_at_time_str` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当时时间',
  `expires_at` int(11) DEFAULT NULL COMMENT '自定义token有效期',
  `bizId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '刷脸意愿id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_goods`;
CREATE TABLE `ims_yz_shop_esign_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `use_contract` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付前是否需要签署电子合同：0、否；1、是',
  `template_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_order`;
CREATE TABLE `ims_yz_shop_esign_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'yz_goods表id',
  `order_id` int(11) NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  `contract_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_osn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_person_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_person_account`;
CREATE TABLE `ims_yz_shop_esign_person_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '认证手机号快照保存',
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT '芸签个人认证id',
  `flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实名流程id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '认证状态：0、未认证；1、已认证',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_face` tinyint(4) DEFAULT '0' COMMENT '刷脸认证',
  `auth_tel` tinyint(4) DEFAULT '0' COMMENT '手机号认证',
  `auth_bank` tinyint(4) DEFAULT '0' COMMENT '银行卡认证',
  `has_face` tinyint(4) DEFAULT '0' COMMENT '是否刷脸',
  `face_flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '刷脸流程id',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_statistics_goods_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_statistics_goods_statistic`;
CREATE TABLE `ims_yz_shop_statistics_goods_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `statistic_date` int(11) NOT NULL COMMENT '统计数据日：时间戳，以统计的数据日期的0时0分时间戳',
  `goods_total` int(11) NOT NULL COMMENT '加入购物车的商品数量',
  `goods_count` int(11) NOT NULL COMMENT '加入购物车的商品种类数量',
  `pay_goods_count` int(11) NOT NULL COMMENT '支付成功的商品数量',
  `moving_goods_count` int(11) NOT NULL COMMENT '动销商品数量（销量不为0）',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_statistics_member_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_statistics_member_statistic`;
CREATE TABLE `ims_yz_shop_statistics_member_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '平台id',
  `statistic_date` int(11) NOT NULL COMMENT '统计数据日：时间戳，以统计的数据日期的0时0分时间戳',
  `member_total` int(11) NOT NULL COMMENT '会员总数',
  `member_new` int(11) NOT NULL COMMENT '会员新增数',
  `member_man` int(11) NOT NULL COMMENT '男性会员数量',
  `member_female` int(11) NOT NULL COMMENT '女性会员数量',
  `member_unknown` int(11) NOT NULL COMMENT '未知性别会员数量',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shopping_share_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shopping_share_coupon`;
CREATE TABLE `ims_yz_shopping_share_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0' COMMENT '分享者会员id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `share_coupon` text COLLATE utf8mb4_unicode_ci COMMENT '分享优惠卷集合',
  `receive_coupon` text COLLATE utf8mb4_unicode_ci COMMENT '领取优惠卷集合',
  `obtain_restriction` tinyint(4) DEFAULT '0' COMMENT '领取限制',
  `status` tinyint(4) DEFAULT '0' COMMENT '是否以领完',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shopping_share_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shopping_share_coupon_log`;
CREATE TABLE `ims_yz_shopping_share_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `share_uid` int(11) DEFAULT '0' COMMENT '分享者会员id',
  `receive_uid` int(11) DEFAULT '0' COMMENT '领取者会员id',
  `share_coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷分享表id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单ID',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷id',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠卷名称',
  `log` text COLLATE utf8mb4_unicode_ci COMMENT '日志详细',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段预留',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sign
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sign`;
CREATE TABLE `ims_yz_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `cumulative_point` decimal(11,2) DEFAULT '0.00',
  `cumulative_coupon` int(11) DEFAULT '0',
  `cumulative_number` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `cumulative_love` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sign_log`;
CREATE TABLE `ims_yz_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `award_point` decimal(11,2) DEFAULT '0.00',
  `award_coupon` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `award_love` int(11) DEFAULT '0',
  `day_love_return` decimal(14,2) DEFAULT '0.00' COMMENT '签到爱心值返现-天',
  `continuous_love_return` decimal(14,2) DEFAULT '0.00' COMMENT '签到爱心值返现-连续',
  `total_love_return` decimal(14,2) DEFAULT '0.00' COMMENT '签到爱心值返现-总值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_site_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_site_setting`;
CREATE TABLE `ims_yz_site_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_slide`;
CREATE TABLE `ims_yz_slide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `slide_name` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  `enabled` tinyint(3) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_sms_send_limit
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sms_send_limit`;
CREATE TABLE `ims_yz_sms_send_limit` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sql_install_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sql_install_log`;
CREATE TABLE `ims_yz_sql_install_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '安装绝对路径',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据库安装记录';

-- ----------------------------
-- Table structure for ims_yz_status
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_status`;
CREATE TABLE `ims_yz_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store`;
CREATE TABLE `ims_yz_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_introduce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `template_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `salers` text COLLATE utf8mb4_unicode_ci,
  `cashier_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `aptitude_imgs` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dispatch_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `affiche` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `user_uid` int(11) NOT NULL DEFAULT '0',
  `information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `banner_thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:显示/1:隐藏',
  `specify_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:首页/1:商品页...',
  `operating_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：经营/1:休息',
  `boss_uid` int(11) NOT NULL DEFAULT '0' COMMENT '老板uid',
  `audio_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:关闭|1：开启',
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `validity` int(11) DEFAULT '0',
  `validity_status` tinyint(1) DEFAULT '0' COMMENT '1失效',
  `id_card_imgs` text COLLATE utf8mb4_unicode_ci,
  `other_imgs` text COLLATE utf8mb4_unicode_ci,
  `yun_horn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '云喇叭iemi值',
  `zkc_pay` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zkc支付iemi值',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_store_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首页小程序二维码地址',
  `goods_store_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品页小程序二维码地址',
  `collect_money_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台小程序二维码地址',
  `payment_jump_minapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台支付跳转小程序链接--总后台设置',
  `payment_jump_h5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台支付跳转h5链接--总后台设置',
  `is_open_jump` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启独立后台支付跳转',
  `separate_payment_jump_minapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台支付跳转小程序链接--独立后台设置',
  `separate_payment_jump_h5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收银台支付跳转h5链接--独立后台设置',
  `balance_id` int(11) DEFAULT '0' COMMENT '门店余额商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_advertisement`;
CREATE TABLE `ims_yz_store_advertisement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '广告链接',
  `sort_by` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:待审核|1：通过',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_advertisement_uniacid` (`uniacid`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_alipay_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_alipay_setting`;
CREATE TABLE `ims_yz_store_alipay_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_auth_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `auth_app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `expires_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `re_expires_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_authorized_royalty` tinyint(4) DEFAULT NULL,
  `royalty` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_apply`;
CREATE TABLE `ims_yz_store_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT '0',
  `validity` int(11) DEFAULT '0',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_auto_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_auto_log`;
CREATE TABLE `ims_yz_store_auto_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_award_point
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_award_point`;
CREATE TABLE `ims_yz_store_award_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `calculate_type` int(11) DEFAULT NULL COMMENT '订单计算方式',
  `award_store_type` int(11) DEFAULT NULL COMMENT '计算方式(门店)',
  `award_cashier_type` int(11) DEFAULT NULL COMMENT '计算方式(收银台)',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT '门店的招商设置',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT '收银台的招商设置',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss`;
CREATE TABLE `ims_yz_store_boss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss_order`;
CREATE TABLE `ims_yz_store_boss_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '老板uid',
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `store_order_id` int(11) DEFAULT NULL COMMENT '门店订单id',
  `cashier_order_id` int(11) DEFAULT NULL COMMENT '收银台订单id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '收入金额',
  `status` tinyint(1) DEFAULT NULL COMMENT '0未提现1已提现',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss_stores
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss_stores`;
CREATE TABLE `ims_yz_store_boss_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `boss_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_boss_id` (`boss_id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_carousel`;
CREATE TABLE `ims_yz_store_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_deduct_love_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_deduct_love_log`;
CREATE TABLE `ims_yz_store_cashier_deduct_love_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `manager_uid` int(11) NOT NULL COMMENT '店长会员ID',
  `shall_be_deduct` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应扣除',
  `actual_deduction` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际扣除',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_give_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_give_coupon`;
CREATE TABLE `ims_yz_store_cashier_give_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_give_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_give_reward`;
CREATE TABLE `ims_yz_store_cashier_give_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `is_store` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为购买者1为门店',
  `reward_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为积分1为爱心值',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_order_import
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_order_import`;
CREATE TABLE `ims_yz_store_cashier_order_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_category`;
CREATE TABLE `ims_yz_store_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_collection_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_collection_code`;
CREATE TABLE `ims_yz_store_collection_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `qr_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二维码链接',
  `collection_code_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款码链接',
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '站点名称',
  `custom_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自定义文字',
  `icon_link_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标链接1',
  `icon_link_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标链接2',
  `icon_link_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标链接3',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色(预设) ',
  `type` int(11) DEFAULT NULL COMMENT '类型:1公众号 2小程序',
  `ico_one_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标1文字',
  `ico_two_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标2文字',
  `ico_three_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标3文字',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店收银台--门店收款码';

-- ----------------------------
-- Table structure for ims_yz_store_consumer_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_consumer_reward`;
CREATE TABLE `ims_yz_store_consumer_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `calculate_type` int(11) DEFAULT NULL COMMENT '订单计算方式',
  `award_store_type` int(11) DEFAULT NULL COMMENT '计算方式(门店)',
  `award_cashier_type` int(11) DEFAULT NULL COMMENT '计算方式(收银台)',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT '门店的招商设置',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT '收银台的招商设置',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店收银台--消费奖励设置';

-- ----------------------------
-- Table structure for ims_yz_store_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_dispatch`;
CREATE TABLE `ims_yz_store_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_diy_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_diy_return`;
CREATE TABLE `ims_yz_store_diy_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `diy_total` int(11) DEFAULT NULL,
  `point_total` int(11) DEFAULT NULL,
  `finish_point_total` int(11) DEFAULT NULL,
  `cash_total` int(11) DEFAULT NULL,
  `finish_cash_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_face_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_face_setting`;
CREATE TABLE `ims_yz_store_face_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `wx_sub_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `wx_sub_mchid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_profit_sharing` tinyint(4) DEFAULT NULL,
  `wx_sub_mini_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_full_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_full_package`;
CREATE TABLE `ims_yz_store_full_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_open` int(11) NOT NULL DEFAULT '0',
  `enough` int(11) NOT NULL DEFAULT '0' COMMENT '满多少元包邮',
  `province_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省id',
  `city_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市id',
  `cities` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_full_reduction`;
CREATE TABLE `ims_yz_store_full_reduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_cashier` int(11) NOT NULL DEFAULT '0' COMMENT '扫码买单',
  `is_store` int(11) NOT NULL DEFAULT '0' COMMENT '门店线上商品销售',
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT '开启优惠',
  `rule` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_geo_fence
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_geo_fence`;
CREATE TABLE `ims_yz_store_geo_fence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_id` int(11) NOT NULL,
  `geo_fence` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `geo_fence_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods`;
CREATE TABLE `ims_yz_store_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_gift` tinyint(4) DEFAULT '0',
  `customer_development` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods_category`;
CREATE TABLE `ims_yz_store_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods_setting`;
CREATE TABLE `ims_yz_store_goods_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL COMMENT '是否开启门店独立提成计算',
  `commission_type` tinyint(1) DEFAULT NULL COMMENT '1:比例2:固定金额',
  `value` decimal(10,2) DEFAULT NULL COMMENT '提成比例或固定金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_homepage_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_homepage_history`;
CREATE TABLE `ims_yz_store_homepage_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storeid` (`store_id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_member`;
CREATE TABLE `ims_yz_store_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店会员等级id',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.进店会员',
  `expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '会员过期时间',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店收银台--门店会员表';

-- ----------------------------
-- Table structure for ims_yz_store_nearby_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_nearby_goods`;
CREATE TABLE `ims_yz_store_nearby_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer`;
CREATE TABLE `ims_yz_store_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_pos
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_pos`;
CREATE TABLE `ims_yz_store_printer_pos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_set`;
CREATE TABLE `ims_yz_store_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_temp`;
CREATE TABLE `ims_yz_store_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_privilege_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_privilege_discount`;
CREATE TABLE `ims_yz_store_privilege_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `discount_type` tinyint(4) DEFAULT '0' COMMENT '折扣时间类型',
  `discount_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按天折扣',
  `discount_weeks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '按星期折扣',
  `discount_value` decimal(3,1) DEFAULT NULL COMMENT '折扣',
  `is_open` tinyint(4) DEFAULT '0' COMMENT '是否开启 0:关闭 1:开启',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级id集合',
  `use_scene` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '使用场景集合',
  `use_cashier` tinyint(4) DEFAULT '0' COMMENT '收银台',
  `use_store` tinyint(4) DEFAULT '0' COMMENT '门店商品',
  `usage_count` int(11) DEFAULT '0' COMMENT '使用次数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_privilege_use_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_privilege_use_log`;
CREATE TABLE `ims_yz_store_privilege_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `member_id` int(11) DEFAULT '0' COMMENT '会员id',
  `privilege_id` int(11) DEFAULT '0' COMMENT '特权折扣id',
  `privilege_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '特权标题',
  `privilege_discount` decimal(3,1) DEFAULT NULL COMMENT '特价折扣',
  `privilege_amount` decimal(12,2) DEFAULT NULL COMMENT '折扣金额',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`),
  KEY `privilege_idx` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_rewards_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_rewards_set`;
CREATE TABLE `ims_yz_store_rewards_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `cashier_id` int(11) DEFAULT NULL COMMENT 'cashier_id.id',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT '门店奖励设置',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT '收银台的店奖励设置',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收银台的店奖励设置';

-- ----------------------------
-- Table structure for ims_yz_store_service
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_service`;
CREATE TABLE `ims_yz_store_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `mini_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序客服路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_setting`;
CREATE TABLE `ims_yz_store_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_share_chain
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_share_chain`;
CREATE TABLE `ims_yz_store_share_chain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '是否开启共享链',
  `member_levels` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级',
  `lucky_draw_type` int(11) DEFAULT NULL COMMENT '抽奖 0 固定 1 区间',
  `award_ladder` text COLLATE utf8mb4_unicode_ci COMMENT '订单累计金额奖励',
  `award_rights` decimal(10,2) DEFAULT NULL COMMENT '提取比例',
  `award_ratio` decimal(10,2) DEFAULT NULL COMMENT '独立奖励比例',
  `fixed_award_ratio` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '固定比例',
  `section_award_ratio_start` decimal(10,2) DEFAULT NULL COMMENT '区间比例',
  `section_award_ratio_end` decimal(10,2) DEFAULT NULL COMMENT '区间比例',
  `start_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间[03:40]',
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间[09:25]',
  `everyone_everyday_award_num` int(11) DEFAULT NULL COMMENT '每人每天奖励限制',
  `everyone_award_total` int(11) DEFAULT NULL COMMENT '每人总奖励限制',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `random_return_is_open` int(11) DEFAULT NULL COMMENT '是否开启随机返',
  PRIMARY KEY (`id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_verification_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_verification_clerk`;
CREATE TABLE `ims_yz_store_verification_clerk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `realname` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_street
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_street`;
CREATE TABLE `ims_yz_street` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(255) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=654328149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_subject
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_subject`;
CREATE TABLE `ims_yz_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号ID',
  `uid_reward_value` decimal(5,2) DEFAULT NULL COMMENT '会员奖励值设置',
  `uid_reward_ratio` decimal(5,2) DEFAULT NULL COMMENT '会员奖励比例设置',
  `parent_reward_value` decimal(5,2) DEFAULT NULL COMMENT '上级奖励值设置',
  `parent_reward_ratio` decimal(5,2) DEFAULT NULL COMMENT '上级奖励比例设置',
  `uid_reward_integral` decimal(5,2) DEFAULT NULL COMMENT '会员奖励消费积分设置',
  `parent_reward_integral` decimal(5,2) DEFAULT NULL COMMENT '上级奖励消费积分设置',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier`;
CREATE TABLE `ims_yz_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `uid` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_bank` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_ali` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ali` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wechat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `diyform_data_id` int(11) NOT NULL DEFAULT '0',
  `bank_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_of_accounts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `opening_branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_ali_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ali_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省级名称',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '市级名称',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '区级名称',
  `grade` tinyint(4) DEFAULT '0' COMMENT '0：无效；1：省级；2：市级；3：区级',
  `shop_commission` decimal(14,2) DEFAULT '0.00',
  `lng` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '经度',
  `lat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '纬度',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省级id',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市级id',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区级id',
  `street_id` int(11) NOT NULL DEFAULT '0' COMMENT '街道id',
  `street_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '街道名称',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '详细地址',
  `insurance_status` int(11) NOT NULL DEFAULT '1' COMMENT '保单开关',
  `certificate` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商资质',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '行业id',
  `shop_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣点',
  `settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT '入驻时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_adv`;
CREATE TABLE `ims_yz_supplier_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `advs` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告位内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `supplier_uid` int(11) DEFAULT '0' COMMENT '供应商辅助ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_aptitude`;
CREATE TABLE `ims_yz_supplier_aptitude` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `aptitude` text COLLATE utf8mb4_unicode_ci COMMENT '资质图片组',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `identity` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上传身份证图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商-供应商资质表';

-- ----------------------------
-- Table structure for ims_yz_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_category`;
CREATE TABLE `ims_yz_supplier_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规格id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商-供应商行业表';

-- ----------------------------
-- Table structure for ims_yz_supplier_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_dispatch`;
CREATE TABLE `ims_yz_supplier_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_goods`;
CREATE TABLE `ims_yz_supplier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_group`;
CREATE TABLE `ims_yz_supplier_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规格id',
  `up_aptitude` int(11) DEFAULT '0' COMMENT '1必须上传资质',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_identity` int(11) NOT NULL DEFAULT '0' COMMENT '是否上传身份证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商-供应商分组表';

-- ----------------------------
-- Table structure for ims_yz_supplier_insurance_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_insurance_order`;
CREATE TABLE `ims_yz_supplier_insurance_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `ins_id` int(11) NOT NULL COMMENT '保单id',
  `supplier_id` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已提现',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_order`;
CREATE TABLE `ims_yz_supplier_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_profit` decimal(14,2) NOT NULL DEFAULT '0.00',
  `order_goods_information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT NULL,
  `is_settlement` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可以结算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_order_ratio_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_order_ratio_log`;
CREATE TABLE `ims_yz_supplier_order_ratio_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '订单编号',
  `is_open_ratio_range` int(11) DEFAULT '0' COMMENT '是否开启区间扣点',
  `shop_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣点',
  `culate_method` int(11) DEFAULT '0' COMMENT '提成计算方式',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商-供应商订单扣点记录表';

-- ----------------------------
-- Table structure for ims_yz_supplier_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer`;
CREATE TABLE `ims_yz_supplier_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer_set`;
CREATE TABLE `ims_yz_supplier_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer_temp`;
CREATE TABLE `ims_yz_supplier_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎会员id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_relevance_package_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_relevance_package_deliver`;
CREATE TABLE `ims_yz_supplier_relevance_package_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT '公众号id',
  `supplier_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `package_deliver_id` int(11) DEFAULT '0' COMMENT '自提点id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='供应商关联自提点-供应商关联自提点表';

-- ----------------------------
-- Table structure for ims_yz_supplier_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_slide`;
CREATE TABLE `ims_yz_supplier_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `slide_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片链接',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片图片',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `supplier_uid` int(11) DEFAULT '0' COMMENT '供应商辅助ID',
  `pc_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片PC版图片',
  `pc_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '幻灯片PC版链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_withdraw`;
CREATE TABLE `ims_yz_supplier_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `money` decimal(14,2) NOT NULL DEFAULT '0.00',
  `order_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `apply_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `pay_time` int(11) DEFAULT '0',
  `apply_money` decimal(14,2) NOT NULL DEFAULT '0.00',
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `service_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_synchronized_binder
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_synchronized_binder`;
CREATE TABLE `ims_yz_synchronized_binder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `old_uid` int(11) DEFAULT '0' COMMENT 'fans表修改前的uid',
  `new_uid` int(11) DEFAULT '0' COMMENT 'fans表修改后的uid',
  `old_credit1` int(11) DEFAULT '0' COMMENT '增加前的积分',
  `old_credit2` int(11) DEFAULT '0' COMMENT '增加前的余额',
  `add_credit1` int(11) DEFAULT '0' COMMENT '增加的积分',
  `add_credit2` int(11) DEFAULT '0' COMMENT '增加的余额',
  `old_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '修改前的mobile',
  `new_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '修改后的mobile',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `setting_data` text COLLATE utf8mb4_unicode_ci COMMENT '当前会员设置',
  `save_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '保存类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sys_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sys_msg_log`;
CREATE TABLE `ims_yz_sys_msg_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '消息类型id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息点击跳转url',
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '读取状态，0未读，1已读',
  `msg_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息详情数据',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `read_at` int(11) DEFAULT NULL COMMENT '阅读时间',
  `redirect_param` text COLLATE utf8mb4_unicode_ci COMMENT '消息跳转所需参数',
  PRIMARY KEY (`id`),
  KEY `yz_sys_msg_log_uniacid_type_id_created_at_index` (`uniacid`,`type_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sys_msg_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sys_msg_type`;
CREATE TABLE `ims_yz_sys_msg_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名称',
  `icon_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型图标地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_system_setting`;
CREATE TABLE `ims_yz_system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_system_white_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_system_white_list`;
CREATE TABLE `ims_yz_system_white_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ip地址',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用:0否1启用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='独立后台登录白名单表';

-- ----------------------------
-- Table structure for ims_yz_task_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_activity`;
CREATE TABLE `ims_yz_task_reward_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动标题',
  `starttime` int(11) DEFAULT NULL COMMENT '时间开启',
  `endtime` int(11) DEFAULT NULL COMMENT '时间结束',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动图片',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '活动介绍',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标题',
  `share_content` text COLLATE utf8mb4_unicode_ci COMMENT '分享内容',
  `share_pictures` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_task_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_log`;
CREATE TABLE `ims_yz_task_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_ci,
  `reward` text COLLATE utf8mb4_unicode_ci,
  `reward_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_task_reward_task
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_task`;
CREATE TABLE `ims_yz_task_reward_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_order` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_ci,
  `reward` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_team_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_team_order_statistics`;
CREATE TABLE `ims_yz_team_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '团队下线订单数',
  `team_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT '团队下线订单金额',
  `pay_count` int(11) DEFAULT '0' COMMENT '团队支付人数',
  `team_count` int(11) DEFAULT '0' COMMENT '团队总人数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message`;
CREATE TABLE `ims_yz_template_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id_short` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `example` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message_default`;
CREATE TABLE `ims_yz_template_message_default` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id_short` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message_record`;
CREATE TABLE `ims_yz_template_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `top_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `send_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `msgid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `wechat_send_at` int(11) NOT NULL DEFAULT '0',
  `sended_count` tinyint(1) NOT NULL DEFAULT '1',
  `extend_data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_uniacid_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_uniacid_app`;
CREATE TABLE `ims_yz_uniacid_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用图片',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `kind` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '行业分类',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用标题',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用描述',
  `version` double(8,2) DEFAULT NULL COMMENT '应用版本',
  `validity_time` int(11) NOT NULL COMMENT '有效期',
  `type` tinyint(4) NOT NULL COMMENT '应用类型,1服务号 2订阅号 3企业号 4小程序5 PC应用6 APP应用 7小游戏',
  `status` tinyint(4) DEFAULT '1' COMMENT '应用状态 0禁用1启用',
  `creator` int(11) DEFAULT NULL COMMENT '平台创建者',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_support` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encodingaeskey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_top` tinyint(4) DEFAULT '0' COMMENT '0不置顶， 1置顶',
  `topped_at` int(11) DEFAULT '0' COMMENT '置顶时间',
  `admin_is_top` tinyint(4) DEFAULT '0' COMMENT '0不置顶， 1超级管理员置顶',
  `admin_topped_at` int(11) DEFAULT '0' COMMENT '超级管理员置顶时间',
  PRIMARY KEY (`id`),
  KEY `yz_uniacid_app_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_universal_card_consume_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_universal_card_consume_coupon`;
CREATE TABLE `ims_yz_universal_card_consume_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '余额状态0无效1可用2冻结',
  `amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='一卡通消费券';

-- ----------------------------
-- Table structure for ims_yz_universal_card_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_universal_card_level`;
CREATE TABLE `ims_yz_universal_card_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_level_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_spec` text COLLATE utf8mb4_unicode_ci,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `consume_coupon_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_update_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_update_auth`;
CREATE TABLE `ims_yz_update_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_update_withdraw_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_update_withdraw_address`;
CREATE TABLE `ims_yz_update_withdraw_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `old_address` varchar(42) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `new_address` varchar(42) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_user_role`;
CREATE TABLE `ims_yz_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_users_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_users_permission`;
CREATE TABLE `ims_yz_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_users_profile
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_users_profile`;
CREATE TABLE `ims_yz_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_variety_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_variety_member_cart`;
CREATE TABLE `ims_yz_variety_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_cart_id` int(11) NOT NULL COMMENT '会员购物车id',
  `member_cart_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员购物车类型',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_variety_member_cart_member_cart_id_index` (`member_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员购物车关系表(多态)';

-- ----------------------------
-- Table structure for ims_yz_video_answer_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_answer_record`;
CREATE TABLE `ims_yz_video_answer_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id',
  `subject_id` int(11) DEFAULT NULL COMMENT '题目id',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_big_chapter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_big_chapter`;
CREATE TABLE `ims_yz_video_big_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `course_goods_id` int(11) DEFAULT '0' COMMENT '商品视频附表id',
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大章名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goods_idx` (`course_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_comment_support
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_comment_support`;
CREATE TABLE `ims_yz_video_comment_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:不点赞，1:点赞',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_commentid` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频分享评论点赞表';

-- ----------------------------
-- Table structure for ims_yz_video_course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_course_chapter`;
CREATE TABLE `ims_yz_video_course_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '章节名称',
  `video_address` text COLLATE utf8mb4_unicode_ci COMMENT '视频地址',
  `is_audition` tinyint(1) DEFAULT NULL COMMENT '是否试听',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `dig_chapter_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属大章id',
  `video_cover_address` text COLLATE utf8mb4_unicode_ci COMMENT '封面地址',
  PRIMARY KEY (`id`),
  KEY `dig_chapter_idx` (`dig_chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_course_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_course_goods`;
CREATE TABLE `ims_yz_video_course_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `is_course` tinyint(1) DEFAULT NULL COMMENT '是否开启课程',
  `lecturer_id` int(11) DEFAULT NULL,
  `lecturer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '讲师姓名',
  `is_reward` tinyint(1) DEFAULT NULL COMMENT '是否打赏',
  `see_levels` text COLLATE utf8mb4_unicode_ci COMMENT '会员等级权限 （会员等级ID） 0全部等级 ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `live_channel` int(11) DEFAULT NULL COMMENT '直播频道',
  `live_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播标题',
  `is_try` tinyint(4) DEFAULT '0' COMMENT '试看开关：0关1开',
  `try_time` int(11) NOT NULL DEFAULT '0' COMMENT '试看时长，单位：秒',
  `questionnaire_is_open` tinyint(4) DEFAULT NULL COMMENT '问卷开启：0关1开',
  `questionnaire_time` int(11) DEFAULT NULL COMMENT '进入页面时长，单位：秒',
  `is_lecturer_dividend` tinyint(4) DEFAULT '0' COMMENT '讲师分红：0开1关',
  `course_aging` int(11) DEFAULT NULL COMMENT '课程有效期，天为单位',
  `not_permit_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '无权限链接跳转',
  `mini_not_permit_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序无权限链接跳转',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_historical
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_historical`;
CREATE TABLE `ims_yz_video_historical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `course_chapter_id` int(11) DEFAULT NULL COMMENT '章节ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_lecturer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_lecturer`;
CREATE TABLE `ims_yz_video_lecturer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `real_name` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `blacklist` int(11) DEFAULT '0' COMMENT '黑名单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_lecturer_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_lecturer_reward_log`;
CREATE TABLE `ims_yz_video_lecturer_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL COMMENT '讲师ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单号',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `reward_type` tinyint(1) DEFAULT NULL COMMENT '奖励类型0：分红1：打赏',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态0：未结算 1：已结算',
  `settle_days` int(11) DEFAULT NULL COMMENT '结算天数',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT '0' COMMENT '购买/打赏人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_live_room
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_live_room`;
CREATE TABLE `ims_yz_video_live_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号',
  `is_open` int(11) NOT NULL COMMENT '插件开关',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '插件名称',
  `hover_icon` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悬浮图标',
  `display_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示页面',
  `position` int(11) NOT NULL COMMENT '悬浮图标位置',
  `position_top` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '顶距',
  `video_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频id',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `yz_video_live_room_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频号直播间';

-- ----------------------------
-- Table structure for ims_yz_video_member_course
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_member_course`;
CREATE TABLE `ims_yz_video_member_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `course_expiration_time` int(11) DEFAULT NULL COMMENT '课程过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_navigation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_navigation`;
CREATE TABLE `ims_yz_video_navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `navigation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `display_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '显示0：否1：是',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_redpack_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_activity`;
CREATE TABLE `ims_yz_video_redpack_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `sort` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '排序',
  `activity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动名称',
  `activity_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '活动状态 0关闭  1正常',
  `redpack_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '红包弹窗背景图链接',
  `logo_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '红包弹窗logo图链接',
  `redpack_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '红包弹窗文案',
  `rule_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '奖励规则开启状态累加值 0未开启 1只开启了时长 2只开启了看完视频 3时长+看完视频',
  `rule_detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '红包规则详情,数组序列化',
  `redpack_store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户名称',
  `redpack_blessing_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '红包祝福语',
  `reward_type` tinyint(3) unsigned NOT NULL COMMENT '奖励方式 1固定奖励 2区间奖励',
  `max_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '单个区间红包最高金额',
  `min_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '单个区间红包最低金额',
  `redpack_amount` decimal(14,2) NOT NULL COMMENT '红包总发放金额',
  `redpack_number` int(10) unsigned NOT NULL COMMENT '红包总发放数量',
  `rest_amount` decimal(14,2) unsigned NOT NULL COMMENT '红包剩余金额',
  `rest_number` int(10) unsigned NOT NULL COMMENT '红包剩余数量',
  `people_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每人限领几次红包，0为不限制',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `pic_list` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频红包--活动表';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_item`;
CREATE TABLE `ims_yz_video_redpack_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `redpack_amount` decimal(8,2) unsigned NOT NULL COMMENT '红包金额',
  `state` int(10) unsigned NOT NULL COMMENT '发放状态 0未领取 1已领取 2失效',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领取红包的用户id',
  `received_at` int(11) DEFAULT NULL COMMENT '领取时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频红包--活动视频表';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_log`;
CREATE TABLE `ims_yz_video_redpack_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `redpack_id` int(10) unsigned NOT NULL COMMENT '红包id',
  `redpack_amount` decimal(8,2) unsigned NOT NULL COMMENT '红包金额',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `state` int(10) unsigned NOT NULL COMMENT '发放状态 0未发放 1发放中 2发放成功 3发放失败',
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信现金红包回调错误代码',
  `err_code_des` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信现金红包回调错误描述',
  `mch_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信现金红包商户订单号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule_type` tinyint(4) NOT NULL,
  `rule_value` int(11) NOT NULL,
  `old_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_video_redpack_log_activity_id_uid_index` (`activity_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频红包--红包发放记录表';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_video
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_video`;
CREATE TABLE `ims_yz_video_redpack_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `video_id` int(10) unsigned NOT NULL COMMENT '视频id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_video_redpack_video_activity_id_index` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_redpack_view_length
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_view_length`;
CREATE TABLE `ims_yz_video_redpack_view_length` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `video_id` int(10) unsigned NOT NULL COMMENT '视频id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `length` int(11) DEFAULT NULL COMMENT '视频时长',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_video_redpack_view_length_video_id_unique` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频红包--视频时长记录表';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_view_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_view_log`;
CREATE TABLE `ims_yz_video_redpack_view_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `video_id` int(10) unsigned NOT NULL COMMENT '视频id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `refresh_at` int(11) DEFAULT NULL COMMENT '最后一次看该视频的开始时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `video_length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_video_redpack_view_log_video_id_uid_unique` (`video_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频红包--视频观看记录表';

-- ----------------------------
-- Table structure for ims_yz_video_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_reward_log`;
CREATE TABLE `ims_yz_video_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '打赏人ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT '讲师ID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '打赏金额',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单号',
  `pay_method` tinyint(1) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '支付状态0：未支付1：已支付',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_bonus`;
CREATE TABLE `ims_yz_video_share_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `ratio` decimal(10,2) DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_category`;
CREATE TABLE `ims_yz_video_share_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `is_show` tinyint(4) DEFAULT NULL COMMENT '是否显示 1-显示 2-隐藏',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频分享--分类';

-- ----------------------------
-- Table structure for ims_yz_video_share_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_comment`;
CREATE TABLE `ims_yz_video_share_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论昵称',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论头像',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `reply_id` int(11) DEFAULT NULL COMMENT '回答哪个会员ID',
  `reply_comment_id` int(11) DEFAULT NULL COMMENT '回答哪个评论',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回答哪个昵称',
  `support_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `type` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_videoid` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频分享评论表';

-- ----------------------------
-- Table structure for ims_yz_video_share_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_follow`;
CREATE TABLE `ims_yz_video_share_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '被关注的用户ID',
  `follow_member_id` int(11) DEFAULT NULL COMMENT '关注者的用户ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='视频分享--关注';

-- ----------------------------
-- Table structure for ims_yz_video_share_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_goods`;
CREATE TABLE `ims_yz_video_share_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `cover` text COLLATE utf8mb4_unicode_ci,
  `video` text COLLATE utf8mb4_unicode_ci,
  `share_num` int(11) DEFAULT NULL,
  `like_num` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `amount_total` decimal(10,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `is_recommend` int(11) DEFAULT NULL COMMENT '推荐 0-关闭 1-开启',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `is_crm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否crm推送，0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_like_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_like_log`;
CREATE TABLE `ims_yz_video_share_like_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_watch_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_watch_record`;
CREATE TABLE `ims_yz_video_share_watch_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_slide`;
CREATE TABLE `ims_yz_video_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `slide_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `display_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态0：禁用1：启用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_subject
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_subject`;
CREATE TABLE `ims_yz_video_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id',
  `subject_id` int(11) DEFAULT NULL COMMENT '题目id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_coin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_coin`;
CREATE TABLE `ims_yz_virtual_coin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟币',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exchange_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '汇率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_data`;
CREATE TABLE `ims_yz_virtual_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usetime` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_idx` (`type_id`),
  KEY `owner_idx` (`owner_id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_goods`;
CREATE TABLE `ims_yz_virtual_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `module_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `type_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_song` tinyint(4) DEFAULT '0',
  `the_way` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_module
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_module`;
CREATE TABLE `ims_yz_virtual_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_order`;
CREATE TABLE `ims_yz_virtual_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `order_sn` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_price` decimal(12,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_type`;
CREATE TABLE `ims_yz_virtual_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `field_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_virtual_type_uniacid_parent_id_index` (`uniacid`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_website_info
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_website_info`;
CREATE TABLE `ims_yz_website_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '站点',
  `founder_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '创始人账号',
  `founder_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '创始人密码',
  `server_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '服务器IP',
  `root_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '服务器root密码',
  `ssh_port` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ssh 端口',
  `database_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '数据库访问地址',
  `database_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '数据库用户名',
  `database_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '数据库密码',
  `root_directory` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '网站根目录',
  `qq` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '联系qq',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '联系手机号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `root_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '服务器账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_attachment`;
CREATE TABLE `ims_yz_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `acid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `module_upload_dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_basic_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_basic_reply`;
CREATE TABLE `ims_yz_wechat_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_image_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_image_reply`;
CREATE TABLE `ims_yz_wechat_image_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_menu`;
CREATE TABLE `ims_yz_wechat_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `client_platform_type` int(11) NOT NULL DEFAULT '0',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_music_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_music_reply`;
CREATE TABLE `ims_yz_wechat_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hqurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news`;
CREATE TABLE `ims_yz_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `attach_id` int(11) NOT NULL DEFAULT '0',
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `digest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show_cover_pic` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `need_open_comment` int(11) NOT NULL DEFAULT '0',
  `only_fans_can_comment` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_news_examine
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_examine`;
CREATE TABLE `ims_yz_wechat_news_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待审核 1成功 -1失败',
  `examine_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '微信审核状态 0:成功, 1:发布中，2:原创失败, 3: 常规失败, 4:平台审核不通过, 5:成功后用户删除所有文章, 6: 成功后系统封禁所有文章',
  `publish_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信审核id',
  `article_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信图文id',
  `examine_time` int(11) DEFAULT NULL COMMENT '审核时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_wechat_news_examine_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公众号-图文审核表';

-- ----------------------------
-- Table structure for ims_yz_wechat_news_examine_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_examine_article`;
CREATE TABLE `ims_yz_wechat_news_examine_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `examine_id` int(11) NOT NULL COMMENT '审核表ID',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `digest` text COLLATE utf8mb4_unicode_ci COMMENT '摘要',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `content_source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原文地址链接',
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '封面图片素材ID',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示封面',
  `need_open_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否打开评论',
  `only_fans_can_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否粉丝才可评论',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图文消息的url',
  `displayorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_wechat_news_examine_article_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公众号-图文素材审核文章';

-- ----------------------------
-- Table structure for ims_yz_wechat_news_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_reply`;
CREATE TABLE `ims_yz_wechat_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `incontent` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_pay_order`;
CREATE TABLE `ims_yz_wechat_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_fee` decimal(14,2) NOT NULL,
  `profit_sharing` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_profit_sharing_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_profit_sharing_log`;
CREATE TABLE `ims_yz_wechat_profit_sharing_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `mch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_mch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_qrcode_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_qrcode_fans`;
CREATE TABLE `ims_yz_wechat_qrcode_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_rule`;
CREATE TABLE `ims_yz_wechat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `containtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reply_type` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_rule_keyword
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_rule_keyword`;
CREATE TABLE `ims_yz_wechat_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_sidebar
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_sidebar`;
CREATE TABLE `ims_yz_wechat_sidebar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `link_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接名称',
  `user_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '成员userid',
  `department_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门id',
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业id',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uk_openid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_category_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_category_apply`;
CREATE TABLE `ims_yz_wechat_trade_category_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `third_cat_id` int(11) NOT NULL COMMENT '三级分类id',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资质图片，序列化',
  `callback` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回调数据，序列化',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待审核 1成功 2失败',
  `apply_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请单号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--类目申请表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_delivery_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_delivery_company`;
CREATE TABLE `ims_yz_wechat_trade_delivery_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--微信快递公司表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods`;
CREATE TABLE `ims_yz_wechat_trade_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `goods_id` int(11) NOT NULL COMMENT '商城商品id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序路径',
  `product_qualification_pics` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品资质图片数组，序列化',
  `wechat_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信端商品数据，序列化数据',
  `brand_id` int(11) NOT NULL DEFAULT '2100000000' COMMENT '商品品牌id',
  `third_cat_id` int(11) NOT NULL COMMENT '三级类目id',
  `edit_status` tinyint(4) NOT NULL COMMENT '审核状态 -1已取消 1未审核 2审核中 3审核失败 4审核成功',
  `wechat_status` tinyint(3) unsigned NOT NULL COMMENT '微信商品状态 0初始值 5上架 11自主下架 13违规下架/风控系统下架',
  `wechat_create_time` int(11) DEFAULT NULL,
  `wechat_update_time` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `info_version` int(11) NOT NULL DEFAULT '1' COMMENT '版本时间戳',
  `wechat_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--商品表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_category`;
CREATE TABLE `ims_yz_wechat_trade_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `level` tinyint(4) NOT NULL COMMENT '类目级别',
  `cat_id` int(10) unsigned NOT NULL COMMENT '微信分类id',
  `parent_id` int(10) unsigned NOT NULL COMMENT '父微信分类id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信分类名称',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态 0关闭 1启用',
  `apply_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请状态 0未申请 1已申请或不需要申请',
  `qualification_type` tinyint(4) NOT NULL COMMENT '类目资质类型,0:不需要,1:必填,2:选填',
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所需类目资质',
  `product_qualification_type` tinyint(4) NOT NULL COMMENT '商品资质类型,0:不需要,1:必填,2:选填',
  `product_qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所需商品资质',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `can_apply` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一二级分类下属是否存在需要申请的三级分类',
  PRIMARY KEY (`id`),
  KEY `yz_wechat_trade_goods_category_cat_id_index` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--类目表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_examine
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_examine`;
CREATE TABLE `ims_yz_wechat_trade_goods_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `goods_id` int(11) NOT NULL COMMENT '商城商品id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序路径',
  `examine_callback` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审核回调数据',
  `product_qualification_pics` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所需商品资质图片数组，序列化',
  `examine_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请审核数据，序列化数据',
  `brand_id` int(11) NOT NULL DEFAULT '2100000000' COMMENT '商品品牌id',
  `third_cat_id` int(11) NOT NULL COMMENT '三级类目id',
  `edit_status` tinyint(4) NOT NULL COMMENT '审核状态 -1已取消 1未审核 2审核中 3审核失败 4审核成功',
  `finish_time` int(11) DEFAULT NULL COMMENT '审核结束时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `info_version` int(11) NOT NULL DEFAULT '1' COMMENT '版本时间戳',
  `wechat_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--商品表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_id_connection
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_id_connection`;
CREATE TABLE `ims_yz_wechat_trade_goods_id_connection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `wechat_goods_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wechat_trade_goods_id_con_index` (`wechat_goods_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--商品id关联表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_order`;
CREATE TABLE `ims_yz_wechat_trade_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付单号',
  `pay_type` int(11) NOT NULL COMMENT '支付方式 0微信 1货到付款 2余额支付',
  `delivery_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配送方式 1: 正常快递, 2: 无需快递, 3: 线下配送, 4: 用户自提',
  `pay_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态 -1关闭 0待支付 1已支付 2已发货 3已完成',
  `close_time` int(11) DEFAULT NULL COMMENT '关闭时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `delivery_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `finish_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '买家uid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--订单表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_qualification
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_qualification`;
CREATE TABLE `ims_yz_wechat_trade_qualification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号id',
  `third_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信三级分类id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '凭证类型 1商品凭证 2分类凭证 3品牌凭证',
  `pic_arr` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证图片数组，序列化',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--凭证记录表';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_test_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_test_order`;
CREATE TABLE `ims_yz_wechat_trade_test_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义交易组件--接入测试订单表';

-- ----------------------------
-- Table structure for ims_yz_wechat_userapi_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_userapi_reply`;
CREATE TABLE `ims_yz_wechat_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `apiurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_text` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cachetime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_video_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_video_reply`;
CREATE TABLE `ims_yz_wechat_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_voice_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_voice_reply`;
CREATE TABLE `ims_yz_wechat_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw`;
CREATE TABLE `ims_yz_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_sn` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` text COLLATE utf8mb4_unicode_ci,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amounts` decimal(14,2) DEFAULT NULL,
  `poundage` decimal(14,2) DEFAULT NULL,
  `poundage_rate` decimal(11,2) DEFAULT NULL,
  `poundage_type` tinyint(4) DEFAULT '0' COMMENT '手续费类型 0:比例 1:固定',
  `pay_way` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `audit_at` int(11) DEFAULT NULL,
  `pay_at` int(11) DEFAULT NULL,
  `arrival_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `actual_amounts` decimal(14,2) NOT NULL,
  `actual_poundage` decimal(14,2) NOT NULL,
  `servicetax` decimal(12,2) DEFAULT NULL COMMENT '劳务税',
  `servicetax_rate` decimal(11,2) DEFAULT NULL COMMENT '劳务税比例',
  `actual_servicetax` decimal(12,2) DEFAULT NULL COMMENT '最终劳务税',
  `manual_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_income
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_income`;
CREATE TABLE `ims_yz_withdraw_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `withdraw_id` int(11) NOT NULL COMMENT '提现id',
  `income_id` int(11) NOT NULL COMMENT '收入id',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_withdraw_income_income_id_unique` (`income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_income_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_income_apply`;
CREATE TABLE `ims_yz_withdraw_income_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `withdraw_id` int(11) NOT NULL COMMENT '提现id',
  `income_id` int(11) NOT NULL COMMENT '收入id',
  `status` int(11) NOT NULL COMMENT '提现状态',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_withdraw_income_apply_income_id_index` (`income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_merge_servicetax_rate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_merge_servicetax_rate`;
CREATE TABLE `ims_yz_withdraw_merge_servicetax_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uniacid` int(11) NOT NULL COMMENT '公众号ID',
  `withdraw_id` int(11) NOT NULL COMMENT '提现记录id',
  `servicetax_rate` decimal(10,2) NOT NULL COMMENT '合并劳务费比例',
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有效 0有效 1失效',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合并提现劳务费比例表';

-- ----------------------------
-- Table structure for ims_yz_withdraw_relation_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_relation_order`;
CREATE TABLE `ims_yz_withdraw_relation_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_rich_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_rich_text`;
CREATE TABLE `ims_yz_withdraw_rich_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_withdraw_rich_text_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提现说明富文本';

-- ----------------------------
-- Table structure for ims_yz_withdraw_set_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_set_log`;
CREATE TABLE `ims_yz_withdraw_set_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_id` int(11) DEFAULT NULL COMMENT 'ID',
  `poundage_type` tinyint(1) DEFAULT '0' COMMENT '提现手续费类型  0比例计算 ，1固定金额，',
  `poundage` decimal(14,2) DEFAULT NULL COMMENT '手续费 poundage_tpye为0，则为比例，为1则为固定金额，',
  `poundage_full_cut` decimal(14,2) DEFAULT NULL COMMENT '满额减免手续费',
  `withdraw_fetter` decimal(14,2) DEFAULT NULL COMMENT '提现限制，提现最小额',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_work_wechat_allocate_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_allocate_customer`;
CREATE TABLE `ims_yz_work_wechat_allocate_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `takeover_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接替成员的userid',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人的userid',
  `handover_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原跟进成员的userid',
  `status` int(11) NOT NULL DEFAULT '2' COMMENT '接替状态， 1-接替完毕 2-等待接替 3-客户拒绝 4-接替成员客户达到上限',
  `fail_reason` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接替失败的原因',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信离职分配的客户表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer`;
CREATE TABLE `ims_yz_work_wechat_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人的userid',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人的名称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人头像',
  `external_type` int(11) NOT NULL DEFAULT '0' COMMENT '外部联系人的类型，1表示该外部联系人是微信用户，2表示该外部联系人是企业微信用户',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '外部联系人性别 0-未知 1-男性 2-女性',
  `unionid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人在微信开放平台的唯一身份标识（微信unionid）',
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人的职位',
  `corp_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人所在企业的简称，仅当联系人类型是企业微信用户时有此字段',
  `corp_full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人所在企业的主体名称，仅当联系人类型是企业微信用户时有此字段',
  `external_profile` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '外部联系人的自定义展示信息，仅当联系人类型是企业微信用户时有此字段',
  `is_member` int(11) DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信外部联系人信息';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_follow_user`;
CREATE TABLE `ims_yz_work_wechat_customer_follow_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '员工的userid',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人的userid',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该员工对此外部联系人的备注',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该员工对此外部联系人的描述',
  `customer_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加此外部联系人的时间',
  `remark_corp_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该员工对此客户备注的企业名称',
  `remark_mobiles` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该员工对此客户备注的手机号码',
  `oper_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发起添加的userid，如果成员主动添加，为成员的userid；如果是客户主动添加，则为客户的外部联系人userid；如果是内部成员共享/管理员分配，则为对应的成员/管理员userid\n',
  `tag_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该成员添加此外部联系人所打企业标签的id，仅企业设置（type为1）的标签返回',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '该成员添加此外部联系人的时间',
  `add_way` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '该成员添加此客户的来源，具体含义详见model',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业自定义的state参数',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态:1正常 -1被删除）',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_customer_follow_user_external_userid_index` (`external_userid`),
  KEY `yz_work_wechat_customer_follow_user_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信企业员工和添加客户的关系表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_follow_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_follow_user_tag`;
CREATE TABLE `ims_yz_work_wechat_customer_follow_user_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `tag_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '标签名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'create_time',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `group_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组标签id',
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组标签名',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `shop_tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城标签ID',
  `shop_tag_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城标签组ID',
  `group_order` int(11) NOT NULL DEFAULT '0' COMMENT '标签组排序',
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_customer_follow_user_tag_shop_tag_id_index` (`shop_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信添加客户的员工和标签关系表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_refresh_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_refresh_log`;
CREATE TABLE `ims_yz_work_wechat_customer_refresh_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业id',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待请求 1已请求',
  `ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工ID',
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户数据',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业客户管理-更新数据表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_tag`;
CREATE TABLE `ims_yz_work_wechat_customer_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `tag_group` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签数据',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信标签表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_department
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_department`;
CREATE TABLE `ims_yz_work_wechat_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `dep_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信创建的部门id',
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_en` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门英文名',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信父部门id',
  `dep_order` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信在父部门中的次序值',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信部门';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_employee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_employee`;
CREATE TABLE `ims_yz_work_wechat_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信userid',
  `avatar_mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `gender` int(11) NOT NULL DEFAULT '1' COMMENT '性别。1表示男性，2表示女性',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'email',
  `department` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户所属部门,使用逗号隔开,字符串格式存储',
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '职务信息',
  `is_leader_in_dept` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '1表示为上级,0表示普通成员(非上级)',
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座机',
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '激活状态: -1=已删除，1=已激活，2=已禁用，4=未激活，5=退出企业',
  `extattr` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '自定义字段',
  `external_profile` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '成员对外属性',
  `external_position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '对外职务',
  `main_department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主部门',
  `active_time` int(11) NOT NULL DEFAULT '0' COMMENT '激活时间',
  `is_allocate` int(11) NOT NULL DEFAULT '0' COMMENT '离职是否分配(1:已分配;0:未分配;)',
  `dimission_time` int(11) NOT NULL DEFAULT '0' COMMENT '离职时间',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信通讯录成员信息';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat`;
CREATE TABLE `ims_yz_work_wechat_group_chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `chat_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '	客户群ID',
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '群名',
  `owner_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '群主userId',
  `owner_uid` int(11) NOT NULL DEFAULT '0' COMMENT '锁客会员uid',
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '群公告',
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '群二维码地址',
  `group_created_time` int(11) NOT NULL DEFAULT '0' COMMENT '群创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-所有列表;1-离职待继承;2-离职继承中;3-离职继承完成,-99-已解散',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `bind_type` int(11) NOT NULL DEFAULT '1' COMMENT '入群会员绑定方式 1锁客会员 2邀请会员',
  `is_extra` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启独立设置 0不开启 1开启',
  `invite_poster_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信入群码海报ID',
  `shop_poster_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城群拓客页面二维码海报ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信客户群信息';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_member`;
CREATE TABLE `ims_yz_work_wechat_group_chat_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `chat_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '	客户群ID',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '群成员id',
  `invitor_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邀请者的userid',
  `unionid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部联系人在微信开放平台的唯一身份标识（微信unionid）',
  `join_time` int(11) NOT NULL DEFAULT '0' COMMENT '加群时间',
  `join_scene` int(11) NOT NULL DEFAULT '0' COMMENT '入群方式:1-由成员邀请入群（直接邀请入群）2 - 由成员邀请入群（通过邀请链接入群）3 - 通过扫描群二维码入群',
  `member_type` int(11) NOT NULL DEFAULT '0' COMMENT '成员类型:1 - 企业成员;2 - 外部联系人',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:0-退群,1-正常',
  `withdraw_time` int(11) NOT NULL DEFAULT '0' COMMENT '最近一次退出时间',
  `withdraw_scene` int(11) NOT NULL DEFAULT '-1' COMMENT '默认-1没退群，退群方式0-自己退群,1-群主/群管理员移出',
  `we_nickname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信名字,临时存放,创建会员后就没用了',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '1' COMMENT '是否老会员 1是 0不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信客户群成员信息';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签名',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '标签排序，值越小优先级越高',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示，0否1是',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BnsId` (`uniacid`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信客户群标签(非企业微信tag_id)';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag_bind
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag_bind`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_chat_id` int(11) NOT NULL COMMENT '客户群id',
  `tag_id` int(11) NOT NULL COMMENT '群标签id(非企业微信tag_id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信客户群标签';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag_group`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，值越小优先级越高',
  `is_show` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BnsId` (`uniacid`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信客户群标签组（非企业微信标签）';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_code`;
CREATE TABLE `ims_yz_work_wechat_group_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义参数',
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业微信群ID',
  `uid` int(11) NOT NULL COMMENT '邀请人会员ID，0为后台生成且无指定群绑定会员',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待确认 1正常 -1待删除 -2已删除',
  `config_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业微信入群码ID',
  `code_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入群码链接',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_group_code_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群拓客-入群邀请码列表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_member_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_member_log`;
CREATE TABLE `ims_yz_work_wechat_group_member_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `unionid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionID',
  `userid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '群成员ID',
  `invite_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邀请人成员ID，仅当内部成员时存在',
  `uid` int(11) NOT NULL COMMENT '群会员会员ID',
  `invite_uid` int(11) NOT NULL COMMENT '邀请人关联会员ID,仅当通过二维码进入且存在state时存在',
  `join_time` int(11) NOT NULL COMMENT '入群时间',
  `chat_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '群ID',
  `join_scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT '入群方式 0未知 1群成员直接邀请 2群成员邀请链接 3二维码',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '入群标识',
  `type` tinyint(4) NOT NULL COMMENT '记录方式 1回调 2后台同步',
  `is_build` tinyint(4) NOT NULL COMMENT '是否第一次进群 0不是 1是',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_member_unique` (`chat_id`,`join_time`,`userid`),
  KEY `yz_work_wechat_group_member_log_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群拓客-入群记录表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_poster`;
CREATE TABLE `ims_yz_work_wechat_group_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT '企业ID',
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '海报链接',
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '海报路径',
  `code_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业微信入群码ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `chat_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业微信群ID',
  `group_id` int(11) NOT NULL COMMENT '群ID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_group_poster_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群拓客-海报表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_platform_crop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_platform_crop`;
CREATE TABLE `ims_yz_work_wechat_platform_crop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员uid',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `logo_img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1正常，-1停用',
  `member_uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员uid',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_plugins` text COLLATE utf8mb4_unicode_ci COMMENT '授权应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信公司应用';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_platform_crop_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_platform_crop_apply`;
CREATE TABLE `ims_yz_work_wechat_platform_crop_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员uid',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `logo_img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0待审核，1通过，2审核失败',
  `finish_time` int(11) DEFAULT NULL COMMENT '审核处理时间',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业平台管理-审核申请表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role`;
CREATE TABLE `ims_yz_work_wechat_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:启用，-1:禁用',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信角色管理';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role_data_permission`;
CREATE TABLE `ims_yz_work_wechat_role_data_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `permission_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限key',
  `permission_val` int(11) NOT NULL DEFAULT '0' COMMENT '权限value:0-无，1-自己，2-自己及下属，3-部门，101-全部',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信角色数据权限数据表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role_permission`;
CREATE TABLE `ims_yz_work_wechat_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限key',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信角色功能权限数据表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user`;
CREATE TABLE `ims_yz_work_wechat_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '后端操作员表uid',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信操作员数据表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user_data_permission`;
CREATE TABLE `ims_yz_work_wechat_user_data_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `permission_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限key',
  `permission_val` int(11) NOT NULL DEFAULT '0' COMMENT '权限value:0-无，1-自己，2-自己及下属，3-部门，101-全部',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信操作员数据权限数据表';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user_permission`;
CREATE TABLE `ims_yz_work_wechat_user_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限key',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业微信操作员功能权限数据表';

-- ----------------------------
-- Table structure for ims_yz_wq_version_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wq_version_log`;
CREATE TABLE `ims_yz_wq_version_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行过的版本号',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_card_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_card_ticket`;
CREATE TABLE `ims_yz_wx_card_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT '公众号',
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡券id',
  `card_type` tinyint(4) DEFAULT '1' COMMENT '卡券类型',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡券logo',
  `wx_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信卡券logo',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `background_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡券封面图片',
  `wx_background_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信卡券封面图片',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卡券封面颜色',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作提醒',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用说明',
  `prerogative` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '特权说明',
  `date_info` tinyint(4) DEFAULT NULL COMMENT '有效时间',
  `time_limit` tinyint(4) DEFAULT NULL COMMENT '可用时段',
  `service_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客服电话',
  `text_image_list` text COLLATE utf8mb4_unicode_ci COMMENT '图文介绍',
  `custom_cell1` text COLLATE utf8mb4_unicode_ci COMMENT '自定义入口1',
  `custom_cell2` text COLLATE utf8mb4_unicode_ci COMMENT '自定义入口2',
  `custom_cell3` text COLLATE utf8mb4_unicode_ci COMMENT '自定义入口3',
  `custom_entry` text COLLATE utf8mb4_unicode_ci COMMENT '客户自定义入口',
  `promotion_entry` text COLLATE utf8mb4_unicode_ci COMMENT '营销自定义入口',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_video_like_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_video_like_set`;
CREATE TABLE `ims_yz_wx_video_like_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `power_type` int(11) NOT NULL DEFAULT '1',
  `power_textarea` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open_relation` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_template_type` int(11) NOT NULL DEFAULT '1',
  `in_host` int(11) NOT NULL DEFAULT '1',
  `send_member_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_video_link_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_video_link_list`;
CREATE TABLE `ims_yz_wx_video_link_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '1',
  `member_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `news_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '1',
  `article_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `msg_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `msg_data_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ys_system_assets_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_assets_log`;
CREATE TABLE `ims_yz_ys_system_assets_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `income_type` int(11) DEFAULT NULL COMMENT '收入类型：1收入-1支出',
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '业务类型',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '编号',
  `change_value` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '变动值',
  `before_assets` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '变动前资产',
  `after_assets` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '变动后资产',
  `assets_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资产类型',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求错误',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '通知状态：0未通知、1已通知、-1通知失败',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26038 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--资产变动记录';

-- ----------------------------
-- Table structure for ims_yz_ys_system_category_import_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_category_import_log`;
CREATE TABLE `ims_yz_ys_system_category_import_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `ys_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方分类id标识',
  `ys_category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方分类名称',
  `level` int(11) DEFAULT NULL COMMENT '分类级别',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--分类导入表';

-- ----------------------------
-- Table structure for ims_yz_ys_system_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_goods`;
CREATE TABLE `ims_yz_ys_system_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `ys_goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '第三方商品ID',
  `shop_id` int(11) DEFAULT '0' COMMENT '第三方店铺ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `goods_idx` (`goods_id`),
  KEY `ys_goods_idx` (`ys_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--商品关联表';

-- ----------------------------
-- Table structure for ims_yz_ys_system_help_edit_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_help_edit_data`;
CREATE TABLE `ims_yz_ys_system_help_edit_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `plugin_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '插件类型',
  `crm_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方id',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '代编辑内容',
  `member_id` int(11) DEFAULT NULL COMMENT '归属会员id',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0未归属1已归属',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--代编辑信息记录';

-- ----------------------------
-- Table structure for ims_yz_ys_system_history_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_history_order`;
CREATE TABLE `ims_yz_ys_system_history_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `ys_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方订单标识',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `parameter` text COLLATE utf8mb4_unicode_ci COMMENT '请求导入参数',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `status_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '历史订单状态',
  `logistic` text COLLATE utf8mb4_unicode_ci COMMENT '物流快递信息',
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`),
  KEY `ys_order_idx` (`ys_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--导入历史订单';

-- ----------------------------
-- Table structure for ims_yz_ys_system_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_member`;
CREATE TABLE `ims_yz_ys_system_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `ys_member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方会员标识',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `member_id_idx` (`member_id`),
  KEY `ys_member_id_idx` (`ys_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--会员关联记录表';

-- ----------------------------
-- Table structure for ims_yz_ys_system_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_member_level`;
CREATE TABLE `ims_yz_ys_system_member_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级id',
  `ys_level_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方会员等级标识',
  `ys_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方会员等级级别',
  `ys_level_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方会员等级名称',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `level_id_idx` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--会员等级记录';

-- ----------------------------
-- Table structure for ims_yz_ys_system_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_order`;
CREATE TABLE `ims_yz_ys_system_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `ys_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方订单标识',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `refund_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '换货订单id',
  `refund_id` int(11) NOT NULL DEFAULT '0' COMMENT '换货售后id',
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`),
  KEY `ys_order_idx` (`ys_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--订单副表';

-- ----------------------------
-- Table structure for ims_yz_ys_system_push_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_push_record`;
CREATE TABLE `ims_yz_ys_system_push_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT '公众号ID',
  `record_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口请求地址',
  `parameter` text COLLATE utf8mb4_unicode_ci COMMENT '推送数据',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '响应错误',
  `push_num` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送状态：500、1已请求、-1推送失败',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=1336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='益生系统--推送记录';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_chats
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_chats`;
CREATE TABLE `ims_yz_yun_chat_chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-文字,1-图片,2-商品,3-订单,4-转发消息',
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-未读,1-已读',
  `direction_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-发送给用户,1-发送给客服',
  `is_system_send` int(11) NOT NULL DEFAULT '0' COMMENT '是否是系统代替客服发送：0-否,1-是',
  `is_system_opt` int(11) NOT NULL DEFAULT '0' COMMENT '是否是系统操作的消息：0-否,1-是',
  `is_backed` int(11) NOT NULL DEFAULT '0' COMMENT '是否撤回息：0-否,1-是',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT 'queue表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_common_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_common_reply`;
CREATE TABLE `ims_yz_yun_chat_common_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '0-通用回复,大于0是客服个人的',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_crop_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_crop_settings`;
CREATE TABLE `ims_yz_yun_chat_crop_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `agent_limit` int(11) NOT NULL DEFAULT '-1' COMMENT '限制坐席数，默认-1不限制',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `free_agent_limit` int(11) NOT NULL DEFAULT '0' COMMENT '免费坐席限制数',
  `agent_alloc_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '坐席限制数方式:0-收费坐席优先;1-免费坐席优先',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '坐席到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客服企业设置';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_employee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_employee`;
CREATE TABLE `ims_yz_yun_chat_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `leader_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级领导ID',
  `work_wechat_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_employee表id',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '客服组Id',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `agent_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '坐席ID',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-正常,0停用',
  `online_status` int(11) NOT NULL DEFAULT '0' COMMENT '在线状态：0-离线,1-在线',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '介绍',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-不推荐，1-推荐',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `work_wechat_userid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信userid,以后不使用work_wechat_employee_id字段',
  `agent_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '坐席类型:0-免费坐席;1-收费坐席',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_employee_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_employee_settings`;
CREATE TABLE `ims_yz_yun_chat_employee_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_group`;
CREATE TABLE `ims_yz_yun_chat_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_queue`;
CREATE TABLE `ims_yz_yun_chat_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-正常,1-已完成,2-黑名单',
  `user_complate` int(11) NOT NULL DEFAULT '0' COMMENT '客户关闭:0-未关闭,1-关闭',
  `employee_complate` int(11) NOT NULL DEFAULT '0' COMMENT '客服关闭:0-未关闭,1-关闭',
  `last_msg_time` int(11) DEFAULT NULL COMMENT '最近消息时间，冗余，方便前端显示',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_reply_key_words
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_reply_key_words`;
CREATE TABLE `ims_yz_yun_chat_reply_key_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `words_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_yun_chat_words_reply表id',
  `key_word` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `match_type` int(11) NOT NULL DEFAULT '2' COMMENT '匹配方式：1-部分匹配,2-完全匹配',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关键词回复关键词表,辅助关键词查重';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_tool_bar
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_tool_bar`;
CREATE TABLE `ims_yz_yun_chat_tool_bar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正常,0停用',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0-关键词回复,1-链接跳转',
  `key_word_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_yun_chat_reply_key_words表id',
  `h5_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '页面链接',
  `mini_app_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序链接',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天工具栏';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_transfer_log`;
CREATE TABLE `ims_yz_yun_chat_transfer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT 'queue表id',
  `from_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '转接人employee_id',
  `to_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '被转接人employee_id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='转接客服记录';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_words_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_words_reply`;
CREATE TABLE `ims_yz_yun_chat_words_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_crop表id',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `reply_type` int(11) NOT NULL DEFAULT '0' COMMENT '回复方式：0-随机一条,1-全部',
  `key_words` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词,逗号分割',
  `key_words_rule` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词规则',
  `reply_contents` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '回复内容',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关键词回复';

-- ----------------------------
-- Table structure for ims_yz_yun_sign_switch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_sign_switch`;
CREATE TABLE `ims_yz_yun_sign_switch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `switch_platform` tinyint(4) DEFAULT '0' COMMENT '开关',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台开关设置表';
SET FOREIGN_KEY_CHECKS=1;
