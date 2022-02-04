package vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int seq;
	private int root;
	private int step;
	private int indent;
	private String id;
	private String content;
	private String regdate;
	private String report;
	private String spare;
	
}
