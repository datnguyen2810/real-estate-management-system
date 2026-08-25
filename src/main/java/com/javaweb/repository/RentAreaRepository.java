package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    @Query(value = "DELETE FROM RentAreaEntity ra WHERE ra.building.id = :id")
    void deleteByBuildingId(@Param("id") Long id);

    void deleteByBuildingIdIn(List<Long> ids);
}
