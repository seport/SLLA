SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE `calendar` (
  `_id` int(10) NOT NULL auto_increment,
  `fb_id` bigint(15) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `startTime` datetime NOT NULL,
  `lat` double default NULL,
  `lng` double default NULL,
  PRIMARY KEY  (`_id`),
  UNIQUE KEY `fb_id_2` (`fb_id`),
  KEY `fb_id` (`fb_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

CREATE TABLE `users` (
  `_id` int(11) NOT NULL auto_increment,
  `user` text NOT NULL,
  `pass` text NOT NULL,
  `level` int(11) NOT NULL,
  `iv` text NOT NULL,
  PRIMARY KEY  (`_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

/* Creating a default admin user with login:
    username: guest
    password: password
*/
INSERT INTO `users` (`_id`, `user`, `pass`, `level`, `iv`) VALUES
(1, 'guest', 'bXEzVHp2N0svMi9rWktSMTFIU3BDQT09', 0, '82faf16c85b154d6');
