package com.xiaoshuo.stock.web;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.impl.MemberImplNew;
import com.xiaoshuo.stock.domain.StockHistory;
import com.xiaoshuo.stock.domain.Stock;
import com.xiaoshuo.stock.domain.StockUser;
import com.xiaoshuo.stock.impl.StockHistoryImpl;
import com.xiaoshuo.stock.impl.StockManagerImpl;
import com.xiaoshuo.stock.impl.StockUserImpl;
import com.xiaoshuo.stock.impl.UserStockImpl;
import com.xiaoshuo.valueobject.Member;

public class StocksImpl {
	private static Log log = LogFactory.getLog(StocksImpl.class);
	
	public static int MAX_CREDIT = 100000;
	private static int DEEM_RACE = 5;
	private static float RAKE_OFF = 1.5f;
	private static float INTEREST_RATE = 1.0f;
	/**
	 * 1 compute the cash need for this operation
	 * 2 execute the buy action
	 * 3 change member points
	 * 4 this module not sell or buy bill, and like fund module
	 */
	public static boolean buy(long memberId, String stockId, int hands){
		boolean rtn = false;
		Stock s = StockManagerImpl.get(stockId);
		StockUser su = StockUserImpl.get(memberId);
		float consume = hands * s.getPrice();
		if(s!=null && su!=null && consume<su.getBalance()){
			rtn = UserStockImpl.buy(memberId, stockId, hands, s.getPrice());
			float commision = consume * (RAKE_OFF/100);
			if(rtn==true){
				StockUserImpl.incBalance(memberId, -1*consume - commision);
				
				StockHistory his = new StockHistory();
				his.setMemberId(memberId);
				his.setType(StockHistory.BUY);
				his.setStockId(stockId);
				his.setHands(hands);
				his.setPrice(s.getPrice());
				his.setBalance(su.getBalance()-consume);
				StockHistoryImpl.add(his);
			}
		}
		return rtn;
	}

	public static boolean sell(long memberId, String stockId, int hands){
		boolean rtn = false;
		Stock s = StockManagerImpl.get(stockId);
		if(s!=null){
			rtn = UserStockImpl.sell(memberId, stockId, hands);
			
			if(rtn==true){
				float consume = hands * s.getPrice();
				float commision = consume * (RAKE_OFF/100);
				StockUserImpl.incBalance(memberId, consume - commision);
				StockUser su = StockUserImpl.get(memberId);
				if(su!=null){
					StockHistory his = new StockHistory();
					his.setMemberId(memberId);
					his.setType(StockHistory.SELL);
					his.setStockId(stockId);
					his.setHands(hands);
					his.setPrice(s.getPrice());
					his.setBalance(su.getBalance());
					StockHistoryImpl.add(his);
				}
			}
		}
		return rtn;
	}
	
	public static boolean credit(long memberId, int funds){
		boolean rtn = false;
		funds = Math.abs(funds);
		StockUser su = StockUserImpl.get(memberId);
		if(su!=null && (su.getCredit()+funds)<=MAX_CREDIT){
			rtn = StockUserImpl.credit(memberId, funds);
		}
		log.info(memberId + " credit " + funds + " : " + rtn);
		return rtn;
	}

	public static boolean uncredit(long memberId, int funds){
		boolean rtn = false;
		funds = Math.abs(funds);
		StockUser su = StockUserImpl.get(memberId);
		if(su!=null && su.getBalance()>=funds){
			if(su.getCredit()<funds)funds=su.getCredit();
			long days = (new Date().getTime() - su.getCreditTime().getTime())/86400000;
			float interest = days * INTEREST_RATE / 100;
			rtn = StockUserImpl.uncredit(memberId, funds, interest);
		}
		log.info(memberId + " uncredit " + funds + " : " + rtn);
		return rtn;
	}
	
	public static boolean redeem(long memberId, int points){
		boolean rtn = false;
		Member member = MemberImplNew.getMember(memberId);
		points = Math.abs(points);
		if(member!=null && member.getPoints()>=points){
			int funds = points/DEEM_RACE;
			points = funds*DEEM_RACE;
			StockUser su = StockUserImpl.get(memberId);
			if(su!=null){
				rtn = StockUserImpl.incBalance(memberId, funds);
				if(rtn==true){
					MemberImplNew.incPoints(memberId, -1*points);
				}
			}
		}
		log.info(memberId + " redeem " + points + " : " + rtn);
		return rtn;
	}
	
	public static boolean unredeem(long memberId, int funds){
		boolean rtn = false;
		StockUser su = StockUserImpl.get(memberId);
		if(su!=null && su.getBalance()>=funds && su.getCredit()<=0){
			int points = funds*DEEM_RACE;
			rtn = StockUserImpl.incBalance(memberId, -1*funds);
			if(rtn==true){
				MemberImplNew.incPoints(memberId, points);
			}
		}
		log.info(memberId + " unredeem " + funds + " : " + rtn);
		return rtn;
	}
	
	public static void main(String args[]){
		StocksImpl.uncredit(1186400, 100);
	}
}
