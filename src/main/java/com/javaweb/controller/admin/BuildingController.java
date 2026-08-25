package com.javaweb.controller.admin;



import com.javaweb.enums.BuildingType;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

// dùng ModelAndView http method bắt buộc phải là get
@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    private final UserService userService;

    @Autowired
    private IBuildingService buildingService;

    public BuildingController(UserService userService, IBuildingService buildingService) {
        this.userService = userService;
        this.buildingService = buildingService;
    }

    @RequestMapping(value="/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        // xuong db - lay data
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);

        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getListStaff());
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingTypes", BuildingType.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/building/edit");
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingTypes", BuildingType.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/admin/building/edit");
        BuildingDTO buildingDTO = buildingService.findById(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingTypes", BuildingType.type());
        return mav;
    }



}
