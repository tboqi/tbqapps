package stock;

import java.util.Date;

public class Stock {
	/**
	 * 股票编码 sh600102
	 */
	private String symbol;
	/**
	 * 代码 600102
	 */
	private String code;
	/**
	 * name:"XD莱钢股"
	 */
	private String name;
	/**
	 * 最新价
	 */
	private float trade;
	/**
	 * 涨跌额
	 */
	private float pricechange;
	/**
	 * 涨跌幅
	 */
	private float changepercent;
	/**
	 * 买入
	 */
	private float buy;
	/**
	 * 卖出
	 */
	private float sell;
	/**
	 * 昨收
	 */
	private float settlement;
	/**
	 * 今开
	 */
	private float open;
	/**
	 * 最高
	 */
	private float high;
	/**
	 * 最低
	 */
	private float low;
	/**
	 * 成交量（股）显示时转换为 手
	 */
	private int volume;
	/**
	 * 成交额
	 */
	private int amount;
	
	private Date fetchtime;
	///////////
	private String pb;

	public Stock() {
		super();
	}

	public Stock(String symbol, String code, String name, float trade,
			float pricechange, float changepercent, float buy, float sell,
			float settlement, float open, float high, float low, int volume,
			int amount, Date fetchtime) {
		super();
		this.symbol = symbol;
		this.code = code;
		this.name = name;
		this.trade = trade;
		this.pricechange = pricechange;
		this.changepercent = changepercent;
		this.buy = buy;
		this.sell = sell;
		this.settlement = settlement;
		this.open = open;
		this.high = high;
		this.low = low;
		this.volume = volume;
		this.amount = amount;
		this.fetchtime = fetchtime;
	}

	public String toSqlString() {
		return "'" + symbol + "', '" + code + "', '" + name + "', '" + trade + "', '" 
		+ pricechange + "', '" + changepercent + "', '" + buy + "', '" + sell + "', '" 
		+ settlement + "', '" + open + "', '" + high + "', '" + low + "', '" 
		+ volume + "', '" + amount + "', '" + ChentuUtils.formatDate(fetchtime) + "'";
	}
	@Override
	public String toString() {
		return "Stock [amount=" + amount + ", buy=" + buy + ", changepercent="
				+ changepercent + ", code=" + code + ", fetchtime=" + fetchtime
				+ ", high=" + high + ", low=" + low + ", name=" + name
				+ ", open=" + open + ", pricechange=" + pricechange + ", sell="
				+ sell + ", settlement=" + settlement + ", symbol=" + symbol
				+ ", trade=" + trade + ", volume=" + volume + "]";
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getTrade() {
		return trade;
	}

	public void setTrade(float trade) {
		this.trade = trade;
	}

	public float getPricechange() {
		return pricechange;
	}

	public void setPricechange(float pricechange) {
		this.pricechange = pricechange;
	}

	public float getChangepercent() {
		return changepercent;
	}

	public void setChangepercent(float changepercent) {
		this.changepercent = changepercent;
	}

	public float getBuy() {
		return buy;
	}

	public void setBuy(float buy) {
		this.buy = buy;
	}

	public float getSell() {
		return sell;
	}

	public void setSell(float sell) {
		this.sell = sell;
	}

	public float getSettlement() {
		return settlement;
	}

	public void setSettlement(float settlement) {
		this.settlement = settlement;
	}

	public float getOpen() {
		return open;
	}

	public void setOpen(float open) {
		this.open = open;
	}

	public float getHigh() {
		return high;
	}

	public void setHigh(float high) {
		this.high = high;
	}

	public float getLow() {
		return low;
	}

	public void setLow(float low) {
		this.low = low;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public void setFetchtime(Date fetchtime) {
		this.fetchtime = fetchtime;
	}

	public Date getFetchtime() {
		return fetchtime;
	}

	public void setPb(String pb) {
		this.pb = pb;
	}

	public String getPb() {
		return pb;
	}
}
