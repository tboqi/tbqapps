package mail;


public class Email {

	public String title;

	public String content;

	public String receverName;

	public String fromAddress;

	public String toAddress;

	public String senderName;

	public Email(String title, String receverName, String fromAddress,
			String toAddress, String senderName){
		super();
		this.title = title;
		this.receverName = receverName;
		this.fromAddress = fromAddress;
		this.toAddress = toAddress;
		this.senderName = senderName;
		this.content = buildContent();
	}

	public String buildContent(){
		String str1 = util.StringUtil.file2string("src/mail/mail.html");
		str1 = str1.replaceFirst("#receverName#", this.receverName);
		str1 = str1.replaceFirst("#senderName#", this.senderName);
		str1 = str1.replaceFirst("#data#", util.StringUtil.getCNData());
 		return str1;
	}

	public static void main(String[] args){
		Email mail = new Email("测试", "content", "senderName", "content",
				"content");
		
		System.out.println(mail.buildContent());
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getReceverName() {
		return receverName;
	}

	public void setReceverName(String receverName) {
		this.receverName = receverName;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
}