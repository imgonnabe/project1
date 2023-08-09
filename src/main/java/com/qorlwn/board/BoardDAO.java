package com.qorlwn.board;

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

	public List<BoardDTO> boardList(PageDTO page){
		return sqlSession.selectList("board.boardList", page);
	}

	public BoardDTO detail(BoardDTO dto) {
		return sqlSession.selectOne("board.detail", dto);// namespace.id, 값
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}

	public void delete(BoardDTO dto) {
		sqlSession.update("board.delete", dto);
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
	}

	public void likeUp(BoardDTO dto) {
		sqlSession.update("board.likeUp", dto);
	}

	public int totalCount() {
		return sqlSession.selectOne("board.totalCount");
	}

	public List<Map<String, Object>> commentsList(int bno) {
		return sqlSession.selectList("board.commentsList", bno);
	}

	public int cdel(Map<String, Object> map) {
		return sqlSession.update("board.cdel", map);
	}

<<<<<<< HEAD
	public int write(Map<String, Object> map) {
		return sqlSession.insert("board.write2", map);
=======
	public int cedit(Map<String, Object> map) {
		return sqlSession.update("board.cedit", map);
>>>>>>> refs/remotes/origin/master
	}
}
