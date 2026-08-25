package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component // biet day la 1 bean
public class BuildingConverter {
    private final RentAreaConverter rentAreaConverter;

    private ModelMapper modelMapper = new ModelMapper();

    public BuildingConverter(RentAreaConverter rentAreaConverter) {
        this.rentAreaConverter = rentAreaConverter;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        String typeCode = buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        buildingEntity.setTypeCode(typeCode);
        buildingEntity.setRentAreaEntities(rentAreaConverter.toRentAreaEntityList(buildingDTO, buildingEntity));
        return buildingEntity;
    }

    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntityList = buildingEntity.getRentAreaEntities();
        if(rentAreaEntityList != null && !rentAreaEntityList.isEmpty()){
            String rentArea = rentAreaEntityList.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
            buildingDTO.setRentArea(rentArea);
        }
        return buildingDTO;
    }
}
