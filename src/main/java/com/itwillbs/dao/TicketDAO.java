package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.TicketMapper";

	public List<Map<String, Object>> selectMovieList(Map<String, String> param) {
		return sqlSession.selectList(namespace + ".selectMovieList", param);
	}

	public List<Map<String, Object>> selectTheaterList(Map<String, String> param) {

		return sqlSession.selectList(namespace + ".selectTheaterList", param);
	}

	public List<Map<String, Object>> selectTh_nameList(Map<String, String> param) {

		return sqlSession.selectList(namespace + ".selectTh_nameList", param);
	}

	public List<Map<String, Object>> selectMtime(Map<String, Object> param) {

		return sqlSession.selectList(namespace + ".selectMtime", param);
	}

	public List<Map<String, Object>> selectMcinema(Map<String, Object> param) {

		return sqlSession.selectList(namespace + ".selectMcinema", param);
	}

	public List<Map<String, Object>> selectUpdateTh_nameList(Map<String, String> param) {

		return sqlSession.selectList(namespace + ".selectUpdateTh_nameList", param);
	}

	public List<Map<String, Object>> selectupdate_movie(Map<String, String> param) {

		return sqlSession.selectList(namespace + ".selectupdate_movie", param);
	}

	public List<Map<String, Object>> selectupdate_time(Map<String, String> param) {

		return sqlSession.selectList(namespace + ".selectupdate_time", param);
	}

	public List<Map<String, Object>> modalth_region() {
		return sqlSession.selectList(namespace + ".modalth_region");
	}

	public List<Map<String, String>> getth_name(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".getth_name", param);
	}

	public List<Map<String, String>> getci_number(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".getci_number", param);
	}

	public void insertseat(Map<String, Object> request) {
		sqlSession.insert(namespace + ".insertseat", request);
	}

	public List<Map<String, String>> selectsaveseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectsaveseat", param);
	}

	public List<Map<String, Object>> selectSecount(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectSecount", param);
	}

	public List<Map<String, String>> selectloadseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectloadseat", param);
	}

	public void insertselectseat(Map<String, Object> request) {
			
		List<String> tpnumList = (List<String>) request.get("tp_num");
		List<String> seatList = (List<String>) request.get("seseat");
		
		 int size = tpnumList.size();
		 
		 for (int i = 0; i < size; i++) {
	            Object tpnum = tpnumList.get(i);
	            String seat = seatList.get(i);

	            Map<String, Object> params = new HashMap<>(request);
	            params.put("tpNum", tpnum);
	            params.put("tpSeat", seat); 
	            
	            sqlSession.insert(namespace + ".insertselectseat", params);
	            
	        }
	}

	public int checkseat(Map<String, Object> request) {
		return sqlSession.selectOne(namespace + ".checkseat", request);
	}

	public void deleteseat(Map<String, Object> request) {
		sqlSession.delete(namespace + ".deleteseat", request);
	}

	public List<Map<String, String>> selectpaymentseat(Map<String, Object> param) {
		return sqlSession.selectList(namespace + ".selectpaymentseat", param);
	}

	public Map<String, String> selectmember(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".selectmember", param);
	}

	public void insertticketpayment(Map<String, Object> request) {
		// `payment` 리스트를 가져옵니다.
		List<List<Object>> paymentList = (List<List<Object>>) request.get("payment");
		// `seseat` 리스트를 가져옵니다.
		List<String> seatList = (List<String>) request.get("seseat");

		// payment와 seat 리스트의 길이가 같은 경우를 처리합니다.
		int size = paymentList.size();

		for (int i = 0; i < size; i++) {
			List<Object> pay = paymentList.get(i);
			String seat = seatList.get(i);

			// 매 항목을 삽입하는 SQL 호출
			Map<String, Object> params = new HashMap<>(request);
			params.put("tpType", pay.get(0)); // TP_TYPE
			params.put("tpPrice", pay.get(1)); // TP_PRICE
			params.put("tpSeat", seat); // TP_SEAT

			sqlSession.insert(namespace + ".insertticketpayment", params);
		}
	}

	public List<Map<String, String>> selectticketpayment(Map<String, Object> request) {
		return sqlSession.selectList(namespace + ".selectticketpayment", request);
	}

	public void deleteticket(Map<String, Object> request) {
		sqlSession.delete(namespace + ".deleteticket", request);
	}

	public void updatepayment(Map<String, Object> request) {
		List<String> tpnumList = (List<String>) request.get("tp_num");
		
		for (int i = 0; i < tpnumList.size() ; i++) {
            Object tpnum = tpnumList.get(i);

            Map<String, Object> params = new HashMap<>(request);
            params.put("tpNum", tpnum);
            
            sqlSession.update(namespace +".updatepayment", params);
            
            System.out.println("updateparams :  " + params  );
            
        }
	}

	public Integer selectnowcount(Map<String, String> param) {
		return sqlSession.selectOne(namespace +".selectnowcount", param);
	}

	public int checkmseat(Map<String, Object> request) {
		return sqlSession.selectOne(namespace +".checkmseat", request);
	}

	public void deletemseat(Map<String, Object> request) {
		sqlSession.delete(namespace + ".deletemseat", request);
	}

	
	
}
