package com.changyu.foryou.controller;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.changyu.foryou.model.Receiver;
import com.changyu.foryou.service.ReceiverService;
import com.changyu.foryou.tools.Constants;


/**
 * 这是收货人的控制器，主要处理收货人的信息
 * @author 殿下
 *
 */
@Controller
@RequestMapping("/receiver")
public class ReceiverController {
	@Autowired
	private ReceiverService receiverService;

	/**
	 * 添加收貨人信息
	 * @param phoneId 用戶手机，id
	 * @param phone  收货人手机号
	 * @param name   收货人名字
	 * @param address  收货人地址
	 * @param campusId 校区号
	 * @return
	 */
	@RequestMapping("/addReceiver")
	public @ResponseBody Map<String, Object>addReceiver(@RequestParam String phoneId,@RequestParam String phone,
			@RequestParam String name,@RequestParam String address,@RequestParam Integer campusId){
		Map<String, Object> map=new HashMap<String ,Object>();
		Receiver receiver=new Receiver(phoneId,phone,name,address,campusId);

		try {

			//通过时间生成该记录的序列号，和phoneId一起唯一表志收货人信息
			Calendar calendar=Calendar.getInstance();
			receiver.setRank(String.valueOf(calendar.getTimeInMillis()));


			if(receiverService.getReceiverCounts(phoneId)!=0){
				receiver.setTag((short)1);
			}else{
				receiver.setTag((short)0);
			}

			System.out.println(JSON.toJSONString(receiver));

			if(receiverService.insert(receiver)!=-1){
				map.put(Constants.STATUS, Constants.SUCCESS);
				map.put(Constants.MESSAGE, "Add successfully!");
			}else{
				map.put(Constants.STATUS, Constants.FAILURE);
				map.put(Constants.MESSAGE, "Add failed！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put(Constants.STATUS, Constants.FAILURE);
			map.put(Constants.MESSAGE, "Add failed！");
		}

		return map;
	}


	/**
	 * 根据用户id获取用户存下来的收货人信息
	 * @param phoneId
	 * @return
	 */
	@RequestMapping("/selectReceiver")
	public @ResponseBody Map<String, Object> relectReceiver(@RequestParam String phoneId){
		Map<String, Object> map=new HashMap<String ,Object>();
		try {
			List<Receiver> receivers=receiverService.selectByPhoneId(phoneId);
			map.put("receivers", receivers);
			map.put(Constants.STATUS, Constants.SUCCESS);
			map.put(Constants.MESSAGE, "Get successfully");
		} catch (Exception e) {
			e.getStackTrace();
			map.put(Constants.STATUS, Constants.FAILURE);
			map.put(Constants.MESSAGE, "Get failed！");
		}
		return map;
	}

	/**
	 * 更改收货人信息
	 * @param phoneId  用户id
	 * @param rank    收货人序列，主键
	 * @param address  收货人地址
	 * @param name    收货人姓名
	 * @param phone   收货人手机号
	 * @param campusId 校区
	 * @return
	 */
	@RequestMapping("/updateReceiver")
	public @ResponseBody Map<String, Object> updateReceiver(@RequestParam String phoneId,@RequestParam String rank,
			String address,String name,String phone,Integer campusId){
		Map<String, Object> map=new HashMap<String ,Object>();
		try {
			Receiver receiver=new Receiver(phoneId,phone,name,address,campusId);
			receiver.setRank(rank);
			if(receiverService.updateByPrimaryKeySelective(receiver)!=-1){
				map.put(Constants.STATUS, Constants.SUCCESS);
				map.put(Constants.MESSAGE, "Update consignee information successfully");
			}else{
				map.put(Constants.STATUS, Constants.FAILURE);
				map.put(Constants.MESSAGE, "Failed to update consignee information");
			}
		} catch (Exception e) {
			e.getStackTrace();
			map.put(Constants.STATUS, Constants.FAILURE);
			map.put(Constants.MESSAGE, "Failed to update consignee information！");
		}
		return map;
	}

	/**
	 * 设置默认收货地址
	 * @param phoneId  用户id
	 * @param rank   收货人序列号
	 * @return
	 */
	@RequestMapping("/setDefaultAddress")
	public @ResponseBody Map<String, Object> setDefaultAddress(@RequestParam String phoneId,@RequestParam String rank){
		Map<String, Object> map=new HashMap<String ,Object>();
		try{
			receiverService.setReceiverTag(phoneId);   //将原先的默认收货地址改成非默认
			if(receiverService.setDefaultAddress(phoneId, rank)!=-1){
				map.put(Constants.STATUS, Constants.SUCCESS);
				map.put(Constants.MESSAGE, "Set the default delivery address successfully");
			}else{
				map.put(Constants.STATUS, Constants.FAILURE);
				map.put(Constants.MESSAGE, "Failed to set default shipping address");
			}
		}catch (Exception e) {
			e.getStackTrace();
			map.put(Constants.STATUS, Constants.FAILURE);
			map.put(Constants.MESSAGE, "Failed to set default shipping address！");
		}

		return map;
	}

	
	/**
	 * 删除某个收货人地址
	 * @param phoneId
	 * @param rank
	 * @return
	 */	
	@RequestMapping("/deleteReceiver")
	public @ResponseBody Map<String,Object> deleteReceiver(@RequestParam String phoneId,@RequestParam String rank){
		Map<String, Object> map=new HashMap<String ,Object>();
		try {
      
			int flag=receiverService.deleteByPrimaryKey(phoneId, rank);
			if(flag!=-1&&flag!=0){
				map.put(Constants.STATUS, Constants.SUCCESS);
				map.put(Constants.MESSAGE, "Address deleted successfully!");
			}else{
				map.put(Constants.STATUS, Constants.FAILURE);
				map.put(Constants.MESSAGE, "Failed to delete address！");
			}
		} catch (Exception e) {
			e.getStackTrace();
			map.put(Constants.STATUS, Constants.FAILURE);
			map.put(Constants.MESSAGE, "Failed to delete address！");
		}
		return map;
	}
}
