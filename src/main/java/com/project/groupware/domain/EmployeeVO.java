package com.project.groupware.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeVO {
	private String id;
	private String name;
	private String email;
	private String hireDate;
	private String address;
	private String addressDetail;
	private String password;
	private String phone;
	private String departmentId;
	private String gradeId;
	private String statusId;
	private List<MultipartFile> upload;
	private List<EmployeeImageVO> imageList;

	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public List<EmployeeImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<EmployeeImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "EmployeeVO [id=" + id + ", name=" + name + ", email=" + email + ", hireDate=" + hireDate + ", address="
				+ address + ", addressDetail=" + addressDetail + ", password=" + password + ", phone=" + phone
				+ ", departmentId=" + departmentId + ", gradeId=" + gradeId + ", statusId=" + statusId + ", upload="
				+ upload + ", imageList=" + imageList + "]";
	}

}
