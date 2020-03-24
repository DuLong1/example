package com.adultexample.manager.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adultexample.manager.dto.PaperDto;
import com.adultexample.manager.service.PaperService;
import com.adultexample.mapper.TPaperMapper;
import com.adultexample.mapper.TQuestionMapper;
import com.adultexample.pojo.TPaperKey;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class PaperServiceImpl implements PaperService {

	@Autowired
	TPaperMapper paperMapper;
	@Autowired
	TQuestionMapper questionMapper;
	
	@Override
	public PageInfo<PaperDto> findPageInfo(Integer pageNumber,
			Integer pageSize, String checkname) {
		PageHelper.startPage(pageNumber, pageSize);
		List<PaperDto> list = paperMapper.selectPageInfo(checkname);
		PageInfo<PaperDto> pageInfo = new PageInfo<PaperDto>(list);
		return pageInfo;
	}

	
	@Override
	public void del(Integer id) {
		TPaperKey key = new TPaperKey();
		key.setId(id);
		paperMapper.deleteByPrimaryKey(key );
	}

	@Override
	public void dels(Integer[] ids) {
		paperMapper.deleteByIds(ids);
	}


	@Override
	public TPaperWithBLOBs findById(Integer id) {
		return paperMapper.selectById(id);
	}


	@Override
	public List<TQuestionWithBLOBs> findPaperInfo(String questionInfo) {
		String[] ids = questionInfo.split(",");
		return questionMapper.selectQuestionInfo(ids);
	}


	@Override
	public int save(TPaperWithBLOBs paper, Integer numdan, Integer numduo,
			Integer numjie) {
		int subId = Integer.parseInt(paper.getSubjectId());
		
		Map map1 = new HashMap(); //将多选题的查询条件保存到map中 (考试类型及多选题数量)
		map1.put("subId", subId);
		map1.put("numduo", numduo);
		
		Map map2 = new HashMap();//将单选题的查询条件保存到map中 (考试类型及单选题数量)
		map2.put("subId", subId);
		map2.put("numdan", numdan);
		
		Map map3 = new HashMap();//将解答题的查询条件保存到map中 (考试类型及解答题数量)
		map3.put("subId", subId);
		map3.put("numjie", numjie);
		
		List<Integer> duoIds = questionMapper.selectDuo(map1);//随机抽取的多选题题号集合
		List<Integer> danIds = questionMapper.selectDan(map2);//随机抽取的单题题号集合
		List<Integer> jieIds = questionMapper.selectJie(map3);//随机抽取的解答题题号集合
		
		String duo = org.apache.commons.lang3.StringUtils.join(duoIds.toArray(),',');//转换成字符串类型并以逗号分隔
		String dan = org.apache.commons.lang3.StringUtils.join(danIds.toArray(),',');
		String jie = org.apache.commons.lang3.StringUtils.join(jieIds.toArray(),',');
		String questions = dan.concat(",").concat(duo).concat(jie);//将所有题号拼接
		paper.setQuestionInfo(questions);//设置试卷题号
		if(paper!=null && paper.getId()!=null){
			paperMapper.updateByPrimaryKeySelective(paper);
		}else {
			paperMapper.insertPaper(paper);//进行保存
		}
		return paper.getId();
	}


	@Override
	public int save(TPaperWithBLOBs paper) {
		if(paper!=null && paper.getId()!=null){
			paperMapper.updateByPrimaryKeySelective(paper);
		}else {
			paperMapper.insertPaper(paper);
		}
		return paper.getId();
	}

}
