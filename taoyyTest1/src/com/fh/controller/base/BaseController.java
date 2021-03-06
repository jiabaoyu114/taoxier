package com.fh.controller.base;

import com.fh.entity.Page;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    protected Logger logger = Logger.getLogger ( this.getClass () );

    private static final long serialVersionUID = 6357869213649815390L;
    public static final String MSG = "msg";
    public static final String SUCCESS = "success";
    public static final String RESULT = "result";
    public static final String ERROR = "error";
    public static final String OK = "ok";
    public static final String NO = "no";
    public static final String PD = "pd";
    /**
     * 请求失败
     */
    public static final String STR_ZERO= "00";
    /**
     * 请求成功
     */
    public static final String STR_ONE = "01";
    /**
     * 返回空值
     */
    public static final String STR_TWO = "02";
    /**
     * 请求协议参数不完整
     */
    public static final String STR_THREE = "03";
    public static final String STR_FOUR= "04";
    public static final String STR_FIVE= "05";

    /**
     * 得到PageData
     */
    public PageData getPageData() {
        return new PageData ( this.getRequest () );
    }

    public PageData getPageData(String requse) {
        return new PageData ( requse );
    }

    /**
     * 得到ModelAndView
     */
    public ModelAndView getModelAndView() {
        return new ModelAndView ();
    }

    /**
     * 得到request对象
     */
    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes ()).getRequest ();

        return request;
    }

    /**
     * 得到32位的uuid
     *
     * @return
     */
    public String get32UUID() {

        return UuidUtil.get32UUID ().replace ( "-", "" );
    }

    /**
     * 得到分页列表的信息
     */
    public Page getPage() {

        return new Page ();
    }

    public static void logBefore(Logger logger, String interfaceName) {
        logger.info ( "" );
        logger.info ( "start" );
        logger.info ( interfaceName );
    }

    public static void logAfter(Logger logger) {
        logger.info ( "end" );
        logger.info ( "" );
    }

}
