<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper">
	
	
	<!-- 新增${packageText}-->
	<insert id="save" parameterType="pd">
		insert into "tb_${objectNameLower}"(
	<#list fieldList as var>
			"${var[0]}",	
	</#list>
			"${objectNameLower}_ID"
		) values (
	<#list fieldList as var>
			${r"#{"}${var[0]}${r"}"},	
	</#list>
			${r"#{"}${objectNameLower}_ID${r"}"}
		)
	</insert>
	
	
	<!-- 删除${packageText}-->
	<delete id="delete" parameterType="pd">
		delete from "tb_${objectNameLower}"
		where 
			"${objectNameLower}_ID" = ${r"#{"}${objectNameLower}_ID${r"}"}
	</delete>
	
	
	<!-- 修改${packageText} -->
	<update id="edit" parameterType="pd">
		update  "tb_${objectNameLower}"
			set 
	<#list fieldList as var>
			<#if var[3] == "是">
				"${var[0]}" = ${r"#{"}${var[0]}${r"}"},	
			</#if>
	</#list>
			"${objectNameLower}_ID" = "${objectNameLower}_ID"
			where 
				"${objectNameLower}_ID" = ${r"#{"}${objectNameLower}_ID${r"}"}
	</update>
	
	
	<!-- 通过ID获取${packageText}数据 -->
	<select id="findById" parameterType="pd" resultType="pd">
		select 
	<#list fieldList as var>
			"${var[0]}",	
	</#list>
			"${objectNameLower}_ID"
		from 
			"tb_${objectNameLower}"
		where 
			"${objectNameLower}_ID" = ${r"#{"}${objectNameLower}_ID${r"}"}
	</select>
	
	
	<!-- 列表${packageText} -->
	<select id="datalistPage" parameterType="page" resultType="pd">
		select
		<#list fieldList as var>
				a."${var[0]}",	
		</#list>
				a."${objectNameLower}_ID"
		from 
				"tb_${objectNameLower}" a
	</select>
	
	<!-- ${packageText}列表(全部) -->
	<select id="listAll" parameterType="pd" resultType="pd">
		select
		<#list fieldList as var>
				a."${var[0]}",	
		</#list>
				a."${objectNameLower}_ID"
		from 
				"tb_${objectNameLower}" a
	</select>
	
	<!-- 批量删除${packageText} -->
	<delete id="deleteAll" parameterType="String">
		delete from "tb_${objectNameLower}"
		where 
			"${objectNameLower}_ID" in
		<foreach item="item" index="index" collection="array" open="(" separator="," close=")">
                 ${r"#{item}"}
		</foreach>
	</delete>
	
</mapper>