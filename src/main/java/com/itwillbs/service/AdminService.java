package com.itwillbs.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Autowired
	private KobisApiService kobisApiService;

// =========================================================== 

	// 회원목록

	public List<AdminDTO> getMemberList() {

		return adminDAO.getMemberList();
	}

// ===========================================================	

	// 회원상세정보

	public AdminDTO getMemberInfo(String MEM_NUM) {

		return adminDAO.getMemberInfo(MEM_NUM);
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
			adminDTO.setThemeSong(movie.getThemeSong());
			adminDTO.setSoundtrack(movie.getSoundtrack());
			
//			System.out.println(adminDTO);
			processMovie(adminDTO);
			
		}
	}

	public void resetMovieRank() {

		adminDAO.resetMovieRank();
	}

	public void updateMoviesRank(String targetDt) {

		List<MovieResponse> movies = kobisApiService.fetchMovies(targetDt);
		List<AdminDTO> adminDTOList = new ArrayList();

		for (MovieResponse movie : movies) {
			AdminDTO adminDTO = new AdminDTO();
			adminDTO.setMovieNm(movie.getMovieNm());
			adminDTO.setRank(movie.getRank());
			adminDTOList.add(adminDTO);
		}
		
//		System.out.println(adminDTOList);
		adminDAO.updateMovieRank(adminDTOList);

	}

	public void processMovie(AdminDTO adminDTO) {
		if (adminDTO.isReleaseDateValid()) {
			if (!adminDAO.checkMovieExists(adminDTO.getTitle()) && adminDTO.getPosterUrl().trim().length() > 0 && adminDTO.getRating().trim().length() > 0) {
				adminDAO.saveMovie(adminDTO);
				System.out.println("저장된 영화 제목: " + adminDTO.getTitle());
			} else {
				System.out.println("저장 안 된 영화 제목: " + adminDTO.getTitle() + " / PosterUrl: " + adminDTO.getPosterUrl() + " / Rating: " + adminDTO.getRating());
			}
		} else {
			System.out.println("잘못된 날짜 형식의 영화제목과 형식: " + adminDTO.getTitle() + ", " + adminDTO.getReleaseDateStr());
		}
	}

// ===========================================================

	// 영화목록

	public List<MovieDTO> getMovieList() {

		return adminDAO.getMovieList();
	}

	// 영화 상세정보
	public MovieDTO getMovieInfo(int movienum) {
		return adminDAO.getMovieInfo(movienum);
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


	// 런타임 찾기
	public String findRuntime(String movie) {
		return adminDAO.findRuntime(movie);
	}

	// 런타임 저장
	public void updateRuntime(Map<String, Object> params) {
		adminDAO.updateRuntime(params);
	}

	public List<ScheduleDTO> getScheduleByCinema(Map<String, Object> params) {
		return adminDAO.getScheduleByCinema(params);
	}


	// 상영일정 저장
	public void insertSchedule(Map<String, Object> params) {
		adminDAO.insertSchedule(params);
	}
	
	// 상영시간 저장
		public void insertScreenTime(Map<String, Object> params) {
			adminDAO.insertScreenTime(params);
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

	public AdminDTO getBookinginfo(String tp_NUM) {
		return adminDAO.getBookinginfo(tp_NUM);
	}

	public List<AdminDTO> getStorePaymentlist() {
		return adminDAO.getStorePaymentlist();
	}

	public AdminDTO getPaymentinfo(String sp_num) {
		return adminDAO.getPaymentinfo(sp_num);
	}

	// =========================================================================================
	// 스토어 통계 시작

	public int getStoreSalesSumByDate(LocalDateTime startOfDay, LocalDateTime endOfDay) {
		// Map에 파라미터를 담기
		Map<String, Object> params = new HashMap();
		params.put("startOfDay", startOfDay);
		params.put("endOfDay", endOfDay);

		// DAO로 Map 전달
		return adminDAO.getStoreSalesSumByDate(params);
	}
	
	public int getMovieSalesSumByDate(LocalDateTime startOfDay, LocalDateTime endOfDay) {
		// Map에 파라미터를 담기
		Map<String, Object> params = new HashMap();
		params.put("startOfDay", startOfDay);
		params.put("endOfDay", endOfDay);

		// DAO로 Map 전달
		return adminDAO.getMovieSalesSumByDate(params);
	}

	public void insertDailyTotalSales(LocalDate yesterday, int storeTotalSales, int movieTotalSales) {

		Map<String, Object> params = new HashMap();
		params.put("yesterday", yesterday);
		params.put("storeTotalSales", storeTotalSales);
		params.put("movieTotalSales", movieTotalSales);
		adminDAO.insertDailyTotalSales(params);
	}
	
	// =================================================================================================

	public List<AdminDTO> getSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		return adminDAO.getSalesDataForWeek(startDate, endDate);
	}

	public List<AdminDTO> getSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		return adminDAO.getSalesDataForMonth(startMonth, endMonth);
	}
	
	// =================================================================================================

	public List<AdminDTO> getMovieSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		return adminDAO.getMovieSalesDataForWeek(startDate, endDate);
	}

	public List<AdminDTO> getMovieSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		return adminDAO.getMovieSalesDataForMonth(startMonth, endMonth);
	}
	
	// =================================================================================================
	
	public List<AdminDTO> getAllSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		return adminDAO.getAllSalesDataForWeek(startDate, endDate);
	}

	public List<AdminDTO> getAllSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		return adminDAO.getAllSalesDataForMonth(startMonth, endMonth);
	}
	
	public AdminDTO getAllSalesDataForYesterday(LocalDateTime startOfDay, LocalDateTime endOfDay) {
		return adminDAO.getAllSalesDataForYesterday(startOfDay, endOfDay);
	}
	
	public AdminDTO getAllSalesDataForOneMonth(LocalDateTime startOfMonth, LocalDateTime endOfMonth) {
		return adminDAO.getAllSalesDataForOneMonth(startOfMonth, endOfMonth);
	}
	
	// =================================================================================================

	public List<AdminDTO> getMemberJoinDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		return adminDAO.getMemberJoinDataForMonth(startMonth, endMonth);
	}

	public List<AdminDTO> getMembersByAgeGroup() {
		return adminDAO.getMembersByAgeGroup();
	}
	
	// =================================================================================================
	
	public List<AdminDTO> getTheaterSalesDataForWeek(LocalDate endDate) {
		return adminDAO.getTheaterSalesDataForWeek(endDate);
	}

	public List<AdminDTO> getTheaterSalesDataForMonth(YearMonth endMonth) {
		return adminDAO.getTheaterSalesDataForMonth(endMonth);
	}

	

	
}
