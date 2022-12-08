package com.model;

import lombok.Data;

//DB Article 테이블 있다고 가정 1:1 매핑

@Data
public class NewArticleCommand {
	private int parentId;
	private String title;
	private String content;
}
