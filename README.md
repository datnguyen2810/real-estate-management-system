# Real Estate Management System

Dự án website quản lý bất động sản và tòa nhà cho thuê, xây dựng bằng **Java Spring Boot**.

---

## 📌 Chức năng chính

- **Xác thực & Phân quyền:** Đăng nhập, phân quyền người dùng theo vai trò (`ADMIN`, `USER/STAFF`) với Spring Security.
- **Quản lý tòa nhà:**
  - Tìm kiếm tòa nhà theo nhiều tiêu chí (tên, khu vực, khoảng giá, diện tích...).
  - Thêm, sửa, xóa thông tin tòa nhà.
  - Phân công nhân viên quản lý từng tòa nhà.
- **Quản lý người dùng:** Quản lý danh sách nhân viên/tài khoản và phân quyền.

---

## 🛠 Công nghệ sử dụng

- **Backend:** Java, Spring Boot, Spring Data JPA, Spring Security
- **Frontend:** JSP, JSTL, SiteMesh, Bootstrap, jQuery
- **Database:** MySQL

---

## 🚀 Hướng dẫn cài đặt & Chạy dự án

### 1. Yêu cầu môi trường
- JDK 8 trở lên
- MySQL Server
- Maven

### 2. Cài đặt Cơ sở dữ liệu
1. Tạo database mới trong MySQL:
   ```sql
   CREATE DATABASE estateadvance CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. Cấu hình lại tài khoản và mật khẩu MySQL của bạn trong file `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/estateadvance
   spring.datasource.username=root
   spring.datasource.password=123456
   ```
3. Chạy file script `database/insert_database.sql` để tạo tài khoản và dữ liệu mẫu.

### 3. Chạy ứng dụng
- Mở dự án bằng IDE (IntelliJ IDEA / Eclipse) và chạy file `SpringBootWebApplication.java`.
- Hoặc chạy bằng dòng lệnh:
  ```bash
  mvn clean spring-boot:run
  ```
- Truy cập trình duyệt:
  - **Trang chủ:** `http://localhost:8080/trang-chu`
  - **Đăng nhập:** `http://localhost:8080/login`
  - **Trang quản trị:** `http://localhost:8080/admin/home`

---

## 🔑 Tài khoản đăng nhập mặc định

| Tài khoản | Mật khẩu | Quyền hạn (Role) |
|---|---|---|
| `admin` | `123456` | ADMIN |
| `nguyenvana` | `123456` | USER / STAFF |
| `nguyenvanb` | `123456` | USER / STAFF |

---

## 👤 Tác giả

- **Nguyễn Xuân Đạt** - [@datnguyen2810](https://github.com/datnguyen2810)
