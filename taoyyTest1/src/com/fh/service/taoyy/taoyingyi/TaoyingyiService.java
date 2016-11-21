package com.fh.service.taoyy.taoyingyi;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

/**
 *
 */
@Service("taoyingyiService")
public class TaoyingyiService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception {
        dao.save ( "TaoyingyiMapper.save", pd );
    }

    /**
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception {
        dao.delete ( "TaoyingyiMapper.delete", pd );
    }

    /*
    * 修改
    */
    public void edit(PageData pd) throws Exception {
        dao.update ( "TaoyingyiMapper.edit", pd );
    }

    /**
     *
     * @param page
     * @return
     * @throws Exception
     */
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList ( "TaoyingyiMapper.datalistPage", page );
    }

    /**
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> listAll(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList ( "TaoyingyiMapper.listAll", pd );
    }

    /**
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject ( "TaoyingyiMapper.findById", pd );
    }

    /**
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete ( "TaoyingyiMapper.deleteAll", ArrayDATA_IDS );
    }

}

