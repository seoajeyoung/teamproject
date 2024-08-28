package com.itwillbs.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.AdminDTO;

import org.springframework.jdbc.core.JdbcTemplate;

@Component
@EnableScheduling
public class ScheduledTasks {

	private final JdbcTemplate jdbcTemplate;

	@Inject
	private AdminService adminService;

	@Autowired
	public ScheduledTasks(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 1분마다 실행되는 작업
	@Scheduled(fixedRate = 86400000) // 60000 밀리초 == 1분 / 나중에 24시간 (86400000)으로 설정하기
	public void deleteExpiredMembers() {
		
		adminService.realDeleteMember();

		// 1. 먼저 POINT 테이블에서 관련 레코드 삭제
//        String deletePointsSql = "DELETE FROM POINT WHERE member_num IN (SELECT member_num FROM MEMBERS WHERE member_status = '탈퇴유예' AND member_out <= NOW())";
//        int pointsDeleted = jdbcTemplate.update(deletePointsSql);

		// 2. MEMBERS 테이블에서 만료된 레코드 삭제
//        String deleteMembersSql = "DELETE FROM MEMBERS WHERE member_status = '탈퇴유예' AND member_out <= NOW()";
//        int membersDeleted = jdbcTemplate.update(deleteMembersSql);

//		System.out.println("스케줄 실행");
	}

	@Scheduled(fixedRate = 1296000000) // 15일마다 실행 (15일 = 1296000000 milliseconds)
	public void selectAndSaveMoives() {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate today = LocalDate.now();
//          LocalDate releaseDts = today.plusDays(30); // 오늘로부터 15일 뒤
//          LocalDate releaseDte = today.plusDays(30); // 오늘로부터 30일 뒤
//          LocalDate releaseDts = today; // 오늘로부터 2개월 전
//          LocalDate releaseDte = today.plusDays(30); // 어제
//          LocalDate releaseDts = today.minusDays(10); // 오늘로부터 2개월 전
//          LocalDate releaseDte = today.minusDays(1); // 어제

		// 오늘로부터 4개월 전
		LocalDate releaseDts = today.minusMonths(3);
		// 오늘로부터 한 달 뒤
		LocalDate releaseDte = today.plusMonths(1);

		String releaseDtsStr = releaseDts.format(formatter);
		String releaseDteStr = releaseDte.format(formatter); 
		
//        adminService.selectAndSaveMovies(releaseDtsStr, releaseDteStr); 
 
	} 

	@Scheduled(fixedRate = 604800000) // 7일마다 실행 (15일 = 1296000000 milliseconds)
	public void updateMoviesRank() {


		// 일주일마다 랭킹 초기화
//		adminService.resetMovieRank();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate today = LocalDate.now();

		LocalDate targetDt = today.minusDays(7);

		String targetDtStr = targetDt.format(formatter); 

//		adminService.updateMoviesRank(targetDtStr); 

	}

	@Scheduled(fixedRate = 86400000) // 24시간마다 실행
	public void deleteMoiveSchedule() {

//    	String deleteMoiveScheduleSql = "DELETE FROM SCREEN WHERE SC_TIME_END < DATE_SUB(CURDATE(), INTERVAL 3 DAY)";
//    	int deleteMoiveSchedule = jdbcTemplate.update(deleteMoiveScheduleSql);

//		System.out.println("일정지난 스케쥴 삭제");
	}

	@Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행 
	// (cron = "0 0 0 * * ?")
	// (fixedRate = 86400000)
	public void insertSales() {

		// 어제 날짜 계산 (오늘 날짜에서 하루를 뺌)
		LocalDate yesterday = LocalDate.now().minusDays(1);

		// 어제의 시작 시간과 끝 시간을 계산
		LocalDateTime startOfDay = yesterday.atStartOfDay();
		LocalDateTime endOfDay = startOfDay.plusDays(1);

//		 어제의 매출 합계를 계산
        int storeTotalSales = adminService.getStoreSalesSumByDate(startOfDay, endOfDay);
        int movieTotalSales = adminService.getMovieSalesSumByDate(startOfDay, endOfDay);
		// 어제의 매출 합계와 날짜를 테이블에 삽입
        
//        System.out.println("S: " + storeTotalSales);
//        System.out.println("M: " + movieTotalSales);
//        System.out.println("A: " + (storeTotalSales+movieTotalSales));
        
//        adminService.insertDailyTotalSales(yesterday, storeTotalSales, movieTotalSales); 
        
	} 


}
