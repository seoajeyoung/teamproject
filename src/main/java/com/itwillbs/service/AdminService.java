package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdminDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieResponse;

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
                System.out.println("중복된 영화 제목: " +adminDTO.getTitle());
            }
        } else {
            System.out.println("잘못된 날짜 형식의 영화제목과 형식: " + adminDTO.getTitle() + ", " + adminDTO.getReleaseDateStr());
        }
    }
	
	
}
