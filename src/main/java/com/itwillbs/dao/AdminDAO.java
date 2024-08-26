package com.itwillbs.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ScheduleDTO;

@Repository
public class AdminDAO {

	@Inject
	private SqlSession sqlSession;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String namespace = "com.itwillbs.mappers.AdminMapper";

// ===========================================================================	

	// 회원목록

	public List<AdminDTO> getMemberList() {

		return sqlSession.selectList(namespace + ".getMemberList");
	}

// ===========================================================================

	// 회원상세정보

	public AdminDTO getMemberInfo(String MEM_NUM) {

		return sqlSession.selectOne(namespace + ".getMemberInfo", MEM_NUM);

	}

// ===========================================================================

	// 포인트지급항목

	public List<MemberDTO> getDetailList() {

		return sqlSession.selectList(namespace + ".getDetailList");
	}

// ===========================================================================

	// 회원정보수정
	public void updateMember(MemberDTO memberDTO) {

		sqlSession.update(namespace + ".updateMember", memberDTO);
	}

	// 포인트 지급,차감
	public void updatePoint(MemberDTO memberDTO) {

		sqlSession.update(namespace + ".updatePoint", memberDTO);
	}

	// 포인트 지급,차감 내역
	public void updatePointHistory(String member_num, String pointDetail, int sPoint) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_num", member_num);
		params.put("point_detail", pointDetail);
		params.put("sPoint", sPoint);

		sqlSession.update(namespace + ".updatePointHistory", params);
	}

// ===========================================================================

	// 회원탈퇴(6개월 유예)
	public void respiteMember(MemberDTO memberDTO) {

		sqlSession.update(namespace + ".respiteMember", memberDTO);
	}

// ===========================================================================

	// 회원정보복구

	public void restoreMember(MemberDTO memberDTO) {

		sqlSession.update(namespace + ".restoreMember", memberDTO);
	}

// ===========================================================================

	// 이메일리스트

	public List<AdminDTO> getEmailList() {

		return sqlSession.selectList(namespace + ".getEmailList");
	}

// ===========================================================================

	public void saveMovie(AdminDTO adminDTO) {

		sqlSession.insert(namespace + ".saveMovie", adminDTO);
	}

	public boolean checkMovieExists(String title) {
		return sqlSession.selectOne(namespace + ".checkMovieExists", title);
	}

	public void resetMovieRank() {
		sqlSession.update(namespace + ".resetMovieRank");
	}

	public void updateMovieRank(List<AdminDTO> adminDTOList) {
		sqlSession.update(namespace + ".updateMovieRank", adminDTOList);
	}

// ===========================================================================	

	// 영화목록

	public List<MovieDTO> getMovieList() {

		return sqlSession.selectList(namespace + ".getMovieList");
	}

	// 영화상세정보

	public MovieDTO getMovieInfo(int movienum) {
		return sqlSession.selectOne(namespace + ".getMovieInfo", movienum);
	}

	// 영화 정보 수정

	public void movieupdate(MovieDTO movieDTO) {

		sqlSession.update(namespace + ".movieupdate", movieDTO);
	}

	public void moviedelete(MovieDTO movieDTO) {

		sqlSession.delete(namespace + ".moviedelete", movieDTO);
	}

// ===========================================================================

	// 지역
	public List<AdminDTO> getRegionList() {
		return sqlSession.selectList(namespace + ".getRegionList");
	}

	// 지점명
	public List<String> getNameList(String TH_REGION) {
		return sqlSession.selectList(namespace + ".getNameList", TH_REGION);
	}

	// 상영관
	public List<String> getCinemaList(String TH_NAME) {
		return sqlSession.selectList(namespace + ".getCinemaList", TH_NAME);
	}

	// 영화제목
	public List<Map<String, String>> getMovieNameList(Map<String, Object> params) {
		return sqlSession.selectList("getMovieNameList", params);
	}


	// 런타임 찾기
	public String findRuntime(String movie) {
		return sqlSession.selectOne(namespace + ".findRuntime", movie);
	}

	// 런타임 저장
	public void updateRuntime(Map<String, Object> params) {
		sqlSession.update(namespace + ".updateRuntime", params);
	}

	// 각 상영관에 따른 상영일정
	public List<ScheduleDTO> getScheduleByCinema(Map<String, Object> params) {
		return sqlSession.selectList(namespace + ".getScheduleByCinema", params);
	}

	// 상영일정 저장
	public void insertSchedule(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertSchedule", params);
	}

	// 상영시간 저장
	public void insertScreenTime(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertScreenTime", params);
	}

	// 상영일정 수정
	public void updateSchedule(Map<String, Object> params) {
		sqlSession.update(namespace + ".updateSchedule", params);
	}

	// 상영일정 삭제
	public void deleteSchedule(int ciNumber) {
		sqlSession.delete(namespace + ".deleteSchedule", ciNumber);
	}

	public List<ScheduleDTO> getScheduleList() {
		return sqlSession.selectList(namespace + ".getScheduleList");
	}

	public void deleteScreenByCINum(int ciNum) {
		sqlSession.delete(namespace + ".deleteScreenByCINum", ciNum);

	}

	public void deleteCinemaByCINum(int ciNum) {
		sqlSession.delete(namespace + ".deleteCinemaByCINum", ciNum);
	}

	public List<AdminDTO> getBranchList() {
		return sqlSession.selectList(namespace + ".getBranchList");
	}

	public List<AdminDTO> getfindAll(String region) {
		List<AdminDTO> findAllList = sqlSession.selectList(namespace + ".getfindAll", region);
		return findAllList;
	}

	public void insertTheater(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertTheater", params);
	}

	public void insertCInumber(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertCInumber", params);
	}

	public void updateTheater(Map<String, String> params) {
		sqlSession.update(namespace + ".updateTheater", params);
	}

	public void deleteTheater(int thNum) {
		sqlSession.delete(namespace + ".deleteTheater", thNum);
	}

// ===========================================================================	

	public Map<String, Boolean> checkStoreDetails(Map<String, String> storeDetails) {
		Map<String, Boolean> result = sqlSession.selectOne(namespace + ".checkStoreDetails", storeDetails);

		// Boolean 값을 저장할 빈 HashMap 생성
		Map<String, Boolean> finalResult = new HashMap<>();

		// result 맵의 모든 엔트리(키-값 쌍)를 순회
		for (Map.Entry<String, ?> entry : result.entrySet()) {

			// 현재 엔트리의 값을 Object 타입으로 저장
			Object value = entry.getValue();

			// 값이 Long 타입일 경우 처리
			if (value instanceof Long) {
				// Long 타입의 값을 1L과 비교하여 true 또는 false로 변환 후 맵에 추가
				finalResult.put(entry.getKey(), (Long) value == 1L);
			}
			// 값이 Integer 타입일 경우 처리
			else if (value instanceof Integer) {
				// Integer 타입의 값을 1과 비교하여 true 또는 false로 변환 후 맵에 추가
				finalResult.put(entry.getKey(), (Integer) value == 1);
			}
			// 값이 String 타입일 경우 처리
			else if (value instanceof String) {
				try {
					// String을 Integer로 변환한 후 1과 비교하여 true 또는 false로 변환 후 맵에 추가
					int intValue = Integer.parseInt((String) value);
					finalResult.put(entry.getKey(), intValue == 1);
				} catch (NumberFormatException e) {
					// 변환이 실패한 경우 false로 설정
					finalResult.put(entry.getKey(), false);
				}
			}
			// 값이 Boolean 타입일 경우 처리
			else if (value instanceof Boolean) {
				// Boolean 값 그대로 맵에 추가
				finalResult.put(entry.getKey(), (Boolean) value);
			}
			// 그 외의 예상치 못한 타입의 경우 처리
			else {
				// 기본값으로 false를 맵에 추가
				finalResult.put(entry.getKey(), false);
			}
		}

		// 변환된 결과를 반환
		return finalResult;
	}

	public List<AdminDTO> getTypeList() {
		return sqlSession.selectList(namespace + ".getTypeList");
	}

	public void insertStore(AdminDTO adminDTO) {
		sqlSession.insert(namespace + ".insertStore", adminDTO);
	}

	public List<AdminDTO> getStoreList() {
		return sqlSession.selectList(namespace + ".getStoreList");
	}

	public AdminDTO getstoreInfo(String storeNum) {
		return sqlSession.selectOne(namespace + ".getstoreInfo", storeNum);
	}

	public void updateStore(AdminDTO adminDTO) {
		sqlSession.update(namespace + ".updateStore", adminDTO);

	}

	public void deleteStore(String stNum) {
		sqlSession.delete(namespace + ".deleteStore", stNum);

	}

	public List<AdminDTO> getBookinglist() {
		return sqlSession.selectList(namespace + ".getBookinglist");
	}

	public AdminDTO getBookinginfo(String tp_NUM) {
		return sqlSession.selectOne(namespace + ".getBookinginfo", tp_NUM);
	}

	public List<AdminDTO> getStorePaymentlist() {
		return sqlSession.selectList(namespace + ".getStorePaymentlist");
	}

	public AdminDTO getPaymentinfo(String sp_num) {
		return sqlSession.selectOne(namespace + ".getPaymentinfo", sp_num);
	}

	// =========================================================================================

	public int getStoreSalesSumByDate(Map<String, Object> params) {
		return sqlSession.selectOne(namespace + ".getStoreSalesSumByDate", params);
	}

	public int getMovieSalesSumByDate(Map<String, Object> params) {
		return sqlSession.selectOne(namespace + ".getMovieSalesSumByDate", params);
	}

	public void insertDailyTotalSales(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertDailyTotalSales", params);
	}

	public List<AdminDTO> getSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		return sqlSession.selectList(namespace + ".getSalesDataForWeek", params);
	}

	// =========================================================================================

	public List<AdminDTO> getSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("startMonth", startMonth.atDay(1)); // 시작 월의 첫 날
		params.put("endMonth", endMonth.atEndOfMonth()); // 종료 월의 마지막 날
		return sqlSession.selectList(namespace + ".getSalesDataForMonth", params);
	}

	// =========================================================================================

	public List<AdminDTO> getMovieSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		return sqlSession.selectList(namespace + ".getMovieSalesDataForWeek", params);
	}

	public List<AdminDTO> getMovieSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("startMonth", startMonth.atDay(1)); // 시작 월의 첫 날
		params.put("endMonth", endMonth.atEndOfMonth()); // 종료 월의 마지막 날
		return sqlSession.selectList(namespace + ".getMovieSalesDataForMonth", params);
	}

	// =========================================================================================

	public List<AdminDTO> getAllSalesDataForWeek(LocalDate startDate, LocalDate endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		return sqlSession.selectList(namespace + ".getAllSalesDataForWeek", params);
	}

	public List<AdminDTO> getAllSalesDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("startMonth", startMonth.atDay(1)); // 시작 월의 첫 날
		params.put("endMonth", endMonth.atEndOfMonth()); // 종료 월의 마지막 날
		return sqlSession.selectList(namespace + ".getAllSalesDataForMonth", params);
	}

	public AdminDTO getAllSalesDataForYesterday(LocalDateTime startOfDay, LocalDateTime endOfDay) {
		Map<String, Object> params = new HashMap<>();
		params.put("startOfDay", startOfDay);
		params.put("endOfDay", endOfDay);
		return sqlSession.selectOne(namespace + ".getAllSalesDataForYesterday", params);
	}

	public AdminDTO getAllSalesDataForOneMonth(LocalDateTime startOfMonth, LocalDateTime endOfMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("startOfMonth", startOfMonth);
		params.put("endOfMonth", endOfMonth);
		return sqlSession.selectOne(namespace + ".getAllSalesDataForOneMonth", params);
	}

	// =========================================================================================

	public List<AdminDTO> getMemberJoinDataForMonth(YearMonth startMonth, YearMonth endMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("startMonth", startMonth.atDay(1)); // 시작 월의 첫 날
		params.put("endMonth", endMonth.atEndOfMonth()); // 종료 월의 마지막 날
		return sqlSession.selectList(namespace + ".getMemberJoinDataForMonth", params);
	}

	public List<AdminDTO> getMembersByAgeGroup() {
		return sqlSession.selectList(namespace + ".getMembersByAgeGroup");
	}

	// =========================================================================================

	public List<AdminDTO> getTheaterSalesDataForWeek(LocalDate endDate) {
		Map<String, Object> params = new HashMap<>();
		params.put("endDate", endDate);
		return sqlSession.selectList(namespace + ".getTheaterSalesDataForWeek", params);
	}

	public List<AdminDTO> getTheaterSalesDataForMonth(YearMonth endMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("endMonth", endMonth.atEndOfMonth()); // 종료 월의 마지막 날
		return sqlSession.selectList(namespace + ".getTheaterSalesDataForMonth", params);
	}

}
