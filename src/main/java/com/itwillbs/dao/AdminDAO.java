package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.AdminMapeer";

		public void registerMember(MemberDTO memberDTO) {
			System.out.println("MemberDAO registerMember()");
			
			
			sqlSession.insert(namespace + ".registerMember", memberDTO);
		}
		
		public List<MemberDTO> getMemberList() {
			System.out.println("MemberDAO getMemberList");
			
			return sqlSession.selectList(namespace + ".getMemberList");
		}

		public MemberDTO getMemberInfo(String member_id) {
			
			return sqlSession.selectOne(namespace + ".getMemberInfo", member_id);
	
		}

		public List<MemberDTO> getGradeList() {
			
			return sqlSession.selectList(namespace + ".getGradeList");
		}


		public void updateMember(MemberDTO memberDTO) {
			
			sqlSession.update(namespace + ".updateMember", memberDTO);
		}	
		
	}



