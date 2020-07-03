package com.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.web.vo.BoardVO;
import com.web.vo.DynamicParam;
import com.web.vo.JuminParam;
import com.web.vo.Param;

public interface MybatisDAO {

	void insert(BoardVO vo);

	int selectCount();

	ArrayList<BoardVO> getList(HashMap<String, Integer> hmap);

	BoardVO selectByIdx(int no);

	void update(BoardVO vo);

	void delete(int no);

	int selectSearchCount(Param param);

	ArrayList<BoardVO> selectSearchList(Param param);

	String selectImage(int no);

	int checkJumin(HashMap<String, String> hmap);

	int selectDynamicSearchCount(DynamicParam dynamicParam);

	ArrayList<BoardVO> selectDynamicSearchList(DynamicParam dynamicParam);

	int getSelectNo();

	void insertImage(BoardVO vo);

	void insertExel(BoardVO vo);

	void insertWord(BoardVO vo);

	int UpdateCheckJumin(JuminParam juminParam);
	

	
}
