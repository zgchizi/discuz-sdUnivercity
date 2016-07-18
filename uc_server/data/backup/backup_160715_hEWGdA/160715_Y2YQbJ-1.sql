# Identify: MTQ2ODU2MzY0Nix1Y2VudGVyLHVjZW50ZXIsbXVsdGl2b2wsMQ==
# <?php exit();?>
# ucenter Multi-Volume Data Dump Vol.1
# Time: 2016-07-15 14:20:46
# Type: ucenter
# Table Prefix: pre_ucenter_
# utf8
# ucenter Home: http://www.comsenz.com
# Please visit our website for newest infomation about ucenter
# --------------------------------------------------------


DROP TABLE IF EXISTS pre_ucenter_admins;
CREATE TABLE pre_ucenter_admins (
  uid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  username char(15) NOT NULL DEFAULT '',
  allowadminsetting tinyint(1) NOT NULL DEFAULT '0',
  allowadminapp tinyint(1) NOT NULL DEFAULT '0',
  allowadminuser tinyint(1) NOT NULL DEFAULT '0',
  allowadminbadword tinyint(1) NOT NULL DEFAULT '0',
  allowadmintag tinyint(1) NOT NULL DEFAULT '0',
  allowadminpm tinyint(1) NOT NULL DEFAULT '0',
  allowadmincredits tinyint(1) NOT NULL DEFAULT '0',
  allowadmindomain tinyint(1) NOT NULL DEFAULT '0',
  allowadmindb tinyint(1) NOT NULL DEFAULT '0',
  allowadminnote tinyint(1) NOT NULL DEFAULT '0',
  allowadmincache tinyint(1) NOT NULL DEFAULT '0',
  allowadminlog tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (uid),
  UNIQUE KEY username (username)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

DROP TABLE IF EXISTS pre_ucenter_applications;
CREATE TABLE pre_ucenter_applications (
  appid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  url varchar(255) NOT NULL DEFAULT '',
  authkey varchar(255) NOT NULL DEFAULT '',
  ip varchar(15) NOT NULL DEFAULT '',
  viewprourl varchar(255) NOT NULL,
  apifilename varchar(30) NOT NULL DEFAULT 'uc.php',
  `charset` varchar(8) NOT NULL DEFAULT '',
  dbcharset varchar(8) NOT NULL DEFAULT '',
  synlogin tinyint(1) NOT NULL DEFAULT '0',
  recvnote tinyint(1) DEFAULT '0',
  extra text NOT NULL,
  tagtemplates text NOT NULL,
  allowips text NOT NULL,
  PRIMARY KEY (appid)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

DROP TABLE IF EXISTS pre_ucenter_badwords;
CREATE TABLE pre_ucenter_badwords (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  admin varchar(15) NOT NULL DEFAULT '',
  find varchar(255) NOT NULL DEFAULT '',
  replacement varchar(255) NOT NULL DEFAULT '',
  findpattern varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY find (find)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_domains;
CREATE TABLE pre_ucenter_domains (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  domain char(40) NOT NULL DEFAULT '',
  ip char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_failedlogins;
CREATE TABLE pre_ucenter_failedlogins (
  ip char(15) NOT NULL DEFAULT '',
  count tinyint(1) unsigned NOT NULL DEFAULT '0',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_feeds;
CREATE TABLE pre_ucenter_feeds (
  feedid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  appid varchar(30) NOT NULL DEFAULT '',
  icon varchar(30) NOT NULL DEFAULT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL DEFAULT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  hash_template varchar(32) NOT NULL DEFAULT '',
  hash_data varchar(32) NOT NULL DEFAULT '',
  title_template text NOT NULL,
  title_data text NOT NULL,
  body_template text NOT NULL,
  body_data text NOT NULL,
  body_general text NOT NULL,
  image_1 varchar(255) NOT NULL DEFAULT '',
  image_1_link varchar(255) NOT NULL DEFAULT '',
  image_2 varchar(255) NOT NULL DEFAULT '',
  image_2_link varchar(255) NOT NULL DEFAULT '',
  image_3 varchar(255) NOT NULL DEFAULT '',
  image_3_link varchar(255) NOT NULL DEFAULT '',
  image_4 varchar(255) NOT NULL DEFAULT '',
  image_4_link varchar(255) NOT NULL DEFAULT '',
  target_ids varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (feedid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_friends;
CREATE TABLE pre_ucenter_friends (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  friendid mediumint(8) unsigned NOT NULL DEFAULT '0',
  direction tinyint(1) NOT NULL DEFAULT '0',
  version int(10) unsigned NOT NULL AUTO_INCREMENT,
  delstatus tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (version),
  KEY uid (uid),
  KEY friendid (friendid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_mailqueue;
CREATE TABLE pre_ucenter_mailqueue (
  mailid int(10) unsigned NOT NULL AUTO_INCREMENT,
  touid mediumint(8) unsigned NOT NULL DEFAULT '0',
  tomail varchar(32) NOT NULL,
  frommail varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  message text NOT NULL,
  `charset` varchar(15) NOT NULL,
  htmlon tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  failures tinyint(3) unsigned NOT NULL DEFAULT '0',
  appid smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mailid),
  KEY appid (appid),
  KEY `level` (`level`,failures)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_memberfields;
CREATE TABLE pre_ucenter_memberfields (
  uid mediumint(8) unsigned NOT NULL,
  blacklist text NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_members;
CREATE TABLE pre_ucenter_members (
  uid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  username char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  email char(32) NOT NULL DEFAULT '',
  myid char(30) NOT NULL DEFAULT '',
  myidkey char(16) NOT NULL DEFAULT '',
  regip char(15) NOT NULL DEFAULT '',
  regdate int(10) unsigned NOT NULL DEFAULT '0',
  lastloginip int(10) NOT NULL DEFAULT '0',
  lastlogintime int(10) unsigned NOT NULL DEFAULT '0',
  salt char(6) NOT NULL,
  secques char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (uid),
  UNIQUE KEY username (username),
  KEY email (email)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

DROP TABLE IF EXISTS pre_ucenter_mergemembers;
CREATE TABLE pre_ucenter_mergemembers (
  appid smallint(6) unsigned NOT NULL,
  username char(15) NOT NULL,
  PRIMARY KEY (appid,username)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_newpm;
CREATE TABLE pre_ucenter_newpm (
  uid mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_notelist;
CREATE TABLE pre_ucenter_notelist (
  noteid int(10) unsigned NOT NULL AUTO_INCREMENT,
  operation char(32) NOT NULL,
  closed tinyint(4) NOT NULL DEFAULT '0',
  totalnum smallint(6) unsigned NOT NULL DEFAULT '0',
  succeednum smallint(6) unsigned NOT NULL DEFAULT '0',
  getdata mediumtext NOT NULL,
  postdata mediumtext NOT NULL,
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  pri tinyint(3) NOT NULL DEFAULT '0',
  app1 tinyint(4) NOT NULL,
  app2 tinyint(4) NOT NULL,
  PRIMARY KEY (noteid),
  KEY closed (closed,pri,noteid),
  KEY dateline (dateline)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AUTO_INCREMENT=10;

DROP TABLE IF EXISTS pre_ucenter_pm_indexes;
CREATE TABLE pre_ucenter_pm_indexes (
  pmid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_pm_lists;
CREATE TABLE pre_ucenter_pm_lists (
  plid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  pmtype tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  members smallint(5) unsigned NOT NULL DEFAULT '0',
  min_max varchar(17) NOT NULL,
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  lastmessage text NOT NULL,
  PRIMARY KEY (plid),
  KEY pmtype (pmtype),
  KEY min_max (min_max),
  KEY authorid (authorid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS pre_ucenter_pm_members;
CREATE TABLE pre_ucenter_pm_members (
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  isnew tinyint(1) unsigned NOT NULL DEFAULT '0',
  pmnum int(10) unsigned NOT NULL DEFAULT '0',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0',
  lastdateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (plid,uid),
  KEY isnew (isnew),
  KEY lastdateline (uid,lastdateline),
  KEY lastupdate (uid,lastupdate)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_0;
CREATE TABLE pre_ucenter_pm_messages_0 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_1;
CREATE TABLE pre_ucenter_pm_messages_1 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_2;
CREATE TABLE pre_ucenter_pm_messages_2 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_3;
CREATE TABLE pre_ucenter_pm_messages_3 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_4;
CREATE TABLE pre_ucenter_pm_messages_4 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_5;
CREATE TABLE pre_ucenter_pm_messages_5 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_6;
CREATE TABLE pre_ucenter_pm_messages_6 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_7;
CREATE TABLE pre_ucenter_pm_messages_7 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_8;
CREATE TABLE pre_ucenter_pm_messages_8 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_pm_messages_9;
CREATE TABLE pre_ucenter_pm_messages_9 (
  pmid mediumint(8) unsigned NOT NULL DEFAULT '0',
  plid mediumint(8) unsigned NOT NULL DEFAULT '0',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  message text NOT NULL,
  delstatus tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid),
  KEY plid (plid,delstatus,dateline),
  KEY dateline (plid,dateline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_protectedmembers;
CREATE TABLE pre_ucenter_protectedmembers (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  username char(15) NOT NULL DEFAULT '',
  appid tinyint(1) unsigned NOT NULL DEFAULT '0',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  admin char(15) NOT NULL DEFAULT '0',
  UNIQUE KEY username (username,appid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_settings;
CREATE TABLE pre_ucenter_settings (
  k varchar(32) NOT NULL DEFAULT '',
  v text NOT NULL,
  PRIMARY KEY (k)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_sqlcache;
CREATE TABLE pre_ucenter_sqlcache (
  sqlid char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  expiry int(10) unsigned NOT NULL,
  PRIMARY KEY (sqlid),
  KEY expiry (expiry)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_tags;
CREATE TABLE pre_ucenter_tags (
  tagname char(20) NOT NULL,
  appid smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  expiration int(10) unsigned NOT NULL,
  KEY tagname (tagname,appid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pre_ucenter_vars;
CREATE TABLE pre_ucenter_vars (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

INSERT INTO pre_ucenter_admins VALUES ('1',0x61646d696e,'1','1','1','1','1','1','1','1','1','1','1','1');

INSERT INTO pre_ucenter_applications VALUES ('1',0x44495343555a58,0x44697363757a2120426f617264,0x687474703a2f2f6c6f63616c686f7374,0x30323133766c6754556e474a4251737477575152574d54365565324e55665a6d3548674d4f304f5372326c3252716165365072776254546b7150364a6978647545724a336753356b44673534334f633564616e4546355575784376654772376256556c6b375761626353696444454a2b6e704d454d6f6d626d636c77,'','',0x75632e706870,'','','1','1',0x613a323a7b733a373a2261707070617468223b733a303a22223b733a383a22657874726175726c223b613a303a7b7d7d,0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d2249534f2d383835392d31223f3e0d0a3c726f6f743e0d0a093c6974656d2069643d2274656d706c617465223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a3c2f726f6f743e,'');
INSERT INTO pre_ucenter_applications VALUES ('2',0x4f54484552,0x6f70706961,0x687474703a2f2f6c6f63616c686f73743a38313831,0x623062637943773058754a453355307238455248517a516d3178447778753554325a556435436e626f643758567a4d676f5571344263597242576d664e5a7667664a614f33544b712f75636e5a4237676e553147306e35536e56794e7758686452472b547978577a31774a6656566d58354b4a38363653457a6e524d,'','',0x7563,'','','1','1',0x613a323a7b733a373a2261707070617468223b733a303a22223b733a383a22657874726175726c223b613a303a7b7d7d,0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d2249534f2d383835392d31223f3e0d0a3c726f6f743e0d0a093c6974656d2069643d2274656d706c617465223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a3c2f726f6f743e,'');



INSERT INTO pre_ucenter_failedlogins VALUES (0x376135376135613734333839346130,'0','1468562890');
INSERT INTO pre_ucenter_failedlogins VALUES (0x623935613433343836333061346433,'0','1468563621');
INSERT INTO pre_ucenter_failedlogins VALUES (0x3a3a31,'0','1468562890');
INSERT INTO pre_ucenter_failedlogins VALUES (0x756e6b6e6f776e,'0','1468563621');




INSERT INTO pre_ucenter_memberfields VALUES ('1','');
INSERT INTO pre_ucenter_memberfields VALUES ('2','');
INSERT INTO pre_ucenter_memberfields VALUES ('3','');
INSERT INTO pre_ucenter_memberfields VALUES ('4','');

INSERT INTO pre_ucenter_members VALUES ('1',0x61646d696e,0x3432356235376363366337363662626164613235393438356437313664343632,0x61646d696e4061646d696e2e636f6d,'','',0x68696464656e,'1466153939','0','0',0x336464323662,'');
INSERT INTO pre_ucenter_members VALUES ('2',0x736f736f,0x6661653232366264663766393534383965633366353932306432613164653033,0x7373403136332e636f6d,'','',0x3139322e3136382e322e313039,'1466155294','0','0',0x653731303630,'');
INSERT INTO pre_ucenter_members VALUES ('3',0x736f676f,0x3437303932313836633038316163373837383266316165353236643466333663,0x736973694071712e636f6d,'','',0x3132372e302e302e31,'1467269110','0','0',0x363938336664,'');
INSERT INTO pre_ucenter_members VALUES ('4',0x796f6e676875,0x3635386434353461666638373739653462316334373964616336663635346663,0x7364614071712e636f6d,'','',0x3a3a31,'1468561309','0','0',0x643165626163,'');



INSERT INTO pre_ucenter_notelist VALUES ('9',0x75706461746561707073,'1','5','0','',0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d2249534f2d383835392d31223f3e0d0a3c726f6f743e0d0a093c6974656d2069643d2231223e0d0a09093c6974656d2069643d226170706964223e3c215b43444154415b315d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2274797065223e3c215b43444154415b44495343555a585d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226e616d65223e3c215b43444154415b44697363757a2120426f6172645d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2275726c223e3c215b43444154415b687474703a2f2f6c6f63616c686f73745d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226970223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d227669657770726f75726c223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2261706966696c656e616d65223e3c215b43444154415b75632e7068705d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2263686172736574223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2273796e6c6f67696e223e3c215b43444154415b315d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226578747261223e0d0a0909093c6974656d2069643d2261707070617468223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a0909093c6974656d2069643d22657874726175726c223e0d0a0909093c2f6974656d3e0d0a09093c2f6974656d3e0d0a09093c6974656d2069643d22726563766e6f7465223e3c215b43444154415b315d5d3e3c2f6974656d3e0d0a093c2f6974656d3e0d0a093c6974656d2069643d2232223e0d0a09093c6974656d2069643d226170706964223e3c215b43444154415b325d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2274797065223e3c215b43444154415b4f544845525d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226e616d65223e3c215b43444154415b6f707069615d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2275726c223e3c215b43444154415b687474703a2f2f6c6f63616c686f73743a383138315d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226970223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d227669657770726f75726c223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2261706966696c656e616d65223e3c215b43444154415b75635d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2263686172736574223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d2273796e6c6f67696e223e3c215b43444154415b315d5d3e3c2f6974656d3e0d0a09093c6974656d2069643d226578747261223e0d0a0909093c6974656d2069643d2261707070617468223e3c215b43444154415b5d5d3e3c2f6974656d3e0d0a0909093c6974656d2069643d22657874726175726c223e0d0a0909093c2f6974656d3e0d0a09093c2f6974656d3e0d0a09093c6974656d2069643d22726563766e6f7465223e3c215b43444154415b315d5d3e3c2f6974656d3e0d0a093c2f6974656d3e0d0a093c6974656d2069643d2255435f415049223e3c215b43444154415b687474703a2f2f6c6f63616c686f73742f75635f7365727665725d5d3e3c2f6974656d3e0d0a3c2f726f6f743e,'1468558288','0','-5','0');















INSERT INTO pre_ucenter_settings VALUES (0x616363657373656d61696c,'');
INSERT INTO pre_ucenter_settings VALUES (0x63656e736f72656d61696c,'');
INSERT INTO pre_ucenter_settings VALUES (0x63656e736f72757365726e616d65,'');
INSERT INTO pre_ucenter_settings VALUES (0x64617465666f726d6174,0x792d6e2d6a);
INSERT INTO pre_ucenter_settings VALUES (0x646f75626c6565,'0');
INSERT INTO pre_ucenter_settings VALUES (0x6e6578746e6f746574696d65,'0');
INSERT INTO pre_ucenter_settings VALUES (0x74696d656f6666736574,0x3238383030);
INSERT INTO pre_ucenter_settings VALUES (0x70726976617465706d7468726561646c696d6974,0x3235);
INSERT INTO pre_ucenter_settings VALUES (0x63686174706d7468726561646c696d6974,0x3330);
INSERT INTO pre_ucenter_settings VALUES (0x63686174706d6d656d6265726c696d6974,0x3335);
INSERT INTO pre_ucenter_settings VALUES (0x706d666c6f6f646374726c,0x3135);
INSERT INTO pre_ucenter_settings VALUES (0x706d63656e746572,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x73656e64706d736563636f6465,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x706d73656e6472656764617973,'0');
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c64656661756c74,0x757365726e616d65403231636e2e636f6d);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c73656e64,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c736572766572,0x736d74702e3231636e2e636f6d);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c706f7274,0x3235);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c61757468,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c66726f6d,0x5543656e746572203c757365726e616d65403231636e2e636f6d3e);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c617574685f757365726e616d65,0x757365726e616d65403231636e2e636f6d);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c617574685f70617373776f7264,0x70617373776f7264);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c64656c696d69746572,'0');
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c757365726e616d65,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x6d61696c73696c656e74,0x31);
INSERT INTO pre_ucenter_settings VALUES (0x6c6f67696e5f6661696c656474696d65,0x35);
INSERT INTO pre_ucenter_settings VALUES (0x76657273696f6e,0x312e362e30);



INSERT INTO pre_ucenter_vars VALUES (0x6e6f7465657869737473,'0');
INSERT INTO pre_ucenter_vars VALUES (0x6e6f746565786973747331,'0');
INSERT INTO pre_ucenter_vars VALUES (0x6e6f746565786973747332,0x31);

