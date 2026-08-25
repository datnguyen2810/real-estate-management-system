package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;


@Component // biet day la 1 bean
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest){
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                                                                            .setName(buildingSearchRequest.getName())
                                                                            .setFloorArea(buildingSearchRequest.getFloorArea())
                                                                            .setDistrict(buildingSearchRequest.getDistrict())
                                                                            .setWard(buildingSearchRequest.getWard())
                                                                            .setStreet(buildingSearchRequest.getStreet())
                                                                            .setNumberOfBasement(buildingSearchRequest.getNumberOfBasement())
                                                                            .setDirection(buildingSearchRequest.getDirection())
                                                                            .setLevel(buildingSearchRequest.getLevel())
                                                                            .setRentAreaFrom(buildingSearchRequest.getAreaFrom())
                                                                            .setRentAreaTo(buildingSearchRequest.getAreaTo())
                                                                            .setRentPriceFrom(buildingSearchRequest.getRentPriceFrom())
                                                                            .setRentPriceTo(buildingSearchRequest.getRentPriceTo())
                                                                            .setManagerName(buildingSearchRequest.getManagerName())
                                                                            .setManagerPhone(buildingSearchRequest.getManagerPhone())
                                                                            .setStaffId(buildingSearchRequest.getStaffId())
                                                                            .setTypeCode(buildingSearchRequest.getTypeCode())
                                                                            .build();
        return buildingSearchBuilder;
    }


}
