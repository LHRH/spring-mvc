package com.lh.common.table;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xiaobiao on 16/10/11.
 */
public class BootstrapTable<T> {

    private int total;

    private List<T> rows;

    private int offset = 0;

    private int limit = 5;

    private String sort = "";

    private String order = "desc";

    private String filter;

    public BootstrapTable() {
    }

    public BootstrapTable(int total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public BootstrapTable(int offset, int limit) {
        this.offset = offset;
        this.limit = limit;
    }

    public PageBounds getPageBounds(){
        PageBounds pageBounds = new PageBounds();
        pageBounds.setLimit(this.limit);
        pageBounds.setPage(offset/limit + 1);
        pageBounds.setContainsTotalCount(true);

        if (!"".equals(sort)){
            List<Order> orders = new ArrayList<>();
            orders.add(new Order(sort, Order.Direction.valueOf(order.toUpperCase()), null));
            pageBounds.setOrders(orders);
        }
        return pageBounds;
    }

    public BootstrapTable<T> setReturn(PageList<T> data) {
        this.rows = new ArrayList<>();
        this.total = 0;
        if (null != data){
            this.total = data.getPaginator().getTotalCount();
            this.rows = data;
        }

        return this;
    }
    public BootstrapTable<T> setReturnData(PageList<T> data) {
        this.rows = new ArrayList<>();
        this.total = 0;
//        if (null != data){
//            this.total = data.getPaginator().getTotalCount();
            this.rows = data;
//        }
        return this;
    }
    public BootstrapTable<T> setPageList(PageList<T> pageList) {
       /* this.rows = new ArrayList<>();
        this.total = 0;
        if (pageList.getDataList()!=null&&!pageList.getDataList().isEmpty()){
        	if(pageList.getPaginator()!=null){
        		 this.total = pageList.getPaginator().getTotalCount();
        	}else{
        		this.total = pageList.getDataList().size();
        	}
            this.rows =pageList.getDataList();
        }*/

        return this;
    }


    /**
     * Getter for property 'total'.
     *
     * @return Value for property 'total'.
     */
    public int getTotal() {
        return total;
    }

    /**
     * Setter for property 'total'.
     *
     * @param total Value to set for property 'total'.
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * Getter for property 'rows'.
     *
     * @return Value for property 'rows'.
     */
    public List<T> getRows() {
        return rows;
    }

    /**
     * Setter for property 'rows'.
     *
     * @param rows Value to set for property 'rows'.
     */
    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    /**
     * Getter for property 'offset'.
     *
     * @return Value for property 'offset'.
     */
    public int getOffset() {
        return offset;
    }

    /**
     * Setter for property 'offset'.
     *
     * @param offset Value to set for property 'offset'.
     */
    public void setOffset(int offset) {
        this.offset = offset;
    }

    /**
     * Getter for property 'limit'.
     *
     * @return Value for property 'limit'.
     */
    public int getLimit() {
        return limit;
    }

    /**
     * Setter for property 'limit'.
     *
     * @param limit Value to set for property 'limit'.
     */
    public void setLimit(int limit) {
        this.limit = limit;
    }

    /**
     * Getter for property 'sort'.
     *
     * @return Value for property 'sort'.
     */
    public String getSort() {
        return sort;
    }

    /**
     * Setter for property 'sort'.
     *
     * @param sort Value to set for property 'sort'.
     */
    public void setSort(String sort) {
        this.sort = sort;
    }

    /**
     * Getter for property 'order'.
     *
     * @return Value for property 'order'.
     */
    public String getOrder() {
        return order;
    }

    /**
     * Setter for property 'order'.
     *
     * @param order Value to set for property 'order'.
     */
    public void setOrder(String order) {
        this.order = order;
    }

    /**
     * Getter for property 'filter'.
     *
     * @return Value for property 'filter'.
     */
    public String getFilter() {
        return filter;
    }

    /**
     * Setter for property 'filter'.
     *
     * @param filter Value to set for property 'filter'.
     */
    public void setFilter(String filter) {
        this.filter = filter;
    }
}
