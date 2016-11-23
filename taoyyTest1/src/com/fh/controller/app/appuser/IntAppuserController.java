package com.fh.controller.app.appuser;

import com.fh.controller.base.BaseController;
import com.fh.service.system.appuser.AppuserService;
import com.fh.util.AESOperator;
import com.fh.util.AppUtil;
import com.fh.util.PageData;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import static com.fh.util.FastJsonPlusUtils.objToJson;

/**
 * 会员-接口类
 * 相关参数协议：
 * STR_ZERO     请求失败
 * STR_ONE      请求成功
 * STR_TWO      返回空值
 * STR_THREE    请求协议参数不完整
 * STR_FOUR     用户名或密码错误
 * STR_FIVE  FKEY验证失败
 */
@Controller
@RequestMapping(value = "/appuser")
public class IntAppuserController extends BaseController {

    @Resource(name = "appuserService")
    private AppuserService appuserService;

    /**
     * 根据用户名获取会员信息
     */
    @RequestMapping(value = "/getAppuserByUm")
    @ResponseBody
    public String getAppuserByUsernmae(String request) {
        Map<String, Object> map = new HashMap<String, Object> ();
        String result = STR_ZERO;
        logBefore ( logger, "根据用户名获取会员信息" );
        try {
            //解密
            request = AESOperator.decrypt ( request, null );
            if (request != null) {    //检验请求key值是否合法
                PageData pd = this.getPageData ( request );
                if (AppUtil.checkParam ( "getAppuserByUsernmae", pd )) {    //检查参数
                    pd = appuserService.findByUId ( pd );
                    map.put ( PD, pd );
                    result = (null == pd) ? STR_TWO : STR_ONE;
                } else {
                    result = STR_THREE;
                }
            } else {
                result = STR_FIVE;
            }
        } catch (Exception e) {
            logger.error ( e.toString (), e );
        } finally {
            map.put ( RESULT, result );
            logAfter ( logger );
        }
        //    return  AppUtil.returnObject ( new PageData (), map );
        //加密
        return AESOperator.encrypt ( objToJson ( map ), null );
    }


}

 