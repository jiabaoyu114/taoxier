package com.fh.service.${packageName}.${objectNameLower};

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 类名称：${objectName}Service
 * 类描述：${packageText}业务逻辑层
 * 创建人：陶应意
 * 创建时间：${nowDate?string("yyyy-MM-dd HH:mm:ss")}
 */
@Service("${objectNameLower}Service")
public class ${objectName}Service {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/*
	* 新增${packageText}
    * @param pd
    * @throws Exception
    */
	public void save(PageData pd)throws Exception{
		dao.save("${objectName}Mapper.save", pd);
	}

	/*
	* 删除${packageText}
    * @param pd
    * @throws Exception
    */
	public void delete(PageData pd)throws Exception{
		dao.delete("${objectName}Mapper.delete", pd);
	}

	/*
	* 修改${packageText}
	* @param pd
    * @throws Exception
    */
	public void edit(PageData pd)throws Exception{
		dao.update("${objectName}Mapper.edit", pd);
	}

	/*
	*${packageText}列表
    * @param page
    * @return
    * @throws Exception
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("${objectName}Mapper.datalistPage", page);
	}

	/**
     *${packageText}列表(全部)
     * @param pd
     * @return
     * @throws Exception
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("${objectName}Mapper.listAll", pd);
	}

	/**
	* 通过id获取${packageText}数据
    * @param pd
    * @return
    * @throws Exception
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("${objectName}Mapper.findById", pd);
	}

	/**
	* 批量删除${packageText}
    * @param ArrayData_IDs
    * @throws Exception
    */
	public void deleteAll(String[] ArrayData_IDs)throws Exception{
		dao.delete("${objectName}Mapper.deleteAll", ArrayData_IDs);
	}

}

