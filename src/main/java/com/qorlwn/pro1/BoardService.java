package com.qorlwn.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {

		return boardDAO.boardList();
	}

	public BoardDTO detail(String bno) {
		BoardDTO dto = boardDAO.detail(bno);
		// 검사: .이 없거나, null이면 실행하지 않게 한다.
		if (dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
			// 여기서 ip뽑아온다.
			String ip = dto.getBip();
			// ip 중간에 하트 넣는다. 172.30.1.19 ---> 172.♡.1.19
			String[] ipArr = ip.split("[.]");// "\\."
			ipArr[1] = "♥";
			// 다시 ip에 저장
			dto.setBip(String.join(".", ipArr));
			// 끝.
		}
		return dto;
	}

	// 글쓰기
	public void write(BoardDTO dto) {
		// btitle을 꺼낸다.
		// 값을 변경한다. replace() < -> &lt;, > -> &gt;
		// 다시 저장
		dto.setBtitle(util.exchange(dto.getBtitle()));
		dto.setBip(util.getIp());//얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
		boardDAO.write(dto);// 실행만 시키고 결과를 받지 않는다.
		// select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 한다.
		// ex. delete
	}
}
