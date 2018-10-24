# Host: localhost  (Version: 5.5.53)
# Date: 2018-10-24 11:39:11
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "accounts"
#

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `Username` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Password` varchar(129) DEFAULT NULL,
  `RegisterDate` varchar(36) DEFAULT NULL,
  `LoginDate` varchar(36) DEFAULT NULL,
  `IP` varchar(16) DEFAULT 'n/a',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "accounts"
#


#
# Structure for table "arrestpoints"
#

DROP TABLE IF EXISTS `arrestpoints`;
CREATE TABLE `arrestpoints` (
  `arrestID` int(11) NOT NULL AUTO_INCREMENT,
  `arrestX` float NOT NULL,
  `arrestY` float NOT NULL,
  `arrestZ` float NOT NULL,
  `arrestInterior` int(11) NOT NULL,
  `arrestWorld` int(11) NOT NULL,
  PRIMARY KEY (`arrestID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "arrestpoints"
#

INSERT INTO `arrestpoints` VALUES (1,278.277,1395.19,10.5859,0,0),(2,1560.6,-1693.6,5.8906,0,0),(3,254.817,85.4965,1002.45,6,7002);

#
# Structure for table "atm"
#

DROP TABLE IF EXISTS `atm`;
CREATE TABLE `atm` (
  `atmID` int(11) NOT NULL AUTO_INCREMENT,
  `atmX` float NOT NULL,
  `atmY` float NOT NULL,
  `atmZ` float NOT NULL,
  `atmA` float NOT NULL,
  `atmInterior` int(11) NOT NULL,
  `atmWorld` int(11) NOT NULL,
  PRIMARY KEY (`atmID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "atm"
#

INSERT INTO `atm` VALUES (1,2104.36,-1803.33,13.5546,269.234,0,0),(2,1832.69,-1839.5,13.5781,268.318,0,0),(3,1976.46,-1761.34,13.5468,180.896,0,0),(4,1926.58,-1765.44,13.539,179.643,0,0),(5,2242.49,-1664.04,15.4765,162.41,0,0),(6,2127.95,-1150.1,24.2795,188.103,0,0),(7,1366.1,-1276.68,13.5468,268.631,0,0),(8,1787.53,-1721.48,13.5468,0.1251,0,0);

#
# Structure for table "backpackitems"
#

DROP TABLE IF EXISTS `backpackitems`;
CREATE TABLE `backpackitems` (
  `ID` int(12) DEFAULT '0',
  `itemID` int(12) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(32) DEFAULT NULL,
  `itemModel` int(12) DEFAULT '0',
  `itemQuantity` int(12) DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "backpackitems"
#


#
# Structure for table "backpacks"
#

DROP TABLE IF EXISTS `backpacks`;
CREATE TABLE `backpacks` (
  `backpackID` int(12) NOT NULL AUTO_INCREMENT,
  `backpackPlayer` int(12) DEFAULT '0',
  `backpackX` float DEFAULT '0',
  `backpackY` float DEFAULT '0',
  `backpackZ` float DEFAULT '0',
  `backpackInterior` int(12) DEFAULT '0',
  `backpackWorld` int(12) DEFAULT '0',
  `backpackHouse` int(12) DEFAULT '0',
  `backpackVehicle` int(12) DEFAULT '0',
  PRIMARY KEY (`backpackID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "backpacks"
#


#
# Structure for table "billboards"
#

DROP TABLE IF EXISTS `billboards`;
CREATE TABLE `billboards` (
  `bbID` int(12) NOT NULL AUTO_INCREMENT,
  `bbExists` int(12) DEFAULT '0',
  `bbName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `bbOwner` int(12) NOT NULL DEFAULT '0',
  `bbPrice` int(12) NOT NULL DEFAULT '0',
  `bbRange` int(12) DEFAULT '10',
  `bbPosX` float DEFAULT '0',
  `bbPosY` float DEFAULT '0',
  `bbPosZ` float DEFAULT '0',
  `bbMessage` varchar(230) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`bbID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "billboards"
#


#
# Structure for table "blacklist"
#

DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `IP` varchar(16) DEFAULT '0.0.0.0',
  `Username` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `BannedBy` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Reason` varchar(128) CHARACTER SET gbk DEFAULT NULL,
  `Date` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "blacklist"
#


#
# Structure for table "businesses"
#

DROP TABLE IF EXISTS `businesses`;
CREATE TABLE `businesses` (
  `bizID` int(12) NOT NULL AUTO_INCREMENT,
  `bizName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `bizOwner` int(12) DEFAULT '0',
  `bizType` int(12) DEFAULT '0',
  `bizPrice` int(12) DEFAULT '0',
  `bizPosX` float DEFAULT '0',
  `bizPosY` float DEFAULT '0',
  `bizPosZ` float DEFAULT '0',
  `bizPosA` float DEFAULT '0',
  `bizIntX` float DEFAULT '0',
  `bizIntY` float DEFAULT '0',
  `bizIntZ` float DEFAULT '0',
  `bizIntA` float DEFAULT '0',
  `bizInterior` int(12) DEFAULT '0',
  `bizExterior` int(12) DEFAULT '0',
  `bizExteriorVW` int(12) DEFAULT '0',
  `bizLocked` int(4) DEFAULT '0',
  `bizVault` int(12) DEFAULT '0',
  `bizProducts` int(12) DEFAULT '0',
  `bizPrice1` int(12) DEFAULT '0',
  `bizPrice2` int(12) DEFAULT '0',
  `bizPrice3` int(12) DEFAULT '0',
  `bizPrice4` int(12) DEFAULT '0',
  `bizPrice5` int(12) DEFAULT '0',
  `bizPrice6` int(12) DEFAULT '0',
  `bizPrice7` int(12) DEFAULT '0',
  `bizPrice8` int(12) DEFAULT '0',
  `bizPrice9` int(12) DEFAULT '0',
  `bizPrice10` int(12) DEFAULT '0',
  `bizSpawnX` float DEFAULT '0',
  `bizSpawnY` float DEFAULT '0',
  `bizSpawnZ` float DEFAULT '0',
  `bizSpawnA` float DEFAULT '0',
  `bizDeliverX` float DEFAULT '0',
  `bizDeliverY` float DEFAULT '0',
  `bizDeliverZ` float DEFAULT '0',
  `bizMessage` varchar(128) CHARACTER SET gbk DEFAULT NULL,
  `bizPrice11` int(12) DEFAULT '0',
  `bizPrice12` int(12) DEFAULT '0',
  `bizPrice13` int(12) DEFAULT '0',
  `bizPrice14` int(12) DEFAULT '0',
  `bizPrice15` int(12) DEFAULT '0',
  `bizPrice16` int(12) DEFAULT '0',
  `bizPrice17` int(12) DEFAULT '0',
  `bizPrice18` int(12) DEFAULT '0',
  `bizPrice19` int(12) DEFAULT '0',
  `bizPrice20` int(12) DEFAULT '0',
  `bizShipment` int(4) DEFAULT '0',
  `bizFaction` int(11) NOT NULL DEFAULT '-1',
  `bizFmoney` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bizID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "businesses"
#

INSERT INTO `businesses` VALUES (1,'火车站24/7',0,1,70000,1832.69,-1842.4,13.5781,256.278,-27.3073,-30.874,1003.56,0,4,0,0,0,658,4736,75,125,15,100,3,2,10,100,20,10,1832.69,-1842.4,13.5781,256.278,1836.69,-1854.73,13.3893,'',150,200,160,60,50,5,10,5,0,0,0,-1,0),(2,'肥宅快乐餐厅',0,4,70000,2104.84,-1806.47,13.5544,269.074,363.34,-74.6679,1001.51,315,10,0,0,0,372,35,2,5,5,10,10,15,10,0,0,0,2104.84,-1806.47,13.5544,269.074,2097.13,-1797.83,13.3886,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(4,'艾德伍德家具店',0,7,70000,1978.82,-1760.82,13.5466,177.902,-2240.5,128.377,1035.42,270,6,0,0,0,315,4993,75,115,15,95,3,2,10,100,20,10,1978.82,-1760.82,13.5466,177.902,1983.04,-1757.44,13.5466,'',140,190,150,60,50,5,10,5,0,0,0,-1,0),(5,'24-7杂货店',0,6,100000,1929.46,-1775.94,13.5466,110.222,-27.3383,-57.6907,1003.55,0,6,0,0,0,132,62,150,200,100,25,25,100,10,200,200,300,1929.46,-1775.94,13.5466,110.222,1928.85,-1792.72,13.3828,'欢迎来到24-7，我们的价格最低价！',400,500,200,300,150,25,25,5,0,0,0,-1,0),(6,'甘顿服装店',0,3,90000,2244.64,-1664.44,15.4764,163.611,161.48,-96.5363,1001.8,0,18,0,0,0,704,60,25,15,10,10,0,0,0,0,0,0,2244.64,-1664.44,15.4764,163.611,2248.43,-1661.44,15.2845,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(7,'艾德伍德邮局',0,9,70000,2069.69,-1773.67,13.5586,98.7507,-107.243,2021.82,901.086,0,3,0,0,0,10,96,5,1,0,0,0,0,0,0,0,0,2069.69,-1773.67,13.5586,98.7507,2074.88,-1768.94,13.5536,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(8,'杰弗逊4S店',0,5,200000,2131.51,-1149.91,24.2119,197.452,1494.56,1304.21,1093.29,0,3,0,0,0,107098,5,0,0,0,0,0,0,0,0,0,0,2135.49,-1133.46,25.6893,86.527,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(10,'自行车/摩托车经销店',0,5,70000,1783.97,-1721.81,13.5452,348.409,1494.56,1304.21,1093.29,0,3,0,0,0,369750,100,0,0,0,0,0,0,0,0,0,0,1779.42,-1727.53,13.3828,90.5326,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(11,'jeff\'s小卖部',0,1,70000,1642.22,-2238.54,13.4975,347.29,-27.3073,-30.874,1003.56,0,4,0,0,0,15219,2,1099,500,40,5,10,20,400,100,80,499,1642.22,-2238.54,13.4975,347.29,1636.01,-2249.01,13.3226,'开业酬宾，全场清仓大甩卖!',150,285,160,60,50,5,10,5,0,0,1,-1,0),(12,'便利店',0,1,60000,962.954,-4501.01,3.4171,169.538,-27.3073,-30.874,1003.56,0,4,0,0,1,0,100,75,125,15,100,3,2,10,100,20,10,962.954,-4501.01,3.4171,169.538,958.989,-4497.94,3.4171,'',150,200,160,60,50,5,10,5,0,0,0,-1,0),(13,'便利加油站',0,6,80000,966.677,-4514.22,3.6746,84.5998,-27.3383,-57.6908,1003.55,0,6,0,0,1,0,100,75,115,15,90,3,2,10,90,20,10,966.677,-4514.22,3.6746,84.5998,971.159,-4511.17,3.5,'',140,150,50,40,5,10,5,0,0,0,0,-1,0),(14,'便民服装店',0,3,60000,975.213,-4524.19,3.6144,90.2399,161.48,-96.5367,1001.8,0,18,0,0,1,0,100,25,15,10,10,0,0,0,0,0,0,975.213,-4524.19,3.6144,90.2399,981.99,-4524.93,3.4999,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(15,'便民饭店',0,4,70000,966.579,-4510.45,3.7197,83.9732,363.34,-74.6679,1001.51,315,10,0,0,1,0,100,2,5,5,10,10,15,10,0,0,0,966.579,-4510.45,3.7197,83.9732,970.398,-4505.77,3.5052,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(16,'两轮工具经销店',0,5,100000,907.202,-4542.51,3.3156,358.409,1494.56,1304.21,1093.29,0,3,0,0,1,0,100,0,0,0,0,0,0,0,0,0,0,906.55,-4546.22,3.1671,87.3964,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(17,'时尚家具店',0,7,100000,867.634,-4542.37,3.3155,356.842,-2240.5,128.377,1035.42,270,6,0,0,1,0,100,75,115,15,95,3,2,10,100,20,10,867.634,-4542.37,3.3155,356.842,873.739,-4546.54,3.1639,'',140,190,150,60,50,5,10,5,0,0,0,-1,0),(18,'滨海邮局',0,9,50000,997.181,-4555.71,3.4171,134.562,-107.243,2021.82,901.086,0,3,0,0,1,0,100,5,1,0,0,0,0,0,0,0,0,997.181,-4555.71,3.4171,134.562,996.582,-4547.45,3.4171,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(19,'恒大武器店',0,2,1000000,1367.66,-1279.74,13.5466,265.059,316.396,-169.837,999.601,0,6,0,0,0,185300,89,7000,10000,7000,20000,40000,80000,16000,50000,0,0,1367.66,-1279.74,13.5466,265.059,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,-1,0),(20,'恒大4S店',0,5,100000,2130.14,-1761.09,13.5625,168.456,1494.56,1304.21,1093.29,0,3,0,0,1,0,100,0,0,0,0,0,0,0,0,0,0,2145.25,-1739.99,13.5561,178.482,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,-1,0);

#
# Structure for table "cars"
#

DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `carID` int(12) NOT NULL AUTO_INCREMENT,
  `carModel` int(12) DEFAULT '0',
  `carOwner` int(12) DEFAULT '0',
  `carPosX` float DEFAULT '0',
  `carPosY` float DEFAULT '0',
  `carPosZ` float DEFAULT '0',
  `carPosR` float DEFAULT '0',
  `carColor1` int(12) DEFAULT '0',
  `carColor2` int(12) DEFAULT '0',
  `carPaintjob` int(12) DEFAULT '-1',
  `carLocked` int(4) DEFAULT '0',
  `carMod1` int(12) DEFAULT '0',
  `carMod2` int(12) DEFAULT '0',
  `carMod3` int(12) DEFAULT '0',
  `carMod4` int(12) DEFAULT '0',
  `carMod5` int(12) DEFAULT '0',
  `carMod6` int(12) DEFAULT '0',
  `carMod7` int(12) DEFAULT '0',
  `carMod8` int(12) DEFAULT '0',
  `carMod9` int(12) DEFAULT '0',
  `carMod10` int(12) DEFAULT '0',
  `carMod11` int(12) DEFAULT '0',
  `carMod12` int(12) DEFAULT '0',
  `carMod13` int(12) DEFAULT '0',
  `carMod14` int(12) DEFAULT '0',
  `carImpounded` int(12) DEFAULT '0',
  `carWeapon1` int(12) DEFAULT '0',
  `carAmmo1` int(12) DEFAULT '0',
  `carWeapon2` int(12) DEFAULT '0',
  `carAmmo2` int(12) DEFAULT '0',
  `carWeapon3` int(12) DEFAULT '0',
  `carAmmo3` int(12) DEFAULT '0',
  `carWeapon4` int(12) DEFAULT '0',
  `carAmmo4` int(12) DEFAULT '0',
  `carWeapon5` int(12) DEFAULT '0',
  `carAmmo5` int(12) DEFAULT '0',
  `carImpoundPrice` int(12) DEFAULT '0',
  `carFaction` int(12) DEFAULT '0',
  `carSiren` int(12) DEFAULT '0',
  PRIMARY KEY (`carID`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;

#
# Data for table "cars"
#

INSERT INTO `cars` VALUES (16,525,0,2136.97,-1733.12,13.55,178.923,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,7,0),(17,525,0,2132.61,-1737.48,13.5586,179.55,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,7,0),(19,525,0,2173.09,-1735.71,13.5461,268.828,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,7,0),(22,400,0,2279.86,-2358.87,13.5467,221.666,61,61,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,10,0),(24,461,0,2285.05,-2353.1,13.5466,228.246,61,61,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,10,0),(25,461,0,2286.67,-2351.37,13.5467,227.306,61,61,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,10,0),(29,416,0,1708.46,-1137.66,24.0859,179.526,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(30,416,0,1717.07,-1137.77,24.0781,178.273,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(32,416,0,1734.37,-1138.33,24.0859,179.573,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(33,416,0,1742.7,-1137.9,24.0781,178.319,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(34,416,0,1751.06,-1137.76,24.0859,179.886,1,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(36,407,0,1708.46,-1099.97,24.0781,1.0889,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(37,407,0,1716.66,-1099.99,24.0781,2.0526,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(38,407,0,1725.18,-1099.53,24.0859,358.606,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(39,544,0,1733.28,-1099.68,24.0781,0.1958,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(40,544,0,1725.52,-1137.31,24.0859,179.715,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,2,0),(45,420,0,1814.17,-1867.29,13.5703,1.3292,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(46,420,0,1814.1,-1874.51,13.5703,358.196,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(47,420,0,1813.91,-1902.55,13.5723,359.137,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(48,420,0,1813.89,-1909.51,13.5654,1.0158,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(49,420,0,1813.88,-1916.81,13.5472,358.486,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(50,420,0,1813.88,-1923.95,13.5477,359.716,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,5,0),(51,408,0,2181.72,-1986.9,13.5503,356.896,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(52,408,0,2161.74,-1971.28,13.5529,93.7404,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(53,408,0,2148.84,-1984.13,13.5468,73.0602,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(54,408,0,2154.84,-1979.6,13.5512,58.3335,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(55,408,0,2170.03,-1982.28,13.5546,356.92,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(56,408,0,2175.57,-1982.73,13.5513,1.4809,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,6,0),(71,463,0,2283.25,-2355.36,13.5467,225.74,43,43,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,10,0),(95,582,0,295.136,-1642.18,17.8593,81.6434,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(96,582,0,296.452,-1638.26,17.8593,79.7634,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(97,582,0,297.785,-1634.42,17.8593,81.9801,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(98,582,0,298.558,-1630.51,17.8593,79.4734,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(99,582,0,298.489,-1626.4,17.8593,81.6668,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(100,582,0,299.599,-1622.67,17.8593,82.2934,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(101,522,0,300.581,-1618.7,17.8593,81.0401,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(102,522,0,301.196,-1614.39,17.8593,82.2934,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(103,582,0,269.711,-1629.62,17.8593,260.582,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(104,582,0,270.53,-1625.47,17.8593,262.172,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(105,488,0,268.804,-1643.53,33.3039,342.699,1,2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,4,0),(106,423,0,1458.48,-1504.17,13.5468,353.545,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(107,423,0,1462.73,-1503.86,13.5468,357.305,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(108,423,0,1469.02,-1499.42,13.5468,359.089,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(109,423,0,1475.05,-1499.18,13.5468,359.818,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(110,423,0,1483.59,-1499.4,13.5504,356.058,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(111,423,0,1479.16,-1498.51,13.5498,0.1545,6,6,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,8,0),(136,560,0,2753.24,-1944.13,13.5468,269.761,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(137,412,0,2762.19,-1972.06,13.5458,359.689,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(138,412,0,2762.17,-1963.08,13.5436,359.689,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(139,412,0,2761.94,-1954.17,13.5468,0.9419,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(141,461,0,2762.03,-1938.01,13.5393,271.015,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(142,461,0,2762.26,-1934.03,13.5393,267.255,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(143,461,0,2762.11,-1929.57,13.5393,276.968,3,3,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,13,0),(188,598,0,1570.22,-1709.25,5.8899,3.654,0,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,9,1);

#
# Structure for table "carstorage"
#

DROP TABLE IF EXISTS `carstorage`;
CREATE TABLE `carstorage` (
  `ID` int(12) DEFAULT '0',
  `itemID` int(12) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `itemModel` int(12) DEFAULT '0',
  `itemQuantity` int(12) DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "carstorage"
#


#
# Structure for table "characters"
#

DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `Username` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `Character` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Created` int(4) DEFAULT '0',
  `Gender` int(4) DEFAULT '0',
  `Birthdate` int(11) NOT NULL DEFAULT '24',
  `Origin` varchar(32) CHARACTER SET gbk DEFAULT 'Not Specified',
  `Skin` int(12) DEFAULT '0',
  `Glasses` int(12) DEFAULT '0',
  `Hat` int(12) DEFAULT '0',
  `Bandana` int(12) DEFAULT '0',
  `Vest` int(12) DEFAULT '0',
  `PosX` float DEFAULT '0',
  `PosY` float DEFAULT '0',
  `PosZ` float DEFAULT '0',
  `PosA` float DEFAULT '0',
  `Interior` int(12) DEFAULT '0',
  `World` int(12) DEFAULT '0',
  `GlassesPos` varchar(100) DEFAULT NULL,
  `HatPos` varchar(100) DEFAULT NULL,
  `BandanaPos` varchar(100) DEFAULT NULL,
  `Hospital` int(12) DEFAULT '-1',
  `HospitalInt` int(12) DEFAULT '0',
  `Money` int(12) DEFAULT '0',
  `BankMoney` int(12) DEFAULT '0',
  `OwnsBillboard` int(12) DEFAULT '-1',
  `Savings` int(12) DEFAULT '0',
  `Admin` int(12) DEFAULT '0',
  `JailTime` int(12) DEFAULT '0',
  `Muted` int(4) DEFAULT '0',
  `CreateDate` int(12) DEFAULT '0',
  `LastLogin` int(12) DEFAULT '0',
  `Helper` int(4) DEFAULT '0',
  `Gun1` int(12) DEFAULT '0',
  `Gun2` int(12) DEFAULT '0',
  `Gun3` int(12) DEFAULT '0',
  `Gun4` int(12) DEFAULT '0',
  `Gun5` int(12) DEFAULT '0',
  `Gun6` int(12) DEFAULT '0',
  `Gun7` int(12) DEFAULT '0',
  `Gun8` int(12) DEFAULT '0',
  `Gun9` int(12) DEFAULT '0',
  `Gun10` int(12) DEFAULT '0',
  `Gun11` int(12) DEFAULT '0',
  `Gun12` int(12) DEFAULT '0',
  `Gun13` int(12) DEFAULT '0',
  `Ammo1` int(12) DEFAULT '0',
  `Ammo2` int(12) DEFAULT '0',
  `Ammo3` int(12) DEFAULT '0',
  `Ammo4` int(12) DEFAULT '0',
  `Ammo5` int(12) DEFAULT '0',
  `Ammo6` int(12) DEFAULT '0',
  `Ammo7` int(12) DEFAULT '0',
  `Ammo8` int(12) DEFAULT '0',
  `Ammo9` int(12) DEFAULT '0',
  `Ammo10` int(12) DEFAULT '0',
  `Ammo11` int(12) DEFAULT '0',
  `Ammo12` int(12) DEFAULT '0',
  `Ammo13` int(12) DEFAULT '0',
  `House` int(12) DEFAULT '-1',
  `Business` int(12) DEFAULT '-1',
  `Phone` int(12) DEFAULT '0',
  `Lottery` int(12) DEFAULT '0',
  `Hunger` int(12) DEFAULT '100',
  `Thirst` int(12) DEFAULT '100',
  `PlayingHours` int(12) DEFAULT '0',
  `Minutes` int(12) DEFAULT '0',
  `ArmorStatus` float DEFAULT '0',
  `Entrance` int(12) DEFAULT '0',
  `Job` int(12) DEFAULT '0',
  `Faction` int(12) DEFAULT '-1',
  `FactionRank` int(12) DEFAULT '0',
  `FactionDivision` int(12) DEFAULT '0',
  `Prisoned` int(4) DEFAULT '0',
  `Warrants` int(12) DEFAULT '0',
  `Injured` int(4) DEFAULT '0',
  `Health` float DEFAULT '0',
  `Channel` int(12) DEFAULT '0',
  `Accent` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Bleeding` int(4) DEFAULT '0',
  `Warnings` int(12) DEFAULT '0',
  `Warn1` varchar(32) DEFAULT NULL,
  `Warn2` varchar(32) DEFAULT NULL,
  `ForumName` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `Donator` int(12) DEFAULT '0',
  `FightStyle` int(11) NOT NULL DEFAULT '4',
  `MaskID` int(12) DEFAULT '0',
  `FactionMod` int(12) DEFAULT '0',
  `SwatMember` int(12) DEFAULT '0',
  `Capacity` int(12) DEFAULT '35',
  `Channel2` int(12) DEFAULT '0',
  `Channel3` int(12) DEFAULT '0',
  `Channel4` int(12) DEFAULT '0',
  `AdminHide` int(4) DEFAULT '0',
  `LotteryB` int(11) NOT NULL,
  `SpawnPoint` int(11) NOT NULL,
  `Clothes1` int(11) NOT NULL DEFAULT '1',
  `Clothes2` int(11) NOT NULL DEFAULT '1',
  `Clothes3` int(11) NOT NULL DEFAULT '1',
  `段位积分` int(11) NOT NULL DEFAULT '0',
  `新手礼包` int(1) NOT NULL DEFAULT '0',
  `职业` int(1) NOT NULL DEFAULT '0',
  `职业积分` int(11) NOT NULL DEFAULT '0',
  `吸血鬼宝箱` int(11) NOT NULL DEFAULT '0',
  `段位积分宝箱` int(11) NOT NULL DEFAULT '0',
  `金钱宝箱` int(11) NOT NULL DEFAULT '0',
  `技能树1` int(11) NOT NULL DEFAULT '0',
  `技能树2` int(11) NOT NULL DEFAULT '0',
  `技能树3` int(11) NOT NULL DEFAULT '0',
  `技能树4` int(11) NOT NULL DEFAULT '0',
  `邀请人数` int(11) NOT NULL DEFAULT '0',
  `邀请人` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT '无',
  `现金兑换` int(1) NOT NULL DEFAULT '0',
  `点卷` int(11) NOT NULL DEFAULT '0',
  `结婚` int(11) NOT NULL DEFAULT '0',
  `新手任务` int(11) NOT NULL DEFAULT '0',
  `停职` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "characters"
#


#
# Structure for table "contacts"
#

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `ID` int(12) DEFAULT '0',
  `contactID` int(12) NOT NULL AUTO_INCREMENT,
  `contactName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `contactNumber` int(12) DEFAULT '0',
  PRIMARY KEY (`contactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "contacts"
#


#
# Structure for table "crates"
#

DROP TABLE IF EXISTS `crates`;
CREATE TABLE `crates` (
  `crateID` int(12) NOT NULL AUTO_INCREMENT,
  `crateType` int(12) DEFAULT '0',
  `crateX` float DEFAULT '0',
  `crateY` float DEFAULT '0',
  `crateZ` float DEFAULT '0',
  `crateA` float DEFAULT '0',
  `crateInterior` int(12) DEFAULT '0',
  `crateWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`crateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "crates"
#


#
# Structure for table "dealervehicles"
#

DROP TABLE IF EXISTS `dealervehicles`;
CREATE TABLE `dealervehicles` (
  `ID` int(12) DEFAULT '0',
  `vehID` int(12) NOT NULL AUTO_INCREMENT,
  `vehModel` int(12) DEFAULT '0',
  `vehPrice` int(12) DEFAULT '0',
  PRIMARY KEY (`vehID`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

#
# Data for table "dealervehicles"
#

INSERT INTO `dealervehicles` VALUES (18,19,400,5000),(18,20,401,2300),(18,21,405,7650),(18,22,413,3000),(18,23,562,12000),(18,24,541,20000),(18,25,415,17000),(18,26,402,5000),(18,27,451,15000),(18,28,580,12000),(18,29,426,3000),(18,30,566,2500),(18,31,458,1500),(18,32,496,3200),(18,33,559,10000),(18,34,517,4000),(18,35,550,4000),(18,36,560,8000),(18,37,468,1500),(18,38,461,2000),(18,39,471,1000),(18,40,521,2000),(18,41,522,2500),(18,42,445,1500),(18,43,534,1800),(18,44,500,4000),(37,45,400,3700),(37,46,401,1650),(37,48,404,1200),(37,49,405,3100),(37,50,409,7000),(37,51,410,2400),(37,53,412,4000),(37,54,413,3200),(37,57,418,4600),(37,58,419,1000),(37,59,426,12000),(37,60,420,4200),(37,61,422,800),(37,62,445,8000),(37,63,421,3450),(37,64,458,9000),(37,66,579,42000),(37,68,562,24000),(53,69,462,350),(53,70,463,650),(53,71,468,1000),(53,72,586,950),(53,73,581,1750),(54,74,487,175000),(54,75,511,280000),(54,76,593,95000),(37,77,566,7500),(37,78,463,1200),(37,79,481,500),(62,80,414,57500),(62,81,413,35000),(62,82,440,2350),(62,83,455,17500),(62,84,456,27500),(62,85,498,17850),(62,86,609,23500),(62,87,525,3500),(37,89,439,4300),(37,90,467,2300),(37,91,475,4800),(37,92,479,2300),(37,93,489,6500),(37,94,559,23500),(37,95,565,16500),(37,96,567,6550),(37,97,576,4300),(37,98,580,4500),(37,99,585,4600),(37,100,600,2990),(37,101,602,8500),(37,102,603,9500),(64,105,463,700),(64,106,461,2350),(64,108,468,1750),(64,109,586,600),(37,110,525,10000),(89,111,566,3500),(89,112,525,8500),(89,113,401,2600),(89,115,405,11000),(89,116,521,28000),(89,117,400,14000),(89,118,404,4300),(89,119,410,2000),(89,120,412,6800),(89,121,421,9100),(89,122,426,14500),(89,123,422,3000),(89,124,442,6700),(89,125,445,8700),(89,126,458,8900),(89,127,463,6000),(89,128,462,1000),(89,129,467,4100),(89,130,475,8000),(89,131,478,900),(89,132,482,5000),(89,133,491,4000),(89,134,492,3000),(89,135,516,8700),(89,136,540,4500),(89,137,546,5900),(89,138,551,6000),(89,139,550,3900),(89,140,499,4000),(89,141,508,7000),(89,142,547,4000),(64,143,481,400),(64,144,521,2800),(64,145,581,2650),(37,146,560,75000),(37,147,414,7000),(110,148,560,2),(8,149,400,259999),(8,156,489,500000),(8,157,579,999999),(8,158,565,1999999),(10,162,521,1000000),(10,163,461,80000),(10,164,463,120000),(10,165,468,140000),(10,166,581,125000),(10,167,586,81000),(16,168,461,5000),(16,169,463,7300),(16,170,468,7000),(16,171,481,3000),(16,172,510,8000),(20,173,409,500000),(20,174,411,7000000),(20,175,429,2000000),(20,176,451,8000000),(20,177,470,900000),(20,178,495,1000000),(20,179,522,3000000),(20,180,560,4000000),(20,181,562,6000000);

#
# Structure for table "detectors"
#

DROP TABLE IF EXISTS `detectors`;
CREATE TABLE `detectors` (
  `detectorID` int(12) NOT NULL AUTO_INCREMENT,
  `detectorX` float DEFAULT '0',
  `detectorY` float DEFAULT '0',
  `detectorZ` float DEFAULT '0',
  `detectorAngle` float DEFAULT '0',
  `detectorInterior` int(12) DEFAULT '0',
  `detectorWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`detectorID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "detectors"
#

/*!40000 ALTER TABLE `detectors` DISABLE KEYS */;
INSERT INTO `detectors` VALUES (3,246.756,63.8392,1003.64,0.2783,6,7002);
/*!40000 ALTER TABLE `detectors` ENABLE KEYS */;

#
# Structure for table "domain"
#

DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `dmid` int(11) NOT NULL AUTO_INCREMENT,
  `dmminx` float DEFAULT NULL,
  `dmminy` float DEFAULT NULL,
  `dmminz` float DEFAULT NULL,
  `dmmaxx` float DEFAULT NULL,
  `dmmaxy` float DEFAULT NULL,
  `dmmaxz` float DEFAULT NULL,
  `dmcolor` varchar(11) DEFAULT NULL,
  `dmx` float DEFAULT NULL,
  `dmy` float DEFAULT NULL,
  `dmz` float DEFAULT NULL,
  `dmowner` int(11) NOT NULL DEFAULT '-1',
  `dmmusic` varchar(255) DEFAULT NULL,
  `dmdesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dmid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "domain"
#

/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;

#
# Structure for table "dropped"
#

DROP TABLE IF EXISTS `dropped`;
CREATE TABLE `dropped` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `itemModel` int(12) DEFAULT '0',
  `itemX` float DEFAULT '0',
  `itemY` float DEFAULT '0',
  `itemZ` float DEFAULT '0',
  `itemInt` int(12) DEFAULT '0',
  `itemWorld` int(12) DEFAULT '0',
  `itemQuantity` int(12) DEFAULT '0',
  `itemAmmo` int(12) DEFAULT '0',
  `itemWeapon` int(12) DEFAULT '0',
  `itemPlayer` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Data for table "dropped"
#


#
# Structure for table "entrances"
#

DROP TABLE IF EXISTS `entrances`;
CREATE TABLE `entrances` (
  `entranceID` int(12) NOT NULL AUTO_INCREMENT,
  `entranceName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `entranceIcon` int(12) DEFAULT '0',
  `entrancePosX` float DEFAULT '0',
  `entrancePosY` float DEFAULT '0',
  `entrancePosZ` float DEFAULT '0',
  `entrancePosA` float DEFAULT '0',
  `entranceIntX` float DEFAULT '0',
  `entranceIntY` float DEFAULT '0',
  `entranceIntZ` float DEFAULT '0',
  `entranceIntA` float DEFAULT '0',
  `entranceInterior` int(12) DEFAULT '0',
  `entranceExterior` int(12) DEFAULT '0',
  `entranceExteriorVW` int(12) DEFAULT '0',
  `entranceType` int(12) DEFAULT '0',
  `entrancePass` varchar(32) DEFAULT NULL,
  `entranceLocked` int(12) DEFAULT '0',
  `entranceCustom` int(4) DEFAULT '0',
  `entranceWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`entranceID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Data for table "entrances"
#

INSERT INTO `entrances` VALUES (1,'一号仓库',11,1847.49,-1761.09,13.5467,301.302,1291.82,5.8713,1001.01,180,18,0,0,3,'',0,0,7001),(2,'洛圣都警察局',30,1554.29,-1675.49,16.1953,266.374,246.756,63.8393,1003.64,0.2783,6,0,0,0,'',0,0,7002),(4,'二号仓库',11,1884.92,-1761.85,13.5467,81.4619,1291.82,5.8713,1001.01,180,18,0,0,3,'',0,0,7004),(5,'政府',36,1481.1,-1770.95,18.7957,180.626,1514.41,-1766.27,18.964,269.445,0,0,0,4,'',0,0,7005),(6,'DMV',27,1248.22,-1560.41,13.5634,30.4908,-2029.55,-118.8,1035.17,0,3,0,0,1,'',0,0,7006),(7,'射击场',6,1022.43,-1122.13,23.8713,4.1705,304.017,-141.989,1004.06,90,7,0,0,5,'',0,0,7007),(8,'国际银行',36,1464.88,-1010.75,26.8437,341.826,1456.19,-987.942,996.105,90,6,0,0,2,'',0,0,7008),(9,'出租车公司',0,1734.96,-1858.63,13.6759,52.0629,2324.4,-1149.1,1050.71,183.688,12,0,0,0,'',0,0,7009),(10,'滨海镇派出所',30,980.077,-4488.1,3.4234,0.9624,246.763,63.0382,1003.64,357.661,6,0,0,0,'',0,0,7010),(11,'技术宅造车厂',0,2281.52,-2364.74,13.5466,95.247,154.217,-28.1175,951.086,355.775,0,0,0,0,'',0,0,7011),(12,'艾德伍德银行分行',52,2034.93,-1761.13,13.5468,175.628,1456.19,-987.942,996.105,90,6,0,0,2,'',0,0,7012),(13,'hy食品公司',0,1421.79,-1488.71,20.4315,4.0297,-2158.9,642.441,1052.38,181.981,1,0,0,0,'',0,0,7013),(14,'多啦a梦[帮派基地]',23,2751.89,-1963.08,13.5468,93.8582,2324.63,-1148.94,1050.71,359.759,12,0,0,0,'147258369',0,0,7014);

#
# Structure for table "factions"
#

DROP TABLE IF EXISTS `factions`;
CREATE TABLE `factions` (
  `factionID` int(12) NOT NULL AUTO_INCREMENT,
  `factionName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionColor` int(12) DEFAULT '0',
  `factionType` int(12) DEFAULT '0',
  `factionRanks` int(12) DEFAULT '0',
  `factionDivisions` int(12) DEFAULT '0',
  `factionLockerX` float DEFAULT '0',
  `factionLockerY` float DEFAULT '0',
  `factionLockerZ` float DEFAULT '0',
  `factionLockerInt` int(12) DEFAULT '0',
  `factionLockerWorld` int(12) DEFAULT '0',
  `factionWeapon1` int(12) DEFAULT '0',
  `factionAmmo1` int(12) DEFAULT '0',
  `factionWeapon2` int(12) DEFAULT '0',
  `factionAmmo2` int(12) DEFAULT '0',
  `factionWeapon3` int(12) DEFAULT '0',
  `factionAmmo3` int(12) DEFAULT '0',
  `factionWeapon4` int(12) DEFAULT '0',
  `factionAmmo4` int(12) DEFAULT '0',
  `factionWeapon5` int(12) DEFAULT '0',
  `factionAmmo5` int(12) DEFAULT '0',
  `factionWeapon6` int(12) DEFAULT '0',
  `factionAmmo6` int(12) DEFAULT '0',
  `factionWeapon7` int(12) DEFAULT '0',
  `factionAmmo7` int(12) DEFAULT '0',
  `factionWeapon8` int(12) DEFAULT '0',
  `factionAmmo8` int(12) DEFAULT '0',
  `factionWeapon9` int(12) DEFAULT '0',
  `factionAmmo9` int(12) DEFAULT '0',
  `factionWeapon10` int(12) DEFAULT '0',
  `factionAmmo10` int(12) DEFAULT '0',
  `factionRank1` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank2` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank3` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank4` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank5` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank6` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank7` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank8` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank9` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank10` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank11` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank12` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank13` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank14` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionRank15` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionDivision1` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionDivision2` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionDivision3` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionDivision4` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionDivision5` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `factionSkin1` int(12) DEFAULT '0',
  `factionSkin2` int(12) DEFAULT '0',
  `factionSkin3` int(12) DEFAULT '0',
  `factionSkin4` int(12) DEFAULT '0',
  `factionSkin5` int(12) DEFAULT '0',
  `factionSkin6` int(12) DEFAULT '0',
  `factionSkin7` int(12) DEFAULT '0',
  `factionSkin8` int(12) DEFAULT '0',
  `SpawnX` float NOT NULL,
  `SpawnY` float NOT NULL,
  `SpawnZ` float NOT NULL,
  `SpawnInterior` int(11) NOT NULL,
  `SpawnVW` int(1) NOT NULL,
  `Money` int(11) NOT NULL DEFAULT '0',
  `CompanyType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`factionID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Data for table "factions"
#

INSERT INTO `factions` VALUES (-1,'None',-256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Rank 1','Rank 2','Rank 3','Rank 4','Rank 5','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(1,'测试组织',-256,1,5,5,0,0,0,0,0,24,500,3,1,17,10,29,500,31,500,34,50,41,500,16,5,0,0,0,0,'Rank 1','Rank 2','Rank 3','Rank 4','Rank 5','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',280,306,307,309,302,281,284,285,0,0,0,0,0,0,0),(2,'洛圣都消防/急救部门',-10270721,3,15,4,1778.55,-1110.32,24.0958,0,0,42,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'FD学员','实习医生','正式医生','主治医生','医院主任','实习消防员','正式消防员','骨干消防员','消防局主任','医院副院长','消防局副局长','院长','消防局局长','FD副局长','FD局长','医疗分局','消防分局','FD总局','行政部','Division 5',277,278,279,274,275,276,308,0,0,0,0,0,0,0,0),(3,'洛圣都政府',869020671,4,6,3,1538.66,-1774.45,18.9644,0,7005,24,100,31,90,25,20,29,90,41,500,0,0,0,0,0,0,0,0,0,0,'实习公务员','正式公务员','政府警卫','警卫主任','副市长','市长','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',17,165,141,147,150,166,0,0,0,0,0,0,0,0,0),(4,'Fox News',-65281,2,6,3,286.153,-1619.9,47,0,0,8,1,41,500,43,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'实习记者','正式记者','主持人','新闻组长','副台长','台长','副台长','台长','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','策划部','人事部','行政部','Division 4','Division 5',188,60,194,240,187,57,0,0,0,0,0,0,0,0,0),(5,'美丽洛圣都出租车公司',-256,6,7,3,2320.5,-1144.71,1050.7,12,7009,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'实习出租车司机','正式出租车司机','政府司机','出租车经理','政府经理','出租车公司主管','政府部门主管','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','美丽洛圣都出租车公司','洛圣都市政府','洛圣都军队','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,'垃圾处理公司',-256,6,7,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Rank 1','Rank 2','Rank 3','Rank 4','Rank 5','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,2326.69,-1146.55,1050.71,12,7009,0,0),(7,'恒大汽修公司',-256,6,8,5,2142.55,-1729.84,13.5592,0,0,0,0,0,0,24,67,29,30,0,0,0,0,0,0,0,0,0,0,0,0,'保安','车间员工','车间组长','车间主任','经理','总经理','秘书','董事长','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','修理部','材料部','行政部','销售部','人事部',0,0,0,0,0,0,0,0,0,0,0,0,0,719494,3),(8,'hy食品公司',-256,6,5,2,-2168.28,642.439,1052.38,1,7013,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'配送员','普通员工','高层人员','管理人员','Big Boss','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','食品卫生部门','食品出售部门','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(9,'洛圣都警察局',65535,1,10,5,254.635,76.722,1003.64,6,7002,24,500,31,500,29,500,34,20,25,20,3,1,41,500,0,0,0,0,0,0,'学警','警员','警探','警司','警督','警监','指挥官','副局长','助理局长','局长','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','交通分局','54分局','空中分局','行政部','SWAT',300,301,306,307,309,284,285,311,2100.34,-1808.8,13.5547,0,0,10000,0),(10,'技术宅造车厂',-256,6,7,3,164.973,-21.7877,951.086,0,7011,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'菜鸟级员工','中等员工','高技术员工','资深级员工','技术宅成员','技术宅主管人','技术宅修车王','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,77085,6),(11,'物流公司',-256,6,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Rank 1','Rank 2','Rank 3','Rank 4','Rank 5','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),(13,'哆啦a梦',-256,5,4,5,2324.06,-1142.47,1050.49,12,7014,0,0,29,220,30,90,30,90,0,0,0,0,0,0,0,0,0,0,0,0,'大熊','小夫','静香','胖虎','Rank 5','Rank 6','Rank 7','Rank 8','Rank 9','Rank 10','Rank 11','Rank 12','Rank 13','Rank 14','Rank 15','Division 1','Division 2','Division 3','Division 4','Division 5',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

#
# Structure for table "furniture"
#

DROP TABLE IF EXISTS `furniture`;
CREATE TABLE `furniture` (
  `ID` int(12) DEFAULT '0',
  `furnitureID` int(12) NOT NULL AUTO_INCREMENT,
  `furnitureName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `furnitureModel` int(12) DEFAULT '0',
  `furnitureX` float DEFAULT '0',
  `furnitureY` float DEFAULT '0',
  `furnitureZ` float DEFAULT '0',
  `furnitureRX` float DEFAULT '0',
  `furnitureRY` float DEFAULT '0',
  `furnitureRZ` float DEFAULT '0',
  `furnitureType` int(12) DEFAULT '0',
  PRIMARY KEY (`furnitureID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "furniture"
#


#
# Structure for table "garbage"
#

DROP TABLE IF EXISTS `garbage`;
CREATE TABLE `garbage` (
  `garbageID` int(12) NOT NULL AUTO_INCREMENT,
  `garbageModel` int(12) DEFAULT '1236',
  `garbageCapacity` int(12) DEFAULT '0',
  `garbageX` float DEFAULT '0',
  `garbageY` float DEFAULT '0',
  `garbageZ` float DEFAULT '0',
  `garbageA` float DEFAULT '0',
  `garbageInterior` int(12) DEFAULT '0',
  `garbageWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`garbageID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "garbage"
#

INSERT INTO `garbage` VALUES (1,1300,0,1727.71,-1869.16,13.6759,231.379,0,0),(2,1300,0,1738.33,-1853.09,13.6759,51.0661,0,0),(3,1300,0,1743.29,-1848.34,13.6649,54.1994,0,0),(4,1300,2,1722.03,-1876.46,13.6759,52.946,0,0),(5,1236,13,1832.63,-1850.23,13.5781,270.065,0,0),(6,1300,1,1710.22,-1891.42,13.5734,29.8017,0,0),(7,1236,0,1704.38,-1891.99,13.5735,7.8682,0,0),(8,1300,4,1365.92,-1284.33,13.5466,271.129,0,0),(9,1236,1,1545.02,-1681.38,13.5559,261.239,0,0),(10,1236,0,1541.75,-1697.07,13.5468,168.491,0,0),(11,1236,0,1545.37,-1669.34,13.5568,285.366,0,0),(12,1236,0,1541.33,-1655.03,13.5593,358.06,0,0),(13,1236,0,1543.53,-1634.26,13.5468,271.266,0,0),(14,1236,0,1929.76,-1780.96,13.5468,88.0708,0,0),(15,1236,0,1929.07,-1770.76,13.5468,89.3242,0,0);

#
# Structure for table "gates"
#

DROP TABLE IF EXISTS `gates`;
CREATE TABLE `gates` (
  `gateID` int(12) NOT NULL AUTO_INCREMENT,
  `gateModel` int(12) DEFAULT '0',
  `gateSpeed` float DEFAULT '0',
  `gateTime` int(12) DEFAULT '0',
  `gateX` float DEFAULT '0',
  `gateY` float DEFAULT '0',
  `gateZ` float DEFAULT '0',
  `gateRX` float DEFAULT '0',
  `gateRY` float DEFAULT '0',
  `gateRZ` float DEFAULT '0',
  `gateInterior` int(12) DEFAULT '0',
  `gateWorld` int(12) DEFAULT '0',
  `gateMoveX` float DEFAULT '0',
  `gateMoveY` float DEFAULT '0',
  `gateMoveZ` float DEFAULT '0',
  `gateMoveRX` float DEFAULT '0',
  `gateMoveRY` float DEFAULT '0',
  `gateMoveRZ` float DEFAULT '0',
  `gateLinkID` int(12) DEFAULT '0',
  `gateFaction` int(12) DEFAULT '0',
  `gatePass` varchar(32) DEFAULT NULL,
  `gateRadius` float DEFAULT '0',
  PRIMARY KEY (`gateID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Data for table "gates"
#

INSERT INTO `gates` VALUES (1,17951,5,0,1708.09,-1142.47,24.7522,0,0,89.8345,0,0,1708.09,-1142.47,21.2922,0,0,89.8345,-1,2,'',5),(2,17951,5,0,1717.03,-1142.54,24.6781,0,0,270.328,0,0,1717.03,-1142.54,21.2881,0,0,270.328,-1,2,'',5),(3,17951,5,0,1725.07,-1142.49,24.728,0,0,-90.2389,0,0,1725.07,-1142.49,21.2879,0,0,-90.2389,-1,2,'',5),(4,17951,5,0,1734.06,-1142.49,24.8094,0,0,-90.7731,0,0,1734.06,-1142.49,21.2894,0,0,-90.7731,-1,2,'',5),(5,17951,5,0,1742.32,-1142.53,24.818,0,0,-91.0999,0,0,1742.32,-1142.53,21.248,0,0,-91.0999,-1,2,'',5),(6,17951,5,0,1751.18,-1142.39,24.7586,0,0,88.541,0,0,1751.18,-1142.39,21.2686,0,0,88.541,-1,2,'',5),(7,17951,5,0,1734.08,-1094.75,24.7981,0,0,89.3193,0,0,1734.08,-1094.75,21.2781,0,0,89.3193,-1,2,'',5),(8,17951,5,0,1725.25,-1094.78,24.7081,0,0,-89.894,0,0,1725.25,-1094.78,21.2781,0,0,-89.894,-1,2,'',5),(9,17951,5,0,1717.04,-1094.78,24.7481,0,0,-89.594,0,0,1717.04,-1094.78,21.2981,0,0,-89.594,-1,2,'',5),(10,17951,5,0,1708.17,-1094.73,24.7381,0,0,-91.434,0,0,1708.17,-1094.73,21.2981,0,0,-91.434,-1,2,'',5),(12,17951,5,0,246.312,72.4127,1003.64,0,0,-90.5283,6,7002,246.312,72.4127,1000.9,0,0,-90.5283,-1,9,'',5),(13,980,8,0,1590.33,-1638.46,13.75,0,0,178.338,0,0,1590.33,-1638.46,9.53,0,0,178.338,-1,9,'',5),(14,1498,5,0,1584.12,-1637.92,12.3704,0,0,-178.715,0,0,1584.12,-1637.92,12.3704,0,0,-113.515,-1,9,'',5),(15,980,10,0,1245.27,-767.26,93.8053,0,0,179.994,0,0,1234.88,-767.26,93.8053,0,0,179.994,-1,15,'2003',5),(16,19313,5,0,1311.04,-802.477,83.1606,0,0,181.942,0,0,1311.04,-802.477,79.8306,0,0,181.942,-1,15,'',5),(17,16501,1,0,2152.74,-1733.85,14.7072,0,0,-90.5467,0,0,2152.75,-1733.85,17.4972,0,-73.0998,-90.5467,-1,7,'',6),(18,16501,1,0,2161.63,-1733.86,14.7072,0,0,90.3796,0,0,2161.63,-1733.86,17.1172,0.0997,76.0998,90.3796,-1,7,'',6),(19,980,3,0,2071.49,-1831.75,13.6345,0,0,90.0952,0,0,2071.49,-1831.75,9.6845,0,0,90.0952,-1,7,'',5),(20,980,3,0,1025.02,-1029.23,32.2618,0,0,359.552,0,0,1025.02,-1029.23,28.3518,0,0,359.552,-1,7,'',5),(21,980,3,0,488.333,-1735.27,11.2434,0,0,172.126,0,0,488.333,-1735.27,7.2234,0,0,172.126,-1,7,'',5);

#
# Structure for table "gps"
#

DROP TABLE IF EXISTS `gps`;
CREATE TABLE `gps` (
  `ID` int(12) DEFAULT '0',
  `locationID` int(12) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `locationX` float DEFAULT '0',
  `locationY` float DEFAULT '0',
  `locationZ` float DEFAULT '0',
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "gps"
#


#
# Structure for table "graffiti"
#

DROP TABLE IF EXISTS `graffiti`;
CREATE TABLE `graffiti` (
  `graffitiID` int(12) NOT NULL AUTO_INCREMENT,
  `graffitiX` float DEFAULT '0',
  `graffitiY` float DEFAULT '0',
  `graffitiZ` float DEFAULT '0',
  `graffitiAngle` float DEFAULT '0',
  `graffitiColor` int(12) DEFAULT '0',
  `graffitiText` varchar(64) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`graffitiID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "graffiti"
#

/*!40000 ALTER TABLE `graffiti` DISABLE KEYS */;
INSERT INTO `graffiti` VALUES (3,2279.9,-2368.47,13.5468,-45.2017,-23296,'技术宅造车厂'),(4,2145.35,-1734.02,14.8052,269.824,-65536,'恒大汽修厂,质量保证');
/*!40000 ALTER TABLE `graffiti` ENABLE KEYS */;

#
# Structure for table "gunracks"
#

DROP TABLE IF EXISTS `gunracks`;
CREATE TABLE `gunracks` (
  `rackID` int(12) NOT NULL AUTO_INCREMENT,
  `rackHouse` int(12) DEFAULT '0',
  `rackX` float DEFAULT '0',
  `rackY` float DEFAULT '0',
  `rackZ` float DEFAULT '0',
  `rackA` float DEFAULT '0',
  `rackInterior` int(12) DEFAULT '0',
  `rackWorld` int(12) DEFAULT '0',
  `rackWeapon1` int(12) DEFAULT '0',
  `rackAmmo1` int(12) DEFAULT '0',
  `rackWeapon2` int(12) DEFAULT '0',
  `rackAmmo2` int(12) DEFAULT '0',
  `rackWeapon3` int(12) DEFAULT '0',
  `rackAmmo3` int(12) DEFAULT '0',
  `rackWeapon4` int(12) DEFAULT '0',
  `rackAmmo4` int(12) DEFAULT '0',
  PRIMARY KEY (`rackID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "gunracks"
#


#
# Structure for table "houses"
#

DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `houseID` int(12) NOT NULL AUTO_INCREMENT,
  `houseOwner` int(12) DEFAULT '0',
  `housePrice` int(12) DEFAULT '0',
  `houseAddress` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `housePosX` float DEFAULT '0',
  `housePosY` float DEFAULT '0',
  `housePosZ` float DEFAULT '0',
  `housePosA` float DEFAULT '0',
  `houseIntX` float DEFAULT '0',
  `houseIntY` float DEFAULT '0',
  `houseIntZ` float DEFAULT '0',
  `houseIntA` float DEFAULT '0',
  `houseInterior` int(12) DEFAULT '0',
  `houseExterior` int(12) DEFAULT '0',
  `houseExteriorVW` int(12) DEFAULT '0',
  `houseLocked` int(4) DEFAULT '0',
  `houseWeapon1` int(12) DEFAULT '0',
  `houseAmmo1` int(12) DEFAULT '0',
  `houseWeapon2` int(12) DEFAULT '0',
  `houseAmmo2` int(12) DEFAULT '0',
  `houseWeapon3` int(12) DEFAULT '0',
  `houseAmmo3` int(12) DEFAULT '0',
  `houseWeapon4` int(12) DEFAULT '0',
  `houseAmmo4` int(12) DEFAULT '0',
  `houseWeapon5` int(12) DEFAULT '0',
  `houseAmmo5` int(12) DEFAULT '0',
  `houseWeapon6` int(12) DEFAULT '0',
  `houseAmmo6` int(12) DEFAULT '0',
  `houseWeapon7` int(12) DEFAULT '0',
  `houseAmmo7` int(12) DEFAULT '0',
  `houseWeapon8` int(12) DEFAULT '0',
  `houseAmmo8` int(12) DEFAULT '0',
  `houseWeapon9` int(12) DEFAULT '0',
  `houseAmmo9` int(12) DEFAULT '0',
  `houseWeapon10` int(12) DEFAULT '0',
  `houseAmmo10` int(12) DEFAULT '0',
  `houseMoney` int(12) DEFAULT '0',
  PRIMARY KEY (`houseID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

#
# Data for table "houses"
#

INSERT INTO `houses` VALUES (1,0,30000,'艾德伍德1号',2067.97,-1731.48,13.876,92.3786,226.291,1240.06,1082.14,90,2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,0,30000,'艾德伍德2号',2067.09,-1717.02,13.5546,92.5236,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,0,40000,'艾德伍德3号',2065.57,-1703.36,14.1484,103.49,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,0,30000,'艾德伍德4号',2068.12,-1656.56,13.5468,90.4824,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,0,30000,'艾德伍德5号',2068.71,-1643.79,13.5468,124.082,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,0,30000,'艾德伍德6号',2068.41,-1629.06,13.8761,50.6887,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,0,30000,'艾德伍德7号',2016.95,-1629.99,13.5468,277.857,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,0,30000,'艾德伍德8号',2015.84,-1641.62,13.7824,259.057,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,0,30000,'艾德伍德9号',2012.51,-1656.5,13.5546,269.711,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,0,30000,'艾德伍德10号',2017.83,-1703.25,14.2343,268.771,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,0,30000,'艾德伍德11号',2015.37,-1717.03,13.5546,269.397,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,0,30000,'艾德伍德12号',2014.89,-1732.56,14.2343,267.204,2269.88,-1210.32,1047.56,90,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,0,60000,'艾德伍德13号',1981.02,-1718.91,17.03,275.159,2317.8,-1026.21,1050.22,0,9,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,45000),(15,0,60000,'艾德伍德14号',1981.4,-1682.84,17.0536,86.8674,2317.8,-1026.21,1050.22,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,0,20000,'1001号公寓',1734.99,-1660.36,23.6957,263.445,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,0,20000,'1002号公寓',1734.96,-1654.47,23.7087,283.185,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,0,20000,'1003号公寓',1735.13,-1648.38,23.7222,331.752,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,0,20000,'1004号公寓',1735.13,-1642.6,23.7348,296.972,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,0,20000,'1005号公寓',1708.79,-1649.71,23.6726,143.124,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,0,20000,'1006号公寓',1708.91,-1654.74,23.6788,153.464,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,0,20000,'1007号公寓',1708.87,-1660.09,23.6802,160.671,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,0,20000,'1008号公寓',1708.87,-1665.2,23.6815,116.177,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,0,20000,'1009号公寓',1708.85,-1670.33,23.6828,142.497,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,0,20000,'2001号公寓',1708.91,-1670.38,27.1725,106.487,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,0,20000,'2002号公寓',1708.79,-1665.24,27.1725,38.4929,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,0,20000,'2003号公寓',1708.79,-1659.92,27.1725,21.2593,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,0,20000,'2004号公寓',1708.79,-1654.86,27.1726,32.5395,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,0,20000,'2005号公寓',1708.79,-1649.55,27.1726,28.7795,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,0,20000,'2006号公寓',1735.13,-1642.4,27.2167,238.065,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,0,20000,'2007号公寓',1735.14,-1648.33,27.208,223.965,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,0,20000,'2008号公寓',1735.16,-1654.53,27.1987,236.185,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,0,20000,'2009号公寓',1735.17,-1660.25,27.1902,239.005,226.291,1240.06,1082.14,90,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,0,30000,'Ocean Oocks 1',2330.03,-2315.48,13.5466,65.2823,2269.88,-1210.32,1047.56,90,10,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,0,500000,'MarKet 1号',901.019,-1447.46,14.1493,83.7215,2317.8,-1026.21,1050.22,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

#
# Structure for table "housestorage"
#

DROP TABLE IF EXISTS `housestorage`;
CREATE TABLE `housestorage` (
  `ID` int(12) DEFAULT '0',
  `itemID` int(12) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `itemModel` int(12) DEFAULT '0',
  `itemQuantity` int(12) DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "housestorage"
#


#
# Structure for table "impoundlots"
#

DROP TABLE IF EXISTS `impoundlots`;
CREATE TABLE `impoundlots` (
  `impoundID` int(12) NOT NULL AUTO_INCREMENT,
  `impoundLotX` float DEFAULT '0',
  `impoundLotY` float DEFAULT '0',
  `impoundLotZ` float DEFAULT '0',
  `impoundReleaseX` float DEFAULT '0',
  `impoundReleaseY` float DEFAULT '0',
  `impoundReleaseZ` float DEFAULT '0',
  `impoundReleaseInt` int(12) DEFAULT '0',
  `impoundReleaseWorld` int(12) DEFAULT '0',
  `impoundReleaseA` float DEFAULT '0',
  PRIMARY KEY (`impoundID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "impoundlots"
#


#
# Structure for table "inventory"
#

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `ID` int(12) DEFAULT '0',
  `invID` int(12) NOT NULL AUTO_INCREMENT,
  `invItem` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  `invModel` int(12) DEFAULT '0',
  `invQuantity` int(12) DEFAULT '0',
  PRIMARY KEY (`invID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "inventory"
#


#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `jobID` int(12) NOT NULL AUTO_INCREMENT,
  `jobPosX` float DEFAULT '0',
  `jobPosY` float DEFAULT '0',
  `jobPosZ` float DEFAULT '0',
  `jobPointX` float DEFAULT '0',
  `jobPointY` float DEFAULT '0',
  `jobPointZ` float DEFAULT '0',
  `jobDeliverX` float DEFAULT '0',
  `jobDeliverY` float DEFAULT '0',
  `jobDeliverZ` float DEFAULT '0',
  `jobInterior` int(12) DEFAULT '0',
  `jobWorld` int(12) DEFAULT '0',
  `jobType` int(12) DEFAULT '0',
  `jobPointInt` int(12) DEFAULT '0',
  `jobPointWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES (1,1296.1,-0.4286,1001.02,1288.15,-2.1419,1001.02,0,0,0,18,7001,4,18,7001),(2,2329.91,-1147.3,1050.7,0,0,0,0,0,0,12,7009,3,0,0),(3,-2167.06,644.629,1052.38,0,0,0,0,0,0,1,7013,6,0,0),(4,2165.51,-1726.97,13.5572,0,0,0,0,0,0,0,0,2,0,0),(5,2195.92,-1973.48,13.5588,2188.9,-1997.82,13.5468,2188.74,-1997.41,13.5468,0,0,7,0,0),(6,1844.93,-1758.64,13.5468,1884.56,-1759.84,13.5468,1849.26,-1760.64,13.5468,0,0,8,0,0),(7,2770.24,-2410.89,13.6275,2779.53,-2418.03,13.6356,2779.75,-2416.9,13.6356,0,0,1,0,0),(9,588.842,870.379,-42.4973,632.818,858.206,-42.9609,601.308,867.879,-42.9609,0,0,5,0,0);

#
# Structure for table "namechanges"
#

DROP TABLE IF EXISTS `namechanges`;
CREATE TABLE `namechanges` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `OldName` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `NewName` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Date` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "namechanges"
#


#
# Structure for table "other"
#

DROP TABLE IF EXISTS `other`;
CREATE TABLE `other` (
  `dwlb` int(11) NOT NULL DEFAULT '10080',
  `mats` int(11) NOT NULL DEFAULT '0',
  `cars` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "other"
#

/*!40000 ALTER TABLE `other` DISABLE KEYS */;
INSERT INTO `other` VALUES (10080,0,0);
/*!40000 ALTER TABLE `other` ENABLE KEYS */;

#
# Structure for table "plants"
#

DROP TABLE IF EXISTS `plants`;
CREATE TABLE `plants` (
  `plantID` int(12) NOT NULL AUTO_INCREMENT,
  `plantType` int(12) DEFAULT '0',
  `plantDrugs` int(12) DEFAULT '0',
  `plantX` float DEFAULT '0',
  `plantY` float DEFAULT '0',
  `plantZ` float DEFAULT '0',
  `plantA` float DEFAULT '0',
  `plantInterior` int(12) DEFAULT '0',
  `plantWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`plantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "plants"
#


#
# Structure for table "pumps"
#

DROP TABLE IF EXISTS `pumps`;
CREATE TABLE `pumps` (
  `ID` int(12) DEFAULT '0',
  `pumpID` int(12) NOT NULL AUTO_INCREMENT,
  `pumpPosX` float DEFAULT '0',
  `pumpPosY` float DEFAULT '0',
  `pumpPosZ` float DEFAULT '0',
  `pumpPosA` float DEFAULT '0',
  `pumpFuel` int(12) DEFAULT '0',
  PRIMARY KEY (`pumpID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "pumps"
#

INSERT INTO `pumps` VALUES (5,1,1941.76,-1778.44,14.1527,-90.2165,1730),(5,2,1941.82,-1775.1,14.1105,89.8545,1885),(5,3,1941.48,-1771.12,14.1806,84.0213,1972),(5,4,1941.59,-1767.83,14.1505,88.288,2000),(13,5,979.183,-4505.67,4.0599,275.422,2000),(13,6,978.76,-4510.13,3.99,270.722,2000);

#
# Structure for table "speedcameras"
#

DROP TABLE IF EXISTS `speedcameras`;
CREATE TABLE `speedcameras` (
  `speedID` int(12) NOT NULL AUTO_INCREMENT,
  `speedRange` float DEFAULT '0',
  `speedLimit` float DEFAULT '0',
  `speedX` float DEFAULT '0',
  `speedY` float DEFAULT '0',
  `speedZ` float DEFAULT '0',
  `speedAngle` float DEFAULT '0',
  PRIMARY KEY (`speedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "speedcameras"
#


#
# Structure for table "tickets"
#

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ID` int(12) DEFAULT '0',
  `ticketID` int(12) NOT NULL AUTO_INCREMENT,
  `ticketFee` int(12) DEFAULT '0',
  `ticketBy` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `ticketDate` varchar(36) DEFAULT NULL,
  `ticketReason` varchar(32) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`ticketID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "tickets"
#


#
# Structure for table "vendors"
#

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `vendorID` int(12) NOT NULL AUTO_INCREMENT,
  `vendorType` int(12) DEFAULT '0',
  `vendorX` float DEFAULT '0',
  `vendorY` float DEFAULT '0',
  `vendorZ` float DEFAULT '0',
  `vendorA` float DEFAULT '0',
  `vendorInterior` int(12) DEFAULT '0',
  `vendorWorld` int(12) DEFAULT '0',
  PRIMARY KEY (`vendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "vendors"
#

INSERT INTO `vendors` VALUES (1,1,1719.95,-1886.85,13.5735,124.116,0,0),(3,2,1713.75,-1886.4,13.5735,47.0353,0,0),(4,1,1723.45,-1889.11,13.5735,141.663,0,0),(5,1,1726.69,-1891.24,13.5735,166.416,0,0),(6,1,1730.86,-1890.97,13.5735,194.617,0,0);

#
# Structure for table "warrants"
#

DROP TABLE IF EXISTS `warrants`;
CREATE TABLE `warrants` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `Suspect` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Username` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  `Date` varchar(36) DEFAULT NULL,
  `Description` varchar(128) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "warrants"
#


#
# Structure for table "zones"
#

DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `地盘ID` int(11) NOT NULL AUTO_INCREMENT,
  `地盘名称` varchar(255) NOT NULL DEFAULT 'None',
  `地盘组织` int(11) NOT NULL DEFAULT '-1',
  `Minx` float DEFAULT NULL,
  `Miny` float DEFAULT NULL,
  `Maxx` float DEFAULT NULL,
  `Maxy` float DEFAULT NULL,
  `Posx` float DEFAULT NULL,
  `Posy` float DEFAULT NULL,
  `Posz` float DEFAULT NULL,
  `地盘金库` int(11) NOT NULL DEFAULT '0',
  `地盘颜色` int(11) DEFAULT NULL,
  PRIMARY KEY (`地盘ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

#
# Data for table "zones"
#

/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;

#
# Structure for table "激活码"
#

DROP TABLE IF EXISTS `激活码`;
CREATE TABLE `激活码` (
  `激活码ID` int(11) NOT NULL AUTO_INCREMENT,
  `激活码名称` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT '未命名',
  `激活码代码` varchar(32) DEFAULT NULL,
  `激活码类型` int(1) NOT NULL DEFAULT '0',
  `激活码状态` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`激活码ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "激活码"
#

/*!40000 ALTER TABLE `激活码` DISABLE KEYS */;
/*!40000 ALTER TABLE `激活码` ENABLE KEYS */;

#
# Structure for table "摊位系统"
#

DROP TABLE IF EXISTS `摊位系统`;
CREATE TABLE `摊位系统` (
  `摊位ID` int(11) NOT NULL AUTO_INCREMENT,
  `摊位OBJ` int(11) DEFAULT NULL,
  `摊位名称` varchar(256) CHARACTER SET gbk NOT NULL DEFAULT '无',
  `摊位主人` varchar(256) CHARACTER SET gbk NOT NULL DEFAULT '无',
  `摊位主人ID` int(11) DEFAULT NULL,
  `摊位资金` int(11) NOT NULL DEFAULT '0',
  `摊位坐标X` float DEFAULT NULL,
  `摊位坐标Y` float DEFAULT NULL,
  `摊位坐标Z` float DEFAULT NULL,
  `摊位物品1` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `摊位物品1模型` int(11) DEFAULT NULL,
  `摊位物品1数量` int(11) DEFAULT NULL,
  `摊位物品2` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `摊位物品2模型` int(11) DEFAULT NULL,
  `摊位物品2数量` int(11) DEFAULT NULL,
  `摊位物品3` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `摊位物品3模型` int(11) DEFAULT NULL,
  `摊位物品3数量` int(11) DEFAULT NULL,
  `摊位物品4` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `摊位物品4模型` int(11) DEFAULT NULL,
  `摊位物品4数量` int(11) DEFAULT NULL,
  `摊位物品5` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `摊位物品5模型` int(11) DEFAULT NULL,
  `摊位物品5数量` int(11) DEFAULT NULL,
  `摊位物品1价格` int(11) DEFAULT NULL,
  `摊位物品2价格` int(11) DEFAULT NULL,
  `摊位物品3价格` int(11) DEFAULT NULL,
  `摊位物品4价格` int(11) DEFAULT NULL,
  `摊位物品5价格` int(11) DEFAULT NULL,
  PRIMARY KEY (`摊位ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "摊位系统"
#


#
# Structure for table "支票系统"
#

DROP TABLE IF EXISTS `支票系统`;
CREATE TABLE `支票系统` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `支票ID` int(11) NOT NULL DEFAULT '0',
  `支票金额` int(11) DEFAULT NULL,
  `支票时间` varchar(36) DEFAULT NULL,
  `支票组织` varchar(64) CHARACTER SET gbk DEFAULT NULL,
  `拥有人` varchar(24) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "支票系统"
#

