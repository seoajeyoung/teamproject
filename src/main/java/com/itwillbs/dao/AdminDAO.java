package com.itwillbs.dao;

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

	// 회원가입

//		public void registerMember(MemberDTO memberDTO) {
//			System.out.println("MemberDAO registerMember()");
//			
//			
//			sqlSession.insert(namespace + ".registerMember", memberDTO);
//		}

	// 일단 안써서 주석
// ===========================================================================	

	// 회원목록

	public List<MemberDTO> getMemberList() {
		System.out.println("AdminDAO getMemberList");

		return sqlSession.selectList(namespace + ".getMemberList");
	}

// ===========================================================================

	// 회원상세정보

	public MemberDTO getMemberInfo(String member_num) {

		return sqlSession.selectOne(namespace + ".getMemberInfo", member_num);

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

//		public void saveMovie(AdminDTO adminDTO) {
//			
//			System.out.println("AdminDAO: Saving movie - " + adminDTO.getTitle());
//			
//	        sqlSession.insert(namespace + ".saveMovie", adminDTO);
//	    }

	public void saveMovie(AdminDTO adminDTO) {

		System.out.println("AdminDAO: Saving movie - " + adminDTO.getTitle());
		sqlSession.insert(namespace + ".saveMovie", adminDTO);
	}

	public boolean checkMovieExists(String title) {
		return sqlSession.selectOne(namespace + ".checkMovieExists", title);
	}

// ===========================================================================	

	// 영화목록

	public List<MovieDTO> getMovieList() {
		System.out.println("AdminDAO getMovieList");

		return sqlSession.selectList(namespace + ".getMovieList");
	}

	// 영화상세정보

	public MovieDTO movieInfo(int num) {
		return sqlSession.selectOne(namespace + ".getMovieInfo", num);
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

	// 영문명 찾기
	public String findTitleEng(String movie) {
		return sqlSession.selectOne(namespace + ".findTitleEng", movie);
	}

	// 런타임 찾기
	public String findRuntime(String movie) {
		return sqlSession.selectOne(namespace + ".findRuntime", movie);
	}

	// 영문명 저장
	public void updateTitleEng(Map<String, Object> params) {
		sqlSession.update(namespace + ".updateTitleEng", params);
	}

	// 런타임 저장
	public void updateRuntime(Map<String, Object> params) {
		sqlSession.update(namespace + ".updateRuntime", params);
	}
	
	// 각 상영관에 따른 상영일정
	public List<ScheduleDTO> getScheduleByCinema(Map<String, Object> params) {
		return sqlSession.selectList(namespace + ".getScheduleByCinema", params);
	}

	// 상영시간 저장
	public void insertScreenTime(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertScreenTime", params);
	}

	// 상영일정 저장
	public void insertSchedule(Map<String, Object> params) {
		sqlSession.insert(namespace + ".insertSchedule", params);
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

	public Map<String, Boolean> checkStoreDetails(Map<String, String> storeDetails) {
        return sqlSession.selectOne(namespace + ".checkStoreDetails", storeDetails);
    }

}
