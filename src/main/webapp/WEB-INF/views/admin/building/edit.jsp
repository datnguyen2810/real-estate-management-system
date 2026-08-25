<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
            <a href="#">Home</a>
          </li>
          <li class="active">Dashboard</li>
        </ul><!-- /.breadcrumb -->
      </div>

      <div class="page-content">
        <div class="page-header">
          <h1>
            Sửa hoặc thêm tòa nhà
            <small>
              <i class="ace-icon fa fa-angle-double-right"></i>
              overview &amp; stats
            </small>
          </h1>
        </div><!-- /.page-header -->

        <div class="row" style="font-family:'Times New Roman', Times, serif">
          <form class="form-horizontal" role="form" action="" id="form-edit">
            <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
              <div class="col-xs-12">
                <div class="form-group row">
                  <label class="col-xs-3">Tên tòa nhà</label>
                  <form:input class="col-xs-9" path="name" />
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Quận</label>
                  <form:select class="col-xs-2" path="district">
                    <form:option value="">--Chọn quận--</form:option>
                    <form:options items="${districts}"/>
                  </form:select>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phường</label>
                  <form:input type="text" class="col-xs-9" path="ward"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Đường</label>
                  <form:input type="text" class="col-xs-9" path="street"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Kết cấu</label>
                  <form:input type="text" class="col-xs-9" path="structure"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Số tầng hầm</label>
                  <form:input type="number" class="col-xs-9" path="numberOfBasement"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Diện tích sàn</label>
                  <form:input type="number" class="col-xs-9" path="floorArea"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Hướng</label>
                  <form:input type="text" class="col-xs-9" path="direction"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Hạng</label>
                  <form:input type="number" class="col-xs-9" path="level"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Diện tích thuê</label>
                  <form:input type="text" class="col-xs-9" path="rentArea"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Giá thuê</label>
                  <form:input type="number" class="col-xs-9" path="rentPrice"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Mô tả giá</label>
                  <form:input type="text" class="col-xs-9" path="rentPriceDescription"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phí dịch vụ</label>
                  <form:input type="text" class="col-xs-9" path="serviceFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phí ô tô</label>
                  <form:input type="text" class="col-xs-9" path="carFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phí mô tô</label>
                  <form:input type="text" class="col-xs-9" path="motoFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phí ngoài giờ</label>
                  <form:input type="text" class="col-xs-9" path="overtimeFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Tiền điện</label>
                  <form:input type="text" class="col-xs-9" path="electricityFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Đặt cọc</label>
                  <form:input type="text" class="col-xs-9" path="deposit"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Thanh toán</label>
                  <form:input type="text" class="col-xs-9" path="payment"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Thời hạn thuê</label>
                  <form:input type="text" class="col-xs-9" path="rentTime"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Thời gian trang trí</label>
                  <form:input type="text" class="col-xs-9" path="decorationTime"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Tên quản lý</label>
                  <form:input type="text" class="col-xs-9" path="managerName"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">SĐT quản lý</label>
                  <form:input type="text" class="col-xs-9" path="managerPhone"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Phí môi giới</label>
                  <form:input type="text" class="col-xs-9" path="brokerageFee"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Loại tòa nhà</label>
                  <div class="col-xs-6">
<%--                    <label class="checkbox-inline">--%>
                      <form:checkboxes items="${buildingTypes}" path="typeCode"/>
<%--                    </label>--%>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Ghi chú</label>
                  <form:input class="col-xs-9" path="note"/>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3">Hình đại diện</label>
                  <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                    <div class="col-sm-9">
                        <c:if test="${not empty buildingEdit.image}">
                            <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                        </c:if>
                        <c:if test="${empty buildingEdit.image}">
                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                  <label class="col-xs-3"></label>
                  <div class="col-xs-9">
                    <c:if test="${not empty buildingEdit.id}">
                      <button type="button" class="btn btn-primary" id="btnAddBuilding">Cập nhật tòa nhà</button>
                    </c:if>
                    <c:if test="${empty buildingEdit.id}">
                      <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm tòa nhà</button>
                    </c:if>
<%--                <a href="/admin/building-list" class="btn btn-primary">Hủy thao tác</a>--%>
                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                  </div>
                </div>
                <form:hidden path="id" id="buildingId" />
              </div>
            </form:form>
          </form>
        </div>

      </div><!-- /.page-content -->
    </div>
  </div><!-- /.main-content -->

  <script >
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddBuilding').click(function(){
      var data = {};
      var typeCode = [];
      var formData = $('#form-edit').serializeArray();
      $.each(formData, function(i, field){
        if(field.name == 'typeCode') {
          typeCode.push(field.value);
        } else {
          data[field.name] = field.value;
        }
      });
      data.typeCode = typeCode;
      console.log("OK");

      if(data.name != "" && data.typeCode != ""){
        addOrUpdateBuilding(data);
      }
      else{
        alert("Tên tòa nhà và loại tòa nhà không được để trống!");
      }
    });

    function addOrUpdateBuilding(data){
      $.ajax({
        type: "POST", //http method
        url: "${buildingAPI}", //url
        data: JSON.stringify(data),
        contentType: "application/json",
        // dataType: "json", // định dạng từ server trả về
        success: function(response) {
          alert("Thêm tòa nhà thành công!");
          window.location.href = "/admin/building-list";
          // Optionally, you can redirect or clear the form here
        },
        error: function(xhr, status, error) {
          alert("Có lỗi xảy ra khi thêm tòa nhà!");
        }
      })
    }

    $('#btnCancel').click(function(){
      window.location.href = "/admin/building-list";
    });

     function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#uploadImage').change(function (event){
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });
  </script>
</body>
</html>
