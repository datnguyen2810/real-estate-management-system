<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListUrl" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <div class="main-content">
    <div class="main-content-inner">
      <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
          try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb">
          <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="#">Trang chủ</a>
          </li>
          <li class="active">Quản lý tòa nhà</li>
        </ul><!-- /.breadcrumb -->
      </div>

      <div class="page-content">
        <div class="page-header">
          <h1>
            Danh sách tòa nhà
            <small>
              <i class="ace-icon fa fa-angle-double-right"></i>
              overview &amp; stats
            </small>
          </h1>
        </div><!-- /.page-header -->

        <div class="row">
          <div class="col-xs-12">
            <div class="widget-box ui-sortable-handle">
              <div class="widget-header">
                <h5 class="widget-title">Tìm kiếm</h5>

                <div class="widget-toolbar">
                  <a href="#" data-action="collapse">
                    <i class="ace-icon fa fa-chevron-up"></i>
                  </a>
                </div>
              </div>

              <div class="widget-body" style="font-family : 'Times New Roman', Times, serif">
                <div class="widget-main" id="listFormContainer">
                  <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListUrl}" method="GET">
                    <div class="row">
                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-6">
                          <label class="name"> Tên tòa nhà</label>
<%--                          <input type="text" placeholder="Tên tòa nhà" class="form-control" name="name" value="${modelSearch.name}">--%>
                            <form:input class="form-control" path="name"/>  <%-- path là key của modelAttribute --%>
                        </div>
                        <div class="col-xs-6">
                          <label class="name"> Diện tích sàn</label>
                          <form:input type="number" placeholder="Diện tích sàn" class="form-control" path="floorArea"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-2">
                          <label class="name"> Quận</label>
                          <form:select class="form-control" path="district">
                            <form:option value="">-- Chọn Quận --</form:option>
                            <form:options items="${districts}"/>
                          </form:select>
                        </div>
                        <div class="col-xs-5">
                          <label class="name"> Phường</label>
                          <form:input class="form-control" path="ward"/>
                        </div>
                        <div class="col-xs-5">
                          <label class="name"> Đường</label>
<%--                          <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                          <form:input class="form-control" path="street"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-4">
                          <label class="name"> Số tầng hầm</label>
                          <form:input class="form-control" path="numberOfBasement"/>

                        </div>
                        <div class="col-xs-4">
                          <label class="name"> Hướng</label>
                          <form:input class="form-control" path="direction"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name"> Hạng</label>
                          <form:input type="number" class="form-control" path="level"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-3">
                          <label class="name"> Diện tích từ</label>
                          <form:input type="text" class="form-control" path="areaFrom"/>

                        </div>
                        <div class="col-xs-3">
                          <label class="name"> Diện tích đến</label>
                          <form:input type="text" class="form-control" path="areaTo"/>
                        </div>
                        <div class="col-xs-3">
                          <label class="name"> Giá thuê từ</label>
                          <form:input type="number" class="form-control" path="rentPriceFrom"/>
                        </div>
                        <div class="col-xs-3">
                          <label class="name"> Giá thuê đến</label>
                          <form:input type="number" class="form-control" path="rentPriceTo"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-4">
                          <label class="name"> Tên quản lý</label>
                          <form:input type="text" class="form-control" path="managerName"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name"> SĐT quản lý</label>
                          <form:input type="text" class="form-control" path="managerPhone"/>
                        </div>
                        <div class="col-xs-2">
                          <security:authorize access="hasRole('ROLE_MANAGER')">
                            <label class="name"> Nhân viên</label>
                            <form:select class="form-control" path="staffId">
                              <form:option value="">-- Chọn nhân viên --</form:option>
                              <form:options items="${listStaffs}" />
                            </form:select>
                          </security:authorize>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-6">
<%--                          <label class="checkbox-inline">--%>
                            <form:checkboxes items="${buildingTypes}" path="typeCode"/>
<%--                          </label>--%>
                        </div>
                      </div>
                    </div>

                    <div class="col-xs-12">
                      <div class="col-xs-6">
                        <button type="button" class="btn btn-xs btn-danger" id="btnSearchBuilding">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                          </svg>
                          Tìm kiếm
                        </button>
                      </div>
                    </div>

                    </div>
                  </form:form>
                </div>
              </div>

            </div>

            <div class="pull-right">
              <a href="/admin/building-edit">
                <button class="btn btn-info" title="Thêm tòa nhà">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                  </svg>
                </button>
              </a>

              <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                  <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                </svg>
              </button>

            </div>


          </div>
        </div>
      </div>

      <!-- Bảng danh sách -->
      <div class="row" style="font-family : 'Times New Roman', Times, serif; margin-top: 20px">
        <div class="col-xs-12">
          <table id="tableList" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="center">
                  <label class="pos-rel">
                    <input type="checkbox" class="ace">
                    <span class="lbl"></span>
                  </label>
                </th>
                <th>Tên tòa nhà</th>
                <th>Địa chỉ</th>
                <th>Số tầng hầm</th>
                <th>Tên quản lý</th>
                <th>Số điện thoại quản lý</th>
                <th>DT sàn</th>
                <th>DT trống</th>
                <th>DT thuê</th>
                <th>Giá thuê</th>
                <th>Phí môi giới</th>
                <th>Phí dịch vụ</th>
                <th>Thao tác</th>
              </tr>
            </thead>

            <tbody>
            <c:forEach var="item" items="${buildingList}">
              <tr>
                <td class="center">
                  <label class="pos-rel">
                    <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                    <span class="lbl"></span>
                  </label>
                </td>

                <td>${item.name}</td>
                <td>${item.address}</td>
                <td>${item.numberOfBasement}</td>
                <td>${item.managerName}</td>
                <td>${item.managerPhone}</td>
                <td>${item.floorArea}</td>
                <td>${item.emptyArea}</td>
                <td>${item.rentArea}</td>
                <td>${item.rentPrice}</td>
                <td>${item.brokerageFee}</td>
                <td>${item.serviceFee}</td>

                <td>
                  <div class="hidden-sm hidden-xs btn-group">
                  <security:authorize access="hasRole('MANAGER')">
                    <button class="btn btn-xs btn-success" onclick="assignmentBuilding(${item.id})">
                      <i class="ace-icon glyphicon glyphicon-list"></i>
                    </button>
                  </security:authorize>

                  <a href="/admin/building-edit-${item.id}" class="btn btn-xs btn-info" title="Sửa tòa nhà">
                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                  </a>

                  <security:authorize access="hasRole('MANAGER')">
                    <button class="btn btn-xs btn-danger" onclick="deleteBuilding(${item.id})">
                      <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </button>
                  </security:authorize>
                  </div>
                </td>
              </tr>
            </c:forEach>


              </tbody>
            </table>
          </div><!-- /.span -->
        </div>

      </div><!-- /.page-content -->
    </div>
  </div><!-- /.main-content -->

  <!-- Modal -->
  <div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family:'Times New Roman', Times, serif">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Danh sách nhân viên</h4>
        </div>
        <div class="modal-body">
          <table id="staffList" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="center">Chọn</th>
                <th class="center">Tên nhân viên</th>
              </tr>
            </thead>
            <tbody>
              
            </tbody>
          </table>
          <input type="hidden" id="buildingId" value="">
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    function assignmentBuilding(buildingId){
      $('#buildingId').val(buildingId);
      $('#assignmentBuildingModal').modal('show');
      loadStaff(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET", //http method
            url: "${buildingAPI}/" + buildingId + '/staffs',
            contentType: "application/json",
            success: function(response) {
              // Xử lý dữ liệu trả về từ server
              console.log(response);
              // Cập nhật danh sách nhân viên trong modal
              var staffList = $('#staffList tbody');
              staffList.empty(); // Xóa danh sách cũ
              $.each(response.data, function(index, staff) {
                  var row = '<tr>' +
                  '<td class="center"><input type="checkbox" value="' + staff.staffId + '" ' + staff.checked + '></td>' +
                  '<td class="center">' + staff.fullName + '</td>' +
                  '</tr>';
                  staffList.append(row);
              });
            },
            error: function(xhr, status, error) {
              alert("Có lỗi xảy ra khi tải danh sách nhân viên!");
            }
        });
    }

    $('#btnassignmentBuilding').click(function(e){
      e.preventDefault();
      var data = {};
      data['buildingId'] = $('#buildingId').val();
      var staffs = $('#staffList').find('tbody input[type = "checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      data['staffs'] = staffs;
      console.log("OK");
      if(data['staffs'] != ''){
        assignment(data);
      }
      console.log(data);
    })

    function assignment(data){
      $.ajax({
        type: "POST",
        url: "${buildingAPI}/" + 'assignment',
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function(response) {
          alert("Giao tòa nhà thành công!");
          $('#assignmentBuildingModal').modal('hide');
          // Optionally, you can redirect or clear the form here
        },
        error: function(xhr, status, error) {
          alert("Có lỗi xảy ra khi giao tòa nhà!");
        }
      });
    }

    $('#btnSearchBuilding').click(function(e){
      e.preventDefault();
      $('#listForm').submit();
    });

    function deleteBuilding(data){
      var building = [data];
        deleteBuildings(building);
    }

    $('#btnDeleteBuilding').click(function(e){
      e.preventDefault();
      var buildingIds = $('#tableList').find('tbody input[type = "checkbox"]:checked').map(function(){
        return $(this).val();
      }).get();
      deleteBuildings(buildingIds);
    });

    function deleteBuildings(data){
      $.ajax({
        type: "DELETE", //http method
        url: "${buildingAPI}/" + data,
        data: JSON.stringify(data),
        contentType: "application/json",
        // dataType: "json", // định dạng từ server trả về
        success: function(response) {
          alert("Xóa tòa nhà thành công!");
          window.location.href= "/admin/building-list";
          // Optionally, you can redirect or clear the form here
        },
        error: function(xhr, status, error) {
          alert("Có lỗi xảy ra khi xóa tòa nhà!");
        }
      })
    }
  </script>

</body>
</html>

