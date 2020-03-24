package com.adultexample.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.ChapterDto;
import com.adultexample.manager.service.ChapterService;
import com.adultexample.mapper.TChapterMapper;
import com.adultexample.pojo.TChapter;
import com.adultexample.pojo.TChapterExample;
import com.adultexample.pojo.TChapterExample.Criteria;
import com.adultexample.pojo.TChapterKey;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ChapterServiceImpl implements ChapterService {

	@Autowired
	TChapterMapper chapterMapper;
	
	@Override
	public PageInfo<ChapterDto> findPageInfo(Integer pageNumber,
			Integer pageSize, String checkname) {
		PageHelper.startPage(pageNumber, pageSize);
		List<ChapterDto> chapList = chapterMapper.selectPageInfo(checkname);
		PageInfo<ChapterDto> pageInfo = new PageInfo<ChapterDto>(chapList);
		return pageInfo;
	}

	@Override
	public TChapter findById(Integer id) {
		TChapterKey key = new TChapterKey();
		key.setId(id);
		return chapterMapper.selectByPrimaryKey(key );
	}

	@Override
	public List<TChapter> findSelectedVal() {
		return chapterMapper.selectByExample(null);
	}

	@Override
	public void saveData(TChapter chapter) {
		if(chapter!=null && chapter.getId()!=null){
			//修改数据
			chapterMapper.updateByPrimaryKeySelective(chapter);
		}else{
			//添加数据
			chapterMapper.insertSelective(chapter);
		}
	}

	@Override
	public void del(Integer id) {
		TChapterKey key = new TChapterKey();
		key.setId(id);
		chapterMapper.deleteByPrimaryKey(key);
	}

	@Override
	public void dels(Integer[] ids) {
		chapterMapper.deletesByIds(ids);
	}

	@Override
	public List<TChapter> findChapterList(Integer subid) {
		TChapterExample example = new TChapterExample();
		Criteria criteria = example.createCriteria();
		criteria.andSubjectIdEqualTo(subid.toString());
		return chapterMapper.selectByExample(example );
	}

}
