package com.changyu.foryou.serviceImpl;

import com.changyu.foryou.mapper.CampusMapper;
import com.changyu.foryou.mapper.FoodCategoryMapper;
import com.changyu.foryou.model.Campus;
import com.changyu.foryou.model.CampusAdmin;
import com.changyu.foryou.model.City;
import com.changyu.foryou.model.CityWithCampus;
import com.changyu.foryou.service.CampusService;
import com.changyu.foryou.tools.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("campusService")
public class CampusServiceImpl implements CampusService {
	@Autowired
	private CampusMapper campusMapper;

	@Autowired
	private FoodCategoryMapper foodCategoryMapper;


	public List<Campus> getAllCampus(Map<String, Object> paramMap) {
		return campusMapper.selectAllCampus(paramMap);
	}

	@Override
	public List<CityWithCampus> getCampusWithCity(Map<String, Object> paramMap) {
		return campusMapper.getCampusWithCity(paramMap);
	}

	@Override
	public Integer getIdByName(Map<String, Object> paramMap) {
		return campusMapper.getIdByName(paramMap);
	}

	@Override
	public Integer closeCampus(Map<String, Object> requestMap) {
		// TODO Auto-generated method stub
		return campusMapper.closeCampus(requestMap);
	}

	@Override
	public Campus getCampusById(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return campusMapper.selectCampusById(paramMap);
	}

	@Override
	public CampusAdmin getCampusIdByAdmin(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return campusMapper.getCampusIdByAdmin(paramMap);
	}

	@Override
	public List<CampusAdmin> getAllCampusAdmin(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return campusMapper.getAllCampusAdmin(paramMap);
	}

	@Override

	public Integer updateCampusAdmin(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return campusMapper.updateCampusAdmin(paramMap);
	}

	@Override
	public Map<String, Object> addCampus(Map<String, Object> paramMap) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// ????????????????????????????????????8?????????????????????????????????????????????
		Integer addCampus = campusMapper.addCampus(paramMap);
		int count = 0;
		if (addCampus != -1 && addCampus != 0) {
			// ????????????????????????
			//??????????????????
			//#{categoryId},#{campusId},#{category},#{imgUrl},#{parentId},#{tag},#{serial},#{isOpen}
			Map<String, Object> categoryMap = new HashMap<String, Object>();
			int campusId = campusMapper.getIdByName(paramMap);
			int categoryId = 0;
			String category = null;
			String imgUrl = null;
			Integer parentId = 0;
			Short tag = 1;
			Integer serial = -1;
			Short isOpen = 1;
			for(int i=1; i<9; i++){
				//int length = String.valueOf(paramMap.get("campusId")).length();
				categoryId = campusId*100+i;
				serial = i;
				switch(i){
				case 1:
					category = "breakfast to home";
					break;
				case 2:
					category = "Housekeeping";
					break;
				case 3:
					category = "fruit to home";
					break;
				case 4:
					category = "Express help";
					break;
				case 5:
					category = "recommended";
					break;
				case 6:
					category = "latest experience";
					break;
				case 7:
					category = "Special Deals";
					break;
				case 8:
					category = "more categories";
					break;
				}
				categoryMap.put("categoryId", categoryId);
				categoryMap.put("campusId", campusId);
				categoryMap.put("category", category);
				categoryMap.put("imgUrl", imgUrl);
				categoryMap.put("parentId", parentId);
				categoryMap.put("tag", tag);
				categoryMap.put("serial", serial);
				categoryMap.put("isOpen", isOpen);

				count += foodCategoryMapper.addCategoryWhenAddCampus(categoryMap);
			}
			if(count<8){
				// ????????????????????????
				responseMap.put(Constants.STATUS, Constants.FAILURE);
				responseMap.put(Constants.MESSAGE, "Failed to add campus");
			}else{
				responseMap.put(Constants.STATUS, Constants.SUCCESS);
				responseMap.put(Constants.MESSAGE, "Add campus successfully");
			}
			//foodCategoryMapper.addCategoryWhenAddCampus(paramMap);
		} else {
			// ????????????????????????
			responseMap.put(Constants.STATUS, Constants.FAILURE);
			responseMap.put(Constants.MESSAGE, "Failed to add campus");
		}
		return responseMap;
	}
	public Campus getCampus(Map<String, Object> paramMap) {
		return campusMapper.getCampusByOrder(paramMap);
	}

	@Override
	public Integer deleteCampusAdmin(Map<String, Object> paramMap) {
		return campusMapper.deleteCampusAdmin(paramMap);
	}

	@Override
	public Integer addCampusAdmin(Map<String, Object> paramMap) {
		return campusMapper.insertCampusAdmin(paramMap);
	}

	@Override
	public List<City> getAllCity() {
		return campusMapper.selectAllCity();
	}

	@Override
	public Integer addCity(Map<String, Object> paramMap) {
		return campusMapper.insertCity(paramMap);
	}

	@Override
	public City getCityByName(String cityName) {
		return campusMapper.getCityByName(cityName);
	}

	@Override
	public Integer updateCampus(Map<String, Object> paramMap) {
		return campusMapper.updateCampus(paramMap);
	}

	@Override
	public String getOldPassword(Map<String, Object> paramMap) {
		return campusMapper.getOldPassword(paramMap);
	}

	@Override
	public int updateCampusAdminPassword(Map<String, Object> paramMap) {
		return campusMapper.updateCampusAdminPassword(paramMap);
	}

	@Override
	public String getCampusName(Integer campusId) {
		return campusMapper.getCampusName(campusId);
	}

}
