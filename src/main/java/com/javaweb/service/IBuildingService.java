package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    void save(BuildingDTO buildingDTO);

    BuildingDTO findById(Long id);

    void deleteAllByIds(List<Long> ids);

    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
