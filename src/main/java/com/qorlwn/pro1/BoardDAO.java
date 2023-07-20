package com.qorlwn.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

// inject 사용하기
@Repository("boardDAO")
public class BoardDAO {
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;

	public List<Map<String, Object>> boardList(){
		return sqlSession.selectList("board.boardList");
	}

	public BoardDTO detail(int bno) {
		return sqlSession.selectOne("board.detail", bno);// namespace.id, 값
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}

	public void delete(BoardDTO dto) {
		sqlSession.delete("board.delete", dto);
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
	}
}
