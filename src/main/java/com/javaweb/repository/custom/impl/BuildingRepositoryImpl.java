package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    // rentArea, staffId,
    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql){
        if(buildingSearchBuilder.getStaffId() != null){
            sql.append(" JOIN assignmentbuilding ab ON b.id = ab.buildingid ");
        }

        if(buildingSearchBuilder.getRentAreaFrom() != null || buildingSearchBuilder.getRentAreaTo() != null){
            sql.append(" JOIN rentarea ra ON b.id = ra.buildingid ");
        }
    }

    // ko phai join voi bang khac -> lay field cua chinh bang do
    public static void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where){
        //java reflection
        try{
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields(); // lay toan bo field
            for(Field item : fields){
                item.setAccessible(true); // cho phep truy cap vao field private
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.startsWith("rentArea") && !fieldName.startsWith("rentPrice")){
                    Object value = item.get(buildingSearchBuilder); // lay gia tri cua field
                    if (value != null && !value.equals("")) {
                        if(item.getType().getName().equals("java.lang.Integer") || item.getType().getName().equals("java.lang.Long")){
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        }
                        else if(item.getType().getName().equals("java.lang.String")){
                            where.append(" AND b." + fieldName + " LIKE '%" + value + "%' ");
                        }

                    }

                }
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }

    // field: ma phai join voi table khac moi co duoc hoac ( <= AND <= )
    public void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where){
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append(" AND ab.staffid = " + staffId + " ");
        }

        Long rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getRentAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea r WHERE r.buildingid = b.id ");
            if (rentAreaFrom != null) {
                where.append("AND r.value >= " + rentAreaFrom + " ");
            }
            if (rentAreaTo != null) {
                where.append("AND r.value <= " + rentAreaTo + " ");
            }
            where.append(")");
        }

        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        if(rentPriceFrom != null){
            where.append(" AND b.rentprice >= " + rentPriceFrom + " ");
        }
        if(rentPriceTo != null){
            where.append(" AND b.rentprice <= " + rentPriceTo + " ");
        }

        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if(typeCode != null && typeCode.size() > 0){
            where.append(" AND (");
            String query = typeCode.stream().map(it -> "b.type LIKE '%" + it + "%' ").collect(Collectors.joining(" OR "));
            where.append(query);
            where.append(")");
        }
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);
        sql.append(where);
        sql.append(" GROUP BY b.id ");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
