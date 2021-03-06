package com.betteryanwo.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.betteryanwo.entity.Order;
import com.betteryanwo.entity.Users;
import com.betteryanwo.pay.config.AlipayConfig;
import com.betteryanwo.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


@Controller
@RequestMapping(value = "/alipay")
public class AlipayController {

	@Autowired
    OrderService orderService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 快捷支付调用支付宝支付接口
	 *
	 * @return
	 * @throws IOException
	 */


	@RequestMapping(value = "/aliPay/{orderSerial}")
	public String goPay(ModelMap map,
						HttpSession session,
						@PathVariable("orderSerial") String orderSerial){
		try{
			//获得初始化的AlipayClient
			AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

			//设置请求参数
			AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
			alipayRequest.setReturnUrl(AlipayConfig.return_url);
			alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
			Thread.sleep(2000);
			Order order = orderService.getOrderByOrderSerial(orderSerial);
			// 封装请求支付信息
			AlipayTradePagePayModel model=new AlipayTradePagePayModel();
			//订单号
			model.setOutTradeNo(orderSerial);
			Users user = (Users) session.getAttribute("user");
			String subject=user.getUserName();
			//订单名称
			model.setSubject(subject);
			//价格：保留3位小数点
			model.setTotalAmount(order.getPrice().toString());
			//描述
			model.setBody(order.getDescription());
			model.setTimeoutExpress("");
			// 销售产品码 必填
			model.setProductCode("FAST_INSTANT_TRADE_PAY");
			alipayRequest.setBizModel(model);
			// 调用SDK生成表单
			String result = alipayClient.pageExecute(alipayRequest).getBody();
			map.put("result",result);
		}catch (Exception e){
			e.printStackTrace();
		}

		return "/pay/alipay";
	}



	/* *
	 * 功能：支付宝服务器同步通知页面
	 * 日期：2017-03-30
	 * 说明：
	 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


	 *************************页面功能说明*************************
	 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
	 */
	@RequestMapping(value = "/return_url")
	public String returnUrl1(ModelMap map,HttpServletRequest request){
		try {
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
			//——请在这里编写您的程序（以下代码仅作参考）——
			if(signVerified) {
				//商户订单号
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
				//支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
				//付款金额
				String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
				System.out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
				//支付成功后，修改支付的状态
				Order order = orderService.getOrderByOrderSerial(out_trade_no);
				order.setStatus(2);
				orderService.updateOrder(order);
				map.put("alipayResult", "支付宝支付成功");
			}else {
				System.out.println("验签失败");
				map.put("alipayResult", "支付宝支付失败");
			}

		}catch (Exception e){
			e.printStackTrace();
		}
		return "/pay/return_url";
	}

	/* *
	 * 功能：支付宝服务器异步通知页面
	 * 日期：2017-03-30
	 * 说明：
	 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


	 *************************页面功能说明*************************
	 * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
	 * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
	 * 如果没有收到该页面返回的 success
	 * 建议该页面只做支付成功的业务逻辑处理，退款的处理请以调用退款查询接口的结果为准。
	 */
	@RequestMapping(value = "/notify_url")
	public String notifyUrl(ModelMap map,HttpServletRequest request){
	try{
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
		//——请在这里编写您的程序（以下代码仅作参考）——
		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");


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
			}

			System.out.println("success");
			map.put("alipayResult","成功");
		}else {//验证失败
			System.out.println("fail");
			map.put("alipayResult","失败");
			//调试用，写文本函数记录程序运行情况是否正常
			//String sWord = AlipaySignature.getSignCheckContentV1(params);
			//AlipayConfig.logResult(sWord);
		}
	}catch (Exception e){
		e.printStackTrace();
	}
		return "/pay/notify_url";
	}


}