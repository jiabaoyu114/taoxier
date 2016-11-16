package com.fh.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import org.apache.commons.collections.map.HashedMap;

import java.util.List;
import java.util.Map;

/**
 * @author Taoyy
 * @className JsonPlusUtils
 * @date 2016/3/27 21:34
 */
public class FastJsonPlusUtils {

    /**
     * 把JSON字符串转为JavaBean
     *
     * @param jsonString
     * @return
     */
    public static <T> T jsonToBean(String jsonString, Class cls) {
        try {
            return (T) JSON.parseObject ( jsonString, cls );
        } catch (Exception e) {
            return null;

        }
    }

    /**
     * 把JSON文本转化成Map<String, Object>
     *
     * @param json
     * @return
     */
    public static Map<String, Object> jsonToMap(String json) {
        try {
            return JSON.parseObject ( json, HashedMap.class );
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 把JSON文本parse成JavaBean集合
     *
     * @param jsonString
     * @param cls
     * @return
     */
    public static <T> List<T> jsonToList(String jsonString, Class cls) {

        try {
            return JSON.parseArray ( jsonString, cls );
        } catch (Exception e) {

            return null;
        }
    }

    /**
     * 将任意类型转化为JSON文本
     *
     * @param object
     * @return
     */

    public static String objToJson(Object object) {
        String josns = "";
        try {
            josns = JSON.toJSONString ( object );
        } catch (Exception e) {
            josns = "";
        }
        return josns;
    }

    /**
     * 字符串数组转json格式字符串
     *
     * @param arr
     * @return
     */
    public static String arrayToJson(String[] arr) {
        String reVal = null;
        try {
            reVal = JSON.toJSONString ( arr, true );
        } catch (Exception e) {
        }
        return reVal;
    }

    /**
     * list转json格式字符串
     *
     * @param list
     * @return
     */
    public static String arrayToJson(List<?> list) {
        String reVal = null;
        try {
            reVal = JSON.toJSONString ( list, true );
        } catch (Exception e) {
        }
        return reVal;
    }

    /**
     * json格式字符串转数组
     */
    public JSONArray jsonToArray(String json) {
        JSONArray jsonArr = null;
        try {
            jsonArr = JSON.parseArray ( json );
        } catch (Exception e) {
        }
        return jsonArr;
    }
   /* *//**
     * json格式字符串转list
     *//*
    public JSONArray jsonToList(String json,Class aClass) {
        JSONArray jsonArr = null;
        try {
        jsonArr = (JSONArray) JSON.parseArray(json,aClass);
        } catch (Exception e) {
        }
        return jsonArr;
    }
*/


}
