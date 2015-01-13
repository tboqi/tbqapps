package new_nobility;

public class Tag {
	
	private int tagId;
	private String tagName;

	public Tag(String tag) {
		tagName = tag;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
}
