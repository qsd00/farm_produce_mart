package com.farm.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.farm.pojo.*;
import com.farm.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
@Controller
public class ForeController {
       @Autowired
    private UserService userService;
       @Autowired
       private FirstCategoryService firstCategoryService;
       @Autowired
       private SecondCategoryService secondCategoryService;
       @Autowired
       private CategoryService categoryService;
       @Autowired
       private PropertyService propertyService;
       @Autowired
       private  PropertyValueService propertyValueService;
       @Autowired
       private  ProductService productService;
       @Autowired
       private OrderItemService orderItemService;
       @Autowired
       private OrderService orderService;
       @Autowired
       private ReviewService reviewService;
       @Autowired
       private OutOrderService outOrderService;
       @Autowired
       private PurchaseService purchaseService;

    @RequestMapping("foreHome")//首页，查出所有分类，查出每个分类销量前5的产品
    public String home( Model model){
        List<FirstCategory> fcs=firstCategoryService.list();
         secondCategoryService.fill(fcs);
         List<Product> pds=new ArrayList<>();
         for (int i=0;i<fcs.size();i++){//获取一级分类
             List<SecondCategory> scs=secondCategoryService.list(fcs.get(i).getId());
             categoryService.fill(scs);
             model.addAttribute("scs"+i,scs);
         }
         for (FirstCategory f:fcs){
           List<Product> ps=productService.listByFid(f.getId());//获取一级分类下的产品
           int[] arr=new int[ps.size()];
            for(int i=0;i<ps.size();i++){
                arr[i]=ps.get(i).getId();//获取一级分类所有产品的id
            }
            List<OrderItem> ois=orderItemService.listByPdids(arr);//获取一级分类下销量前5的产品
            int size=ois.size();
            for (OrderItem oi:ois){
                Product p=productService.get(oi.getPdid());
                pds.add(p);
            }
         }
        System.out.println(pds.size());
         model.addAttribute("fcs",fcs);
        model.addAttribute("pds",pds);
        return "fore/home";
    }

        @RequestMapping("foreLogin")//登陆
    public String login(@RequestParam("uname") String name, @RequestParam("pwd") String pwd, HttpSession session){
            System.out.println(name+pwd);
            User user=userService.login(name,pwd);
            if (user!=null){
                session.setAttribute("user",user);
                if (user.getType()==2){
                    return "redirect:foreHome";
                }
               else {
                   return "redirect:admin_firstcategory_list";
                }
            }else{
                session.setAttribute("msg","账号或密码不正确!");
                return "redirect:loginPage";
            }
        }

    @RequestMapping("foreRegist")
    public String regist(Model model, User user,HttpSession session){
       userService.regist(user);
        session.setAttribute("msg","注册成功!");
        return "redirect:loginPage";
    }

    @RequestMapping("foreLogout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:foreHome";

    }


    @RequestMapping("foreCategory")//根据分类查询产品
    public String foreCategory(Model model,int cid,Page page){
         List<Property> ps=propertyService.list(cid);
         propertyValueService.fill(ps);
        page.setCount(10);
        PageHelper.offsetPage(page.getStart(),page.getCount());
         List<Product> pds=productService.list(cid);
        int total = (int) new PageInfo<>(pds).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+cid);
        productService.setFirstProductImage(pds);
         model.addAttribute("ps",ps);
         model.addAttribute("pds",pds);
        model.addAttribute("page", page);
        model.addAttribute("cid",cid);
         return "fore/category";
    }

    @RequestMapping("foreSelectCategory")//根据属性值来筛选产品
    public String foreSelectCategory(Model model,int cid,String pvs){
        List<Property> ps=propertyService.list(cid);//获取属性
        propertyValueService.fill(ps);//填充属性值
        List<Product> pds=productService.list(cid);//获取该分类下的所有产品
        productService.setFirstProductImage(pds);
        String [] a=pvs.split(",");//获取条件数组
        List<String> b=Arrays.asList(a);
        List<Product> vs=new ArrayList<>();
       if (pvs!=""){//如果有条件
           for (Product pd:pds){//判断产品的属性值集合是否包含条件属性值集合，包含则放入产品集合
               List<PropertyValue> pvis=propertyValueService.listByPdid(pd.getId());
               List<String> c=new ArrayList<>();
               for (PropertyValue pv:pvis){
                   c.add(pv.getValue());
               }
               if (c.containsAll(b)){
                   vs.add(pd);
               }
           }
       }else{
           vs=pds;
       }
        int total=(vs.size()%10==0)?vs.size()/10:(vs.size()/10+1);
        model.addAttribute("total",total);
        model.addAttribute("ps",ps);
        model.addAttribute("pds",vs);
        model.addAttribute("cid",cid);
        return "fore/selectCategory";
    }

    @RequestMapping("foreProduct")//跳转到产品页面
    public String foreProduct(Model model,int pdid){
        Product p=productService.get(pdid);
        productService.setSaleAndReviewNumber(p);
        List<PropertyValue> pvs = propertyValueService.list(p.getId());
        List<Review> rs=reviewService.listByProduct(pdid);
        model.addAttribute("p",p);
        model.addAttribute("pvs",pvs);
        model.addAttribute("rs",rs);
         return "fore/product";
    }

    @RequestMapping("foreCheckLogin")
    @ResponseBody
    public String foreCheckLogin(HttpSession session){
        User user= (User) session.getAttribute("user");
        if (user==null){
            return "false";
        }
        return "success";
    }

    @RequestMapping("foreLoginAjax")
    @ResponseBody//使用ajax登陆
    public String foreLoginAjax(@RequestParam("name") String name,@RequestParam("pwd") String pwd,HttpSession session)  {
        name = HtmlUtils.htmlEscape(name);
        User user=userService.login(name,pwd);
        if (user==null){
            return "false";
        }
        session.setAttribute("user", user);
        return "success";
    }

    @RequestMapping("foreBuyOne")//点击立即购买访问该控制器，生成订单项，将订单项id传递到结算页面
    public String buyone(int pdid, int num, HttpSession session) {
        Product p = productService.get(pdid);
        int oiid = 0;
        User user =(User)  session.getAttribute("user");
        boolean found = false;
        List<OrderItem> ois = orderItemService.listByUid(user.getId());
        for (OrderItem oi : ois) {//判断用户有没有该产品的订单项，如果有就在原来的基础上修改数量
            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
                oi.setNumber(oi.getNumber()+num);
                orderItemService.update(oi);
                found = true;
                oiid = oi.getId();
                break;
            }
        }
        if(!found){//没有，就添加订单项
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setPdid(pdid);
            oi.setSid(p.getSid());
            orderItemService.add(oi);
            oiid = oi.getId();
        }
        return "redirect:foreBuy?oiid="+oiid;
    }

    @ResponseBody
    @RequestMapping("foreAddCart")//加入购物车
    public String addCart(int pdid, int num, Model model,HttpSession session) {
        Product p = productService.get(pdid);
        User user =(User)  session.getAttribute("user");
        boolean found = false;

        List<OrderItem> ois = orderItemService.listByUid(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==p.getId().intValue())
            {
                oi.setNumber(oi.getNumber()+num);
                orderItemService.update(oi);
                found = true;
                break;
            }
        }

        if(!found){
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setSid(p.getSid());
            oi.setPdid(pdid);
            orderItemService.add(oi);
        }
        return "success";
    }

    @RequestMapping("foreCart")//跳转到购物车页面
    public String cart( Model model,HttpSession session) {
        User user =(User)  session.getAttribute("user");
        List<OrderItem> ois = orderItemService.listByUid(user.getId());
        model.addAttribute("ois", ois);
        return "fore/cart";
    }


@RequestMapping("foreBuy")//获取订单项，计算出总费用，传递到结算页面
    public String buy( Model model,String[] oiid,HttpSession session){
        List<OrderItem> ois = new ArrayList<>();
        float total = 0;
        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
            OrderItem oi= orderItemService.get(id);
            total +=oi.getProduct().getPrice()*oi.getNumber();
            ois.add(oi);
        }
        session.setAttribute("ois", ois);
        model.addAttribute("total", total);
        return "fore/buy";
    }

    @RequestMapping("foreCreateOrder")//接收结算页面数据，创建订单，计算出费用，将费用传到支付的处理器进行付款
    public String createOrder( Order order,HttpSession session) throws UnsupportedEncodingException {
        System.out.println(order);
        User user =(User)  session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + user.getId()+RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        List<OrderItem> ois= (List<OrderItem>)  session.getAttribute("ois");
        float total =orderService.add(order,ois);//添加订单，修改订单项oid,返回订单总费用
        order.setTotal(total);
        session.setAttribute("o",order);
        return "redirect:/pay?total_amount="+total;
    }

    @RequestMapping("foreAlipay")//将订单放入session方便成功页面读取，将金额传入支付方法
    public String foreAlipay(int oid,float total,HttpSession session){
        Order order=orderService.get(oid);
        orderItemService.fill(order);
        order.setTotal(total);
        session.setAttribute("o",order);
        return "redirect:/pay?total_amount="+total;
    }

    @RequestMapping("pay")//调用支付宝接口，进行支付
    public  String  pay(Model model,  float total_amount, HttpSession session) throws UnsupportedEncodingException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        User user =(User)  session.getAttribute("user");
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +1+ user.getId()+RandomUtils.nextInt(10000);
        //订单名称，必填
        Order o= (Order)session.getAttribute("o");
        String subject = o.getOrderItems().get(0).getProduct().getName();
      /*  //商品描述，可空
        String body = "这是一个苹果支付";//好像没看到显示
*/
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
//                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        try {
           String  result = alipayClient.pageExecute(alipayRequest).getBody();
           model.addAttribute("re",result);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
       return "fore/pay";

    }

    @RequestMapping(value = "paySuccessful",method = RequestMethod.GET)//同步回调
    public String paySuccessful(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException, AlipayApiException {
        request.setCharacterEncoding("utf-8");
        System.out.println("同步回调");
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for(String str :requestParams.keySet()){
        String name = str;
        String[] values = (String[]) requestParams.get(name);
        String valueStr = "";
        for (int i = 0; i < values.length; i++) {
        valueStr = (i == values.length - 1) ? valueStr + values[i]
        : valueStr + values[i] + ",";
           }
         params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
        if(signVerified) {
        System.out.println("验签成功-跳转到成功后页面");
        Order order= (Order) session.getAttribute("o");
            order.setStatus(OrderService.waitDelivery);
            order.setPayDate(new Date());
            orderService.update(order);
           List<Integer> ss=new ArrayList<>();
           for (OrderItem oi:order.getOrderItems()){//拿到所有卖家的id
               if (!ss.contains(oi.getSid())){
                   ss.add(oi.getSid());
               }
           }

           for (Integer sid:ss){//创建商户订单
               OutOrder oto=new OutOrder();
               oto.setOid(order.getId());
               oto.setOrderCode( new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +2+ sid+RandomUtils.nextInt(10000));
               oto.setCreateDate(new Date());
               oto.setUid(order.getUid());
               oto.setSid(sid);
               oto.setStatus("waitDelivery");
               outOrderService.add(oto);
               List<OrderItem> ois=orderItemService.listBySidAndOid(sid,order.getId());
               for (OrderItem oi:ois){
                   oi.setOtid(oto.getId());//插入时，id已被映射
                   orderItemService.update(oi);//更新订单项
               }
           }
         //跳转至支付成功后的页面,
        return "fore/paySuccess";
        }else {
         System.out.println("验签失败-跳转到充值页面让用户重新充值");
        return "fore/payFail";
        }
    }

    @RequestMapping("foreBought")//根据用户id查询不是delete状态的订单，跳转到订单页面
    public String foreBought(Model model,HttpSession session){
        User user= (User) session.getAttribute("user");
        List<Order> os=orderService.listByUser(user.getId(),OrderService.delete);
        orderItemService.fill(os);
        List<Order> ods=orderService.listByStatus(user.getId(),"waitConfirm");
        for (Order o:ods){//点击个人中心时，查看待收货的订单的发货日期是否超过了15天，如果超过了就修改订单状态为待评价
            long date=o.getDeliveryDate().getTime();
            long now=new Date().getTime();
            long time=1000*60*60*24*15;
            if (now-date>time){
             o.setStatus("waitReview");
             orderService.update(o);
            }
        }
        model.addAttribute("os",os);
        return "fore/bought";

    }

    @RequestMapping("foreDeleteOrder")//删除订单
    @ResponseBody
    public String deleteOrder( Model model,int oid){
        Order o = orderService.get(oid);
        o.setStatus(OrderService.delete);
        orderService.update(o);
        return "success";
    }

    @RequestMapping("foreChangeOrderItem")//修改订单项数量
    @ResponseBody
    public String changeOrderItem( Model model,HttpSession session, int pid, int number) {
        User user =(User)  session.getAttribute("user");
        if(null==user)
            return "fail";

        List<OrderItem> ois = orderItemService.listByUid(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==pid){
                oi.setNumber(number);
                orderItemService.update(oi);
                break;
            }

        }
        return "success";
    }

    @RequestMapping("foreDeleteOrderItem")
    @ResponseBody//删除订单项
    public String deleteOrderItem( Model model,HttpSession session,int oiid){
        User user =(User)  session.getAttribute("user");
        if(null==user)//停留页面时间过长，session可能会失效
            return "fail";
        orderItemService.delete(oiid);
        return "success";
    }


    @RequestMapping("foreConfirmPay")//获取订单信息，跳转到确认支付页面
    public String confirmPay( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        model.addAttribute("o", o);
        return "fore/confirmPay";
    }

    @RequestMapping("foreOrderConfirmed")//获取订单信息，修改订单状态和商家订单状态
    public String orderConfirmed( Model model,int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        List<OutOrder> ots=outOrderService.getByOid(o.getId());
        for (OutOrder oi:ots){
            oi.setStatus(OutOrderService.waitPaid);
            outOrderService.update(oi);
        }
        return "fore/orderConfirmed";
    }

    @RequestMapping("foreReview")//跳转到评价页面
    public String review( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        Product p = o.getOrderItems().get(0).getProduct();
        List<Review> reviews = reviewService.listByProduct(p.getId());
        productService.setSaleAndReviewNumber(p);
        model.addAttribute("p", p);
        model.addAttribute("o", o);
        model.addAttribute("reviews", reviews);
        return "fore/review";
    }


    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @RequestMapping("foreDoreview")//提交评价
    public String doreview( Model model,HttpSession session,@RequestParam("oid") int oid,@RequestParam("pdid") int pdid,String content) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.finish);
        orderService.update(o);
        Product p = productService.get(pdid);
        content = HtmlUtils.htmlEscape(content);
        User user =(User)  session.getAttribute("user");
        Review review = new Review();
        review.setContent(content);
        review.setPdid(pdid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewService.add(review);
        return "redirect:foreProduct?pdid="+pdid;
//        return "redirect:foreReview?oid="+oid+"&showonly=true";
    }

    @RequestMapping(value = "notify",method = RequestMethod.POST)
    @ResponseBody//异步回调
    public String notify(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException, AlipayApiException {
        request.setCharacterEncoding("utf-8");
        System.out.println("异步回调");
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for(String str :requestParams.keySet()){
            String name = str;
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
        if(signVerified) {
            String trade_status = params.get("trade_status");
            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            }else if (trade_status.equals("TRADE_SUCCESS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
                Order order= (Order) session.getAttribute("o");
                if (order.getStatus()!=OrderService.waitDelivery){
                    order.setStatus(OrderService.waitDelivery);
                    order.setPayDate(new Date());
                    orderService.update(order);
                }

            }
            return "success";
        }
            return "fail";
    }

    @ResponseBody
    @RequestMapping("transferAccounts")//实现转账
    public String zz(String account,float amount,int id){
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();

        String out_biz_no=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +RandomUtils.nextInt(10000);
        System.out.println(account);
        System.out.println(amount);

        request.setBizContent("{" +
                "\"out_biz_no\":\""+out_biz_no+"\"," +  //商户订单号
                "\"payee_type\":\"ALIPAY_LOGONID\"," +  //有两个选择
                "\"payee_account\":\""+account+"\"," +//支付宝账号
                "\"amount\":\""+amount+"\"," +//转账金额
                "\"payer_show_name\":\"农产品电商平台\"," +
                "\"remark\":\"买家已收货\"," +
                " }");

        AlipayFundTransToaccountTransferResponse response = null;
        try {
            response = alipayClient.execute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        if(response.isSuccess()){
            System.out.println("转账成功");
            OutOrder oto=outOrderService.get(id);
            oto.setStatus(outOrderService.finish);
            oto.setPaidDate(new Date());
            outOrderService.update(oto);
            return "success";
        } else {
            System.out.println("转账失败");
        }
        return "fail";
    }

    @RequestMapping("/ss")
    public void ss(){
        System.out.println("success");
        System.out.println("支付成功");

    }

    @RequestMapping("forePurchase")//显示采购页面
    public String forePurchase(Model model,Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Purchase> ps=purchaseService.list();
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        List<FirstCategory> fs=firstCategoryService.list();
        model.addAttribute("ps",ps);
        model.addAttribute("fs",fs);
        return "fore/purchase";
    }

    @RequestMapping("forePurchaseShow")//显示采购详细页面
    public String forePurchaseShow(Model model,int id){
        Purchase p=purchaseService.get(id);
        model.addAttribute("p",p);
        return "fore/purchaseShow";
    }

    @RequestMapping("foreFirstCategory")//根据一级分类搜索产品
    public String foreFirstCategory(int id,Model model){
        List<FirstCategory> fs=firstCategoryService.listById(id);
        List<FirstCategory> fs1=firstCategoryService.list();
        List<Product> pds=new ArrayList<>();
        for (FirstCategory f:fs){
            List<SecondCategory> ss=secondCategoryService.list(f.getId());
            for (SecondCategory s:ss){
                List<Category> cs=categoryService.list(s.getId());
                for (Category c:cs){
                    List<Product> ps=productService.list(c.getId());
                    productService.setFirstProductImage(ps);
                  pds.addAll(ps);
                }
            }
        }
        int total=(pds.size()%10==0)?pds.size()/10:(pds.size()/10+1);
        model.addAttribute("total",total);
        model.addAttribute("pds",pds);
        model.addAttribute("fs",fs1);
        return "fore/firstCategory";
    }

    @RequestMapping("foreSearch")//搜索功能
    public String foreSearch(String keyword,Model model,Page page){
        page.setCount(10);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> pds=productService.search(keyword);
        int total = (int) new PageInfo<>(pds).getTotal();
        page.setTotal(total);
        page.setParam("&keyword="+keyword);
        productService.setFirstProductImage(pds);
        model.addAttribute("pds",pds);
        model.addAttribute("page",page);
        return "fore/searchResult";
    }

    @RequestMapping("foreProductQuotation")//第一次显示产品行情
    public String productQuotation(Model model){
        List<Category> cs=categoryService.listAll();
        List<Product> pds=productService.listByCid(1);//要分组查询
        Category c=categoryService.get(1);
        model.addAttribute("cs",cs);
        model.addAttribute("c",c);
        model.addAttribute("pds",pds);
       return "fore/productQuotation";
    }

    @RequestMapping("foreSearchProductQuotation")//根据分类显示产品行情
    public String searchProductQuotation(Model model,int cid){
        List<Category> cs=categoryService.listAll();
        List<Product> pds=productService.listByCid(cid);//要分组查询
        Category c=categoryService.get(cid);
        model.addAttribute("cs",cs);
        model.addAttribute("c",c);
        model.addAttribute("pds",pds);
        return "fore/productQuotation";
    }

   @RequestMapping("checkName")
   @ResponseBody
    public String checkName(@RequestParam("name") String name)  {
       System.out.println(name);
        User user=userService.isExist(name);
        if (user!=null){
          return "fail";
        }
        return "success";

   }

}
