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
		
		
		
	}



