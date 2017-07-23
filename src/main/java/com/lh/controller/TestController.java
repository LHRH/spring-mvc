package com.lh.controller;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.lh.common.table.BootstrapTable;
import com.lh.po.Admin;
import com.lh.po.CarBase;
import com.lh.po.User;
import com.lh.po.vo.SelectTree;
import com.lh.service.IAdminService;
import com.lh.service.ICarBaseService;
import com.lh.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by linghu on 17/02/07.
 */
@Controller
@RequestMapping("test")
public class TestController {
    private static Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private IUserService userService;
    @Autowired
    private IAdminService adminService;
    @Autowired
    private ICarBaseService carBaseService;

    @RequestMapping("test")
    @ResponseBody
    public BootstrapTable<Admin> test(Admin admin, BootstrapTable<Admin> table) {

        PageList<Admin> admins = adminService.fuzzySearchByPager(admin, table.getPageBounds());
        BootstrapTable<Admin> bootstrapTable = new BootstrapTable<>();
        return bootstrapTable.setReturn(admins);
    }

    @RequestMapping("cxSelect1")
    public String select1() {

        return "/cxSelect1";
    }

    @RequestMapping("ajaxCxSelect1")
    @ResponseBody
    public List<SelectTree> ajaxCxSelect1() {
        List<CarBase> all = carBaseService.selectByExample(new CarBase());
        logger.info(all.get(0).getName());
        List<SelectTree> list = new ArrayList<>();
        List<SelectTree> list2 = new ArrayList<>();
        SelectTree selectTree;
        for (CarBase base : all) {
            selectTree = new SelectTree();
            selectTree.setId(base.getId());
            selectTree.setLabel(base.getName());
            selectTree.setPid(base.getPid());
            list.add(selectTree);
        }
        for (SelectTree treeNode : list) {
            if (StringUtils.pathEquals(treeNode.getPid(), "-1")) {
                list2.add(treeNode);
            }
            treeNode.setChildren(new ArrayList<SelectTree>());
            for (SelectTree treeChild : list) {
                if (StringUtils.pathEquals(treeChild.getPid(), treeNode.getId())) {
                    treeNode.getChildren().add(treeChild);
                }
            }
        }
        return list2;
    }

    @RequestMapping(value = "getStr", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getStr(String str) {
        User user = new User();
        user.setUserName(str);
        userService.insert(user);
        ajaxCxSelect1();
        return "获取到了" + str;
    }


  /*  public static void main(String[] args) {
        String url = "http://ca.tboss.cu-sc.com:10010/changan/service/order";
        //POST的URL
        HttpPost httppost = new HttpPost(url);
        //建立HttpPost对象
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        //建立一个NameValuePair数组，用于存储欲传送的参数
        params.add(new BasicNameValuePair("sku", "KWBASIC"));
        //添加参数
        try {
            httppost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));

            // 依次是目标请求地址，端口号,协议类型
            CloseableHttpClient closeableHttpClient = HttpClientBuilder.create().build();
            HttpHost proxy = new HttpHost("10.17.12.55", 808);
            DefaultHttpClient httpClient = new DefaultHttpClient();

            httpClient.getParams().setParameter(ConnRouteParams.DEFAULT_PROXY, proxy);

           *//* RequestConfig config = RequestConfig.custom().setProxy(proxy).build();
            httppost.setConfig(config);*//*


            //设置编码
            HttpResponse response = httpClient.execute(httppost);
            //发送Post,并返回一个HttpResponse对象
            if (response.getStatusLine().getStatusCode() == 200) {//如果状态码为200,就是正常返回
                String result = EntityUtils.toString(response.getEntity());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/


}
