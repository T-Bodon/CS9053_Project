package com.changyu.foryou.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.changyu.foryou.model.Campus;
import com.changyu.foryou.model.CampusAdmin;
import com.changyu.foryou.model.City;
import com.changyu.foryou.model.CityWithCampus;
import com.changyu.foryou.service.CampusService;
import com.changyu.foryou.tools.Constants;
import com.changyu.foryou.tools.Md5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/campus")
public class CampusController {
    private CampusService campusService;

    @Autowired
    public void setCampusService(CampusService campusService) {
        this.campusService = campusService;
    }

    /**
     * 获取校区
     *
     * @return
     */
    @RequestMapping("getAllCampus")
    public @ResponseBody
    JSONArray getAllCampus() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<Campus> campus = campusService.getAllCampus(paramMap);
        JSONArray array = JSON.parseArray(JSON.toJSONStringWithDateFormat(
                campus, "HH:mm:ss"));//yyyy-MM-dd HH:mm:ss
        return array;
    }

    /**
     * 获取相应的校区和城市
     *
     * @return
     */
    @RequestMapping("/getCampusAndCity")
    public @ResponseBody
    Map<String, Object> getCampusByCity() {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        try {
            Map<String, Object> paramMap = new HashMap<String, Object>();

            List<CityWithCampus> campus = campusService.getCampusWithCity(paramMap);

            resultMap.put(Constants.STATUS, Constants.SUCCESS);
            resultMap.put(Constants.MESSAGE, "Get Campus Successfully ");
            resultMap.put("campus", campus);

        } catch (Exception e) {
            e.getStackTrace();
            resultMap.put(Constants.STATUS, Constants.FAILURE);
            resultMap.put(Constants.MESSAGE, "Get Campus Failed ");
        }
        return resultMap;
    }

    /**
     * @param campusName 根据校区名获取校区Id
     */

    @RequestMapping("/getIdByName")
    public @ResponseBody
    Map<String, Object> getIdByName(@RequestParam String campusName) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("campusName", campusName.trim());
            Integer campusId = campusService.getIdByName(paramMap);
            map.put(Constants.STATUS, Constants.SUCCESS);
            map.put(Constants.MESSAGE, "Get Campus Id Successfully");
            map.put("campusId", campusId);

        } catch (Exception e) {
            e.getStackTrace();
            map.put(Constants.STATUS, Constants.FAILURE);
            map.put(Constants.MESSAGE, "Get Campus Id Failed");
        }

        return map;
    }

    //一键关店、开店

    /**
     * @param campusId
     * @param closeReason 关店原因
     * @param status      关店传0，开店传1。
     * @return
     */
    @RequestMapping("/closeCampus")
    public @ResponseBody
    Map<String, Object> closeCampus(@RequestParam Integer campusId, String closeReason, @RequestParam Short status) {
        Map<String, Object> requestMap = new HashMap<String, Object>();
        Map<String, Object> responseMap = new HashMap<String, Object>();
        try {
            requestMap.put("campusId", campusId);
            requestMap.put("closeReason", closeReason);
            requestMap.put("status", status);
            Integer flag = campusService.closeCampus(requestMap);

            if (status == 1) {
                responseMap.put("isOpened", flag);
                responseMap.put(Constants.STATUS, Constants.SUCCESS);
                responseMap.put(Constants.MESSAGE, "Close Store Successfully ");
            } else if (status == 0) {
                responseMap.put("isClosed", flag);
                responseMap.put(Constants.STATUS, Constants.SUCCESS);
                responseMap.put(Constants.MESSAGE, "Close Store Failed ");
            }
        } catch (Exception e) {
            e.getStackTrace();
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "Opreation Failed ");
        }

        return responseMap;
    }


    /**
     * @param campusId 校区id
     */
    @RequestMapping("/getCampusById")
    public @ResponseBody
    Map<String, Object> getCampusById(@RequestParam Integer campusId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("campusId", campusId);
            Campus campus = campusService.getCampusById(paramMap);
            map.put(Constants.STATUS, Constants.SUCCESS);
            map.put(Constants.MESSAGE, "Setup Store Successfully ");
            map.put("campus", JSON.toJSON(campus));

        } catch (Exception e) {
            e.getStackTrace();
            map.put(Constants.STATUS, Constants.FAILURE);
            map.put(Constants.MESSAGE, "Get Campus Failed ");
        }

        return map;
    }

    @RequestMapping("getCampusIdByAdmin")
    public @ResponseBody
    Map<String, Object> getCampusIdByAdmin(@RequestParam String campusAdminName) {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        Map<String, Object> requestMap = new HashMap<String, Object>();

        requestMap.put("campusAdmin", campusAdminName);

        CampusAdmin campusAdminInfo = campusService.getCampusIdByAdmin(requestMap);

        responseMap.put("CampusAdmin", campusAdminInfo);

        return responseMap;
    }

    /**
     * 返回校区管理员
     *
     * @return
     */
    @RequestMapping("getAllCampusAdmin")
    public @ResponseBody
    JSONArray getAllCampusAdmin() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("type", 0);

        List<CampusAdmin> campusAdmins = campusService.getAllCampusAdmin(paramMap);
        JSONArray array = JSON.parseArray(JSON.toJSONStringWithDateFormat(campusAdmins, "yyyy-MM-dd"));

        return array;
    }

    /**
     * 修改校区管理员
     *
     * @param campusId
     * @param campusAdminName
     * @return
     */
    @RequestMapping("/updateCampusAdmin")
    public @ResponseBody
    Map<String, Object> updateCampusAdmin(@RequestParam String campusName, @RequestParam String campusAdminName) {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        Map<String, Object> paramMap = new HashMap<String, Object>();

        Map<String, Object> tempMap = new HashMap<String, Object>();
        tempMap.put("campusName", campusName);

        paramMap.put("campusId", campusService.getIdByName(tempMap));
        paramMap.put("campusAdmin", campusAdminName);

        Integer result = campusService.updateCampusAdmin(paramMap);

        if (result == 0 || result == -1) {
            //没更新成功
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "Modify Campus Admin Failed ");
        } else {
            responseMap.put(Constants.STATUS, Constants.SUCCESS);
            responseMap.put(Constants.MESSAGE, "Modify Campus Admin Successfully ");
        }

        return responseMap;
    }


    /**
     * 删除校区的某校区管理员
     *
     * @param campusId
     * @param campusAdminName
     * @return
     */
    @RequestMapping("/deleteCampusAdmin")
    public @ResponseBody
    Map<String, Object> deleteCampusAdmin(@RequestParam Integer campusId, @RequestParam String campusAdminName) {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("campusId", campusId);
        paramMap.put("campusAdmin", campusAdminName);

        Integer result = campusService.deleteCampusAdmin(paramMap);
        if (result > 0) {
            responseMap.put(Constants.STATUS, Constants.SUCCESS);
            responseMap.put(Constants.MESSAGE, "Delete Sucessfully");
        } else {
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "Detele Failed");
        }
        return responseMap;
    }

    /**
     * 添加校区，默认添加8个分类
     *
     * @param campusName
     * @param status
     * @param customService
     * @param openTime
     * @param closeTime
     * @return
     * @throws ParseException
     */
    @RequestMapping("addCampus")
    public @ResponseBody
    Map<String, Object> addCampus(@RequestParam String campusName, @RequestParam String cityName, @RequestParam String openTime, @RequestParam String closeTime, @RequestParam Short status, @RequestParam String customService) throws ParseException {
        Map<String, Object> responseMap;
        Map<String, Object> paramMap = new HashMap<String, Object>();

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        Date openTimeDate = sdf.parse(openTime);
        Date closeTimeDate = sdf.parse(closeTime);

        paramMap.put("campusId", null);
        paramMap.put("campusName", campusName);
        paramMap.put("cityId", campusService.getCityByName(cityName).getCityId());
        paramMap.put("openTime", openTimeDate);
        paramMap.put("closeTime", closeTimeDate);
        paramMap.put("status", status);                    //默认开启校区
        paramMap.put("customService", customService);

        responseMap = campusService.addCampus(paramMap);
        return responseMap;
    }

    /**
     * 添加校区管理员
     *
     * @param campusName
     * @param campusName
     * @param campusAdminName
     * @return
     */
    @RequestMapping("addCampusAdmin")
    public @ResponseBody
    Map<String, Object> addCampusAdmin(@RequestParam String campusName, @RequestParam String campusAdminName, @RequestParam String password) {
        Map<String, Object> responseMap = new HashMap<>();
        Map<String, Object> paramMap = new HashMap<>();

        Map<String, Object> tempMap = new HashMap<>();
        tempMap.put("campusName", campusName);

        paramMap.put("campusId", campusService.getIdByName(tempMap));
        paramMap.put("campusName", campusName);
        paramMap.put("campusAdmin", campusAdminName);
        paramMap.put("password", Md5.GetMD5Code(password));
        paramMap.put("type", 0);            //只能添加校区管理员，总校区管理员只能从数据库添加，更符合逻辑

        Integer result = campusService.addCampusAdmin(paramMap);

        if (result != 0 && result != -1) {
            responseMap.put(Constants.STATUS, Constants.SUCCESS);
            responseMap.put(Constants.MESSAGE, "Add campus successfully, please dispatch accounts to people and remind them to modify passwords ");
        } else {
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "Add campus failed ");
        }
        return responseMap;
    }

    /**
     * 获取全部城市
     *
     * @return
     */
    @RequestMapping("getAllCity")
    @ResponseBody
    public List<City> getAllCity() {

        return campusService.getAllCity();
    }

    @RequestMapping("addCity")
    @ResponseBody
    public Map<String, Object> addCity(@RequestParam String cityName) {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("cityName", cityName);

        if (campusService.getCityByName(cityName) == null) {
            Integer result = campusService.addCity(paramMap);
            if (result != -1 && result != 0) {
                responseMap.put(Constants.STATUS, Constants.SUCCESS);
                responseMap.put(Constants.MESSAGE, "Add City Successfully ");
            } else {
                responseMap.put(Constants.STATUS, Constants.FAILURE);
                responseMap.put(Constants.MESSAGE, "Add City Failed ");
            }
        } else {
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "City Already Exists ");
        }

        return responseMap;
    }

    @RequestMapping("updateCampus")
    @ResponseBody
    public Map<String, Object> updateCampus(@RequestParam String campusId, @RequestParam String campusName, @RequestParam String cityName, @RequestParam String openTime, @RequestParam String closeTime, @RequestParam Short status, @RequestParam String customService) {
        //管理端这些值都要传过来，传之前判空
        Map<String, Object> responseMap = new HashMap<String, Object>();
        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("campusId", campusId);
        paramMap.put("campusName", campusName);
        paramMap.put("cityId", campusService.getCityByName(cityName).getCityId());
        paramMap.put("openTime", openTime);
        paramMap.put("closeTime", closeTime);
        paramMap.put("status", status);
        paramMap.put("customService", customService);

        Integer result = campusService.updateCampus(paramMap);

        if (result != 0 && result != -1) {
            responseMap.put(Constants.STATUS, Constants.SUCCESS);
            responseMap.put(Constants.MESSAGE, "Update Campus Successfully ");
        } else {
            responseMap.put(Constants.STATUS, Constants.FAILURE);
            responseMap.put(Constants.MESSAGE, "Update Campus Failed ");
        }

        return responseMap;
    }


    @RequestMapping("/updateCampusAdminPassword")
    public @ResponseBody
    Map<String, Object> updateCampusAdminPassword(String campusAdmin, String oldPassword, String newPassword) {
        Map<String, Object> resultMap = new HashMap<>();

        try {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("campusAdmin", campusAdmin);    //campusAdmin唯一

            String password = campusService.getOldPassword(paramMap);

            if (password.equals(Md5.GetMD5Code(oldPassword))) {
                paramMap.put("newPassword", Md5.GetMD5Code(newPassword));

                int flag = campusService.updateCampusAdminPassword(paramMap);
                if (flag != -1) {
                    resultMap.put(Constants.STATUS, Constants.SUCCESS);
                    resultMap.put(Constants.MESSAGE, "Modify Password Succefully");
                } else {
                    resultMap.put(Constants.STATUS, Constants.FAILURE);
                    resultMap.put(Constants.MESSAGE, "Modify Password Failed");
                }
            } else {
                resultMap.put(Constants.STATUS, Constants.FAILURE);
                resultMap.put(Constants.MESSAGE, "Wrong Old Password");
            }
        } catch (Exception e) {
            e.getStackTrace();
            resultMap.put(Constants.STATUS, Constants.FAILURE);
            resultMap.put(Constants.MESSAGE, "Modify Password Failed");
        }

        return resultMap;
    }
}
