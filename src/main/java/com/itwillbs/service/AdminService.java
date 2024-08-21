package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.MovieResponse;
import com.itwillbs.domain.ScheduleDTO;

@Service
public class AdminService {

	@Inject
	private AdminDAO adminDAO;

	@Autowired
	private KMDBApiService kmdbApiService;

// =========================================================== 	
	// 회원가입

//	public void registerMember(MemberDTO memberDTO) {
//		
//		memberDTO.setMember_input(new Timestamp(System.currentTimeMillis()));
//		
//		adminDAO.registerMember(memberDTO);
//	}

	// 일단 안써서 주석
// =========================================================== 

	// 회원목록

	public List<MemberDTO> getMemberList() {
		System.out.println("AdminService getMemberList()");

		return adminDAO.getMemberList();
	}

// ===========================================================	

	// 회원상세정보

	public MemberDTO getMemberInfo(String member_num) {

		return adminDAO.getMemberInfo(member_num);
	}

// ===========================================================

	// 포인트지급항목

	public List<MemberDTO> getDetailList() {

		return adminDAO.getDetailList();
	}

// ===========================================================	

	// 회원정보수정
	public void updateMember(MemberDTO memberDTO) {

		adminDAO.updateMember(memberDTO);
	}

	// 포인트지급,차감
	public void updatePoint(MemberDTO memberDTO) {

		adminDAO.updatePoint(memberDTO);
	}

	// 포인트지급,차감 내역
	public void updatePointHistory(String member_num, String pointDetail, int sPoint) {

		adminDAO.updatePointHistory(member_num, pointDetail, sPoint);
	}

// ===========================================================

	// 회원탈퇴(6개월 유예)

	public void respiteMember(MemberDTO memberDTO) {

		adminDAO.respiteMember(memberDTO);

	}

// ===========================================================

	// 회원정보복구

	public void restoreMember(MemberDTO memberDTO) {

		adminDAO.restoreMember(memberDTO);
	}

// ===========================================================

	// 메일리스트 선택하면 자동으로 제목, 내용 입력

	public List<AdminDTO> getEmailList() {

		return adminDAO.getEmailList();
	}

// ===========================================================

	// 메일리스트 선택하면 자동으로 제목, 내용 입력

// ===========================================================

	//
	public void selectAndSaveMovies(String releaseDts, String releaseDte) {
		List<MovieResponse> movies = kmdbApiService.fetchMovies(releaseDts, releaseDte);
		for (MovieResponse movie : movies) {
			AdminDTO adminDTO = new AdminDTO();
			adminDTO.setTitle(movie.getTitle());
			adminDTO.setTitleEng(movie.getTitleEng());
			adminDTO.setDirectorNm(movie.getDirectorNm());
			adminDTO.setActorNm(movie.getActorNm());
			adminDTO.setNation(movie.getNation());
			adminDTO.setGenre(movie.getGenre());
			adminDTO.setPlot(movie.getPlot());
			adminDTO.setRuntime(movie.getRuntime());
			adminDTO.setRating(movie.getRating());
			adminDTO.setReleaseDateStr(movie.getReleaseDate());
			adminDTO.setPosterUrl(movie.getPosterUrl());

			adminDTO.setStillUrl(movie.getStillUrl());
			adminDTO.setVodUrl(movie.getVodUrl());

			adminDTO.setAudiAcc(movie.getAudiAcc());
			adminDTO.setThemeSong(movie.getThemeSong());
			adminDTO.setSoundtrack(movie.getSoundtrack());
			adminDTO.setAwards1(movie.getAwards1());

			processMovie(adminDTO);
		}
	}

	public void processMovie(AdminDTO adminDTO) {
		if (adminDTO.isReleaseDateValid()) {
			if (!adminDAO.checkMovieExists(adminDTO.getTitle())) {
				adminDAO.saveMovie(adminDTO);
			} else {
				System.out.println("중복된 영화 제목: " + adminDTO.getTitle());
			}
		} else {
			System.out.println("잘못된 날짜 형식의 영화제목과 형식: " + adminDTO.getTitle() + ", " + adminDTO.getReleaseDateStr());
		}
	}

// ===========================================================

	// 영화목록

	public List<MovieDTO> getMovieList() {
		System.out.println("AdminService getMovieList()");

		return adminDAO.getMovieList();
	}

	// 영화 상세정보
	public MovieDTO movieInfo(int num) {
		return adminDAO.movieInfo(num);
	}

	// 영화 정보 수정
	public void movieupdate(MovieDTO movieDTO) {

		adminDAO.movieupdate(movieDTO);
	}

	// 영화 정보 삭제
	public void moviedelete(MovieDTO movieDTO) {

		adminDAO.moviedelete(movieDTO);
	}

	
	// =================================================================
	// 우석 / 극장리스트 가져오기

	// 극장 지역
	public List<AdminDTO> getRegionList() {
		return adminDAO.getRegionList();
	}

	// 지점명 리스트
	public List<String> getNameList(String TH_REGION) {
		return adminDAO.getNameList(TH_REGION);
	}

	// 상영관 리스트
	public List<String> getCinemaList(String TH_NAME) {
		return adminDAO.getCinemaList(TH_NAME);
	}

	// 영화이름 리스트
	public List<Map<String, String>> getMovieNameList(Map<String, Object> params) {
		return adminDAO.getMovieNameList(params);
	}

	// 영문명 찾기
	public String findTitleEng(String movie) {
		return adminDAO.findTitleEng(movie);
	}

	// 런타임 찾기
	public String findRuntime(String movie) {
		return adminDAO.findRuntime(movie);
	}

	// 영문명 저장
	public void updateTitleEng(Map<String, Object> params) {
		adminDAO.updateTitleEng(params);
	}

	// 런타임 저장
	public void updateRuntime(Map<String, Object> params) {
		adminDAO.updateRuntime(params);
	}
	
	public List<ScheduleDTO> getScheduleByCinema(Map<String, Object> params) {
		return adminDAO.getScheduleByCinema(params);
	}

	// 상영시간 저장
	public void insertScreenTime(Map<String, Object> params) {
		adminDAO.insertScreenTime(params);
	}

	// 상영일정 저장
	public void insertSchedule(Map<String, Object> params) {
		adminDAO.insertSchedule(params);
	}

	// 상영일정 수정
	public void updateSchedule(Map<String, Object> params) {
		adminDAO.updateSchedule(params);
	}

	// 상영일정 삭제
	public void deleteSchedule(int ciNumber) {
		adminDAO.deleteSchedule(ciNumber);
	}

	public List<ScheduleDTO> getScheduleList() {
		return adminDAO.getScheduleList();
	}
	
	public void deleteScreenByCINum(int ciNum) {
		adminDAO.deleteScreenByCINum(ciNum);
	}
	
	public void deleteCinemaByCINum(int ciNum) {
		adminDAO.deleteCinemaByCINum(ciNum);
	}

	public List<AdminDTO> getBranchList() {
		return adminDAO.getBranchList();
	}
	
	public List<AdminDTO> getfindAll(String region) {
		List<AdminDTO> findAllList = adminDAO.getfindAll(region);
		return findAllList;
	}

	public void insertTheater(Map<String, Object> params) {
		adminDAO.insertTheater(params);
	}

	public void insertCInumber(Map<String, Object> params) {
		adminDAO.insertCInumber(params);
	}

	public void updateTheater(Map<String, String> params) {
		adminDAO.updateTheater(params);
	}

	public void deleteTheater(int thNum) {
		adminDAO.deleteTheater(thNum);
	}

	
	// ===========================================================	
	
	// 스토어
	
	public Map<String, Boolean> checkStoreDetails(Map<String, String> storeDetails) {
        return adminDAO.checkStoreDetails(storeDetails);
    }
	
	public List<AdminDTO> getTypeList() {
		return adminDAO.getTypeList();
	}

	public void insertStore(AdminDTO adminDTO) {
		adminDAO.insertStore(adminDTO);
	}

	public List<AdminDTO> getStoreList() {
		return adminDAO.getStoreList();
	}

	public AdminDTO getstoreInfo(String storeNum) {
		return adminDAO.getstoreInfo(storeNum);
	}

	public void updateStore(AdminDTO adminDTO) {
		adminDAO.updateStore(adminDTO);
		
	}

	public void deleteStore(String stNum) {
		adminDAO.deleteStore(stNum);
		
	}

	public List<AdminDTO> getBookinglist() {
		return adminDAO.getBookinglist();
	}

	public AdminDTO getBookinginfo(String sp_NUM) {
		return adminDAO.getBookinginfo(sp_NUM);
	}
	
	

		
	
	
}
