package com.project.groupware.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ArticleVO {

	private int id; // 번호
	private	String employeeId ; // 사번
	private	int boardId; // 게시판 번호
	private	String subject; // 제목
	private	String content; // 내용
	private	String writeday; // 작성일자
	private int hitcount; // 조회수
	private String secret; // 비밀글 여부
	private EmployeeVO employee = new EmployeeVO(); // 이름 가져오기
	private int count; // 파일 카운트
	private int rcount; // 댓글 카운트
	private String fileNo; // 파일번호

	
	private List<MultipartFile> upload; //업로드 된 파일
	private List<ArticleFileVO> files = new ArrayList<ArticleFileVO>();
	private List<ArticleReplyVO> replys = new ArrayList<ArticleReplyVO>();
	
	private List<ArticleImageVO> image = new ArrayList<ArticleImageVO>();
	private MultipartFile imgUpload; // 업로드된 이미지
	
	public ArticleVO() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public List<ArticleFileVO> getFiles() {
		return files;
	}

	public void setFiles(List<ArticleFileVO> files) {
		this.files = files;
	}

	public List<ArticleReplyVO> getReplys() {
		return replys;
	}

	public void setReplys(List<ArticleReplyVO> replys) {
		this.replys = replys;
	}
	
	public void addArticleFile(ArticleFileVO articleFile) {
		this.files.add(articleFile);
	}
	
	

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	
	
	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	
	

	public List<ArticleImageVO> getImage() {
		return image;
	}

	public void setImage(List<ArticleImageVO> image) {
		this.image = image;
	}

	public MultipartFile getImgUpload() {
		return imgUpload;
	}

	public void setImgUpload(MultipartFile imgUpload) {
		this.imgUpload = imgUpload;
	}

	@Override
	public String toString() {
		return "ArticleVO [id=" + id + ", employeeId=" + employeeId + ", boardId=" + boardId + ", subject=" + subject
				+ ", content=" + content + ", writeday=" + writeday + ", hitcount=" + hitcount + ", secret=" + secret
				+ ", employee=" + employee + ", count=" + count + ", rcount=" + rcount + ", fileNo=" + fileNo
				+ ", upload=" + upload + ", files=" + files + ", replys=" + replys + ", image=" + image + ", imgUpload="
				+ imgUpload + "]";
	}


	public void addArticleImage(ArticleImageVO articleImage) {
		this.image.add(articleImage);

	}


	
}
