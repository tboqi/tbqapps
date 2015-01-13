package stock;

import java.util.Iterator;
import java.util.List;
import java.util.zip.DataFormatException;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class StockDao extends JdbcDaoSupport {

	public void save(Stock stock) {
		getJdbcTemplate().execute(
				"INSERT INTO stock.stocks (symbol, `code`, `name`, "
						+ "trade, pricechange, "
						+ "changepercent, buy, sell, settlement, `open`, high,"
						+ " low, volume, " + "amount, fetchtime) VALUES ("
						+ stock.toSqlString() + ")");
	}

	public void save(List<Stock> stocks) {
		String sql = "INSERT INTO stock.stocks (symbol, `code`, `name`, trade, "
				+ "pricechange, changepercent, buy, sell, settlement, `open`, "
				+ "high, low, volume, amount, fetchtime) VALUES ";
		String split = "";
		for (Iterator<Stock> iterator = stocks.iterator(); iterator.hasNext();) {
			Stock stock = (Stock) iterator.next();
			sql += split + "(" + stock.toSqlString() + ")";
			split = ", ";
		}
		getJdbcTemplate().execute(sql);
	}
}
