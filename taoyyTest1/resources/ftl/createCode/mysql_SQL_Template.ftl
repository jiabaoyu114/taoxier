
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_${objectNameLower}`
-- ----------------------------
DROP TABLE IF EXISTS `tb_${objectNameLower}`;
CREATE TABLE `tb_${objectNameLower}` (
 		`${objectNameLower}_ID` varchar(100) NOT NULL,
	<#list fieldList as var>
		<#if var[1] == 'Integer'>
		`${var[0]}` int(11) NOT NULL COMMENT '${var[2]}',
		<#else>
		`${var[0]}` varchar(255) DEFAULT NULL COMMENT '${var[2]}',
		</#if>
	</#list>
  		PRIMARY KEY (`${objectNameLower}_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
