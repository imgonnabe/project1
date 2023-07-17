package com.qorlwn.pro1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService {

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 1; i <= 10; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bno", i);
			map.put("btitle", i + "번째 글 입니다.");
			map.put("bwrite", "홍길동");
			map.put("bdate", "2023-07-17");
			map.put("blike", i * 10);
			list.add(map);
		}
		return list;
	}
}
