package com.itwillbs.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Scheduled(fixedRate = 600000000)// 60000 밀리초 == 1분 / 나중에 24시간 (86400000)으로 설정하기
    public void deleteExpiredMembers() {

    	// 1. 먼저 POINT 테이블에서 관련 레코드 삭제
//        String deletePointsSql = "DELETE FROM POINT WHERE member_num IN (SELECT member_num FROM MEMBERS WHERE member_status = '탈퇴유예' AND member_out <= NOW())";
//        int pointsDeleted = jdbcTemplate.update(deletePointsSql);

        // 2. MEMBERS 테이블에서 만료된 레코드 삭제
//        String deleteMembersSql = "DELETE FROM MEMBERS WHERE member_status = '탈퇴유예' AND member_out <= NOW()";
//        int membersDeleted = jdbcTemplate.update(deleteMembersSql);

        // 3. 로그 출력 (콘솔 또는 로깅 프레임워크 사용)
//        System.out.println("Deleted " + pointsDeleted + " rows from POINT table");
//        System.out.println("Deleted " + membersDeleted + " rows from MEMBERS table");
//        System.out.println("스케줄링 작업 수행: " + System.currentTimeMillis());
    	
    	System.out.println("스케줄 실행");
    }
    
    @Scheduled(fixedRate = 1296000000) // 15일마다 실행 (15일 = 1296000000 milliseconds)
    public void selectAndSaveMoives() {
    		
    		System.out.println("저장");
    	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
          LocalDate today = LocalDate.now();
//          LocalDate releaseDts = today.plusDays(30); // 오늘로부터 15일 뒤
//          LocalDate releaseDte = today.plusDays(30); // 오늘로부터 30일 뒤
//          LocalDate releaseDts = today; // 오늘로부터 2개월 전
//          LocalDate releaseDte = today.plusDays(30); // 어제
//          LocalDate releaseDts = today.minusDays(10); // 오늘로부터 2개월 전
//          LocalDate releaseDte = today.minusDays(1); // 어제
          
          // 오늘로부터 4개월 전
          LocalDate releaseDts = today.minusMonths(1);
          // 오늘로부터 한 달 뒤
          LocalDate releaseDte = today.plusMonths(1);
          
          String releaseDtsStr = releaseDts.format(formatter);
          String releaseDteStr = releaseDte.format(formatter); 

//          adminService.selectAndSaveMovies(releaseDtsStr, releaseDteStr);
    	
    }
    
    @Scheduled(fixedRate = 86400000) // 24시간마다 실행
    public void deleteMoiveSchedule() {
    		
//    	String deleteMoiveScheduleSql = "DELETE FROM SCREEN WHERE SC_TIME_END < DATE_SUB(CURDATE(), INTERVAL 3 DAY)";
//    	int deleteMoiveSchedule = jdbcTemplate.update(deleteMoiveScheduleSql);
    	
    	System.out.println("일정지난 스케쥴 삭제");
    }
    
    
    
}
