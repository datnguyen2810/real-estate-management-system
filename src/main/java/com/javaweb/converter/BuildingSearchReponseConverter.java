package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component // danh dau java class la 1 bean ko co ham ktao
public class BuildingSearchReponseConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchReponse(BuildingEntity buildingEntity){
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);

        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingSearchResponse.setRentArea(areaResult);

        Map<String, String> districts = DistrictCode.type();
        String districtName = "";
        if(buildingEntity.getDistrict() != null && buildingEntity.getDistrict() != ""){
            districtName = districts.get(buildingEntity.getDistrict());
        }

        if (districtName != null && districtName != "") {
            buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtName);
        }

        return buildingSearchResponse;
    }
}
