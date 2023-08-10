package com.qorlwn.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qorlwn.util.Util;

@Service("boardService")
public class BoardService {
	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	public List<BoardDTO> boardList(PageDTO page) {
		return boardDAO.boardList(page);
	}

	public BoardDTO detail(BoardDTO dto2) {
		// 좋아요수 + 1 기능을 넣는다.
		boardDAO.likeUp(dto2);
		BoardDTO dto = boardDAO.detail(dto2);
		// System.out.println(dto);
		// System.out.println(dto.getBno());
		// System.out.println(dto.getBip());
		// 검사: .이 없거나, null이면 실행하지 않게 한다.
		// 내 글이 아닐때 null이 들어온다. null이 아닐때
		if (dto != null && dto.getBip() != null && dto.getBip().indexOf(".") != -1) {
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
		dto.setBip(util.getIp());// 얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
		boardDAO.write(dto);// 실행만 시키고 결과를 받지 않는다.
		// select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 한다.
		// ex. delete
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
	}

	public void edit(BoardDTO dto) {
		dto.setBip(util.getIp());
		boardDAO.edit(dto);
	}
	
	// 전체 글수 가져오기
	public int totalCount() {
		return boardDAO.totalCount();
	}

	public List<Map<String, Object>> commentsList(int bno) {
		return boardDAO.commentsList(bno);
	}

	public int cdel(Map<String, Object> map) {
		return boardDAO.cdel(map);
	}
	
	// write(map)
	public int write(Map<String, Object> map) {
		return boardDAO.write(map);
	}
	public int cedit(Map<String, Object> map) {
		return boardDAO.cedit(map);
	}
}
