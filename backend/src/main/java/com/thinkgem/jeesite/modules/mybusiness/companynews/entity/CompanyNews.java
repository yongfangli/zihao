/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mybusiness.companynews.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 公司新闻Entity
 * @author liyongfang
 * @version 2018-03-15
 */
public class CompanyNews extends DataEntity<CompanyNews> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 新闻标题
	private String content;		// 新闻内容
	private String viewCount;		// 浏览次数
	
	public CompanyNews() {
		super();
	}

	public CompanyNews(String id){
		super(id);
	}

	@Length(min=0, max=100, message="新闻标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=1000, message="新闻内容长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=11, message="浏览次数长度必须介于 0 和 11 之间")
	public String getViewCount() {
		return viewCount;
	}

	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	
}