-- ----------------------------
-- Table structure for "C##NEWO"."tb_${objectNameLower}"
-- ----------------------------
-- DROP TABLE "C##NEWO"."tb_${objectNameLower}";
CREATE TABLE "C##NEWO"."tb_${objectNameLower}" (
<#list fieldList as var>
	<#if var[1] == 'Integer'>
	"${var[0]}" NUMBER(10) NULL ,
	<#else>
	"${var[0]}" VARCHAR2(255 BYTE) NULL ,
	</#if>
</#list>
	"${objectNameLower}_ID" VARCHAR2(100 BYTE) NOT NULL
)
LOGGING
NOCOMPRESS
NOCACHE
;

<#list fieldList as var>
COMMENT ON COLUMN "C##NEWO"."tb_${objectNameLower}"."${var[0]}" IS '${var[2]}';
</#list>
COMMENT ON COLUMN "C##NEWO"."tb_${objectNameLower}"."${objectNameLower}_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table tb_${objectNameLower}
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."tb_${objectNameLower}"

-- ----------------------------

ALTER TABLE "C##NEWO"."tb_${objectNameLower}" ADD CHECK ("${objectNameLower}_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##NEWO"."tb_${objectNameLower}"
-- ----------------------------
ALTER TABLE "C##NEWO"."tb_${objectNameLower}" ADD PRIMARY KEY ("${objectNameLower}_ID");
